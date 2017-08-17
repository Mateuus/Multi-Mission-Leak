/*
	Autor: Felix von Studsinske
	Dateiname: fn_zeigePerso.sqf
	Beschreibung:
		Setzt nen HUD für den Spieler auf und zeigt den Personalausweis an.
		
	Sie dürfen meine Funktionen/Scripte nur mit der "License-FvS.txt" nutzen sowie der Einhaltung der Regeln.
		Im Missionshauptverzeichnis oder in einem leicht zu findenen Ordner muss die "License-FvS.txt" vorhanden sein!
			Beispiel-Pfad: 
				Altis_Life.Altis\License-FvS.txt
				MyExampleMission.Altis\License-FvS.txt
	You are only allowed to use my scripts/functions with my littly "License-FvS.txt" and the agreements to the rules.
		The "License-FvS.txt" has to be in your mission root folder or in an easy to finding folder
			Destination example:
				Altis_Life.Altis\License-FvS.txt
				MyExampleMission.Altis\License-FvS.txt
*/
disableSerialization;
params [
	["_sender",objNull,[objNull]],
	["_plInfo","# UNDEFINIERT #",[""]],
	"_senderVar","_ui","_nameP","_alter","_sex","_bltg","_stra","_handynr","_email","_cm","_kg","_t","_m","_j","_plz","_wohnort","_hsnr","_bildID","_bildPerso","_bild",
	"_name","_bday","_adresse","_groesse","_geschlecht","_mail","_gewicht","_handynrUI","_seite","_gang","_frakt","_fraktBild","_textBild","_tasteNr","_tastenName","_ausblenden"];
if(!(isNull (uiNameSpace getVariable "playerPerso"))) exitWith {hint format["%1 would like to show you his player id, however you are already looking at one. press TAB to close the current one.",_sender getVariable["realname",name _sender]]}; // Aktuell wird schon ein Personalausweis angesehen
if(_sender distance player > 5) exitWith {titleText ["Der Spieler ist zu weit weg","PLAIN"];};
if(isNull _sender) exitWith {};
_senderVar = _sender getVariable ["personaltext",[]];
if(_senderVar isEqualTo []) exitWith {hint format ["Error in personal ID of %1 and it can not be displayed ( %1 )",_sender getVariable["realname",name _sender],_senderVar];}; // Fehler

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
_staat = _senderVar select 15;
_wohnort = getText(missionConfigFile >> "Personalausweis" >> "persoOrt" >> (_senderVar select 12) >> "name");
_bildID = getText(missionConfigFile >> "Personalausweis" >> "persoBild" >> (_senderVar select 14) >> "pfad");

_bildPerso = _ui displayCtrl 410001;
_bildPerso ctrlSetText format["%1",_bildID];

_bild = _ui displayCtrl 2;
_bild ctrlSetText format["%1",_staat select 1];

_name = _ui displayCtrl 410002;
_name ctrlSetStructuredText parseText format["<t size='.9'><t color='#000000'>%1</t></t>",_nameP];

_bday = _ui displayCtrl 410003;
_bday ctrlSetStructuredText parseText format["<t size='.9'><t color='#000000'>%1. %2. %3</t></t>",_t,_m,_j];

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
_frakt = switch (side _sender) do
	{
		case west: {"Polizist<br/>" + _plInfo}; // Cop
		case independent: {"Sanitaeter<br/>" + _plInfo}; // Medic
		case civilian: {"Zivilist<br/>" + _gang}; // Civilian + gang name
		case east: {"Opfor<br/>" + _plInfo}; // Opfor/East
		default {"Unbekannt"};
	};
_seite ctrlSetStructuredText parseText format["<t size='.75'><t color='#000000'>%1</t></t>",_frakt];

_fraktBild = _ui displayCtrl 410011;
_textBild = switch (side _sender) do
	{
		case west: {getText(missionConfigFile >> "Personalausweis" >> "logoWest")};
		case independent: {getText(missionConfigFile >> "Personalausweis" >> "logoIndep")};
		case civilian: {getText(missionConfigFile >> "Personalausweis" >> "logoCiv")};
		case east: {getText(missionConfigFile >> "Personalausweis" >> "logoOpfor")};
		default {getText(missionConfigFile >> "Personalausweis" >> "logoUnkn")};
	};
_fraktBild ctrlSetText _textBild;

_ausblenden = _ui displayCtrl 3;

_tasteNr = getNumber(missionConfigFile >> "Personalausweis" >> "tasteAusblenden");
_tastenName = getText(missionConfigFile >> "Personalausweis" >> "tasten" >> str _tasteNr);
if(_sender != player) then {
	private _t = format[localize "STR_IDCard_zeige_fremd",_sender getVariable["realname",name _sender],_tastenName];
	hint _t;
	_ausblenden ctrlSetStructuredText parseText _t;
} else {
	private _t = format[localize "STR_IDCard_zeige_eigen",_tastenName];
	hint _t;
	_ausblenden ctrlSetStructuredText parseText _t;
};
PERSO_EXIT = (findDisplay 46) displayAddEventHandler ["KeyDown",format["if((_this select 1) == %1) then {(findDisplay 46) displayRemoveEventHandler ['KeyDown',PERSO_EXIT];(""perso"" call BIS_fnc_rscLayer) cutText ["""",""PLAIN""];};false",_tasteNr]];