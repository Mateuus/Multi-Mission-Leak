/*
	Autor: Felix von Studsinske
	Dateiname: fn_updateHsnr.sqf
	Beschreibung:
		Aktualisiert die Liste der Hausnummer
		
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
disableSerialization;
private ["_display","_lb_plzStadtList","_lb_Strasse","_lb_Strasse","_lb_Hausnr","_hsnr"];
_display = findDisplay 60000;

_lb_plzStadtList = _display displayCtrl 60012;
_lb_Strasse = _display displayCtrl  60010;
_lb_Hausnr = _display displayCtrl 60011;

lbClear _lb_Hausnr;
_plz = call compile format ["%1",lbValue[60012,(lbCurSel 60012)]];
_hsnr = getArray(missionConfigFile >> "Personalausweis" >> "persoOrt" >> str(_plz) >> "str");
_hsnr = (_hsnr select (lbCurSel 60010)) select 1;
for "_i" from 0 to _hsnr do
{
	_lb_Hausnr lbAdd format["%1",_i];
	_lb_Hausnr lbSetValue[(lbSize _lb_Hausnr)-1,_i];
};
lbSetCurSel [60011,0];