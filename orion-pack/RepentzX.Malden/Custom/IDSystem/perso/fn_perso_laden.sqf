/*
	Autor: Felix von Studsinske
	Dateiname: fn_perso_laden.sqf
	Beschreibung: 
		Stößt die Suche nach den Daten des Personalausweises in der DB an und gibt dementsprechend eine Rückmeldung.
		
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
private ["_uid","_side","_sender"];
_uid = getPlayerUID player;
_side = playerSide;
_sender = player;
[_uid,_side,_sender] remoteExec ["DB_fnc_persoRequest",2];