/*
	File: fn_courtask.sqf
	Author: Barney

	Description:
	Asks Player for court


	You're not allowed to modify this file!
    Licensed under the Arma EULA and Arma Tools EULA.
	Usage of this file is restricted to permitted servers e.g. Loewenherz.
	Ask us for permission to use this file: www.lhzp.de
*/
Private["_action","_verurteilter","_gefragte","_bericht"];
if(lhm_is_arrested == 1 || lhm_is_arrested == 2) exitWith {};
if(!alive player) exitWith {};
if(vehicle player != player) exitWith {};
if(player getVariable["restrained",false]) exitWith {};

_verurteilter = objectfromnetid (_this select 0); //netid vom Täter

sleep random (2);

closedialog 0;


_action = [
	"Ein Gericht wurde einberufen, wollen Sie an diesem als Geschworener teilnehmen?",
	"LOEWENHERZ GERICHT",
	"JA",
	"NEIN"
] call BIS_fnc_guiMessage;

waituntil{ str _action == "true" or  str _action == "false"};

if(_verurteilter distance (getpos Stuhl_angeklagter) < 100) exitWith {hintsilent "Du hast leider zu spät geantwortet"};


sleep random(7);
if(_verurteilter distance (getpos Stuhl_angeklagter) < 100) exitWith {hintsilent "Du hast leider zu spät geantwortet"};
if (_action) then {
_bericht = Gericht_1 getVariable["geschworene",[]];
_bericht pushback [name player,netid player];
hintsilent "Es werden noch weitere Geschworene befragt, sollten sich nicht genügend andere melden wird das Gericht nicht tagen und Sie werden informiert \n  \n Haben Sie Geduld, dieser Vorgang dauert ca. 1-2 Minuten!";

Gericht_1 setVariable["geschworene",_bericht,true];

};