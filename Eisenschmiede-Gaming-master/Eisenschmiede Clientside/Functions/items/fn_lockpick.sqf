#include "..\script_macros.hpp"
/*
	File: fn_lockpick.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Main functionality for lock-picking.
*/
private["_curTarget","_distance","_isVehicle","_title","_progressBar","_cP","_titleText","_dice","_badDistance"];

closeDialog 0;

_curTarget = cursorTarget;
ES_interrupted = false;

if(ES_action_inUse) exitWith {};
if(isNull _curTarget) exitWith {}; //Bad type
_distance = ((boundingBox _curTarget select 1) select 0) + 2;
if(player distance _curTarget > _distance) exitWith {}; //Too far

if(!DarfLockPick) exitWith {hint localize "STR_NOTF_LockPick_Vehicle";};
if(DarfLockPick) then {
	DarfLockPick = false;
	[] spawn {
		sleep 60;
		DarfLockPick = true;
	};
};

_isVehicle = if((_curTarget isKindOf "LandVehicle") OR (_curTarget isKindOf "Ship") OR (_curTarget isKindOf "Air")) then {true} else {false};
if(_isVehicle && _curTarget in ES_vehicles) exitWith {hint localize "STR_ISTR_Lock_AlreadyHave"};

//More error checks
if(!_isVehicle && !isPlayer _curTarget) exitWith {};
if(!_isVehicle && !(_curTarget getVariable ["restrained",false])) exitWith {};

_title = format[localize "STR_ISTR_Lock_Process",if(!_isVehicle) then {"Handcuffs"} else {getText(configFile >> "CfgVehicles" >> (typeOf _curTarget) >> "displayName")}];
ES_action_inUse = true; //Lock out other actions

//Setup the progress bar
disableSerialization;
5 cutRsc ["ES_progress","PLAIN"];
_ui = uiNamespace getVariable "ES_progress";
_progressBar = _ui displayCtrl 38201;
_titleText = _ui displayCtrl 38202;
_titleText ctrlSetText format["%2 (1%1)...","%",_title];
_progressBar progressSetPosition 0.01;
_cP = 0.01;

_xpLvl = 1;
if(ES_xp_lvl >= 12) then {_xpLvl = 0.8;};
if(ES_xp_lvl >= 22) then {_xpLvl = 0.7;};
if(ES_xp_lvl >= 28) then {_xpLvl = 0.6;};
if(ES_xp_lvl >= 36) then {_xpLvl = 0.3;};
if(ES_xp_lvl >= 40) then {_xpLvl = 0.2;};

while {true} do
{
	if(animationState player != "AinvPknlMstpSnonWnonDnon_medic_1") then {
		[player,"AinvPknlMstpSnonWnonDnon_medic_1",true] remoteExec ["ES_fnc_animSync",-2];
		player switchMove "AinvPknlMstpSnonWnonDnon_medic_1";
		player playMoveNow "AinvPknlMstpSnonWnonDnon_medic_1";
	};
	
	sleep 0.30 * _xpLvl;

	if(isNull _ui) then {
		5 cutRsc ["ES_progress","PLAIN"];
		_ui = uiNamespace getVariable "ES_progress";
		_progressBar = _ui displayCtrl 38201;
		_titleText = _ui displayCtrl 38202;
	};
	_cP = _cP + 0.01;
	_progressBar progressSetPosition _cP;
	_titleText ctrlSetText format["%3 (%1%2)...",round(_cP * 100),"%",_title];
	
	if(_cP >= 1 OR !alive player) exitWith {};
	if(ES_istazed) exitWith {}; //Tazed
	if(ES_interrupted) exitWith {};
	if((player getVariable ["restrained",false])) exitWith {};
	if(player distance _curTarget > _distance) exitWith {_badDistance = true;};
};

//Kill the UI display and check for various states
5 cutText ["","PLAIN"];
player playActionNow "stop";

if(!alive player OR ES_istazed) exitWith {ES_action_inUse = false;};
if((player getVariable ["restrained",false])) exitWith {ES_action_inUse = false;};
if(!isNil "_badDistance") exitWith {titleText[localize "STR_ISTR_Lock_TooFar","PLAIN"]; ES_action_inUse = false;};
if(ES_interrupted) exitWith {ES_interrupted = false; titleText[localize "STR_NOTF_ActionCancel","PLAIN"]; ES_action_inUse = false;};
if(!([false,"lockpick",1] call ES_fnc_handleInv)) exitWith {ES_action_inUse = false;};

ES_action_inUse = false;

if(!_isVehicle) then {
	_curTarget setVariable ["restrained",false,true];
	_curTarget setVariable ["Escorting",false,true];
	_curTarget setVariable ["transporting",false,true];
} else {
	_dice = random(100);
	if(_dice < 30) then {
		titleText[localize "STR_ISTR_Lock_Success","PLAIN"];
		ES_vehicles pushBack _curTarget;
		[getPlayerUID player,profileName,"487"] remoteExec ["ES_fnc_wantedAdd",2];
	} else {
		[[_curTarget],"ES_fnc_CarAlarmSound",nil,true] spawn ES_fnc_MP;
		[getPlayerUID player,profileName,"215"] remoteExec ["ES_fnc_wantedAdd",2];
		[0,"STR_ISTR_Lock_FailedNOTF",true,[profileName]] remoteExec ["ES_fnc_broadcast",west];
		titleText[localize "STR_ISTR_Lock_Failed","PLAIN"];
	};
};