/*
	File: fn_startcourtCop.sqf
	Author: Barney

	Description:
	Cop initialiazes the court, BUTTON POWER


	You're not allowed to modify this file!
    Licensed under the Arma EULA and Arma Tools EULA.
	Usage of this file is restricted to permitted servers e.g. Loewenherz.
	Ask us for permission to use this file: www.lhzp.de
*/
Private["_action","_verurteilter","_zubefragende","_gewaehlte","_random","_count","_personenMessage","_rndmplayer","_limit"];

if(vehicle player != player) exitWith {}; // errorchecks
if(Gericht_1 getVariable["Gericht_Status",false]) exitWith {Hint "Das Gericht tagt bereits"}; // WHAT DA ISCH SCHON ÄH GERICHT!

_verurteilter = _this select 0;
_zubefragende = playableunits - [_verurteilter];
_zubefragende = _zubefragende - [player];
_gewaehlte = [];
_personenMessage = [];
_rndmplayer = [];
_limit = LHM_Geschworene_LIMIT ;

closedialog 0;

_action = [
	"Wollen Sie wirklich ein Gericht starten?",
	"LOEWENHERZ GERICHT",
	"JA",
	"NEIN"
] call BIS_fnc_guiMessage;

waituntil{ str _action == "true" or  str _action == "false"};


if(_action) then {

	hint format["%1 du hast ein Gericht gestartet, alle Vorbereitungen werden nun getroffen und Geschworene werden gesucht",name player];

	detach _verurteilter;

	{if(!alive _x or (_x getVariable["restrained",false]) or !isplayer _x or !(vehicle _x iskindof "MAN") or (_x distance (getMarkerPos "jail_marker") < 40))then{_zubefragende = _zubefragende - [_x]};} foreach _zubefragende;   //eine Liste von allen playern erstellen, aufgrund der unzuverlässigkeit von allplayers tote rausfiltern


	_count = count(_zubefragende);

	if(_count < _limit ) exitWith {Hint "Es wurden nicht genügend geeignete Geschworene gefunden"}; // ------------    fürs testen ausgeschaltet



[[_zubefragende],"lhm_fnc_courtStartMe",_verurteilter,false] call lhm_fnc_mp;

[[_verurteilter,player,false],"lhm_fnc_wantedBounty",false,false] call lhm_fnc_mp;

Gericht_1 setVariable["geschworene",[],true];
Gericht_1 setVariable["vote",[],true];
Gericht_1 setvariable["Gericht_Status",true,true];
Gericht_1 setVariable["Gericht_Entschieden",false,true];

};

