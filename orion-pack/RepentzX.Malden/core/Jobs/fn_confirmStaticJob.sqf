
diag_log format ["%1",_this];

_JobLocation = _this select 0;
_HastheplayerStarted = player getVariable ["JobStarted",false];
_Job = player getVariable ["Job", ""];
player setVariable ["JobStarted",false,true];
ADT_JobVehicle = _JobLocation;
[]spawn AdtC_fnc_JobThread;

_JobVar = player getVariable ["Job",""];
_JobTitle = getText(missionConfigFile >> "ADT_Jobs" >> _JobVar >> "JobTitle");
_Amount = getNumber(missionConfigFile >> "ADT_Jobs" >> _JobVar >> "Wage");
_Wageper = getNumber(missionConfigFile >> "ADT_Jobs" >> _JobVar >> "PayCheckPer");
_distance = getNumber(missionConfigFile >> "ADT_Jobs" >> _JobVar >> "HowFar");
hint "You have now Started the job, You will have a paycheck whilst doing activities with your job.";