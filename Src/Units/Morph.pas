unit Morph;

interface

uses
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf,
  FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async,
  FireDAC.Phys, FireDAC.VCLUI.Wait, Data.DB, FireDAC.Comp.Client, System.JSON,
  Morph.EnumeratedTypes, Morph.MorphTable, Morph.TableField, Morph.Settings;

type
  TMorph = class
    private
    public
      constructor Create;
      destructor Destroy; override;
      function Config : TMorph;
      function DatabaseType(const aDBType : TMorphDBType) : TMorph;
      function Connection(const aConnection : TFDConnection) : TMorph;
      function OutputFDMemTable(const anOutputTable : TFDMemTable) : TMorph;
      function OutputMorphTable(const aMorphTable : TMphTable) : TMorph;
      function IgnoreCreatedStructure : TMorph;
      function DoNotRaiseOnRedundances : TMorph;
      function RunFindInAnOtherThread : TMorph;
      function LoadSettings(const aMorphSettings : TMorphSettings) : TMorph;
      function ExportSettings : TJSONObject;
      function CurrentSQLCommand : String;
      function ExecuteSQL() : TMorph;
      function Return : TMorph;
      function AsMorphTable : TMphTable;
      function AsJSONString : String;
      function AsTFDMemTable : TFDMemTable;
      function Table(const aTableName : String) : TMorph;
      function Drop : TMorph;
      function Delete : TMorph;
      function ChangeNameTo(const aNewName : String) : TMorph;
      function Field(const aField : String) : TMorph;
      function Integer : TMorph;
      function Boolean : TMorph;
      function Varchar(const aSize : Integer) : TMorph;
      function Float : TMorph;
      function Date : TMorph;
      function BynaryBlob : TMorph;
      function PrimaryKey : TMorph;
      function Identity : TMorph;
      function NotNull : TMorph;
      function Unique : TMorph;
      function Add : TMorph;
      function FieldsInfo : TMorphTableFieldsInfo;
      function FieldInfo : TMorphTableFieldInfo;
      function InsertInto : TMorph;
      function InsertJSONStringInto : TMorph;
      function Value<T>(const aValue : T) : TMorph;
      function Fields(const Fields : TArray<string>) : TMorph;
      function Values(const Fields : TArray<string>) : TMorph;
      function InsertJSON(const aJSONString : String) : TMorph;
      function JSONContent(const aJSONString : String) : TMorph;
      function InserFDMEMtableInto(const aTableName : String) : TMorph;
      function FDMemTable(const aFDMemTable : TFDMemTable) : TMorph;
      function ImportSettings(const aConfigJSONString : String) : TMorph;
      function Update : TMorph;
      function SetField(const aFieldName : String) : TMorph;
      function NewValue<T>(const aNewValue : T) : TMorph;
      function Where : TMorph;
      function SetFields(const Fields : TArray<String>) : TMorph;
      function NewValues(const NewValues : TArray<String>) : TMorph;
      function ForeignKey : TMorph;
      function References : TMorph;
      function NoOrphaData : TMorph;
      function Post : TMorph;
      function Content(const aMorphTable : TMphTable) : TMorph;
      class function JSONParse(const aJSONString : String) : TMphTable;
      function Equals<T>(const aValue : T) : TMorph;
      function IsBiggerThan<T>(const aValue : T) : TMorph;
      function _And : TMorph;
      function IsSmallerThen<T>(const aValue : T) : TMorph;
      function Select : TMorph;
      function All : TMorph;
      function From(const aTableName : String) : TMorph;
      function IsBiggerOrEqualThen<T>(const aValue : T) : TMorph;
      function _Or : TMorph;
      function IsSmallerOrEqualThen<T>(const aValue : T) : TMorph;
    end;
implementation

{ TMorph }

function TMorph.Add: TMorph;
begin

end;

function TMorph.All: TMorph;
begin

end;

function TMorph.AsJSONString: String;
begin

end;

function TMorph.AsMorphTable: TMphTable;
begin

end;

function TMorph.AsTFDMemTable: TFDMemTable;
begin

end;

function TMorph.Boolean: TMorph;
begin

end;

function TMorph.BynaryBlob: TMorph;
begin

end;

function TMorph.ChangeNameTo(const aNewName: String): TMorph;
begin

end;

function TMorph.Config: TMorph;
begin

end;

function TMorph.Connection(const aConnection: TFDConnection): TMorph;
begin

end;

function TMorph.Content(const aMorphTable: TMphTable): TMorph;
begin

end;

constructor TMorph.Create;
begin

end;

function TMorph.CurrentSQLCommand: String;
begin

end;

function TMorph.DatabaseType(const aDBType: TMorphDBType): TMorph;
begin

end;

function TMorph.Date: TMorph;
begin

end;

function TMorph.Delete: TMorph;
begin

end;

destructor TMorph.Destroy;
begin

  inherited;
end;

function TMorph.DoNotRaiseOnRedundances: TMorph;
begin

end;

function TMorph.Drop: TMorph;
begin

end;

function TMorph.Equals<T>(const aValue: T): TMorph;
begin

end;

function TMorph.ExecuteSQL: TMorph;
begin

end;

function TMorph.ExportSettings: TJSONObject;
begin

end;

function TMorph.FDMemTable(const aFDMemTable: TFDMemTable): TMorph;
begin

end;

function TMorph.Field(const aField: String): TMorph;
begin

end;

function TMorph.FieldInfo: TMorphTableFieldInfo;
begin

end;

function TMorph.Fields(const Fields: TArray<string>): TMorph;
begin

end;

function TMorph.FieldsInfo: TMorphTableFieldsInfo;
begin

end;

function TMorph.Float: TMorph;
begin

end;

function TMorph.ForeignKey: TMorph;
begin

end;

function TMorph.From(const aTableName: String): TMorph;
begin

end;

function TMorph.Identity: TMorph;
begin

end;

function TMorph.IgnoreCreatedStructure: TMorph;
begin

end;

function TMorph.ImportSettings(const aConfigJSONString: String): TMorph;
begin

end;

function TMorph.InserFDMEMtableInto(const aTableName: String): TMorph;
begin

end;

function TMorph.InsertInto: TMorph;
begin

end;

function TMorph.InsertJSON(const aJSONString: String): TMorph;
begin

end;

function TMorph.InsertJSONStringInto: TMorph;
begin

end;

function TMorph.Integer: TMorph;
begin

end;

function TMorph.IsBiggerOrEqualThen<T>(const aValue: T): TMorph;
begin

end;

function TMorph.IsBiggerThan<T>(const aValue: T): TMorph;
begin

end;

function TMorph.IsSmallerOrEqualThen<T>(const aValue: T): TMorph;
begin

end;

function TMorph.IsSmallerThen<T>(const aValue: T): TMorph;
begin

end;

function TMorph.JSONContent(const aJSONString: String): TMorph;
begin

end;

class function TMorph.JSONParse(const aJSONString: String): TMphTable;
begin

end;

function TMorph.LoadSettings(const aMorphSettings : TMorphSettings): TMorph;
begin

end;

function TMorph.NewValue<T>(const aNewValue: T): TMorph;
begin

end;

function TMorph.NewValues(const NewValues: TArray<String>): TMorph;
begin

end;

function TMorph.NoOrphaData: TMorph;
begin

end;

function TMorph.NotNull: TMorph;
begin

end;



function TMorph.OutputFDMemTable(const anOutputTable: TFDMemTable): TMorph;
begin

end;

function TMorph.OutputMorphTable(const aMorphTable: TMphTable): TMorph;
begin

end;

function TMorph.Post: TMorph;
begin

end;

function TMorph.PrimaryKey: TMorph;
begin

end;

function TMorph.References: TMorph;
begin

end;

function TMorph.Return: TMorph;
begin

end;

function TMorph.RunFindInAnOtherThread: TMorph;
begin

end;

function TMorph.Select: TMorph;
begin

end;

function TMorph.SetField(const aFieldName: String): TMorph;
begin

end;

function TMorph.SetFields(const Fields: TArray<String>): TMorph;
begin

end;

function TMorph.Table(const aTableName: String): TMorph;
begin

end;

function TMorph.Unique: TMorph;
begin

end;

function TMorph.Update: TMorph;
begin

end;

function TMorph.Value<T>(const aValue: T): TMorph;
begin

end;

function TMorph.Values(const Fields: TArray<string>): TMorph;
begin

end;

function TMorph.Varchar(const aSize: Integer): TMorph;
begin

end;

function TMorph.Where: TMorph;
begin

end;

function TMorph._And: TMorph;
begin

end;

function TMorph._Or: TMorph;
begin

end;

end.
