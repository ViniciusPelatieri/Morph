unit Morph.Sample.CategoryInfo;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Menus, Vcl.ExtCtrls,
  Vcl.Mask, Vcl.Imaging.pngimage, Morph;

type
  TFrmcategoryInfo = class(TForm)
    PnBase: TPanel;
    LbEdtObs: TLabeledEdit;
    LbEdtID: TLabeledEdit;
    LbEdtName: TLabeledEdit;
    BtnEdit: TButton;
    BtnSave: TButton;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure BtnSaveClick(Sender: TObject);
  private
    { Private declarations }
    FMorph: TMorph;
    procedure AssignTLBEdts;
  public
    { Public declarations }
    procedure Edit(const aProductID: Integer);
    procedure NewRegister;
  end;

var
  FrmcategoryInfo: TFrmcategoryInfo;

implementation

uses
  Morph.Sample.MorphInit;

{$R *.dfm}

{ TFrmProductInfo }

procedure TFrmcategoryInfo.AssignTLBEdts;
begin
  FMorph.Table('CATEGORIES')
        .AssignToInsert(LbEdtID).Field('ID')
        .AssignToInsert(LbEdtName).Field('NAME')
        .AssignToInsert(LbEdtObs).Field('OBS');
end;

procedure TFrmcategoryInfo.BtnSaveClick(Sender: TObject);
begin
  FMorph.Insert;
end;

procedure TFrmcategoryInfo.Edit(const aProductID: Integer);
begin
  Self.Caption := 'Category Edit';
end;

procedure TFrmcategoryInfo.FormCreate(Sender: TObject);
begin
  FMorph := TMorph.Create;
  FMorph.Settings(DMMorphInit.GetMorphConfig);
  LbEdtID.Text := IntToStr(FMorph.Select.Max('ID').From('CATEGORIES').AsInteger);

  AssignTLBEdts;
end;

procedure TFrmcategoryInfo.FormDestroy(Sender: TObject);
begin
  FMorph.Free;
end;

procedure TFrmcategoryInfo.NewRegister;
begin
  Self.Caption := 'New Category';
end;

end.
