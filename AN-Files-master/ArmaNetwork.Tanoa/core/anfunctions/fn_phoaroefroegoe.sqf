/*
  ArmA.Network
  Author: Rathbone
  Copyright (c) ArmA.Network 2015 - 2016

  The usage of this file is restricted to ArmA.Network
  You're not allowed to modify this file!
  Licensed under the Arma EULA and Arma Tools EULA.
  For further questions contact the author!
*/
private _isInjured = ((1 - damage player) * 100) < 50;
private _isHungry = (life_hunger < 500);
private _isThirsty = (life_thirst < 500);
//life_islegbroken = (player getVariable ["LegBroken",false]);
if(life_thirst <= 0) exitWith {player setDamage 1;};
if(life_hunger <= 0) exitWith {player setDamage 1;};

[_isHungry,1202] call life_fnc_spunadruc;
[_isThirsty,1203] call life_fnc_spunadruc;
[_isInjured,1201] call life_fnc_spunadruc;
//life_isbleeding call life_fnc_spunadruc;
//life_islegbroken call life_fnc_pafrustac;
private _survival = if (("survival" in AN_Skills) OR {playerSide in [west,independent]}) then {1} else {3};

if (!(getNumber(missionConfigFile >> "DebugMode") isEqualTo 1)) then
{
  life_hunger = life_hunger - _survival;
  life_thirst = life_thirst - _survival;
};

[] call life_fnc_virtualRefreshMax;
life_carryWeight = call life_fnc_virtualInventoryWeight;

if (life_carryWeight > life_maxWeight && {!isForcedWalk player}) then
{
	player forceWalk true;
	player setFatigue 1;
	[true,1206] call life_fnc_spunadruc;
}
else
{
	if(isForcedWalk player) then
  {
		player forceWalk false;
	};
	[false,1206] call life_fnc_spunadruc;
};
