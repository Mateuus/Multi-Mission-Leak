/*
	Author: ArmA.Network
	The usage of this file is restricted to ArmA.Network
	You're not allowed to modify this file!
	Licensed under the Arma EULA and Arma Tools EULA.
	For further questions contact the author!
*/
private "_dead";
if((lbCurSel 1500) == -1) exitWith {hint "A body wasn't selected!";closeDialog 0;};
_dead = lbData [1500,lbCurSel 1500];
_dead = call compile format["%1",_dead];
if(isNil "_dead") exitWith {systemChat "Body Selected isNil!";closeDialog 0;};
if(isNull _dead) exitWith {systemChat "Body Selected isNull!";closeDialog 0;};
[_dead,true] spawn life_fnc_revivePlayer;
closeDialog 0;
