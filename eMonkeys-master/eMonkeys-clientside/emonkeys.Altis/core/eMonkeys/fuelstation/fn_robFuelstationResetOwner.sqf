/*
	Author: DerOnkel & Williams
	Avanix Gaming Community | E-Monkeys.com
	The usage of this file is restricted to Avanix-Gaming.de & E-Monkeys.com
    You're not allowed to modify this file!
    Licensed under the Arma EULA and Arma Tools EULA.
    For further questions contact the author!
	
	Description:
	Reset the Fuelstationmarker after Rob
*/
private["_ownerID","_id","_marker"];
_ownerID = [_this,0,"",[""]] call BIS_fnc_param;
_id = _this select 1;

if(_ownerID == getPlayerUID player) then 
{
	_marker = format["fuelstation_%1",_id];
	_marker setMarkerColorLocal "ColorYellow";
};



