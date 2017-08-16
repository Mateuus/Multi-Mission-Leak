/*
	File: fn_upgradeCar.sqf
	Author: Barney

	Description:
	blah blah blah....


	You're not allowed to modify this file!
    	Licensed under the Arma EULA and Arma Tools EULA.
	Usage of this file is restricted to permitted servers e.g. Loewenherz.
	Ask us for permission to use this file: www.lhzp.de
*/


private ["_display","_listbox","_btn","_cur_sel","_action","_netid","_vehicle"];
disableSerialization;


if(isnull(findDisplay 2541)) exitWith {};
if((lhm_cash - 50000) < 0) exitWith {hint "Du hast nicht genügend Geld um das zu tun, du brauchst 50.000$";};
_display = findDisplay 2541;
_listbox = _display displayCtrl 1500;
_btn = _display displayCtrl 2400;


_cur_sel = lbCurSel _listbox;
if(_cur_sel == -1) exitWith {hint "Du hast kein Fahrzeug ausgewählt";};
_action = [
	"Wollen Sie wirklich ihr Fahrzeug für 50.000$ mit 6 Nitro-Ladungen bestücken? Vorsicht, das ist als Zivilist (civilian slot) ILLEGAL! ANMERKUNG: Benutzen des Nitros im Fahrzeug mit der E - Taste!",
	"LOEWENHERZ AUTO - TUNING",
	"JA",
	"NEIN"
] call BIS_fnc_guiMessage;

if(_action) then {
	_netid = _listbox lbdata _cur_sel;
	_vehicle = objectfromnetid _netid;
	if(!isnull _vehicle) then {
		_vehicle setvariable["injection",6,true];
		hint "Du hast erfolgreich dieses Auto aufgerüstet";
		lhm_cash = lhm_cash - 50000;

	} else {
		hint "Dieses Fahrzeug exisitert nicht mehr?!";
	};
};

