
//fn_JoinJob.sqf
if(lbcurSel 9956630 isEqualTo -1)exitWith{
	systemChat "No Job Selected";
};
_Something = player getVariable ["JobStarted",true];
_workers = 0;
if(_Something)exitWith{
 systemChat "You have a job but haven't started it";
};
_JobClass = lbData [9956630, (lbCurSel 9956630)];
if(player getVariable ["Job",""] != "")exitWith{
	systemChat "Player has Job";
};

{
	if(_x getVariable ["Job",""] == _JobClass)then{
		_Workers = _Workers + 1;
	};
}count playableUnits;
_JobVar = getText(missionconfigfile >> "ADT_Jobs" >> _JobClass >> "JobVar");
_maxWorkers = getNumber(missionconfigfile >> "ADT_Jobs" >> _JobClass >> "MaxWorkers");
if(_workers >= _maxWorkers)exitWith{
	//Too many people Working.
};
_JobTitle = getText(missionconfigfile >> "ADT_Jobs" >> _JobClass >> "JobTitle");
if(getText(missionconfigFile >> "ADT_Jobs" >> _JobClass >> "Type") == "Roaming")then{
 hint "You have Confirmed your job.  To start the job, Repair fallen or broken objects in your area to get payments";
};

if(getText(missionconfigFile >> "ADT_Jobs" >> _JobClass >> "Type") == "Static")then{
	 hint "You have Confirmed your job. Repair fallen or broken objects in your area to get payments";
};
player setVariable ["JobStarted",true,true];
player setVariable ["Job",_JobClass,true];
//[]spawn ATDC_fnc_JobThread;
sleep 600;
if(player getVariable ["JobStarted",true])exitWith{
	player setVariable ["JobStarted",false,true];
	player setVariable ["Job","",true];
	hint "You have taken too long to start the job, you will need to reapply.";
};



