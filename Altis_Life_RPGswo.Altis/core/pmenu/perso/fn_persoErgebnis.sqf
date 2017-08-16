#include "..\..\..\macros.hpp"
/*
	Autor: Felix von Studsinske
	Dateiname: fn_persoErgebnis.sqf
	Beschreibung:
	Überprüft die Personalausweisdaten auf das richtige Format (Strings) und weist den Personalausweis dem Spieler zu.
*/
_text = [_this,0,[],[[]]] call BIS_fnc_param;
if(_text isEqualTo []) exitWith {0 cutText ["Personalausweis muss angelegt werden","BLACK FADED"]; 0 cutFadeOut 9999999; if(side player == civilian) then { DWEV_stranger = true; } else {  [] call DWEV_fnc_persoNeu; }; };
if((count _text) < 17 || (count _text) > 17 || !(_this isEqualType [])) exitWith {endMission "fehlerprof";};
if(!((_text select 0) isEqualTo profileName) && !DWEV_stranger) exitWith {
	[(_text select 0)] spawn {
		[
			format["Du hast dich versucht mit einem anderem Profilname (%1) anzumelden, aber '%2' ist für den Personalausweis hinterlegt! Ändere deinen Namen im Profil oder melde dich beim Support im Teamspeak auf <a underline='true' color='#0000FF' href='ts3server://ts.division-wolf.de?port=9987'>ts.division-wolf.de</a> oder im Forum unter <a underline='true' color='#0000FF' href='http://www.division-wolf.de'>www.division-wolf.de</a></a></t>",profileName, _this select 0],
			"Personalausweis - Falscher Name (Groß-/Kleinschreibung)",
			"Verstanden",
			false
		] call BIS_fnc_guiMessage;
		endMission "falschprof";
	};
};
if(!(_text isEqualTypeArray ["","","","","","","","","","","","","","","","",""]) || (typeName _text != "ARRAY")) exitWith {endMission "fformatprof";};
_name = _text select 0;
_alter = _text select 1;
_sex = _text select 2;
_bltg = _text select 3;
_stra = _text select 4;
_handynr = _text select 5;
_email = _text select 6;
_cm = _text select 7;
_kg = _text select 8;
_t = _text select 9;
_m = _text select 10;
_j = _text select 11;
_plz = _text select 12;
_hsnr = _text select 13;
_wohnort = getText(missionConfigFile >> "Personalausweis" >> "persoOrt" >> (_text select 12) >> "name");
_bildID = _text select 14;
_bildName = getText(missionConfigFile >> "Personalausweis" >> "persoBild" >> _bildID >> "name");
_vorname = _text select 15;
_nachname = _text select 16;
hint parseText format["Daten des Personalausweises im Überblick:<br/><br/>Name: %1<br/>Strasse: %2 %3<br/>Plz/Ort: %4 %5<br/><br/>Email: %6<br/>Handynummer: 0%7<br/>Körpergrösse: %8cm<br/>Gewicht: %9kg<br/>Alter: %10 Jahre<br/>Geburtsdatum: %11.%12.%13<br/>Blutgruppe: %14<br/><br/>Fotobezeichnung: %15 %16",_name,_stra,_hsnr,_plz,_wohnort,_email,_handynr,_cm,_kg,_alter,_t,_m,_j,_bltg,_bildID,_bildName];
player setVariable ["personaltext",_text,true];

//Variablen begüllen
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

DWEV_persoReady = true;
DWEV_stranger = false;