/*
	Autor: Felix von Studsinske
	Dateiname: fn_perso_laden.sqf
	Beschreibung: 
		Stößt die Suche nach den Daten des Personalausweises in der DB an und gibt dementsprechend eine Rückmeldung.
*/
_uid = getPlayerUID player;
_side = playerSide;
_sender = player;
[_uid,_side,_sender] remoteExec ["DB_fnc_persoRequest",2];