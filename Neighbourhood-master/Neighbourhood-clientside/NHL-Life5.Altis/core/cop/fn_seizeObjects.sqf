/*
	File: fn_seizeWeapon.sqf
	Author: Skalicon
	
	Description:

*/
_clear = nearestObjects [player,["Box_NATO_Ammo_F","CamoNet_OPFOR_F","TapeSign_F","Land_Razorwire_F","Land_PortableLight_double_F","RoadBarrier_small_F","WeaponHolderSimulated","weaponholder","GroundWeaponHolder","Land_BottlePlastic_V1_F","Land_TacticalBacon_F","Land_Can_V3_F","Land_CanisterFuel_F", "Land_Can_V3_F","Land_Money_F","Land_Suitcase_F"],3];
_destroyed = 0;
for "_i" from 0 to count _clear - 1 
do
{
	_destroyed = _destroyed + 1;
	deleteVehicle (_clear select _i);
	sleep 0.056;
};

titleText[format["Removed %1 object(s) in the vicinity.", _destroyed],"PLAIN"];
[[51, player, format["Removed %1 object(s) in the vicinity.", _destroyed]],"TON_fnc_logIt",false,false] spawn life_fnc_MP;