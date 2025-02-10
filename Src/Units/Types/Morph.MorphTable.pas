unit Morph.MorphTable;

interface

uses
  Morph.Settings, FireDAC.Comp.Client, System.Classes;

type
 TMphTable = class;

  TMorphField = class
    public
      function AsInteger(const aValue : Integer) : TMphTable;
      function AsString(const aValue : String) : TMphTable;
      function AsFloat(const aValue : Extended) : TMphTable;
      function AsBoolean(const aValue : Boolean) : TMphTable;
      function AsDate(const aValue : TDateTime) : TMphTable;
      function AsBlob(const aValue : TMemoryStream) : TMphTable;
  end;

  TMorphFields = TArray<TMorphField>;

  TMphTable = class
    private
      FName : String;
      FFields : TArray<TMorphFields>;
    public
      function ImportSettings(const aJSONSettings : TMorphSettings) : TMphTable;
      function ExportSettings : TMorphSettings;
      function InsertInto(const aTableName : String) : TMphTable;
      function AsFDMemtable : TFDMemTable;
      function AsJSONString : String;
      function LoadFromFDMemtable(const aMemtable : TFDMemTable) : TMphTable;
      function LoadFromJSONString(const aJSONString : String) : TMphTable;
      procedure Clear;
      function AddField(const aFieldName : String) : TMphTable;
      function TypeInteger : TMphTable;
      function NewLine : TMphTable;
      function TypeString : TMphTable;
      function FieldByName(const aFieldName : String) : TMphTable;
      function SetFields(const aFieldID : Integer) : TMorphField;
      function SetFieldByname(const aFieldName : String) : TMorphField;
      function Post : TMorphField;

      property Name : String read FName write FName;
      property Fields : TArray<TMorphFields> read FFields write FFields;
  end;

  TMphTableArrange = class
    private
    public
      function ImportSettings(const aJSONSettings : TMorphSettings) : TMphTableArrange;
      function ExportSettings : TMorphSettings;
      function Name(const aTableName : String) : TMphTable;
  end;

implementation

{ TMphTable }

function TMphTable.AsFDMemtable: TFDMemTable;
begin

end;

function TMphTable.AsJSONString: String;
begin

end;

procedure TMphTable.Clear;
begin

end;

function TMphTable.ExportSettings: TMorphSettings;
begin

end;

function TMphTable.ImportSettings(
  const aJSONSettings: TMorphSettings): TMphTable;
begin

end;

function TMphTable.InsertInto(const aTableName: String): TMphTable;
begin

end;

function TMphTable.LoadFromFDMemtable(
  const aMemtable: TFDMemTable): TMphTable;
begin

end;

function TMphTable.LoadFromJSONString(const aJSONString: String): TMphTable;
begin

end;

{ TMphTableArrange }

function TMphTableArrange.ExportSettings: TMorphSettings;
begin

end;

function TMphTableArrange.ImportSettings(
  const aJSONSettings: TMorphSettings): TMphTableArrange;
begin

end;

function TMphTableArrange.Name(const aTableName: String): TMphTable;
begin

end;

end.
