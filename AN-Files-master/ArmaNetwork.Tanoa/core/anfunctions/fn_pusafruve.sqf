/*
	ArmA.Network
	Rathbone
	Opens Menu for President
	(c) ArmA.Network 2016

	The usage of this file is restricted to ArmA.Network
	You're not allowed to modify this file!
	Licensed under the Arma EULA and Arma Tools EULA.
	For further questions contact the author!
*/
disableSerialization;
if(!life_isGov) exitWith {};
life_govCash = -1;
createDialog "president_menu";
_dialog = findDisplay 50300;
_taxes = _dialog displayCtrl 2409;
_popularity = _dialog displayCtrl 2408;
_funds = _dialog displayCtrl 2407;
_taxes ctrlSetStructuredText parseText format ["%1 percent",([(life_gov select 2)/100] call life_fnc_rupadudejat)];
_popularity ctrlSetStructuredText parseText format ["Retrieving Info"];
_funds ctrlSetStructuredText parseText format ["Retrieving Info"];
[player,0] remoteExecCall ["life_fnc_getGovDetails",2];
waitUntil {life_govCash != -1};
_popularity ctrlSetStructuredText parseText format["%1",[life_govPop] call life_fnc_rupadudejat];
_funds ctrlSetStructuredText parseText format["$%1",[life_govCash] call life_fnc_rupadudejat];
