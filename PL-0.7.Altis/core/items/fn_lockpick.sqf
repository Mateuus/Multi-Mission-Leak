#include "..\..\script_macros.hpp"
/*
	File: fn_lockpick.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Main functionality for lock-picking.
*/
private["_curTarget","_distance","_isVehicle","_title","_progressBar","_cP","_titleText","_dice","_badDistance"];
_curTarget = cursorTarget;
life_interrupted = false;
_sound = ["CarAlarm","lockpick"] call BIS_fnc_selectRandom;

if(life_action_inUse) exitWith {};
if(isNull _curTarget) exitWith {}; //Bad type
_distance = ((boundingBox _curTarget select 1) select 0) + 2;
if(player distance _curTarget > _distance) exitWith {}; //Too far

_isVehicle = if((_curTarget isKindOf "LandVehicle") || (_curTarget isKindOf "Ship") || (_curTarget isKindOf "Air")) then {true} else {false};
if(_isVehicle && _curTarget in life_vehicles) exitWith {hint localize "STR_ISTR_Lock_AlreadyHave"};

//More error checks
if(!_isVehicle && !isPlayer _curTarget) exitWith {};
if(!_isVehicle && !(_curTarget GVAR ["restrained",false])) exitWith {};

_title = format[localize "STR_ISTR_Lock_Process",if(!_isVehicle) then {"Handcuffs"} else {getText(configFile >> "CfgVehicles" >> (typeOf _curTarget) >> "displayName")}];
life_action_inUse = true; //Lock out other actions

//Setup the progress bar
disableSerialization;
5 cutRsc ["life_progress","PLAIN"];
_ui = GVAR_UINS "life_progress";
_progressBar = _ui displayCtrl 38201;
_titleText = _ui displayCtrl 38202;
_titleText ctrlSetText format["%2 (1%1)...","%",_title];
_progressBar progressSetPosition 0.01;
_security = _curTarget getVariable ["security", false];
if (_security) then {
	_cp = 0.005;
	[_curTarget] spawn {
		sleep 60;
		_vehicle = _this select 0;
		_vehData = _vehicle getVariable["vehicle_info_owners",[]];
		_vehOwner = -1;
		if(count _vehData  > 0) then
		{
			_vehOwner = (_vehData select 0) select 0;
		};
		_uid = _vehOwner;
		_owner =
		{
			if (getPlayerUID _x == _uid) exitWith {_x;};
		} forEach allUnits;
		_vehname = getText(configFile >> "CfgVehicles" >> typeof _vehicle >> "displayName");
		_msg = format["Le système de sécurité de votre %1 a été activé",_vehname];
		[[_owner,_msg,player,6],"TON_fnc_handleMessages",false] spawn life_fnc_MP;
	};
} else {
	_cP = 0.01;
};

while {true} do
{
	if(animationState player != "AinvPknlMstpsnonWnonDnon_medic_1" ) then {
		player action ["SwitchWeapon", player, player, 100];   //EDIT
		player playMove "AinvPknlMstpsnonWnonDnon_medic_1"; //Durée action 6.5 secondes
		player playActionNow "stop";
		player playMove "AinvPknlMstpsnonWnonDnon_medic_1";
		player playActionNow "stop";
		player playMove "AinvPknlMstpsnonWnonDnon_medic_1";
	};

	sleep 0.195; // 3 fois 6.5 secondes = 19,5secondes

	if(isNull _ui) then {
		5 cutRsc ["life_progress","PLAIN"];
		_ui = GVAR_UINS "life_progress";
		_progressBar = _ui displayCtrl 38201;
		_titleText = _ui displayCtrl 38202;
	};
	_cP = _cP + 0.01;
	_progressBar progressSetPosition _cP;
	_titleText ctrlSetText format["%3 (%1%2)...",round(_cP * 100),"%",_title];

	if(_cP >= 1 || !alive player) exitWith {};
	if(life_istazed) exitWith {}; //Tazed
	if(life_isknocked) exitWith {}; //Knocked
	if(life_interrupted) exitWith {};
	if((player GVAR ["restrained",false])) exitWith {};
	if(player distance _curTarget > _distance) exitWith {_badDistance = true;};
};

//Kill the UI display and check for various states
5 cutText ["","PLAIN"];
player playActionNow "stop";

if(!alive player || life_istazed || life_isknocked) exitWith {life_action_inUse = false;};
if((player GVAR ["restrained",false])) exitWith {life_action_inUse = false;};
if(!isNil "_badDistance") exitWith {titleText[localize "STR_ISTR_Lock_TooFar","PLAIN"]; life_action_inUse = false;};
if(life_interrupted) exitWith {life_interrupted = false; titleText[localize "STR_NOTF_ActionCancel","PLAIN"]; life_action_inUse = false;};
if(!([false,"lockpick",1] call life_fnc_handleInv)) exitWith {life_action_inUse = false;};

life_action_inUse = false;

if(!_isVehicle) then {
	_curTarget SVAR ["restrained",false,true];
	_curTarget SVAR ["Escorting",false,true];
	_curTarget SVAR ["transporting",false,true];
} else {
	_dice = random(100);
	if(_dice < 60) then {
		titleText[localize "STR_ISTR_Lock_Success","PLAIN"];
		life_vehicles pushBack _curTarget;
		//[getPlayerUID player,profileName,"487"] remoteExecCall ["life_fnc_wantedAdd",RSERV];
	} else {
		//[getPlayerUID player,profileName,"215"] remoteExecCall ["life_fnc_wantedAdd",RSERV];
		[0,"STR_ISTR_Lock_FailedNOTF",true,[profileName]] remoteExecCall ["life_fnc_broadcast",west];
		titleText[localize "STR_ISTR_Lock_Failed","PLAIN"];
		_curTarget say3D _sound;
	};
};
