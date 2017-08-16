#include "..\..\..\macros.hpp"
/*
	Autor: Felix von Studsinske
	Dateiname: fn_persoBeantragen.sqf
	Beschreibung:
	Überprüft nochmal die Eingaben/Auswahlen des Personalausweises und schickt die dann zum Server.
*/
disableSerialization;
if((lbCurSel 60002) == -1) exitWith {};
if((lbCurSel 60004) == -1) exitWith {};
if((lbCurSel 60005) == -1) exitWith {};
if((lbCurSel 60006) == -1) exitWith {};
if((lbCurSel 60007) == -1) exitWith {};
if((lbCurSel 60008) == -1) exitWith {};
if((lbCurSel 60009) == -1) exitWith {};
if((lbCurSel 60012) == -1) exitWith {};
if((lbCurSel 60010) == -1) exitWith {};
if((lbCurSel 60011) == -1) exitWith {};
if((lbCurSel 60017) == -1) exitWith {};
if(!DWEV_hakenregeln || !DWEV_hakenrichtig || !DWEV_hakendaten || !DWEV_namenInfo) exitWith {};

_name  = (ctrlText 60001);
_length = count (toArray(_name));
_chrByte = toArray (_name);
_allowed = toArray("ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz -");
if((_length < 3) || (_length > 16)) exitWith {hint "Es sind mindestens 3 und maximal 16 Zeichen beim Namen erlaubt."};
_badChar = false;
{if(!(_x in _allowed)) exitWith {_badChar = true;};} foreach _chrByte;
if(_badChar) exitWith {hint "Es sind nur Buchstaben im Namen erlaubt. Gangtags sind im Personalausweis-Namen nicht erlaubt!";};

_vorname  = (ctrlText 60018);
_length = count (toArray(_vorname));
_chrByte = toArray (_vorname);
_allowed = toArray("ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz -");
if((_length < 3) || (_length > 16)) exitWith {hint "Es sind mindestens 3 und maximal 16 Zeichen beim Vornamen erlaubt."};
_badChar = false;
{if(!(_x in _allowed)) exitWith {_badChar = true;};} foreach _chrByte;
if(_badChar) exitWith {hint "Es sind nur Buchstaben im Vornamen erlaubt. Gangtags sind im Personalausweis-Namen nicht erlaubt!";};

_length = count(toArray(_name)) + count(toArray(_vorname));
if(_length > 23) exitWith {hint "Es sind insgesamt maximal 23 Zeichen beim Vornamen und Nachnamen erlaubt."};

_sex = call compile format ["%1",lbData[60002,(lbCurSel 60002)]];
_cm = call compile format ["%1",lbValue[60004,(lbCurSel 60004)]];
_kg = call compile format ["%1",lbValue[60005,(lbCurSel 60005)]];
_blg = call compile format ["%1",lbData[60006,(lbCurSel 60006)]];
_bT = call compile format ["%1",lbValue[60007,(lbCurSel 60007)]];
_bM = call compile format ["%1",lbValue[60008,(lbCurSel 60008)]];
_bJ = call compile format ["%1",lbValue[60009,(lbCurSel 60009)]];
_plzst = call compile format ["%1",lbValue[60012,(lbCurSel 60012)]];
_str = call compile format ["%1",lbData[60010,(lbCurSel 60010)]]; 
_hausnr = call compile format ["%1",lbValue[60011,(lbCurSel 60011)]]; 
_bildID = call compile format ["%1",lbValue[60017,(lbCurSel 60017)]]; 
_insert = [];
_insert pushBack format["%1 %2", _vorname, _name];
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
[_insert,_uid,_side,player] remoteExec ["DB_fnc_persoInsert",2];


5 cutText ["","PLAIN"];
closeDialog 0;
DWEV_hakenregeln = false;
DWEV_hakenrichtig = false;
DWEV_namenInfo = false;
DWEV_hakendaten = false;
DWEV_checking_a = false;

if(format["%1 %2", _vorname, _name] != profileName) then {
	[] spawn {
		systemChat format["Du hast einen Personalausweis erstellt. Da du einen anderen Namen als deinen Profilnamen eingegeben hast, solltest du innerhalb der nächsten 5 Minuten den Server verlassen und mit dem neuen Namen joinen, ansonsten wirst du gekickt! Bitte ändere deinen Profilnamen zu ""%1"".", getMyName];
		sleep (60 * 5);
		endMission "persoA";
	};
};