/*
    File: fn_seizeObjects.sqf
    Author: Skalicon
	Edited By: Travis Boi
        
    Description:
	Sieze's Objects or Weapons on Ground
*/
_clear = nearestObjects [player,["weaponholder"],3];
_clear = _clear + nearestObjects [player,["groundWeaponHolder"],3];
_destroyed = 0;
for "_i" from 0 to count _clear - 1 
do
{
        _destroyed = _destroyed + 1;
        deleteVehicle (_clear select _i);
        uiSleep 0.056;
};
_destroyed = _destroyed - 1;
titleText[format["Usunąłeś %1 przedmioty.", _destroyed],"PLAIN"];