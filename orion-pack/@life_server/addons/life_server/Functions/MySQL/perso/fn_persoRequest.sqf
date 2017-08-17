/*
	Autor: Felix von Studsinske
	Dateiname: fn_persoRequest.sqf
	Beschreibung:
		Sucht in der DB nach Einträgen für den Personalausweis je nach Fraktion.
		
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
params [
	["_uid","",[""]],
	["_side",sideUnknown,[sideUnknown]],
	["_player",objNull,[objNull]]
];

if(isNull _player) exitWith {}; // Gibt's nicht

_query = switch(_side) do
{
	case west:
	{
		format["SELECT persoCop FROM perso WHERE pid='%1'",_uid];
	};
	case independent:
	{
		format["SELECT persoMed FROM perso WHERE pid='%1'",_uid];
	};
	case civilian:
	{
		format["SELECT persoCiv FROM perso WHERE pid='%1'",_uid];
	};
	case east:
	{
		format["SELECT persoEast FROM perso WHERE pid='%1'",_uid];
	};
};
_queryResult = [_query,2] call DB_fnc_asyncCall;
_ergebnis = [_queryResult select 0] call DB_fnc_mresToArray;

// Not in database
if(count _queryResult == 0) exitWith {
	_query_2 = format["INSERT INTO perso(pid, persoCop, persoMed, persoCiv, persoEast) VALUES ('%1','""[]""','""[]""','""[]""','""[]""')",_uid];
	[_query_2,_player] spawn {
		[_this select 0,1] call DB_fnc_asyncCall;
		[] remoteExecCall ["fvs_fnc_persoNeu",(owner (_this select 1))];
	};
};
[_ergebnis] remoteExecCall ["fvs_fnc_persoErgebnis",(owner _player)];