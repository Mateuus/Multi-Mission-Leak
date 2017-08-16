/*
		File: activateNitro.sqf
		Author: John "Paratus" VanderZwet
		
		Description: Activates nitrous injector on car
		
		Edits by Huntah for police boost
*/
private ["_timer","_speed"];


_timer = 30;


_vehicle = vehicle player;

if (_vehicle == player) exitWith {};
if (driver _vehicle != player) exitWith {};
if((playerside != west)&&(!(player getVariable ["security",false]))&&(!(player getVariable ["medic",false])))then{DS_police_nos = true};
if(((playerside == west)||(player getVariable ["security",false])||(player getVariable ["medic",false]))&&(DS_police_nos))exitwith{hint "This vehicle is still recharging from its last boost"};

if((playerside != west)&&(!(player getVariable ["security",false]))&&(!(player getVariable ["medic",false])))then
	{
	if ((_vehicle getVariable ["nitro",0]) < 1) exitWith {};
	};

if ((speed _vehicle) <= 10) exitWith { systemChat format ["You must be moving at over 10km/h to activate Nitro."]; };

if(player getVariable ["medic",false])exitWith
	{
	_speed = 22;
	[[(vehicle player),"NosSound"],"DS_fnc_playSounds"] spawn DS_fnc_MP;
	systemChat "Medic Boost Engaged.";
	DS_police_nos = true;
	_vel = velocity _vehicle;
	_dir = direction _vehicle; //how much you want to add speed for the vehicle
	if((vehicle player) isKindOf "Ship")then
		{
		_speed = 35;
		_vehicle setVelocity [(_vel select 0)+(sin _dir*_speed),(_vel select 1)+ (cos _dir*_speed),(_vel select 2)+2];
		}
		else
		{
		_vehicle setVelocity [(_vel select 0)+(sin _dir*_speed),(_vel select 1)+ (cos _dir*_speed),(_vel select 2)];
		};
	if((DS_infoArray select 10) == 8)then
		{
		_tempNum = DS_infoArray select 11;
		_tempNum = _tempNum + 1;
		DS_infoArray set [11,_tempNum];
		if((DS_infoArray select 11) > 19)then
			{
			[3] call DS_fnc_questCompleted;
			};
		};
	if((DS_infoArray select 10) == 22)then
		{
		_tempNum = DS_infoArray select 11;
		_tempNum = _tempNum + 1;
		DS_infoArray set [11,_tempNum];
		if((DS_infoArray select 11) > 49)then
			{
			[3] call DS_fnc_questCompleted;
			};
		};
	if((DS_infoArray select 10) > 8)then
		{
		_timer = (_timer - 10);
		};
	if((DS_infoArray select 10) > 22)then
		{
		_timer = (_timer - 10);
		};
	sleep _timer;
	hint "Boost Recharged";
	DS_police_nos = false;
	};

if(player getVariable ["security",false])exitWith
	{
	if((DS_infoArray select 19) > 27)then{_speed = 32}else{_speed = 22};
	if((DS_infoArray select 19) > 2)then{_timer = 20};
	if((DS_infoArray select 19) > 18)then{_timer = 15};
	[[(vehicle player),"NosSound"],"DS_fnc_playSounds"] spawn DS_fnc_MP;
	systemChat "Speed Boost Engaged.";
	DS_police_nos = true;
	_vel = velocity _vehicle;
	_dir = direction _vehicle; //how much you want to add speed for the vehicle
	if((vehicle player) isKindOf "Ship")then
		{
		_speed = 35;
		_vehicle setVelocity [(_vel select 0)+(sin _dir*_speed),(_vel select 1)+ (cos _dir*_speed),(_vel select 2)+2];
		}
		else
		{
		_vehicle setVelocity [(_vel select 0)+(sin _dir*_speed),(_vel select 1)+ (cos _dir*_speed),(_vel select 2)];
		};

	sleep _timer;
	hint "Boost Recharged";
	DS_police_nos = false;
	
	if((DS_infoArray select 19) == 2)then
		{
		_tempNum = DS_infoArray select 20;
		_tempNum = _tempNum + 1;
		DS_infoArray set [20,_tempNum];
		if((DS_infoArray select 20) > 19)then
			{
			[3] call DS_fnc_questCompleted;
			};
		};
	if((DS_infoArray select 19) == 18)then
		{
		_tempNum = DS_infoArray select 20;
		_tempNum = _tempNum + 1;
		DS_infoArray set [20,_tempNum];
		if((DS_infoArray select 20) > 49)then
			{
			[3] call DS_fnc_questCompleted;
			};
		};
	if((DS_infoArray select 19) == 27)then
		{
		_tempNum = DS_infoArray select 20;
		_tempNum = _tempNum + 1;
		DS_infoArray set [20,_tempNum];
		if((DS_infoArray select 20) > 99)then
			{
			[3] call DS_fnc_questCompleted;
			};
		};
	if((DS_infoArray select 19) == 35)then
		{
		_tempNum = DS_infoArray select 20;
		_tempNum = _tempNum + 1;
		DS_infoArray set [20,_tempNum];
		if((DS_infoArray select 20) > 199)then
			{
			[3] call DS_fnc_questCompleted;
			};
		};
	};

if(playerside != west)then
	{
	[[(vehicle player),"NosSound"],"DS_fnc_playSounds"] spawn DS_fnc_MP;
	_vehicle setVariable["nitro",((_vehicle getVariable["nitro",0]) - 1),true];
	_vehicle setVariable["nitroTime", time, false];
	systemChat "Nitro engaged.";
	_vel = velocity _vehicle;
	_dir = direction _vehicle;
	_speed = 50; //how much you want to add speed for the vehicle
	_vehicle setVelocity [(_vel select 0)+(sin _dir*_speed),(_vel select 1)+ (cos _dir*_speed),(_vel select 2)];
	if((DS_infoArray select 13) == 11)then
		{
		[0] call DS_fnc_questCompleted;
		};
	if(((DS_infoArray select 13) == 41)&&(playerside == civilian))then
		{
		_tempNum = DS_infoArray select 14;
		_tempNum = _tempNum + 1;
		DS_infoArray set [14,_tempNum];
		if((DS_infoArray select 14) > 49)then
			{
			[0] call DS_fnc_questCompleted;
			};
		};
	if(((DS_infoArray select 23) == 17)&&(player getVariable ["mechanic",false]))then
		{
		_tempNum = DS_infoArray select 24;
		_tempNum = _tempNum + 1;
		DS_infoArray set [24,_tempNum];
		if((DS_infoArray select 14) > 49)then
			{
			[3] call DS_fnc_questCompleted;
			};
		};
	}
	else
	{
	if((player getVariable ["policeSquad",""]) == "Highway Patrol")then{_timer = _timer - 10};
	if((player getVariable ["policeSquad",""]) == "Rapid Response")then{_timer = _timer - 10};
	if((DS_infoArray select 21) > 9)then{_timer = _timer - 5;};
	if((DS_infoArray select 21) > 22)then{_timer = _timer - 5;};
	[[(vehicle player),"NosSound"],"DS_fnc_playSounds"] spawn DS_fnc_MP;
	systemChat "Police Boost Engaged.";
	DS_police_nos = true;
	_vel = velocity _vehicle;
	_dir = direction _vehicle; //how much you want to add speed for the vehicle
	if((vehicle player) isKindOf "Ship")then
		{
		_speed = 35;
		_vehicle setVelocity [(_vel select 0)+(sin _dir*_speed),(_vel select 1)+ (cos _dir*_speed),(_vel select 2)+6];
		if((player getVariable ["policeSquad",""]) == "Coast Guard")then{_timer = 5;};
		}
		else
		{
		_speed = 22;
		if((player getVariable ["policeSquad",""]) == "Rapid Response")then{_speed = 32;};
		_vehicle setVelocity [(_vel select 0)+(sin _dir*_speed),(_vel select 1)+ (cos _dir*_speed),(_vel select 2)];
		};

	sleep _timer;
	hint "Boost Recharged";
	DS_police_nos = false;
	
	};
	
