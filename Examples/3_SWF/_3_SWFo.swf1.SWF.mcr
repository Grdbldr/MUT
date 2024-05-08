#!MC 1410
$!ReadDataSet  "_3_SWFo.swf1.SWF.tecplot.dat"
  ReadDataOption = New
  ResetStyle = No
  VarLoadMode = ByName
  AssignStrandIDs = Yes
  VarNameList =  '"X","Y","Z","Layer","Ibound","Initial head","SWF\\n Hydraulic Head","Saturation","To STORAGE","To CONSTANT_HEAD","To GWF","To FLOW_FACES",'
$!WriteDataSet  "_3_SWFo.swf1.SWF.neighbours.dat"
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
