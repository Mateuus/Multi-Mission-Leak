#include "..\..\script_macros.hpp"
/*
	File: fn_stealfuel.sqf
	Author: RPGforYOU
	Website: www.outlawed-veterans.com
	
	Description:
	Steals the fuel from the vehicles
*/
private["_vehicle","_displayName","_upp","_ui","_progress","_pgText","_cP","_previousState","_time","_badDistance"];
if(playerSide in [west,independent]) exitWith {hint"You have a job to do, stealing is not one of them!";};
_vehicle = cursorTarget;
life_interrupted = false;
if(life_inv_hose < 1) exitWith {hint"You don't have a hose, how are you gone steal fuel?";};
if(isNull _vehicle) exitWith {hint localize "STR_ISTR_Jerry_NotLookingDrain"};
if(!(_vehicle isKindOF "LandVehicle") && !(_vehicle isKindOf "Air") && !(_vehicle isKindOf "Ship")) exitWith {};
if(player distance _vehicle > 7.5) exitWith {hint localize "STR_ISTR_Jerry_NotNear"};

life_action_inUse = true;
_displayName = getText(configFile >> "CfgVehicles" >> (typeOf _vehicle) >> "displayName");

_upp = format[localize "STR_ISTR_Jerry_Drain_Process",_displayName];
//Setup our progress bar.
disableSerialization;
5 cutRsc ["life_progress","PLAIN"];
_ui = uiNameSpace getVariable "life_progress";
_progress = _ui displayCtrl 38201;
_pgText = _ui displayCtrl 38202;
_pgText ctrlSetText format["%2 (1%1)...","%",_upp];
_progress progressSetPosition 0.01;
_cP = 0.01;
if (_vehicle isKindOF "LandVehicle") then {
if(life_inv_hose < 1) exitWith {hint"You don't have a hose, how are you gone steal fuel?";};
if(life_inv_fuelEmpty < 2) exitWith {hint"You don't have enough(2) empty fuel cans to put the fuel into! Leaving it on the floor is very suspicious";};
_time = 0.03;
};
if (_vehicle isKindOf "Air") then {
if(life_inv_hose < 1) exitWith {hint"You don't have a hose, how are you gone steal fuel?";};
if(life_inv_fuelEmpty < 4) exitWith {hint"You don't have enough(4) empty fuel cans to put the fuel into! Leaving it on the floor is very suspicious";};
_time = 0.01;
};
if (_vehicle isKindOf "Tank") then {
if(life_inv_hose < 1) exitWith {hint"You don't have a hose, how are you gone steal fuel?";};
if(life_inv_fuelEmpty < 4) exitWith {hint"You don't have enough(4) empty fuel cans to put the fuel into! Leaving it on the floor is very suspicious";};
_time = 0.01;
};
if (_vehicle isKindOf "Ship") then {
if(life_inv_hose < 1) exitWith {hint"You don't have a hose, how are you gone steal fuel?";};
if(life_inv_fuelEmpty < 3) exitWith {hint"You don't have enough(3) empty fuel cans to put the fuel into! Leaving it on the floor is very suspicious";};
_time = 0.02;
};

while{true} do
{
	if(animationState player != "AinvPknlMstpSnonWnonDnon_medic_1") then {
		[[player,"AinvPknlMstpSnonWnonDnon_medic_1"],"life_fnc_animSync",true,false] spawn life_fnc_MP;
		player playMoveNow "AinvPknlMstpSnonWnonDnon_medic_1";
	};
	uiSleep 0.2;
	if(isNull _ui) then {
		5 cutRsc ["life_progress","PLAIN"];
		_ui = uiNamespace getVariable "life_progress";
		_progressBar = _ui displayCtrl 38201;
		_titleText = _ui displayCtrl 38202;
	};
	_cP = _cP + _time;
	_progress progressSetPosition _cP;
	_pgText ctrlSetText format["%3 (%1%2)...",round(_cP * 100),"%",_upp];
	if(_cP >= 1) exitWith {};
	if(player distance _vehicle > 4) exitWith {_badDistance = 1;};
	if(!alive player) exitWith {_badDistance = 1;};
	if(life_interrupted) exitWith {_badDistance = 1;};
};

if(_badDistance == 1) exitWith { hint "Car is too far away to drain that fuel! It needs to be stationary!";life_action_inUse = false;};

life_action_inUse = false;
5 cutText ["","PLAIN"];
player playActionNow "stop";
if(!alive player) exitWith {};
if(life_interrupted) exitWith {life_interrupted = false; titleText[localize "STR_NOTF_ActionCancel","PLAIN"];};


switch (true) do
{
	case (_vehicle isKindOF "LandVehicle"):
	{
		if(!local _vehicle) then
		{			
			[[_vehicle,(Fuel _vehicle) - 1],"life_fnc_setFuel",_vehicle,false] spawn life_fnc_MP;
			[true,"fuelFull",2] call life_fnc_handleInv;
			[false,"fuelEmpty",2] call life_fnc_handleInv;
		}
			else
		{
			_vehicle setFuel 0;
			[true,"fuelFull",2] call life_fnc_handleInv;
			[false,"fuelEmpty",2] call life_fnc_handleInv;
		};
	};
	
	case (_vehicle isKindOf "Air"):
	{
		if(!local _vehicle) then
		{
			[[_vehicle,(Fuel _vehicle) - 1],"life_fnc_setFuel",_vehicle,false] spawn life_fnc_MP;
			[true,"fuelFull",4] call life_fnc_handleInv;
			[false,"fuelEmpty",4] call life_fnc_handleInv;
		}
			else
		{
			_vehicle setFuel 0;
			[true,"fuelFull",4] call life_fnc_handleInv;
			[false,"fuelEmpty",4] call life_fnc_handleInv;
		};
	};
	
	case (_vehicle isKindOf "Tank"):
	{
		if(!local _vehicle) then
		{
			[[_vehicle,(Fuel _vehicle) - 1],"life_fnc_setFuel",_vehicle,false] spawn life_fnc_MP;
			[true,"fuelFull",4] call life_fnc_handleInv;
			[false,"fuelEmpty",4] call life_fnc_handleInv;
		}
			else
		{
			_vehicle setFuel 0;
			[true,"fuelFull",4] call life_fnc_handleInv;
			[false,"fuelEmpty",4] call life_fnc_handleInv;
		};
	};
	
	case (_vehicle isKindOf "Ship"):
	{
		if(!local _vehicle) then
		{
			[[_vehicle,(Fuel _vehicle) - 1],"life_fnc_setFuel",_vehicle,false] spawn life_fnc_MP;
			[true,"fuelFull",3] call life_fnc_handleInv;
			[false,"fuelEmpty",3] call life_fnc_handleInv;
		}
			else
		{
			_vehicle setFuel 0;
			[true,"fuelFull",3] call life_fnc_handleInv;
			[false,"fuelEmpty",3] call life_fnc_handleInv;
		};
	};
};
titleText[format[localize "STR_ISTR_Jerry_Drain_Success",_displayName],"PLAIN"];
