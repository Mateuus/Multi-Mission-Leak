/*
	File: fn_searchVehAction.sqf
*/
private["_vehicle","_data"];
_vehicle = cursorTarget;
if((_vehicle isKindOf "Car") || !(_vehicle isKindOf "Air") || !(_vehicle isKindOf "Ship")) then
{
	_owners = _vehicle getVariable "vehicle_info_owners";
	if(isNil {_owners}) exitWith {hint "Keine Daten zu diesem Fahrzeug vorhanden. \n\nEs wird entfernt."; deleteVehicle _vehicle;};
	DWEV_action_inUse = true;
	hint "Überprüfe Fahrzeug....";
	sleep 3;
	DWEV_action_inUse = false;
	if(player distance _vehicle > 10 || !alive player || !alive _vehicle) exitWith {hint "Überprüfung war nicht möglich.";};
	//_inventory = [(_vehicle getVariable "vehicle_info_inv")] call fnc_veh_inv;
	//if(isNil {_inventory}) then {_inventory = "Nothing in storage."};
	_owners = [_owners] call DWEV_fnc_vehicleOwners;
	
	if(_owners == "any<br/>") then
	{
		_owners = "Kein besitzer, Beschlagnahme es.<br/>";
	};
	hint parseText format["<t color='#FF0000'><t size='2'>Fahrzeugpapiere</t></t><br/><t color='#FFD700'><t size='1.5'>Eigentümer</t></t><br/> %1",_owners];
};