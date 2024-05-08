#!MC 1410
$!ReadDataSet  "_buildo.hillslope-mc.GWF.tecplot.dat"
  ReadDataOption = New
  ResetStyle = No
  VarLoadMode = ByName
  AssignStrandIDs = Yes
  VarNameList =  '"X","Y","Z","Layer","Zone","Cell Top","Cell Bottom",'
$!WriteDataSet  "scratch.GWF.neighbours.dat"
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
