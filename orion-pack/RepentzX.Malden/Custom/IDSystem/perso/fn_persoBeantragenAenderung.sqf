/*
	Autor: Felix von Studsinske
	Dateiname: fn_persoBeantragenAenderung.sqf
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
private ["_preis","_sex","_cm","_kg","_blg","_bT","_bM","_bJ","_plzst","_str","_hausnr","_bildID","_insert","_name","_alter","_bltg","_stra","_email","_t","_m","_j","_plz",
"_hsnr","_wohnort","_bildName","_erlaubeMehrereNamen"];
if(playerside != civilian) exitWith {}; 
disableSerialization;
_preis = getNumber(missionConfigFile >> "Personalausweis" >> "aenderungspreis");
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
if(ctrlText 70002 == "" && fvs_namenInfo) exitWith {hint "You want to change the name, but no new is specified. Name can not be empty and contain at least 4 characters!"};
if(life_houseProtect < _preis) exitWith {hint parseText format ["You do not have enough money.<br/>Current: $%2<br/>Missing: $%1",(_preis - life_houseProtect), life_houseProtect];};
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
if(fvs_namen_a) then {
	_insert pushBack (ctrlText 70002);
} else {
	_insert pushBack profileName;
};
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
closeDialog 0;
_erlaubeMehrereNamen = switch (playerSide) do {
	case west: {getNumber(missionConfigFile >> "Personalausweis" >> "erlaube_West_aendern")};
	case independent: {getNumber(missionConfigFile >> "Personalausweis" >> "erlaube_Indp_aendern")};
	case east: {getNumber(missionConfigFile >> "Personalausweis" >> "erlaube_East_aendern")};
	case civilian: {getNumber(missionConfigFile >> "Personalausweis" >> "erlaube_Civ_aendern")};
	default{0};
};
if(fvs_namen_a && !(profileName isEqualTo (ctrlText 70002)) && (_erlaubeMehrereNamen isEqualTo 0)) then {
	hint parseText format ["You have changed your ID. You are automatically removed from the game after 5 minutes, so you can change your profile name. You have been charged $%17.<br/><br/>Data of the ID card at a glance:<br/><br/>Name: %1<br/>Street: %2 %3<br/>ZIP/City: %4 %5<br/><br/>Email: %6<br/>mobile number: 0%7<br/>Height: %8cm<br/>Weight: %9kg<br/>Alter: %10 Age<br/>Date of birth: %11 %12 %13<br/>Blood Type: %14<br/><br/>Photo Title: %15 %16",_name,_stra,_hsnr,_plz,_wohnort,_email,fvs_handynr,_cm,_kg,_alter,_t,_m,_j,_bltg,_bildID,_bildName,_preis];
	player setVariable ["personaltext",_insert,true];
	fvs_namen_a = false;
	fvs_checking_a = false;
	life_houseProtect = life_houseProtect - _preis;
	[] call SOCK_fnc_updateRequest;
	sleep (60 * 5);
	endMission "persoA";
} else {
	hint parseText format ["You have changed your ID. There was a fee of $%17. <br/><br/>Data of the ID card in overview:<br/><br/>Name: %1<br/>glance: %2 %3<br/>ZIP/City: %4 %5<br/><br/>Email: %6<br/>mobile number: 0%7<br/>Height: %8cm<br/>Weight: %9kg<br/>Alter: %10 Age<br/>Date of birth: %11 %12 %13<br/>Blood Type: %14<br/><br/>Photo Title: %15 %16",_name,_stra,_hsnr,_plz,_wohnort,_email,fvs_handynr,_cm,_kg,_alter,_t,_m,_j,_bltg,_bildID,_bildName,_preis];
	player setVariable ["personaltext",_insert,true];
	fvs_namen_a = false;
	fvs_checking_a = false;
	life_houseProtect = life_houseProtect - _preis;
	[] call SOCK_fnc_updateRequest;
};