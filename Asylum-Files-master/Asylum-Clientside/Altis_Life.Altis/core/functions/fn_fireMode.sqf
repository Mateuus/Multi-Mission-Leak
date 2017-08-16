/*
	File: fn_fireMode.sqf
	Author: Alan

	Description:
	Sets fire mode for player when exiting vehicle.
*/
_act = [_this,0,"",[""]] call BIS_fnc_param;

if(_act == "") exitWith {};
if((weaponState player) select 0 == "") exitWith {}; //No gun
switch (_act) do 
{
	case "in": {fireMode = (weaponState player) select 2};
	case "out": 
	{
		[] spawn 
		{
			_weapon = currentWeapon player;
			_ammo = player ammo _weapon;
			
			uiSleep 0.5; 
			player setAmmo [_weapon,0];
			player forceWeaponFire [_weapon, fireMode];
			player setAmmo [_weapon,_ammo];
		};
	};
};