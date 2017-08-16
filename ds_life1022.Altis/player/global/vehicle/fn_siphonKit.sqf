/*
	Darkside Life

	Author: Shawn "Huntah" Macgillivray // Warfare[AU]

	Description:
	Siphons fuel from a vehicle
*/

if(player distance (getMarkerPos "auctionHouse") < 300)exitwith{hint "You can not use this item in this area"};
closeDialog 0;
private["_vehicle","_displayName","_upp","_ui","_progress","_pgText","_cP","_previousState","_rand"];
_vehicle = DS_cursorTarget;
DS_moved = false;
if(isNull _vehicle) exitWith {hint "You are not facing a vehicle";};
if(!(_vehicle isKindOF "LandVehicle") && !(_vehicle isKindOf "Air") && !(_vehicle isKindOf "Ship")) exitWith {};
if(player distance _vehicle > 7.5) exitWith {hint "You are not close enough to the vehicle";};

if(typeOf (_vehicle) == "C_Kart_01_Blu_F")exitwith{hint 'You can not syphon from portable go karts';};

if(DS_moral < 500)then
	{
	_rand = random 80;
	}
	else
	{
	_rand = random 100;
	};

[3,false] spawn DS_fnc_moralAlter;

DS_doingStuff = true;
_displayName = getText(configFile >> "CfgVehicles" >> (typeOf _vehicle) >> "displayName");
["siphonKit",false,1] call DS_fnc_handleInventory;
_upp = "Siphoning Fuel";
disableSerialization;
"progressBar" cutRsc ["DS_progress","PLAIN"];
_ui = uiNameSpace getVariable "DS_progress";
_progress = _ui displayCtrl 38201;
_pgText = _ui displayCtrl 38202;
_pgText ctrlSetText format["%2 (1%1)...","%",_upp];
_progress progressSetPosition 0.01;
_cP = 0.01;
_targets = allPlayers select {(_x distance player) < 200};
[player,"AinvPknlMstpSnonWnonDnon_medicUp3"] remoteExecCall ["DS_fnc_animSync",_targets];
player playMoveNow "AinvPknlMstpSnonWnonDnon_medicUp3";
while{true} do
{
	sleep 0.2;
	if(isNull _ui) then {
		"progressBar" cutRsc ["DS_progress","PLAIN"];
		_ui = uiNamespace getVariable "DS_progress";
		_progressBar = _ui displayCtrl 38201;
		_titleText = _ui displayCtrl 38202;
	};
	_cP = _cP + 0.01;
	_progress progressSetPosition _cP;
	_pgText ctrlSetText format["%3 (%1%2)...",round(_cP * 100),"%",_upp];
	if(_cP >= 1) exitWith {};
	if(!alive player) exitWith {};
	if(DS_moved) exitWith {};
};
DS_doingStuff = false;
"progressBar" cutText ["","PLAIN"];
player playActionNow "stop";
if(!alive player) exitWith {};
if(DS_moved) exitWith {DS_moved = false;hint "You must not move while siphoning a vehicle";["siphonKit",true,1] call DS_fnc_handleInventory;};
if(player distance _vehicle > 7.5) exitWith {hint "You are not close enough to the vehicle";};
if(_rand > 80) exitwith
	{
	hint "Opps, you messed that up and swallowed a bit too much fuel!";
	DS_thirst = (DS_thirst - 25);
	if(DS_thirst < 0) then {DS_thirst = 0;};
	[] call DS_fnc_updateHud;
	};

switch (true) do
{
	case (_vehicle isKindOF "LandVehicle"):
		{
		if(!local _vehicle) then
			{
			[[_vehicle],{(_this select 0) setFuel 0;}] remoteExec ["BIS_fnc_spawn",_vehicle];
			}
			else
			{
			_vehicle setFuel 0;
			};
		};

	case (_vehicle isKindOf "Air"):
		{
		if(!local _vehicle) then
			{
			[[_vehicle],{(_this select 0) setFuel 0;}] remoteExec ["BIS_fnc_spawn",_vehicle];
			}
			else
			{
			_vehicle setFuel 0;
			};
		};

	case (_vehicle isKindOf "Ship"):
		{
		if(!local _vehicle) then
			{
			[[_vehicle],{(_this select 0) setFuel 0;}] remoteExec ["BIS_fnc_spawn",_vehicle];
			}
			else
			{
			_vehicle setFuel 0;
			};
		};
};
hint "You have siphoned fuel from this vehicle";
["refuelKit",true,1] call DS_fnc_handleInventory;
if((DS_infoArray select 15) == 3)then { [1] call DS_fnc_questCompleted };
if((_vehicle getVariable ["policeVehicle",false])&&((DS_infoArray select 15) == 23))then { [1] call DS_fnc_questCompleted };