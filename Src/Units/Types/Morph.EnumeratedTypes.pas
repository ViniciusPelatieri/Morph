unit Morph.EnumeratedTypes;

interface

type
  TMorphDBType = (FB2_5, FB5);
  TMorphEmptyType = (Empty);
  TMorphFieldTypes = (mphUndefined, mphInteger, mphVarchar, mphFloat, mphDate, mphBoolean, mphTXTBlob,  mphBinaryBlob);
  TMorphBasicTypes = (mbtNumber, mbtString, mbtDate, mbtBoolean);
  TMorphStages = (mpsCreate, mpsReference, mpsInsert, mpsDelete, mpsSelect, mpsInsertFromVisualComponent);
  TMorphQryAction = (mqaOpen, mqaExecute);
  TMorphRelationsbehavior = (mrbNoOrphanData, mrbNullOrphanData, mrbDeleteOrphanData);
  TMorphDateOrientation = (mdoDD_MM_AAAA, mdoMM_DD_AAAA, mdoAAAA_MM_DD);
  TMorphSQLOperations = (msoField, msoEquals, msoDiffers, msoIsBiggerThan, msoIsSmallerThan, msoOr, msoAnd);

implementation

end.     mover  RunPSQL(const aCommand : String; const aQryAction : TMorphQryAction)  para o dababase utilities
