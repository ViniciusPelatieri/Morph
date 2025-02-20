unit Morph.EnumeratedTypes;

interface

type
  TMorphDBType = (FB2_5, FB5);
  TMorphEmptyType = (Empty);
  TMorphFieldTypes = (mphUndefined, mphInteger, mphVarchar, mphFloat, mphDate, mphBoolean, mphTXTBlob,  mphBinaryBlob);
  TMorphBasicTypes = (mbtNumber, mbtString, mbtDate, mbtBoolean);
  TMorphStages = (mpsCreate, mpsReference, mpsInsert, mpsDelete, mpsSelect);
  TMorphQryAction = (Open, Execute);
  TMorphRelationsbehavior = (mrbNoOrphanData, mrbNullOrphanData, mrbDeleteOrphanData);
  TMorphDateOrientation = (mdoDD_MM_AAAA, mdoMM_DD_AAAA, mdoAAAA_MM_DD);

implementation

end.
