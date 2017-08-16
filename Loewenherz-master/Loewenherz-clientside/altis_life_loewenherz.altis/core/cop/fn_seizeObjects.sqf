/*
	File: fn_seizeWeapon.sqf
	Author: Skalicon
	seize weaponseize weapon
	Description:

*/
_clear = nearestObjects [player,["GroundWeaponHolder"],3];
_destroyed = 0;
for "_i" from 0 to count _clear - 1 
do
{
	_destroyed = _destroyed + 1;
	deleteVehicle (_clear select _i);
	sleep 0.056;
};

titleText[format["Beschlagnahmung %1 Objekte in der naehe", _destroyed],"PLAIN"];
[[51, player, format["Beschlagnahmung %1 Objekte in der naehe", _destroyed]],"TON_fnc_logIt",false,false] call lhm_fnc_mp;