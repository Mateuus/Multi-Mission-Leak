/*
	Author: ArmA.Network
	The usage of this file is restricted to ArmA.Network
	You're not allowed to modify this file!
	Licensed under the Arma EULA and Arma Tools EULA.
	For further questions contact the author!
*/
private "_dead";
if((lbCurSel 1500) isEqualTo -1) exitWith {hintSilent "A body wasn't selected!";closeDialog 0;};

_dead = lbData [1500,lbCurSel 1500];
_dead = call compile format["%1",_dead];

if(isNil "_dead") exitWith {closeDialog 0; deleteVehicle _dead};
if(isNull _dead) exitWith {closeDialog 0; deleteVehicle _dead};

[_dead,true] spawn life_fnc_triepluwleqlep;
closeDialog 0;
