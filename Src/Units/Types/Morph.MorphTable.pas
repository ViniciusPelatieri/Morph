unit Morph.MorphTable;

interface

uses
  Morph.Settings, FireDAC.Comp.Client;

type
  TMorphTable = class
    private
    public
      function ImportSettings(const aJSONSettings : TMorphSettings) : TMorphTable;
      function ExportSettings : TMorphSettings;
      function InsertInto(const aTableName : String) : TMorphTable;
      function AsFDMemtable : TFDMemTable;
      function AsJSONString : String;
      function LoadFromFDMemtable(const aMemtable : TFDMemTable) : TMorphTable;
      function LoadFromJSONString(const aJSONString : String) : TMorphTable;
  end;

  TMorphTableArrange = class
    private
    public
      function ImportSettings(const aJSONSettings : TMorphSettings) : TMorphTableArrange;
      function ExportSettings : TMorphSettings;
  end;

implementation

{ TMorphTable }

function TMorphTable.AsFDMemtable: TFDMemTable;
begin

end;

function TMorphTable.AsJSONString: String;
begin

end;

function TMorphTable.ExportSettings: TMorphSettings;
begin

end;

function TMorphTable.ImportSettings(
  const aJSONSettings: TMorphSettings): TMorphTable;
begin

end;

function TMorphTable.InsertInto(const aTableName: String): TMorphTable;
begin

end;

function TMorphTable.LoadFromFDMemtable(
  const aMemtable: TFDMemTable): TMorphTable;
begin

end;

function TMorphTable.LoadFromJSONString(const aJSONString: String): TMorphTable;
begin

end;

{ TMorphTableArrange }

function TMorphTableArrange.ExportSettings: TMorphSettings;
begin

end;

function TMorphTableArrange.ImportSettings(
  const aJSONSettings: TMorphSettings): TMorphTableArrange;
begin

end;

end.
