#include "..\..\..\macros.hpp"
/*
	Autor: Felix von Studsinske
	Dateiname: fn_zeigePerso.sqf
	Beschreibung:
	Setzt nen HUD für den Spieler auf und zeigt den Personalausweis an.
*/
private["_rank","_sender"];
disableSerialization;
_sender = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
if(!(isNull (uiNameSpace getVariable "playerPerso"))) then {
	hint format["%1 moechte dir seinen Personal- / Dienstausweis zeigen, jedoch schaust du dir gerade einen an. Blende den aktuellen Ausweis mit *TAB* aus , um den von %1 zu sehen.",getPlayerDName(_sender)];
	waitUntil { sleep 1; isNull(uiNameSpace getVariable "playerPerso")};
}; // Aktuell wird schon ein Personalausweis angesehen
if(_sender distance player > 5) exitWith {titleText ["Der Spieler ist zu weit weg","PLAIN"];};
if(isNull _sender) exitWith {};
_senderVar = _sender getVariable ["personaltext",[]];
if(_senderVar isEqualTo []) exitWith {hint format ["Fehler im Personalausweis von %1 und kann somit nicht dargestellt werden ( %1 )",getPlayerDName(_sender),_senderVar];}; // Fehler

("perso" call BIS_fnc_rscLayer) cutRsc ["playerPerso","PLAIN"];
_ui = uiNameSpace getVariable "playerPerso";

_nameP = _senderVar select 0;
_alter = _senderVar select 1;
_sex = _senderVar select 2;
_bltg = _senderVar select 3;
_stra = _senderVar select 4;
_handynr = _senderVar select 5;
_email = _senderVar select 6;
_cm = _senderVar select 7;
_kg = _senderVar select 8;
_t = _senderVar select 9;
_m = _senderVar select 10;
_j = _senderVar select 11;
_plz = _senderVar select 12;
_hsnr = _senderVar select 13;
_wohnort = getText(missionConfigFile >> "Personalausweis" >> "persoOrt" >> (_senderVar select 12) >> "name");
_bildID = getText(missionConfigFile >> "Personalausweis" >> "persoBild" >> (_senderVar select 14) >> "pfad");

_bildPerso = _ui displayCtrl 410001;
_bildPerso ctrlSetText format["%1",_bildID];

_name = _ui displayCtrl 410002;
_name ctrlSetStructuredText parseText format["<t size='.9'><t color='#000000'>%1</t></t>",_nameP];

_bday = _ui displayCtrl 410003;
_bday ctrlSetStructuredText parseText format["<t size='.9'><t color='#000000'>%1.%2.%3</t></t>",_t,_m,_j];

_adresse = _ui displayCtrl 410004;
_adresse ctrlSetStructuredText parseText format["<t size='.9'><t color='#000000'>%1 %2<br/>%3 %4</t></t>",_stra,_hsnr,_plz,_wohnort];

_groesse = _ui displayCtrl 410005;
_groesse ctrlSetStructuredText parseText format["<t size='.9'><t color='#000000'>%1 cm</t></t>",_cm];

_geschlecht = _ui displayCtrl 410006;
_geschlecht ctrlSetStructuredText parseText format["<t size='.9'><t color='#000000'>%1</t></t>",_sex];

_mail = _ui displayCtrl 410007;
_mail ctrlSetStructuredText parseText format["<t size='.9'><t color='#000000'>%1</t></t>",_email];

_gewicht = _ui displayCtrl 410008;
_gewicht ctrlSetStructuredText parseText format["<t size='.9'><t color='#000000'>%1 kg</t></t>",_kg];

_handynrUI = _ui displayCtrl 410009;
_handynrUI ctrlSetStructuredText parseText format["<t size='.9'><t color='#000000'>0%1</t></t>",_handynr];

_seite = _ui displayCtrl 410010;
_gang = if(side _sender == civilian && (group _sender) getVariable ["gang_name",""] != "") then {(group _sender) getVariable "gang_name"} else {""};

if((side _sender) == west) then
{
	_rank = switch(_sender getVariable["coplevel", 0]) do
	{
		case (1) : {"Ordnungsbeamter"};
		case (2) : {"Wachtmeister"};
		case (3) : {"Oberwachtmeister"};
		case (4) : {"Hauptwachtmeister"};
		case (5) : {"Kommissar"};
		case (6) : {"Oberkommissar"};
		case (7) : {"Hauptkommissar"};
		case (8) : {"Polizeidirektion"};
		case (9) : {"Polizeipräsident"};
		default {"Unbekannt"};
	};
};

if((side _sender) == independent) then
{
	_rank = switch(_sender getVariable["mediclevel", 0]) do
	{
		case (1) : {"Anwärter"};
		case (2) : {"Helfer"};
		case (3) : {"Atemschutzgeräteträger"};
		case (4) : {"Truppführer"};
		case (5) : {"Maschinist"};
		case (6) : {"Gruppenführer"};
		case (7) : {"Hauptfeuerwehrmann"};
		case (8) : {"Zugführer"};
		case (9) : {"Leitung"};
		default {"Unbekannt"};
	};
};

_frakt = switch (side _sender) do {
	case west: {"Polizist<br/>" + _rank};
	case independent: {"Feuerwehrmann<br/>" + _rank};
	case civilian: {"Zivilist<br/>Gang: " + _gang};
	case east: {"Sicherheitsmann"};
	default {"Unbekannt"};
};
_seite ctrlSetStructuredText parseText format["<t size='.75'><t color='#000000'>%1</t></t>",_frakt];

_fraktBild = _ui displayCtrl 410011;
_textBild = switch(side _sender) do {
	case (civilian) : { getText(missionConfigFile >> "Personalausweis" >> "logoCiv") };
	case (west) : { getText(missionConfigFile >> "Personalausweis" >> "logoWest") };
	case (independent) : { getText(missionConfigFile >> "Personalausweis" >> "logoIndep") };
	case (east) : { getText(missionConfigFile >> "Personalausweis" >> "logoEast") };
};

_fraktBild ctrlSetText _textBild;

if(_sender != player) then {
	hint format["Dir wird gerade den Personal- / Dienstausweis von %1 angezeigt. Blende ihn mit *TAB* wieder aus",getPlayerDName(_sender)];
} else {
	hint "Du schaust dir gerade deinen Personal- / Dienstausweis an. Blende ihn mit *TAB* wieder aus"; // Eigener Personalausweis?
};
PERSO_EXIT = (findDisplay 46) displayAddEventHandler ["KeyDown","if((_this select 1) == 15) then {(findDisplay 46) displayRemoveEventHandler ['KeyDown',PERSO_EXIT];(""perso"" call BIS_fnc_rscLayer) cutText ["""",""PLAIN""];};false"];