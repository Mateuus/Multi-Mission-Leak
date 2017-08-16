/*
	Author: DerOnkel & Williams
	Avanix Gaming Community | E-Monkeys.com
	The usage of this file is restricted to Avanix-Gaming.de & E-Monkeys.com
    You're not allowed to modify this file!
    Licensed under the Arma EULA and Arma Tools EULA.
    For further questions contact the author!
	
	Description:
	Initializes the Players Fuelstation (Orginalscript initHouses.sqf by Bryan "Tonic" Boardwine)
*/
if(count EMonkeys_fuelstation == 0) exitWith {}; //Nothing to do.
{
	_position = call compile format["%1",_x select 1];
	_fuelstation = (nearestObjects[_position, ["Land_CarService_F"],40] select 0);
	_fuelstation setVariable["uid",round(random 99999),true];
	
	_fuelstationID = _x select 0;
	
	{
		format["fuelstation_%1",_x] setMarkerColorLocal "ColorYellow";
	} forEach [_fuelstationID];
	
} foreach EMonkeys_fuelstation;