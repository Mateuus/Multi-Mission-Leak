#include "..\..\..\macros.hpp"
/*
	Autor: Felix von Studsinske
	Dateiname: fn_persoBeantragenAenderung.sqf
	Beschreibung:
	Überprüft nochmal die Eingaben/Auswahlen des Personalausweises und schickt die dann zum Server.
*/
if(playerside != civilian) exitWith {}; 
disableSerialization;
if((lbCurSel 70003) == -1) exitWith {};
if((lbCurSel 70004) == -1) exitWith {};
if((lbCurSel 70006) == -1) exitWith {};
if((lbCurSel 70007) == -1) exitWith {};
if((lbCurSel 70008) == -1) exitWith {};
if((lbCurSel 70009) == -1) exitWith {};
if((lbCurSel 70010) == -1) exitWith {};
if((lbCurSel 70013) == -1) exitWith {};
if((lbCurSel 70018) == -1) exitWith {};
if((lbCurSel 70011) == -1) exitWith {};
if((lbCurSel 70012) == -1) exitWith {};
if((ctrlText 70002 == "" || ctrlText 70019 == "") && DWEV_namenInfo) exitWith {hint "Du willst den Namen zwar ändern, aber es ist kein Neuer angegeben. Name darf nicht leer sein und muss mindestens 4 Zeichen enthalten!"};
if(dwf_cash < 250000) exitWith {hint parseText format ["Du hast nicht genug Geld auf der Hand.<br/>Aktuell: %2 €<br/>Fehlend: %1 €",(250000 - dwf_cash), dwf_cash];};
_sex = call compile format ["%1",lbData[70003,(lbCurSel 70003)]];
_cm = call compile format ["%1",lbValue[70004,(lbCurSel 70004)]];
_kg = call compile format ["%1",lbValue[70006,(lbCurSel 70006)]];
_blg = call compile format ["%1",lbData[70007,(lbCurSel 70007)]];
_bT = call compile format ["%1",lbValue[70008,(lbCurSel 70008)]];
_bM = call compile format ["%1",lbValue[70009,(lbCurSel 70009)]];
_bJ = call compile format ["%1",lbValue[70010,(lbCurSel 70010)]];
_plzst = call compile format ["%1",lbValue[70013,(lbCurSel 70013)]];
_str = call compile format ["%1",lbData[70011,(lbCurSel 70011)]]; 
_hausnr = call compile format ["%1",lbValue[70012,(lbCurSel 70012)]]; 
_bildID = call compile format ["%1",lbValue[70018,(lbCurSel 70018)]]; 
_insert = [];


_vorname = player getVariable ["vorname",((profileName splitString " ") select 0)];
_name = player getVariable ["nachname",((profileName splitString " ") select 1)];

if(DWEV_namen_a) then {
	_name  = (ctrlText 70002);
	_length = count (toArray(_name));
	_chrByte = toArray (_name);
	_allowed = toArray("ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz -");
	if((_length < 3) || (_length > 16)) exitWith {hint "Es sind mindestens 3 und maximal 16 Zeichen beim Namen erlaubt."};
	_badChar = false;
	{if(!(_x in _allowed)) exitWith {_badChar = true;};} foreach _chrByte;
	if(_badChar) exitWith {hint "Es sind nur Buchstaben im Namen erlaubt. Gangtags sind im Personalausweis-Namen nicht erlaubt!";};

	_vorname  = (ctrlText 70019);
	_length = count (toArray(_vorname));
	_chrByte = toArray (_vorname);
	_allowed = toArray("ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz -");
	if((_length < 3) || (_length > 16)) exitWith {hint "Es sind mindestens 3 und maximal 16 Zeichen beim Vornamen erlaubt."};
	_badChar = false;
	{if(!(_x in _allowed)) exitWith {_badChar = true;};} foreach _chrByte;
	if(_badChar) exitWith {hint "Es sind nur Buchstaben im Vornamen erlaubt. Gangtags sind im Personalausweis-Namen nicht erlaubt!";};
	
	_insert pushBack format["%1 %2", _vorname, _name];
} else {
	_insert pushBack (player getVariable ["realname",profileName]);
};

_insert pushBack str((Amyf_zeit select 4) - _bJ);
_insert pushBack _sex;
_insert pushBack _blg;
_insert pushBack _str;
_insert pushBack DWEV_handynr;
_insert pushBack DWEV_email;
_insert pushBack str(_cm);
_insert pushBack str(_kg);
_insert pushBack str(_bT);
_insert pushBack str(_bM);
_insert pushBack str(_bJ);
_insert pushBack str(_plzst);
_insert pushBack str(_hausnr);
_insert pushBack str(_bildID);
_insert pushBack _vorname;
_insert pushBack _name;
_uid = (getplayerUID player);
_side = side player;
[_insert,_uid,_side,player] remoteExec ["DB_fnc_persoUpdate",2];

_name = _insert select 0;
_alter = _insert select 1;
_sex = _insert select 2;
_bltg = _insert select 3;
_stra = _insert select 4;
_email = _insert select 6;
_cm = _insert select 7;
_kg = _insert select 8;
_t = _insert select 9;
_m = _insert select 10;
_j = _insert select 11;
_plz = _insert select 12;
_hsnr = _insert select 13;
_wohnort = getText(missionConfigFile >> "Personalausweis" >> "persoOrt" >> (_insert select 12) >> "name");
_bildID = _insert select 14;
_bildName = getText(missionConfigFile >> "Personalausweis" >> "persoBild" >> _bildID >> "name");
_nachname = _insert select 15;
closeDialog 0;
if(DWEV_namen_a) then {
	hint parseText format ["Du hast deinen Personalausweis geändert. Du wirst automatisch nach 5 Minuten aus dem Spiel entfernt, damit du dein Profilnamen ändern kannst. Bitte ändere deinen zu dem unten angezeigten Namen. Es wurde eine Gebühr von 250.000 € erhoben.<br/><br/>Daten des Personalausweises im Überblick:<br/><br/>Name: ""%1""<br/>Strasse: %2 %3<br/>Plz/Ort: %4 %5<br/><br/>Email: %6<br/>Handynummer: 0%7<br/>Körpergrösse: %8cm<br/>Gewicht: %9kg<br/>Alter: %10 Jahre<br/>Geburtsdatum: %11.%12.%13<br/>Blutgruppe: %14<br/><br/>Fotobezeichnung: %15 %16",_name,_stra,_hsnr,_plz,_wohnort,_email,DWEV_handynr,_cm,_kg,_alter,_t,_m,_j,_bltg,_bildID,_bildName];
	player setVariable ["personaltext",_insert,true];
	DWEV_namen_a = false;
	DWEV_checking_a = false;

	player setVariable ["realname",_name,true];
	player setVariable ["vorname",_vorname,true];
	player setVariable ["nachname",_nachname,true];
	//if(player getVariable["displayname",""] == "") then {
		if(getMyTag != "ERROR1") then {
			player setVariable["displayname",format ["[%2] %1",_name , getMyTag],true];
		} else {
			player setVariable["displayname",format ["%1",_name],true];
		};
	//};

	dwf_cash = dwf_cash - 250000;
	[] call SOCK_fnc_updateRequest;
	sleep (60 * 5);
	endMission "persoA";
} else {
	hint parseText format ["Du hast deinen Personalausweis geändert. Es wurde eine Gebühr von 250.000 € erhoben. <br/><br/>Daten des Personalausweises im Überblick:<br/><br/>Name: %1<br/>Strasse: %2 %3<br/>Plz/Ort: %4 %5<br/><br/>Email: %6<br/>Handynummer: 0%7<br/>Körpergrösse: %8cm<br/>Gewicht: %9kg<br/>Alter: %10 Jahre<br/>Geburtsdatum: %11.%12.%13<br/>Blutgruppe: %14<br/><br/>Fotobezeichnung: %15 %16",_name,_stra,_hsnr,_plz,_wohnort,_email,DWEV_handynr,_cm,_kg,_alter,_t,_m,_j,_bltg,_bildID,_bildName];
	player setVariable ["personaltext",_insert,true];
	DWEV_namen_a = false;
	DWEV_checking_a = false;
	dwf_cash = dwf_cash - 250000;
	[] call SOCK_fnc_updateRequest;
};