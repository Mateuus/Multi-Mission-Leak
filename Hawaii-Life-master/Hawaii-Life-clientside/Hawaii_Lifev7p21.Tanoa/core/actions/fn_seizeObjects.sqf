/*
	File: fn_seizeWeapon.sqf
	Author: Skalicon
	
	Description:

*/
_clear = nearestObjects [player,["weaponholder"],3];
for "_i" from 0 to count _clear - 1 
do
{
	deleteVehicle (_clear select _i);
	sleep 0.056;
};
titleText["Die Objekte in ner Nähe wurden entfernt.","PLAIN"];