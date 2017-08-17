/*
	Autor: Felix von Studsinske
	Dateiname: fn_persoErgebnis.sqf
	Beschreibung:
		Überprüft die Personalausweisdaten auf das richtige Format (Strings) und weist den Personalausweis dem Spieler zu.
		
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
if(_this isEqualTo []) exitWith {0 cutText ["Fehler: Personalausweis muss angelegt werden","BLACK FADED"]; 0 cutFadeOut 9999999; [] call fvs_fnc_persoNeu};
if((count _this) < 15 || (count _this) > 15 || !(_this isEqualType [])) exitWith {
	_uid = (getplayerUID player);
	_side = side player;
	[_uid,_side,player] remoteExec ["DB_fnc_persoErrorFix",2];
};
if(!((_this select 0) isEqualTo profileName)) exitWith {
	[(_this select 0)] spawn {
		[
			format["Du hast dich versucht mit einem anderem Profilname (%1) anzumelden, aber '%2' ist für den Personalausweis hinterlegt! Ändere deinen Namen im Profil oder melde dich beim Support im Teamspeak auf %3 oder im Forum unter <a href='http://%4'>%4</a></t>",profileName, _this select 0,getText(missionConfigFile >> "server" >> "ts"),getText(missionConfigFile >> "server" >> "web")],
			"Personalausweis - Falscher Name - Case-Sensitive (Groß-/Kleinschreibung)",
			"Verstanden",
			false
		] call BIS_fnc_guiMessage;
		endMission "falschprof";
	};
};
if(!(_this isEqualTypeArray ["","","","","","","","","","","","","","",""]) || (typeName _this != "ARRAY")) exitWith {endMission "fformatprof";};
_name = _this select 0;
_alter = _this select 1;
_sex = _this select 2;
_bltg = _this select 3;
_stra = _this select 4;
_handynr = _this select 5;
_email = _this select 6;
_cm = _this select 7;
_kg = _this select 8;
_t = _this select 9;
_m = _this select 10;
_j = _this select 11;
_plz = _this select 12;
_hsnr = _this select 13;
_wohnort = getText(missionConfigFile >> "Personalausweis" >> "persoOrt" >> (_this select 12) >> "name");
_bildID = _this select 14;
_bildName = getText(missionConfigFile >> "Personalausweis" >> "persoBild" >> _bildID >> "name");
hint parseText format["Data of the ID card at a glance:<br/><br/>Name: %1<br/>Strasse: %2 %3<br/>Plz/Ort: %4 %5<br/><br/>Email: %6<br/>Phone: 0%7<br/>Height: %8cm<br/>Gewicht: %9kg<br/>Alter: %10 Jahre<br/>Geburtsdatum: %11 %12 %13<br/>Blutgruppe: %14<br/><br/>Fotobezeichnung: %15 %16",_name,_stra,_hsnr,_plz,_wohnort,_email,_handynr,_cm,_kg,_alter,_t,_m,_j,_bltg,_bildID,_bildName];
player setVariable ["personaltext",_this,true];
fvs_persoReady = true;