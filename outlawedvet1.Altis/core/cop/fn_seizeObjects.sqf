/*
	File: fn_seizeObjects.sqf
	Author: Skalicon
	
	Description:

*/
_clear = nearestObjects [player,["weaponholder"],5];
_clear1 = nearestObjects [player,["WeaponHolderSimulated"],5];
_destroyed = 0;

for "_j" from 0 to count _clear - 1 
do
{
	_destroyed = _destroyed + 1;
	deleteVehicle (_clear select _j);

	uiSleep 0.056;
};

for "_i" from 0 to count _clear1 - 1 
do
{
	_destroyed = _destroyed + 1;
	deleteVehicle (_clear1 select _i);

	uiSleep 0.056;
};

Uisleep 0.1;

titleText[format["Removed %1 object(s) in the vicinity.", _destroyed],"PLAIN"];
