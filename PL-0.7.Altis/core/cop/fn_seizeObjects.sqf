_clear = nearestObjects [player,["weaponholder"],7];
_destroyed = 0;
for "_i" from 0 to count _clear - 1
do
{
	_destroyed = _destroyed + 1;
	deleteVehicle (_clear select _i);
	uiSleep 0.056;
};
titleText[format["Vous avez saisis %1 objets suspets", _destroyed],"PLAIN"];