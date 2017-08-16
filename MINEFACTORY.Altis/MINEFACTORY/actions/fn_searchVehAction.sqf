#include "..\..\script_macros.hpp"
/*
	File: fn_searchVehAction.sqf
	Author:

	Description:

*/
private["_vehicle","_data"];
_vehicle = cursorObject;
if((_vehicle isKindOf "Car") || !(_vehicle isKindOf "Air") || !(_vehicle isKindOf "Ship")) then {
	_owners = _vehicle GVAR "vehicle_info_owners";
	if(isNil {_owners}) exitWith {hint  "Über das Fahrzeug gibt es keine Informationen, es wurde vermutlich durch Cheats gespawnt. \n\nLösche Fahrzeuge."; deleteVehicle _vehicle;};

	life_action_inUse = true;
	hint  "Suche...";

	sleep 3;
	life_action_inUse = false;

	if(player distance _vehicle > 10 || !alive player || !alive _vehicle) exitWith {hint  "Das Fahrzeug konnte nicht durchsucht werden";};
	//_inventory = [(_vehicle getVariable "vehicle_info_inv")] call fnc_veh_inv;
	//if(isNil {_inventory}) then {_inventory = "Nothing in storage."};
	_owners = [_owners] call life_fnc_vehicleOwners;

	if(_owners == "any<br/>") then {
		_owners = "No owners, impound it<br/>";
	};
	hint parseText format[ "<t color='#FF0000'><t size='2'>Fahrzeuginfo</t></t><br/><t color='#FFD700'><t size='1.5'>Besitzer</t></t><br/> %1",_owners];
};
