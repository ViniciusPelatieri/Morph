unit Morph.Settings;

interface

type
  TMorphSettings = class
    private
    public
      function LoadFromJSONString(const aConfigString : String) : TMorphSettings;
      function ExportToJSONString : String;
  end;

implementation

{ TMorphSettings }

function TMorphSettings.ExportToJSONString: String;
begin

end;

function TMorphSettings.LoadFromJSONString(
  const aConfigString: String): TMorphSettings;
begin

end;

end.
