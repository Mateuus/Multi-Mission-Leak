/*
	File: fn_repairTruck.sqf
	Author: Bryan "Tonic" Boardwine
	Edit: Niklas "Rappelkiste" Quenter
	
	Description:
	Main functionality for toolkits
*/
private["_veh","_upp","_ui","_progress","_pgText","_cP","_displayName","_weaponChange"];
_boxType = ["Box_IND_AmmoVeh_F","Land_Cargo20_blue_F"];
_veh = cursorTarget;
eM_interrupted = false;

if(isNull _veh) exitWith {};
if(!(_veh isKindOf "Car") && !(_veh isKindOf "Ship") && !(typeof _veh in _boxType) && !(_veh isKindOf "Air")) exitWith {};
if(!("ToolKit" in (items player))) exitWith {};

_weaponChange = false;

if(currentWeapon player != "") then
{
	_weaponChange = true;
	EMonkeys_curWep_h = currentWeapon player;
	player action ["SwitchWeapon", player, player, 100];
	uisleep 3;
};

eM_action_inUse = true;
_displayName = getText(configFile >> "CfgVehicles" >> (typeOf _veh) >> "displayName");
_upp = format["Repariere %1",_displayName];

//Setup our progress bar.
disableSerialization;
5 cutRsc ["EMonkeys_progress","PLAIN"];
_ui = uiNameSpace getVariable "EMonkeys_progress";
_progress = _ui displayCtrl 38201;
_pgText = _ui displayCtrl 38202;
_pgText ctrlSetText format["%2 (1%1)...","%",_upp];
_progress progressSetPosition 0.01;
_cP = 0.01;

["Acts_carFixingWheel",3] execFSM "core\fsm\moveLoop.fsm";
while{true} do
{
	if(animationState player == "Acts_carFixingWheel") then
	{
		_cP = _cP + 0.01;
		_progress progressSetPosition _cP;
		_pgText ctrlSetText format["%3 (%1%2)...",round(_cP * 100),"%",_upp];
	};
	if(_cP >= 1) exitWith {};
	if(((!alive player) || (player getVariable["onkill",FALSE]))) exitWith {};
	if(player != vehicle player) exitWith {};
	if(eM_interrupted) exitWith {};
	uisleep 0.27;
};
EMonkeys_ExitMoveLoop = true;
player switchMove "AmovPercMstpSrasWrflDnon_AmovPercMstpSlowWrflDnon";

eM_action_inUse = false;
5 cutText ["","PLAIN"];

if(_weaponChange) then
{
	if(EMonkeys_curWep_h in [primaryWeapon player,secondaryWeapon player,handgunWeapon player]) then
	{
		player selectWeapon EMonkeys_curWep_h;
	};
};

if(eM_interrupted) exitWith
{
	eM_interrupted = false;
	titleText["Reparatur abgebrochen.","PLAIN"];
};
if(player != vehicle player) exitWith
{
	titleText["Du kannst das Fahrzeug nicht reparieren, solange du dich darin befindest.","PLAIN"];
};
if(!("ToolKit" in (items player))) exitWith {};
switch(side player) do
{
	case civilian: {player removeItem "ToolKit"};
	case opfor: {player removeItem "ToolKit"};
	case independent: {[format ["%1",8000],"EMonkeys_fnc_madcash",independent,false] call EMonkeys_fnc_mp};
};
_veh setDamage 0;
titleText["Du hast das Fahrzeug repariert","PLAIN"];