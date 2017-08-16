/*
	File: fn_adacCallAction.sqf
	Author: Bryan "Tonic" Boardwine	
	Moded: by RageBone
	
	Description:
	Dies ist lokal auf der Maschine des Rufenden.
	
*/
private["_vehicle","_vehicleName","_Village","_units","_unit","_c","_msg"];
_vehicle = cursorObject;
_vehicleName = getText(configFile >> "CfgVehicles" >> (typeOf _vehicle) >> "displayName");
_Village = (text (nearestLocations [(getpos player),["NameVillage","NameCity","NameCityCapital"],5000]select 0));
if ((independent countside playableUnits) == 0) exitWith {hint "Leider ist kein AHW-Mitarbeiter im Dienst."};
if(life_adacCall) exitWith {hint "Du musst 10 Minuten warten um einen erneuten Notruf absetzen zu können!"}; 

_action = [
	format["Du benötigst Unfallhilfe?"],
	"Notfallsystem",
	"Ja",
	"Nein"
] call BIS_fnc_guiMessage;

if!(_action) exitWith {};

_action = [
	format["Was benötigst du?"],
	"Notfallsystem",
	"Reparatur",
	"Abschleppen"
] call BIS_fnc_guiMessage;

if(_action) then 
{
	_id = round(random 100000);

	[2,[_id,"Reparatur",player,_Village,[1] call life_fnc_gettime,"Niemand",getpos player]] remoteExecCall ["SOA_fnc_ahw",2];
	[_vehicle, _vehicleName, name player,"mechaniker",_id] remoteExec ["life_fnc_ahwEinsatz",independent];
} else {
	_id = round(random 100000);

	[2,[_id,"Abschleppdienst",player,_Village,[1] call life_fnc_gettime,"Niemand",getpos player]] remoteExecCall ["SOA_fnc_ahw",2];
	[_vehicle, _vehicleName, name player,"mechaniker",_id] remoteExec ["life_fnc_ahwEinsatz",independent];
};

hint "Das AHW wurde verständigt. Wir senden Ihnen einen Mechaniker zu, bitte gedulden Sie sich.";

life_adacCall = true;
sleep (10 * 60);
life_adacCall = false;