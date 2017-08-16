/*
	File: fn_storeVehicle.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Stores the vehicle in the garage.
*/
private["_nearVehicles","_vehicle","_checkvehicle","_action"];
_action = true;
if!(isNull objectParent player) then
{
	_vehicle = vehicle player;
}
	else
{
	_nearVehicles = nearestObjects[getPos (_this select 0),["Car","Air","Ship"],50];
	if(count _nearVehicles > 0) then
	{
		{
			if(!isNil "_vehicle") exitWith {};
			_vehData = _x getVariable["vehicle_info_owners",[]];
			if(count _vehData  > 0) then
			{
				_vehOwner = (_vehData select 0) select 0;
				if((getPlayerUID player) == _vehOwner) exitWith
				{
					_vehicle = _x;
				};
			};
		} foreach _nearVehicles;
	};
};

if(isNil "_vehicle") exitWith {};
if(isNull _vehicle) exitWith {};
if((damage _vehicle) == 1) exitWith {hint "Das Fahrzeug ist kaputt und kann nicht eingeparkt werden."};
if(_vehicle getVariable "versichert") then {
	_action = [
		format["Dein Fahrzeug ist noch immer %1-versichert! Beim Einparken wird die Versicherung nichtig!",(_vehicle getVariable "versicherung")],
		"Fahrzeug trotz Versicherung einparken?",
		"Ja",
		"Nein"
	] call BIS_fnc_guiMessage;
};
if(!_action) exitWith {};

_checkvehicle = "";

switch(_this select 3) do { 
	case "car": 	{_checkvehicle = "LandVehicle"}; 
	case "heli":	{_checkvehicle = "Air"};
	case "boot":	{_checkvehicle = "Ship"};
};

if(isNil "_vehicle") exitWith {hint localize "STR_Garage_NoNPC"};
if(isNull _vehicle) exitWith {};
if!(_vehicle isKindOf _checkvehicle) exitWith {hint "Diesen Fahrzeugtyp kannst du hier nicht einparken."};

if(license_civ_president && flagsOn) then {
		{deletevehicle _x} foreach (nearestObjects [getpos _vehicle,["FlagSmall_F"],3]);
		flagsOn = false;
};

[_vehicle] call life_fnc_vehicleDeAnimate;

[_vehicle,false,(_this select 1),(damage _vehicle),(fuel _vehicle)] remoteExecCall ["SOA_fnc_vehicleStore",2];
hint localize "STR_Garage_Store_Server";
life_garage_store = true;