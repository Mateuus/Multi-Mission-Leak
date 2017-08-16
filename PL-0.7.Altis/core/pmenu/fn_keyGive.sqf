#include "..\..\script_macros.hpp"
/*
	File: fn_keyGive.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Gives a copy of the key for the selected vehicle to the selected player.
	Player must be within range.
*/
private["_dialog","_list","_plist","_sel","_vehicle","_owners","_index","_unit","_uid"];
disableSerialization;

_dialog = findDisplay 2700;
_list = _dialog displayCtrl 2701;
_plist = _dialog displayCtrl 2702;

_sel = lbCurSel _list;
if((_list lbText _sel) == "You don't own any vehicles") exitWith {hint "You didn't select a vehicle.";};
_vehicle = _list lbData _sel;
_vehicle = life_vehicles select parseNumber(_vehicle);

_sel = lbCurSel _plist;
_unit = _plist lbData _sel;
if(_unit == "targetkeygive") then {
	_unit = cursorObject;
} else {
	_unit = call compile format["%1",_unit];
};
if(isNull _unit || isNil "_unit") exitWith {hint "La cible n'est pas un joueur !";ctrlShow[2703,true];};
if(_unit == player) exitWith {hint "La cible n'est pas un joueur !";ctrlShow[2703,true];};
if(!isPlayer _unit) exitWith {hint "La cible n'est pas un joueur !";ctrlShow[2703,true];};
if(player distance _unit > 25) exitWith {hint "Cette personne est trop loin";ctrlShow[2703,true];};

_uid = getPlayerUID _unit;
_owners = _vehicle GVAR "vehicle_info_owners";
_index = [_uid,_owners] call TON_fnc_index;
if(EQUAL(_index,-1)) then  {
	_owners pushBack [_uid,_unit GVAR ["realname",name _unit]];
	_vehicle SVAR ["vehicle_info_owners",_owners,true];
};

hint format["Vous avez donnez les clefs de %1 à quelqu'un",
getText(configFile >> "CfgVehicles" >> (typeOf _vehicle) >> "displayName")];

_playerID = getPlayerUID player;
_playerName = name player;
_toPlayerID = getPlayerUID _unit;
_toPlayerName = name _unit;
_type = 2;
_amount = getText(configFile >> "CfgVehicles" >> (typeOf _vehicle) >> "displayName");
[_playerID,_playerName,_toPlayerID,_toPlayerName,_type,_amount] remoteExecCall ["TON_fnc_actionLog", (call life_fnc_HCC)];

[_vehicle,_unit,profileName] remoteExecCAll ["TON_fnc_clientGetKey",_unit];