/*
	File: fn_seizeWeapon.sqf
	Author: Kai
	
	Description:

*/
_clear = nearestObjects [player,["weaponholder"],3];
_clear = _clear + nearestObjects [player,["GroundWeaponHolder"],3];
_clear = _clear + nearestObjects [player,["WeaponHolderSimulated"],3];
_destroyed = 0;
for "_i" from 0 to count _clear - 1 
do
{
	_destroyed = _destroyed + 1;
	deleteVehicle (_clear select _i);
};

titleText[format["Seized %1 ground objects in the vicinity.", _destroyed],"PLAIN"];
//playSound "bag";


//[[51, name player, getPlayerUID player, format["Seized %1 ground objects in the vicinity.", _destroyed]],"TON_fnc_logIt",false,false] call BIS_fnc_MP;

/*
_clear = nearestObjects [player,["weaponholder"],3];
_destroyed = 0;
for "_i" from 0 to count _clear - 1 
do
{
	_destroyed = _destroyed + 1;
	deleteVehicle (_clear select _i);
	sleep 0.056;
};

titleText[format["Removed %1 objects vicinity.", _destroyed],"PLAIN"];
[[51, player, format["Removed %1 objects in the vicinity.", _destroyed]],"TON_fnc_logIt",false,false] call life_fnc_MP;

*/