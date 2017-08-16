/*
	File: fn_seizeObjects.sqf
	Author: Skalicon
	
	Description:Objekte beschlagnahmt

*/
_clear = nearestObjects [player,["weaponholder"],3];
_destroyed = 0;
for "_i" from 0 to count _clear - 1 
do
{
	_destroyed = _destroyed + 1;
	deleteVehicle (_clear select _i);
	uisleep 0.056;
};

titleText[format["Sie haben diverse Gegenstände beschlagnahmt.", _destroyed],"PLAIN"];
