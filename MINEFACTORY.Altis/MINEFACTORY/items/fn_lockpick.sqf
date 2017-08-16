#include "..\..\script_macros.hpp"
/*
	File: fn_lockpick.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Main functionality for lock-picking.
*/
private["_curTarget","_distance","_isVehicle","_title","_progressBar","_cP","_titleText","_dice","_badDistance"];
_curTarget = cursorObject;
life_interrupted = false;

if(life_action_inUse) exitWith {};
if(isNull _curTarget) exitWith {}; //Bad type
_distance = ((boundingBox _curTarget select 1) select 0) + 2;
if(player distance _curTarget > _distance) exitWith {}; //Too far

_isVehicle = if((_curTarget isKindOf "LandVehicle") OR (_curTarget isKindOf "Ship") OR (_curTarget isKindOf "Air")) then {true} else {false};
if(_isVehicle && _curTarget in life_vehicles) exitWith {hint  "Du hast diesen Fahrzeugschlüssel bereits in deinem Schlüsselbund."};

//More error checks
if(!_isVehicle && !isPlayer _curTarget) exitWith {};
if(!_isVehicle && !(_curTarget GVAR ["restrained",false])) exitWith {};

_title = format[ "Wird aufgebrochen %1",if(!_isVehicle) then {"Handcuffs"} else {getText(configFile >> "CfgVehicles" >> (typeOf _curTarget) >> "displayName")}];
life_action_inUse = true; //Lock out other actions

//Setup the progress bar
disableSerialization;
5 cutRsc ["life_progress","PLAIN"];
_ui = GVAR_UINS "life_progress";
_progressBar = _ui displayCtrl 38201;
_titleText = _ui displayCtrl 38202;
_titleText ctrlSetText format["%2 (1%1)...","%",_title];
_progressBar progressSetPosition 0.01;
_cP = 0.01;

while {true} do
{
	if(animationState player != "AinvPknlMstpSnonWnonDnon_medic_1") then {
		[player,"AinvPknlMstpSnonWnonDnon_medic_1",true] remoteExecCall ["life_fnc_animSync",RCLIENT];
		player switchMove "AinvPknlMstpSnonWnonDnon_medic_1";
		player playMoveNow "AinvPknlMstpSnonWnonDnon_medic_1";
	};

	sleep 0.26;

	if(isNull _ui) then {
		5 cutRsc ["life_progress","PLAIN"];
		_ui = GVAR_UINS "life_progress";
		_progressBar = _ui displayCtrl 38201;
		_titleText = _ui displayCtrl 38202;
	};
	_cP = _cP + 0.01;
	_progressBar progressSetPosition _cP;
	_titleText ctrlSetText format["%3 (%1%2)...",round(_cP * 100),"%",_title];

	if(_cP >= 1 OR !alive player) exitWith {};
	if(life_istazed) exitWith {}; //Tazed
	if(life_isknocked) exitWith {}; //Knocked
	if(life_interrupted) exitWith {};
	if((player GVAR ["restrained",false])) exitWith {};
	if(player distance _curTarget > _distance) exitWith {_badDistance = true;};
};

//Kill the UI display and check for various states
5 cutText ["","PLAIN"];
player playActionNow "stop";

if(!alive player OR life_istazed OR life_isknocked) exitWith {life_action_inUse = false;};
if((player GVAR ["restrained",false])) exitWith {life_action_inUse = false;};
if(!isNil "_badDistance") exitWith {titleText[ "Du hast dich zu weit vom Ziel entfernt.","PLAIN"]; life_action_inUse = false;};
if(life_interrupted) exitWith {life_interrupted = false; titleText[ "Aktion abgebrochen","PLAIN"]; life_action_inUse = false;};
if(!([false,"lockpick",1] call life_fnc_handleInv)) exitWith {life_action_inUse = false;};

life_action_inUse = false;

if(!_isVehicle) then {
	_curTarget setVariable["restrained",false,true];
	_curTarget setVariable["Escorting",false,true];
	_curTarget setVariable["transporting",false,true];
} else {
	if (playerSide in [west,independent]) then {
		titleText[ "Du hast nun einen Schlüssel zu diesem Fahrzeug.","PLAIN"];
		life_vehicles pushBack _curTarget;
		[true,"lockpick",1] call life_fnc_handleInv;
	} else {
		_dice = random(100);
	if(_dice < 30) then {
		titleText[ "Du hast nun einen Schlüssel zu diesem Fahrzeug.","PLAIN"];
		life_vehicles pushBack _curTarget;
		[getPlayerUID player,profileName,"487"] remoteExecCall ["HC_fnc_wantedAdd",HC_Life];
		[getPlayerUID player,profileName,"487"] remoteExecCall ["HC_fnc_wantedAdd",HC_Life];
	} else {
		[getPlayerUID player,profileName,"215"] remoteExecCall ["HC_fnc_wantedAdd",HC_Life];
		[getPlayerUID player,profileName,"215"] remoteExecCall ["HC_fnc_wantedAdd",HC_Life];
		[0,"Der Dietrich ist abgebrochen.NOTF",true,[profileName]] remoteExecCall ["life_fnc_broadcast",west];
		titleText[ "Der Dietrich ist abgebrochen.","PLAIN"];
	};
	};
};
