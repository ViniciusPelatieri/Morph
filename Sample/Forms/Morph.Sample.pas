unit Morph.Sample;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Morph, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf,
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys,
  FireDAC.VCLUI.Wait, Data.DB, FireDAC.Comp.Client, FireDAC.Stan.Param,
  FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.Comp.DataSet;

type
  TSample = class(TForm)
    FDConnection1: TFDConnection;
    FDMemTable1: TFDMemTable;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Sample: TSample;

implementation

uses
  Morph.EnumeratedTypes, Morph.MorphTable, Morph.Settings;

{$R *.dfm}

procedure TSample.FormCreate(Sender: TObject);
var
  Morph : TMorph;
  MorphTableArrange : TMorphTableArrange;
  JSONOutput : String;
  Settings : TMorphSettings;
  InsertJSON : String;
  ConfigString : String;
  MorphTable : TMorphTable;
  Conteudo : String;
begin
  //Configuration
  Settings.LoadFromJSONString(ConfigString);
  Settings.ExportToJSONString;

  Morph.Config.DatabaseType(FB5)
              .Connection(FDConnection1)
              .OutputFDMemTable(FDMemTable1)
              .OutputMorphTable(MorphTable)
              .IgnoreCreatedStructure
              .DoNotRaiseOnRedundances
              .RunFindInAnOtherThread
              .LoadSettings(Settings)
              .ExportSettings;

  //Delete table
  Morph.Table('PEOPLE')
       .Table('CITY')
       .Table('PRODUCT')
       .Drop.CurrentSQLCommand;

  //Remove all data from table
  Morph.Table('PEOPLE')
       .Table('CITY')
       .Table('PRODUCT')
       .Delete;

  //Change table name
  Morph.Table('PEOPLE').ChangeNameTo('PEOPLE_DATA')
          .Table('CITY').ChangeNameTo('CITY_INFO')
       .Table('PRODUCT').ChangeNameTo('PRODUCT_DATA');

  //Create Table
  Morph.Table('PEOPLE').Field('ID').Integer.PrimaryKey.Identity
                       .Field('NAME').Varchar(20).NotNull
                       .Field('ACTIVE').Boolean.NotNull
                       .Field('ACCESS_KEY').Varchar(10).Unique
                       .Field('CREDIT').Float
                       .Field('REGISTER_DATE').Date
                       .Field('PICTURE').BynaryBlob

        .Table('CITY').Field('ID').Integer.PrimaryKey
                      .Field('NAME').Varchar(15).NotNull

        .Table('PRODUCT').Field('ID').Integer.PrimaryKey
                         .Field('NAME').Varchar(30).NotNull
                         .Field('PRICE').Float
        .Create;

  //Add Fields in Table
  Morph.Table('PEOPLE').Field('LAST_VISIT').Date
       .Table('CITY').Field('POSTAL_CODE').Integer
       .Table('PRODUCT').Field('REGISTER_DATE').Date
                        .Field('QTD').Float.NotNull
       .Add;

  //Remove field from table:
  Morph.Table('PEOPLE').Field('ACCESS_KEY')
                       .Field('PICTURE')

       .Table('CITY').Field('POSTAL_CODE')
       .Drop;

  //Edit field name
  Morph.Table('PEOPLE').Field('ID').ChangeNameTo('CODE')
                       .Field('NAME').ChangeNameTo('CLI_NAME')
        .Table('CITY').Field('ID').ChangeNameTo('CODE')
        .Table('PRODUCT').Field('ID').ChangeNameTo('CODE');

  //Table Fields Info
  Morph.Table('PEOPLE').FieldsInfo;

  //Field Info
  Morph.Table('CITY').Field('CODIGO').FieldInfo;

  //Common Insert
  Morph.InsertInto.Table('PEOPLE').Field('NAME').Value('Carlos');

  //Muktiple Insert
  Morph.InsertInto.Table('PEOPLE').Fields(['NAME', 'ACTIVE']).Values(['Fernando', 'False']);

  //JSON Tables and Fields Insert
  Morph.InsertJSON(InsertJSON);

  //JSON Fields Insert
  Morph.InsertJSONStringInto.Table('PEOPLE').JSONContent(InsertJSON);

  //TFDMemTable Table Insert
  Morph.InserFDMEMtableInto('PEOPLE').FDMemTable(FDMemTable1);

  //MorphTableArrange Config
  MorphTableArrange.ImportSettings(Settings);
  MorphTableArrange.ExportSettings;

  //Add tables to arrange: PAREI AQUI

  //MorphTable Config
  MorphTable.ImportSettings(Settings);

  //Morph table insert
  MorphTable.InsertInto('PEOPLE');

  //ExportData
  MorphTable.AsFDMemtable;
  MorphTable.AsJSONString;

  //ImportData
  MorphTable.LoadFromFDMemtable(FDMemtable1);
  MorphTable.LoadFromJSONString(Conteudo);

  //Update
  Morph.Update.Table('PEOPLE').SetField('NAME').NewValue('Marcos').Where
  Morph.Update.Table('PEOPLE').SetFields(['NAME', 'ACTIVE']).NewValues(['Marcos', 'False']).Where
end;

end.

