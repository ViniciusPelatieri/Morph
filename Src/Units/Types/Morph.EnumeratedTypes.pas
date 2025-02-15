unit Morph.EnumeratedTypes;

interface

type
  TMorphDBType = (FB2_5, FB5);
  TMorphEmptyType = (Empty);
  TMorphFieldTypes = (mphInteger, mphVarchar, mphFloat, mphDate, mphBoolean, mphTXTBlob,  mphBinaryBlob);
  TMorphStages = (mpsCreate, mpsReference, mpsInsert, mpsDelete, mpsSelect);
  TMorphQryAction = (Open, Execute);
  TMorphRelationsbehavior = (mrbNoOrphanData, mrbNullOrphanData, mrbDeleteOrphanData);

implementation

end.
