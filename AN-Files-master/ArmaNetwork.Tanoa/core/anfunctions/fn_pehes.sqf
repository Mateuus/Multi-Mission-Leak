/*
  ArmA.Network
  Rathbone
  (c) ArmA.Network 2016

  The usage of this file is restricted to ArmA.Network
  You're not allowed to modify this file!
  Licensed under the Arma EULA and Arma Tools EULA.
  For further questions contact the author!
*/
if((life_vInact_curTarget getVariable ["wlocker_in_use",false]) && {((life_vInact_curTarget getVariable["wlocker_used_by",""]) != getPlayerUID player)}) exitWith {closeDialog 0;};
disableSerialization;
if(lbCurSel 1500 isEqualTo -1) exitWith {hintSilent "You must select a Loadout!";};
_data = lbData[1500,(lbCurSel 1500)];
_data = call compile format["%1",_data];
lbSetCurSel [1500,-1];
_loadout = _data select 0;
_amount = _data select 1;
_arrayIndex = _data select 2;
if(_amount <= 0) exitWith {hintSilent "Not available anymore!";};
_weapons = (life_vInact_curTarget getVariable ["WeaponLocker",[]]);
if(count _weapons isEqualTo 0) exitWith {closeDialog 0;};
closeDialog 0;
[_loadout,player] call life_fnc_rufru;
_weaponArray = (_weapons select _arrayIndex) select 1;
_weaponArray = _weaponArray - 1;
_weapons set[_arrayIndex,[_loadout,_weaponArray]];
life_vInact_curTarget setVariable ["WeaponLocker",_weapons,true];
