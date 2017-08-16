/*
	Autor: Felix von Studsinske
	Dateiname: fn_updateMonat.sqf
	Beschreibung:
		Dient mit zur Überprüfung ob Schaltjahr sowie der Freigabe der Tage am Ende
		
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
private ["_display","_lb_bdayTagList","_lb_bdayMonatList"];
disableSerialization;
if(isNull (findDisplay 60000)) exitWith {hint "Fehler";};
_display = findDisplay 60000;
_lb_bdayTagList = _display displayCtrl 60007;
_lb_bdayMonatList = _display displayCtrl 60008;
lbClear _lb_bdayMonatList;
lbClear _lb_bdayTagList;
for "_bM" from 1 to 12 do
{
	_lb_bdayMonatList lbAdd format["%1",_bM];
	_lb_bdayMonatList lbSetValue [(lbSize _lb_bdayMonatList)-1,_bM];
};
lbSetCurSel [60008,0];
