unit Morph.Filter;

interface

type

  TMorphFilter = class
    private
    public
      function Where : TMorphFilter;
      function _Or : TMorphFilter;
      function _And : TMorphFilter;
      function DiffersFromValue : TMorphFilter;
      function DiffersFromFalues : TMorphFilter;
      function IsEqualTo : TMorphFilter;
  end;

implementation

{ TMorphFilter }

function TMorphFilter.DiffersFromFalues: TMorphFilter;
begin

end;

function TMorphFilter.DiffersFromValue: TMorphFilter;
begin

end;

function TMorphFilter.IsEqualTo: TMorphFilter;
begin

end;

function TMorphFilter.Where: TMorphFilter;
begin

end;

function TMorphFilter._And: TMorphFilter;
begin

end;

function TMorphFilter._Or: TMorphFilter;
begin

end;

end.
