unit Morph.InsertFromVisualComponents;

interface

uses Morph.Vector, Vcl.ExtCtrls;

type
  TInsertInstruction = record
    private
      FLabeledEdit: TLabeledEdit;
      FFieldName: String;
    public
      procedure SetLabeledEdit(const ALabeledEdit: TLabeledEdit);
      procedure SetFieldName(const AFieldName: String);
  end;

  TInsertStructure = TMorphVector<TInsertInstruction>;

  TInsertFromVisualComponents = class
    private
      FInsertStructure: TInsertStructure;
    public
      constructor Create;
      destructor Destroy; override;
      procedure Clear;
      procedure AddComponent(const ALabeledEdit: TLabeledEdit);
      procedure SetFieldName(const AFieldName: String);
      procedure Insert;
  end;

implementation

{ TInsertFromVisualComponents }

procedure TInsertFromVisualComponents.AddComponent(
  const ALabeledEdit: TLabeledEdit);
begin
  FInsertStructure.AddEmptyValue;
  FInsertStructure.Current.SetLabeledEdit(ALabeledEdit);
end;

procedure TInsertFromVisualComponents.Clear;
begin
  FInsertStructure.Clear;
end;

constructor TInsertFromVisualComponents.Create;
begin
  FInsertStructure := TMorphVector<TInsertInstruction>.Create;
end;

destructor TInsertFromVisualComponents.Destroy;
begin
  FInsertStructure.Free;
  inherited;
end;

procedure TInsertFromVisualComponents.Insert;
var
  LPSQLCommand: String;
begin
  //LPSQLCommand :=
  //TInsertStructure.First;
 // while NOT TInsertStructure.Eof do
 // begin

 // end;
end;

procedure TInsertFromVisualComponents.SetFieldName(const AFieldName: String);
begin
  FInsertStructure.Current.SetFieldName(AFieldName);
end;

{ TInsertInstruction }

procedure TInsertInstruction.SetFieldName(const AFieldName: String);
begin
  FFieldName := AFieldName;
end;

procedure TInsertInstruction.SetLabeledEdit(const ALabeledEdit: TLabeledEdit);
begin
  FLabeledEdit := ALabeledEdit;
end;

end.
