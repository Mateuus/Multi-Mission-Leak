/*
  ArmA.Network
  Rathbone
  (c) ArmA.Network 2016

  The usage of this file is restricted to ArmA.Network
  You're not allowed to modify this file!
  Licensed under the Arma EULA and Arma Tools EULA.
  For further questions contact the author!
*/
params [
  ["_vehicle",objNull,[objNull]]
];
if(isNull _vehicle) exitWith {systemChat "isNull";};
if!(playerSide isEqualTo west || playerSide isEqualTo independent) exitWith {systemChat "Side Error";};
if!(_vehicle isKindOf "Car" || _vehicle isKindOf "Boat") exitWith {systemChat "Not a car or Boat";};
if((_vehicle getVariable ["wlocker_in_use",false]) && {((_vehicle getVariable["wlocker_used_by",""]) != getPlayerUID player)}) then {
  _usedBy = (_vehicle getVariable ["wlocker_used_by",""]);
  if(_usedBy != "") then {
    _ready = {getPlayerUID _x isEqualTo _usedBy} count playableUnits;
    if(_ready > 0) exitWith {hintSilent "Weapon Locker in use!";};
  } else {
    _vehicle setVariable["wlocker_in_use",false,true];
  };
};
_vehicle setVariable["wlocker_in_use",true,true];
_vehicle setVariable["wlocker_used_by",(getPlayerUID player),true];

createDialog "weaponlocker";
disableSerialization;
_display = findDisplay 84693;
_list = _display displayCtrl 1500;
_weapons = (_vehicle getVariable ["WeaponLocker",[]]);
if(count _weapons isEqualTo 0) exitWith {closeDialog 0;};
lbClear _list;
{
  _item = getText (missionConfigFile >> "WeaponLockerCfg" >> _x select 0 >> "displayName");
  _amount = _x select 1;
  _list lbAdd format["%1 - [%2]",_item,[_amount] call life_fnc_rupadudejat];
  _list lbSetData [(lbSize _list)-1,str([_x select 0,_amount,_forEachIndex])];
} forEach _weapons;

_vehicle spawn
{
	waitUntil {isNull (findDisplay 84693)};
	_this setVariable["wlocker_in_use",false,true];
	_this setVariable["wlocker_used_by",nil,true];
};
