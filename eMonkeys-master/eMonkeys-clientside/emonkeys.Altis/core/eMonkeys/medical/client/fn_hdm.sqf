/*
	File: fn_repairTruck.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Main functionality for toolkits, to be revised in later version.
*/
private["_unit","_upp","_ui","_progress","_pgText","_cP","_displayName","_sleep"];
_unit = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
eM_interrupted = false;
if(isNull _unit) exitwith {};
if (!((_unit getVariable["onkill",FALSE]) && _unit isKindOf "Man")) exitWith {};
if (!("Medikit" in (items player))) exitWith {hint "Du hast keinen Verbandskasten dabei"};
if (!(_unit getVariable ["medRequested",false])) exitWith {hint "Der Spieler hat keinen Sanitäter gerufen"};

if(currentWeapon player != "") then {
	EMonkeys_curWep_h = currentWeapon player;
	player action ["SwitchWeapon", player, player, 100];
};

eM_action_inUse = true;
_displayName = _unit getVariable "name";
_upp = format["Versuche %1 am leben zu halten",_displayName];

disableSerialization;
5 cutRsc ["EMonkeys_progress","PLAIN"];
_ui = uiNameSpace getVariable "EMonkeys_progress";
_progress = _ui displayCtrl 38201;
_pgText = _ui displayCtrl 38202;
_pgText ctrlSetText format["%2 (1%1)...","%",_upp];
_progress progressSetPosition 0.01;
_cP = 0.01;
_sleep = 0.27;
switch (playerside) do
{
	case west:{_sleep = 0.27;};
	case independent:{_sleep = 0.14;};
	case civilian:{_sleep = 0.27;};
	case east:{_sleep = 0.27;};
};

["ainvpknlmstpsnonwnondr_medic4",5] execFSM "core\fsm\moveLoop.fsm";
while{true} do
{
	if(animationState player == "ainvpknlmstpsnonwnondr_medic4") then 
	{
		_cP = _cP + 0.01;
		_progress progressSetPosition _cP;
		_pgText ctrlSetText format["%3 (%1%2)...",round(_cP * 100),"%",_upp];
	};
	if(_cP >= 1) exitWith {};
	
	if(player != vehicle player) exitWith {};
	if(eM_interrupted) exitWith {};
	if(!(_unit getVariable["onkill",false])) exitWith {titleText["Stabilisieren abgebrochen.","PLAIN"];};
	uisleep _sleep;
};
EMonkeys_ExitMoveLoop = true;
player switchMove "AmovPercMstpSrasWrflDnon_AmovPercMstpSlowWrflDnon";

eM_action_inUse = false;
5 cutText ["","PLAIN"];
if(!isNil "EMonkeys_curWep_h" && {(EMonkeys_curWep_h != "")}) then {
	if(EMonkeys_curWep_h in [primaryWeapon player,secondaryWeapon player,handgunWeapon player]) then {
		player selectWeapon EMonkeys_curWep_h;
	};
};

if(eM_interrupted) exitWith {eM_interrupted = false; titleText["Stabilisieren abgebrochen.","PLAIN"]; eM_action_inUse = false;};
if(player != vehicle player) exitWith {titleText["Du bist in einem Fahrzeug","PLAIN"];};
if(!(_unit getVariable["onkill",false])) exitWith {titleText["Stabilisieren abgebrochen.","PLAIN"];};
if (side player in [east,civilian]) then 
{
	player removeItem "Medikit";
};

_unit setVariable["addtime",true,true];
titleText["Stabilisierung war erfolgreich!","PLAIN"];