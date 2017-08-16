/*
 File: fn_seizeWeapon.sqf
 Author: Skalicon
 Modified by powerafro2
 Beschreibung: Entfernt Objekte auf dem Boden
*/
_clear = nearestObjects [player,["weaponholder"],3];
_destroyed = 0;
for "_i" from 0 to count _clear - 1 
do
{
 _destroyed = _destroyed + 1;
 deleteVehicle (_clear select _i);
 sleep 0.1;
};
titleText[format["%1 Sachen auf dem Boden wurden von den Ameisen gefressen.", _destroyed],"PLAIN"];
