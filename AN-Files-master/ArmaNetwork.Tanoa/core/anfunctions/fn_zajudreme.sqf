#include <macro.h>
/*
	ArmA.Network
	Rathbone
	Opens New ATM Menu & fills Menu with info
	(c) ArmA.Network 2016

	The usage of this file is restricted to ArmA.Network
	You're not allowed to modify this file!
	Licensed under the Arma EULA and Arma Tools EULA.
	For further questions contact the author!
*/
if(!life_use_atm) exitWith {
	hintSilent localize "STR_Shop_ATMRobbed";
};

if(dialog) exitWith {};
if(isNull (findDisplay 2700)) then {createDialog "an_atm_menu";};
(findDisplay 2700) displaySetEventHandler ["KeyDown","if((_this select 1) isEqualTo 1) then {true}"];
[0] call life_fnc_drerebuwu;
