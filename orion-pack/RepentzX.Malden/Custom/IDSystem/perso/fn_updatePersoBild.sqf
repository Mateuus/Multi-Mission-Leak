/*
	Autor: Felix von Studsinske
	Dateiname: fn_updateStrasse.sqf
	Beschreibung:
		Aktualisiert die Liste der Strassen
		
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
private ["_display","_bild","_bildID","_pfad"];
disableSerialization;
_display = findDisplay 60000;

_bild = _display displayCtrl 60016;
_bildID = call compile format ["%1",lbValue[60017,(lbCurSel 60017)]];
_pfad = getText(missionConfigFile >> "Personalausweis" >> "persoBild" >> str(_bildID) >> "pfad");

_bild ctrlSetText format["%1",_pfad];