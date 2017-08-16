/*
	Darkside Life

	Author: Shawn "Huntah" Macgillivray

	Description:
	Unrestrain a civilian
*/

private["_type","_currentPoint","_marker","_counter","_failCounter","_amount","_minutes"];

_type = _this select 0;

switch(_type)do
	{
	case 0:
		{
		player setVariable ["blowUp",false,true];
		_currentPoint = _this select 1;

		DS_carBombTask = player createSimpleTask ["carBombTask"];
		DS_carBombTask setSimpleTaskDescription ["Go to the location marked on your map and remain in the area for 3 minutes","Bomb Placement Point","Terrorist Mission - Phase Two"];
		DS_carBombTask setSimpleTaskDestination (getMarkerPos _currentPoint);
		DS_carBombTask setTaskState "Assigned";
		player setCurrentTask DS_carBombTask;

		systemchat "Your job is to go to the location marked on your map and remain in the area for 3 minutes, you will then have 1 minute to leave before the bombs go off";
		hint "Your job is to go to the location marked on your map and remain in the area for 3 minutes, you will then have 1 minute to leave before the bombs go off";
		DS_rebelMission = true;
		DS_currentTask1 = "Terrorist Mission - Phase Two";
		DS_currentTask2 = "You must travel to the location marked on your map and remain there for three minutes to active the bomb. Once three minutes is up you will have one minute to leave before it explodes";
		};
	case 1:
		{
		player setVariable ["blowUp",false,true];
		player say3D "Fail";
		systemchat "You died while doing a terrorist mission, therefore you have failed";
		hint "You died while doing a terrorist mission, therefore you have failed";
		DS_currentTask1 = "";
		DS_rebelMission = false;
		player removeSimpleTask DS_carBombTask;
		};
	case 2:
		{
		player setVariable ["blowUp",false,true];
		player say3D "Fail";
		systemchat "You have been restrained while doing a terrorist mission, therefore you have failed";
		hint "You been restrained while doing a terrorist mission, therefore you have failed";
		DS_currentTask1 = "";
		DS_rebelMission = false;
		player removeSimpleTask DS_carBombTask;
		};
	case 3:
		{
		_counter = 180;
		_failCounter = 0;
		_currentPoint = _this select 1;
		while{true}do
			{
			if(!DS_rebelMission)exitwith{};
			if(_counter < 10)exitwith{player setVariable ["blowUp",true,true];systemchat "Bomb is triggered, Run!";hint "Bomb is triggered, Run!";};
			if(player distance (getMarkerPos _currentPoint) < 10)then{systemchat format ["You're in the area, remain here for another %1 seconds to detonate the bomb",_counter];hint format ["You're in the area, remain here for another %1 seconds to detonate the bomb",_counter];_counter = _counter - 10;};
			sleep 10;
			};
		};
	case 4:
		{
		player setVariable ["blowUp",false,true];
		player say3D "success";
		systemchat "Great job, your payment has been deposited into your bank account";
		hint "Great job, your payment has been deposited into your bank account";
		[5000000,true,true] call DS_fnc_handleMoney;
		DS_rebelMission = false;

		if(DS_tokenMission == 9)then
			{
			DS_tokenMission = -1;
			[500,name player,false] spawn DS_civ_payTokens;
			DS_rebelMissionToken = false;
			};
		DS_currentTask1 = "";
		_amount = [] call DS_fnc_getCopScore;
		_amount = (_amount*30000);
		[_amount] spawn DS_civ_payGangAccount;
		player removeSimpleTask DS_carBombTask;
		if((DS_infoArray select 17) == 38)then { [2] call DS_fnc_questCompleted };
		};
	case 5:
		{
		player setVariable ["blowUp",false,true];
		player say3D "fail";
		systemchat "You failed to complete your terrorist mission in time";
		hint "You failed to complete your terrorist mission in time";
		DS_rebelMission = false;
		};
	case 6:
		{
		_minutes = (round((_this select 1)/60));
		systemchat format ["You have %1 minutes left to complete your mission",_minutes];
		hint format ["You have %1 minutes left to complete your mission",_minutes];
		};
	};