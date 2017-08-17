/*
	Autor: Felix von Studsinske
	Dateiname: fn_persoBeantragen.sqf
	Beschreibung:
		Überprüft nochmal die Eingaben/Auswahlen des Personalausweises und schickt die dann zum Server.
		
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
private ["_sex","_cm","_kg","_blg","_bT","_bM","_bJ","_plzst","_str","_hausnr","_bildID","_insert","_uid","_side"];
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
if((lbCurSel 60018) == -1) exitWith {};
if(!fvs_hakenregeln || !fvs_hakenrichtig || !fvs_hakendaten || !fvs_namenInfo) exitWith {};

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
_insert pushBack profileName;
_insert pushBack str((date select 0) - _bJ);
_insert pushBack _sex;
_insert pushBack _blg;
_insert pushBack _str;
_insert pushBack fvs_handynr;
_insert pushBack fvs_email;
_insert pushBack str(_cm);
_insert pushBack str(_kg);
_insert pushBack str(_bT);
_insert pushBack str(_bM);
_insert pushBack str(_bJ);
_insert pushBack str(_plzst);
_insert pushBack str(_hausnr);
_insert pushBack str(_bildID);
_insert pushBack str(lbCurSel 60018);
_uid = (getplayerUID player);
_side = side player;
[_insert,_uid,_side,player] remoteExec ["DB_fnc_persoInsert",2];

closeDialog 0;
fvs_hakenregeln = false;
fvs_hakenrichtig = false;
fvs_namenInfo = false;
fvs_hakendaten = false;
fvs_checking_a = false;