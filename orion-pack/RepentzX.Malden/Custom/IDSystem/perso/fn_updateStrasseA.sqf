/*
	Autor: Felix von Studsinske
	Dateiname: fn_updateStrasseA.sqf
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
private ["_display","_lb_plzStadtList","_lb_Strasse","_plz","_str"];
if(playerside != civilian) exitWith {}; 
disableSerialization;
_display = findDisplay 70000;

_lb_plzStadtList = _display displayCtrl 70013;
_lb_Strasse = _display displayCtrl  70011;
lbClear _lb_Strasse;
_plz = call compile format ["%1",lbValue[70013,(lbCurSel 70013)]];
_str = getArray(missionConfigFile >> "Personalausweis" >> "persoOrt" >> str(_plz) >> "str");

{
	_lb_Strasse lbAdd format["%1",_x select 0];
	_lb_Strasse lbSetData[(lbSize _lb_Strasse)-1,str(_x select 0)];
} forEach _str;
lbSetCurSel [70011,0];