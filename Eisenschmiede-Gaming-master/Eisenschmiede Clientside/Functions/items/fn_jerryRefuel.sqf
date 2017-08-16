#include "..\script_macros.hpp"
/*
	File: fn_jerryRefuel.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Refuels the vehicle if the player has a fuel can.
*/
private["_vehicle","_displayName","_upp","_ui","_progress","_pgText","_cP","_previousState"];
_vehicle = cursorTarget;
ES_interrupted = false;

if(isNull _vehicle) exitWith {hint localize "STR_ISTR_Jerry_NotLooking"};
if(!(_vehicle isKindOF "LandVehicle") && !(_vehicle isKindOf "Air") && !(_vehicle isKindOf "Ship")) exitWith {};
if(player distance _vehicle > 7.5) exitWith {hint localize "STR_ISTR_Jerry_NotNear"};

if(!([false,"fuelFull",1] call ES_fnc_handleInv)) exitWith {};
ES_action_inUse = true;

_displayName = getText(configFile >> "CfgVehicles" >> (typeOf _vehicle) >> "displayName");

_upp = format[localize "STR_ISTR_Jerry_Process",_displayName];

//Setup our progress bar.
disableSerialization;
5 cutRsc ["ES_progress","PLAIN"];
_ui = uiNamespace getVariable "ES_progress";
_progress = _ui displayCtrl 38201;
_pgText = _ui displayCtrl 38202;
_pgText ctrlSetText format["%2 (1%1)...","%",_upp];
_progress progressSetPosition 0.01;
_cP = 0.01;

while{true} do {
	if(animationState player != "AinvPknlMstpSnonWnonDnon_medic_1") then {
		[player,"AinvPknlMstpSnonWnonDnon_medic_1",true] remoteExec ["ES_fnc_animSync",-2];
		player switchMove "AinvPknlMstpSnonWnonDnon_medic_1";
		player playMoveNow "AinvPknlMstpSnonWnonDnon_medic_1";
	};
	sleep 0.2;
	if(isNull _ui) then {
		5 cutRsc ["ES_progress","PLAIN"];
		_ui = uiNamespace getVariable "ES_progress";
		_progressBar = _ui displayCtrl 38201;
		_titleText = _ui displayCtrl 38202;
	};
	_cP = _cP + 0.01;
	_progress progressSetPosition _cP;
	_pgText ctrlSetText format["%3 (%1%2)...",round(_cP * 100),"%",_upp];
	if(_cP >= 1) exitWith {};
	if(!alive player) exitWith {};
	if(ES_interrupted) exitWith {};
};
ES_action_inUse = false;
5 cutText ["","PLAIN"];
player playActionNow "stop";
if(!alive player) exitWith {};
if(ES_interrupted) exitWith {ES_interrupted = false; titleText[localize "STR_NOTF_ActionCancel","PLAIN"];};


switch (true) do {
	case (_vehicle isKindOF "LandVehicle"): {
		if(!local _vehicle) then {
			[_vehicle,(Fuel _vehicle) + 0.5] remoteExec ["ES_fnc_setFuel",_vehicle];
		} else {
			_vehicle setFuel ((Fuel _vehicle) + 0.5);
		};
	};
	
	case (_vehicle isKindOf "Air"): {
		if(!local _vehicle) then {
			[_vehicle,(Fuel _vehicle) + 0.2] remoteExec ["ES_fnc_setFuel",_vehicle];
		} else {
			_vehicle setFuel ((Fuel _vehicle) + 0.2);
		};
	};
	
	case (_vehicle isKindOf "Ship"): {
		if(!local _vehicle) then {
			[_vehicle,(Fuel _vehicle) + 0.35] remoteExec ["ES_fnc_setFuel",_vehicle];
		} else {
			_vehicle setFuel ((Fuel _vehicle) + 0.35);
		};
	};
};
titleText[format[localize "STR_ISTR_Jerry_Success",_displayName],"PLAIN"];
[true,"fuelEmpty",1] call ES_fnc_handleInv;