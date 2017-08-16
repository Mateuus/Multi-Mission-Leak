/*
	ArmA.Network
	Rathbone
	(c) ArmA.Network 2016

	The usage of this file is restricted to ArmA.Network
	You're not allowed to modify this file!
	Licensed under the Arma EULA and Arma Tools EULA.
	For further questions contact the author!
*/
disableSerialization;
_text = parseNumber(ctrlText 1400);
if(!([str(_text)] call life_fnc_spunetuwada)) exitWith {hintSilent localize "STR_ATM_notnumeric"};
if(_text < 5 || {_text > 25}) exitWith {hintSilent "Must be between 5 and 25";};
closeDialog 0;
[4,_text] remoteExecCall ["life_fnc_updateGovDetails",2];
