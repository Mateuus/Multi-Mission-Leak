//Job thread
_BaseCount = 0;
_payCount = 0;
_Dicksplash = "";
_TooFar = false;
_Something = player getVariable ["JobStarted",false];
_JobEnd = {
	player setVariable ["Job","",true];
	player getVariable ["JobStarted",false];
	if(!isNull ADT_JobVehicle)then{
		if(!(typeof ADT_JobVehicle in["Land_InfoStand_V1_F"]))then{
			deleteVehicle ADT_JobVehicle;
		};
	};
	player setVariable ["Vehicle",objNull,true];
	if(player getVariable["Job",""] == "")exitWith{};
};
while{true}do{
	if(player getVariable ["JobStarted",true])then{
		player setVariable ["JobStarted",false,true];
	};
	if(player getVariable ["Job",""] == "")exitWith{};//No job so Exit.
	//Check if the player is near his work position.
	_JobVar = player getVariable ["Job",""];
	_JobTitle = getText(missionConfigFile >> "ADT_Jobs" >> _JobVar >> "JobTitle");
	_Amount = getNumber(missionConfigFile >> "ADT_Jobs" >> _JobVar >> "Wage");
	_Wageper = getNumber(missionConfigFile >> "ADT_Jobs" >> _JobVar >> "PayCheckPer");
	_distance = getNumber(missionConfigFile >> "ADT_Jobs" >> _JobVar >> "HowFar");
	_Type = getText(missionConfigFile >> "ADT_Jobs" >> "_JobVar" >> "Type");
	//Checking distance from needed object before Paycheck;Long and drawn out but Meh
	if(isNull ADT_JobVehicle)exitWith{
		hint "Your job vehicle has been destroyed, or is no where to be seen and you have lost your job, you will need to get a new one";
		player setVariable ["Job","",true];
		[] call _JobEnd;
	};
	if(life_is_Arrested)exitWith{
		hint "You are in jail and lost your job, when you get out, you will need to apply for a new one.";
		[] call _JobEnd;
	};
	if(player distance ADT_JobVehicle < _distance)then{
		_TooFar = false;
	};
	if(_type == "Roaming")then{
			_Dicksplash = "Vehicle";
	};
	if(_type == "Static")then{
			_Dicksplash = "Marker";
	};
	if(_TooFar)then{
		hint "You have gone to far away from your vehicle and lost your job, you will need to apply for a new one.";
		[] call _JobEnd;
	}else{
		if(player distance ADT_JobVehicle > _distance)then{
			_TooFar = true;
			hint "You are too far away from your vehicle you have one minute to get back or you will lose your job";
		};
	};
	//PayCheckAmounts
	if(_payCount >= _Wageper)then{
		_payCount = 0;
		hint "You have been paid for working in your job, you will be paid again in several minutes";
		life_houseProtect = life_houseProtect + _Amount;
	}else{
		_payCount = _payCount + 1;
	};

	//Checking if the job is over.
	_JobLengthMins = getNumber(missionConfigFile >> "ADT_Jobs" >> _JobVar >> "HowLong");
	if(_BaseCount >= _JobLengthMins)then{
		_BaseCount = 0;
		hint "Your job is over, you will need to go and apply for a new job";
		player setVariable ["Job","",true];
		[] call _JobEnd;
	}else{
		_BaseCount = _BaseCount + 1;
	};

	sleep 60;
};