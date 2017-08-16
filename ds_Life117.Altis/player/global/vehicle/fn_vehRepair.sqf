/*
Darkside Life

Author: Shawn "Huntah" Macgillivray

Description:
	Takes inventory items from vehicles
*/

private ["_vehicle","_vehicleString","_sleep","_isValid","_progress","_ui","_sleep2","_highwayPatrol"];
closeDialog 0;
_vehicle = DS_cursorTarget;
if(isNil "DS_mechanicMission")then{DS_mechanicMission = false};
if((player getVariable ["mechanic",false])&&(_vehicle getVariable ["mechanicMission",false])&&(!DS_mechanicMission))exitWith
	{
	DS_mechanicMission = true;
	};
	
if(DS_mechanicMission)exitwith{};

DS_moved = false;
_highwayPatrol = false;
_isValid = false;
_sleep2 = 0;
_sleep = 0.18;
if((player getVariable ["policeSquad",""]) == "Highway Patrol")then{_highwayPatrol = true};
if(DS_moral > 100)then
	{
	_sleep2 = (DS_moral/8333);
	};
_sleep = _sleep - _sleep2;

if(((DS_infoArray select 19) > 36)&&(player getVariable ["security",false]))then
	{
	_sleep = (_sleep/2);
	};

if((_vehicle isKindOf "Car")||(_vehicle isKindOf "Air")||(_vehicle isKindOf "Ship")||(_vehicle isKindOf "Tank"))then
	{
	_isValid = true;
	};
if(!_isValid)exitwith{hint "This is an invalid vehicle type"};
if(player distance _vehicle > 7)exitwith{};
if(!_highwayPatrol)then
	{
	["repairKit",false,1] call DS_fnc_handleInventory;
	};
DS_doingStuff = true;
_vehicleString = getText(configFile >> "CfgVehicles" >> (typeOf _vehicle) >> "displayName");
_upp = format["Repairing %1",_vehicleString];
disableSerialization;
5 cutRsc ["DS_progress","PLAIN"];
_ui = uiNameSpace getVariable "DS_progress";
_progress = _ui displayCtrl 38201;
_pgText = _ui displayCtrl 38202;
_pgText ctrlSetText format["%2 (1%1)...","%",_upp];
_progress progressSetPosition 0.01;
_cP = 0.01;

[]spawn 
	{
	while{true}do
		{
		if(!DS_doingStuff)exitwith{};
		{
			if(player distance _x < 100)then
				{
				[[player,"repair"],"DS_fnc_playSounds",_x,false] spawn DS_fnc_MP;
				};
		}forEach playableUnits;
		sleep 2.5;
		};
	};
[[player,"AinvPknlMstpSnonWnonDnon_medicUp3"],"DS_fnc_animSync",true,false] spawn DS_fnc_MP;
player playMoveNow "AinvPknlMstpSnonWnonDnon_medicUp3";	
if((player getVariable ["policeSquad",""]) == "Rapid Response")then{_sleep = 0.03};	
if((player getVariable ["mechanic",false])&&((DS_infoArray select 23) > 18))then{_sleep = 0.03};
while{true} do
	{
	sleep _sleep;
	_cP = _cP + 0.01;
	_progress progressSetPosition _cP;
	_pgText ctrlSetText format["%3 (%1%2)...",round(_cP * 100),"%",_upp];
	if(_cP >= 1) exitWith {};
	if(!alive player) exitWith {};
	if(player distance _vehicle > 10) exitWith {};
	if(player != vehicle player) exitWith {};
	if(DS_moved) exitWith {};
	};
DS_doingStuff = false;
5 cutText ["","PLAIN"];
player playActionNow "stop";
if(!alive player)exitwith{};
if(player distance _vehicle > 10) exitWith {hint "You moved too far from the vehicle";["repairKit",true,1] call DS_fnc_handleInventory;};
if(player != vehicle player) exitWith {hint "You must remain outside the vehicle to repair it";["repairKit",true,1] call DS_fnc_handleInventory;};
if(DS_moved) exitWith {DS_moved = false;hint "You must not move while repairing a vehicle";["repairKit",true,1] call DS_fnc_handleInventory;};


_vehicle setDamage 0;
if(fuel _vehicle < 0.01)then
	{
	if(!local _vehicle) then
		{
		[[[_vehicle],{_this select 0 setFuel ((Fuel (_this select 0)) + 0.2);}],"BIS_fnc_spawn",_vehicle,false] spawn BIS_fnc_MP;
		if((DS_infoArray select 13) == 23)then
			{
			[0] call DS_fnc_questCompleted;
			};
		}
		else
		{
		if((DS_infoArray select 13) == 23)then
			{
			[0] call DS_fnc_questCompleted;
			};
		_vehicle setFuel ((fuel _vehicle) + 0.2);
		};
	};
titleText [format ["You have repaired this %1",_vehicleString],"PLAIN"];

if((DS_infoArray select 13) == 10)then
	{
	[0] call DS_fnc_questCompleted;
	};





