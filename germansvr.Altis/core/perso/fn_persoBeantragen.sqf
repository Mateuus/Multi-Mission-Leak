/*
	Autor: Felix von Studsinske
	Dateiname: fn_persoBeantragen.sqf
	Beschreibung:
		Überprüft nochmal die Eingaben/Auswahlen des Personalausweises und schickt die dann zum Server.
*/
disableSerialization;
if((ctrlText 60003) == "") exitWith {};
if((ctrlText 60004) == "") exitWith {};
if((ctrlText 60011) == "") exitWith {};
if((lbCurSel 60005) == -1) exitWith {};
if((lbCurSel 60006) == -1) exitWith {};
if((lbCurSel 60007) == -1) exitWith {};
if((lbCurSel 60008) == -1) exitWith {};
if((lbCurSel 60009) == -1) exitWith {};
if((lbCurSel 60010) == -1) exitWith {};
if((lbCurSel 60012) == -1) exitWith {};
if(!life_hakenregeln || !life_hakenrichtig || !life_hakendaten || !life_namenInfo) exitWith {};

_gangtag = ctrlText 60002;
_vname = ctrlText 60003;
_nname = ctrlText 60004;
_sex = call compile format ["%1",lbData[60005,(lbCurSel 60005)]];
_cm = call compile format ["%1",lbValue[60006,(lbCurSel 60006)]];
_kg = call compile format ["%1",lbValue[60007,(lbCurSel 60007)]];
_bT = call compile format ["%1",lbValue[60008,(lbCurSel 60008)]];
_bM = call compile format ["%1",lbValue[60009,(lbCurSel 60009)]];
_bJ = call compile format ["%1",lbValue[60010,(lbCurSel 60010)]];
_mnr = ctrlText 60011;
_bildID = call compile format ["%1",lbValue[60012,(lbCurSel 60012)]];  
_insert = [];
if (_gangtag == "") then {_gangtag = "-";};
_insert pushBack _gangtag;
_insert pushBack _vname;
_insert pushBack _nname;
_insert pushBack _sex;
_insert pushBack str(_cm);
_insert pushBack str(_kg);
_insert pushBack str(_bT);
_insert pushBack str(_bM);
_insert pushBack str(_bJ);
_insert pushBack _mnr;
_insert pushBack str(_bildID);
_uid = (getplayerUID player);
_side = side player;
[_insert,_uid,_side,player] remoteExec ["DB_fnc_persoInsert",2];

closeDialog 0;
life_hakenregeln = false;
life_hakenrichtig = false;
life_namenInfo = false;
life_hakendaten = false;
life_checking_a = false;