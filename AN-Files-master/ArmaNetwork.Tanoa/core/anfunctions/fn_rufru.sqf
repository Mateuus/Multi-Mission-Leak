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
  ["_loadout","",[""]],
  ["_player",objNull,[objNull]]
];
if(_loadout isEqualTo "") exitWith {};
if(isNull _player) exitWith {};
_loadoutArray = getArray (missionConfigFile >> "WeaponLockerCfg" >> _loadout >> "loadout");
if(count _loadoutArray isEqualTo 0) exitWith {};

if(playerside isEqualTo west) then {
removeAllWeapons player;
{player removeMagazine _x;} forEach (magazines player);
removeUniform player;
removeVest player;
removeBackpack player;
};

{
  [_x,true] call life_fnc_waxecruwuka;
} forEach _loadoutArray;
