#!MC 1410
$!ReadDataSet  "_3_SWFo.swf1.GWF.tecplot.dat"
  ReadDataOption = New
  ResetStyle = No
  VarLoadMode = ByName
  AssignStrandIDs = Yes
  VarNameList =  '"X","Y","Z","Layer","Ibound","Initial head","Kh","GWF\\n Hydraulic Head","Saturation","To STORAGE","To CONSTANT_HEAD","To SWF","To FLOW_FACES",'
$!WriteDataSet  "_3_SWFo.swf1.GWF.neighbours.dat"
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
