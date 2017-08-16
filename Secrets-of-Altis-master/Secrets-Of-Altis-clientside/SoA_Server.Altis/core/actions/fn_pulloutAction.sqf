/*
	File: fn_pulloutAction.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Pulls civilians out of a car if it's stopped.
*/
private["_crew"];
if(locked cursorObject == 2 && playerside == civilian) exitWith {hint "Das Fahrzeug ist abgeschlossen!"};
if(cursorObject distance player > 5) exitWith {hint "Das Fahrzeug ist zu weit entfernt!"};
_crew = crew cursorObject;

{
	_x setVariable ["transporting",false,true]; _x setVariable ["Escorting",false,true];
	[name player] remoteExecCall ["life_fnc_pulloutVeh",_x];
} foreach _crew;