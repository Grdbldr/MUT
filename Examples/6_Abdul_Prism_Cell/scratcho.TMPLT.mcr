#!MC 1410
$!ReadDataSet  "scratcho.TMPLT.tecplot.dat"
  ReadDataOption = New
  ResetStyle = No
  VarLoadMode = ByName
  AssignStrandIDs = Yes
  VarNameList =  '"X","Y","Z"'
$!WriteDataSet  " scratcho.TMPLT.neighbours.dat"
  IncludeText = No
  IncludeGeom = No
  IncludeCustomLabels = No
  IncludeDataShareLinkage = Yes
  IncludeAutoGenFaceNeighbors = Yes
  VarPositionList =  [1]
  Binary = No
  UsePointFormat = Yes
  Precision = 9
  TecplotVersionToWrite = TecplotCurrent
