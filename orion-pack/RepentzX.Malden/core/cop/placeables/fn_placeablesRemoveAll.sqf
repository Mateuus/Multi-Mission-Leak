/*
	Author: Maximum
	Description: Placeables for the cop\medic sides.
*/
_amountRemoved = 0;
{
	deleteVehicle _x;
	_amountRemoved = _amountRemoved + 5;
} forEach (life_bar_placey);
