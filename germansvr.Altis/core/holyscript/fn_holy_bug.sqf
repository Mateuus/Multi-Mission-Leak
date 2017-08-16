/*
 *
 *	@File:		holy_bugtracker.sqf
 *	@Autor: 	AustrianNoob
 *	@Date:		02.11.2016
 *
 *	You are not allowed to use this script or remove the credits of the script without the permission of the author.
 */
disableSerialization;
_uid = getPlayerUID player;
_name = profileName;
_dialog = findDisplay 1349;
_pnbox = _dialog displayCtrl 1351;
_puidbox = _dialog displayCtrl 1350;
_hinweis1 = _dialog displayCtrl 1354;
_hinweis2 = _dialog displayCtrl 1355;
_auswahl = (_this select 0);

if(!dialog) then {createDialog "holy_bug"}; //Thefuck?
waitUntil {!isNull (_dialog)};

switch(_auswahl) do {
	case 0: {
		hint parseText format["<t underline='true'>Missbrauch</t> führt zum Ban!"];
		_pnbox ctrlSetStructuredText parseText format["%1",_name];
		_puidbox ctrlSetStructuredText parseText format["%1",_uid];
		_hinweis1 ctrlSetStructuredText parseText format["<t align='center'><t color='#ff0000'>*</t> Mit diesem Symbol gekenntzeichnete Felder</t>"];
		_hinweis2 ctrlSetStructuredText parseText format["<t align='center'><t underline='true'>müssen</t> ausgefüllt werden!</t>"];
	};
	case 1: {
		if(((ctrlText 1352) != "") && ((ctrlText 1353) != "")) then {
			if(((ctrlText 1352) != "Bitte Titel eingeben") && ((ctrlText 1353) != "Bitte Beschreibung eingeben")) then {
				diag_log format["%1(%2) hat gerade einen Bug gefunden: ['TITEL: %3'],['BESCHREIBUNG: %4']",_name,_uid,ctrlText 1352,ctrlText 1353]; //<-- muss geaendert werden, diag_log ist scheisse
				_summary = [(ctrlText 1352),(ctrlText 1353)] joinString ",";
				[_uid,_summary] remoteExec ["DB_fnc_buginsert",2];
				hint "Bug wurde erfolgreich gemeldet!";
				closeDialog 0;
			} else {hint "Du musst jedes Feld ausfüllen!"};
		} else {hint "Du musst jedes Feld ausfüllen!"};
	};
};
