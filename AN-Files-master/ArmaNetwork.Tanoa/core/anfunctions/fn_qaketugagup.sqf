/*
	Author: ArmA.Network
	The usage of this file is restricted to ArmA.Network
	You're not allowed to modify this file!
	Licensed under the Arma EULA and Arma Tools EULA.
	For further questions contact the author!
*/
_vehicle = param [0,ObjNull,[objNull]];
if(isNull _vehicle) exitWith {systemChat "Vehicle is Null"};
if(player distance _vehicle > 5) exitWith {hintSilent "You must be closer to the Vehicle to begin using the Jaws of Life!"};

//_vehicle setDamage 0.5;

if(count(crew _vehicle) > 0) then
{
	[_vehicle] call life_fnc_brephugesak;
} else {
  hintSilent "There isn't anyone in this Vehicle!";
};
