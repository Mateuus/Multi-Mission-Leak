/*
	File: fn_seizeObjects.sqf
	Author: Skalicon
	
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
//[[51, player, format["Seized %1 ground objects in the vicinity.", _destroyed]],"ASY_fnc_logIt",false,false] spawn life_fnc_MP;

