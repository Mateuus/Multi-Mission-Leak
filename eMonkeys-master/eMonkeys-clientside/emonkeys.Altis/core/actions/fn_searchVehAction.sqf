/*
	File: fn_searchVehAction.sqf
*/
private["_vehicle","_data"];
_boxType = ["Box_IND_AmmoVeh_F","Land_Cargo20_blue_F"];
_vehicle = cursorTarget;
if((_vehicle isKindOf "Car") || !(_vehicle isKindOf "Air") || !(typeof _vehicle in _boxType) || !(_vehicle isKindOf "Ship")) then
{
	_owners = _vehicle getVariable "vehicle_info_owners";
	if(isNil {_owners}) exitWith {hint "Das Fahrzeug wurde wahrscheinlich mit Cheats gespawnt..."; deleteVehicle _vehicle;};
	eM_action_inUse = true;
	hint "Durchsuche Fahrzeug...";
	uisleep 3;
	eM_action_inUse = false;
	if(player distance _vehicle > 10 || ((!alive player) || (player getVariable["onkill",FALSE])) || !alive _vehicle) exitWith {hint "Konnte das Fahrzeug nicht durchsuchen.";};
	//_inventory = [(_vehicle getVariable "vehicle_info_inv")] call fnc_veh_inv;
	//if(isNil {_inventory}) then {_inventory = "Nothing in storage."};
	_owners = [_owners] call EMonkeys_fnc_vehicleOwners;
	
	if(_owners == "any<br/>") then
	{
		_owners = "Keine Fahrzeughalter gefunden<br/>";
	};
	hint parseText format["<t color='#FF0000'><t size='2'>Vehicle Info</t></t><br/><t color='#FFD700'><t size='1.5'>Besitzer</t></t><br/> %1",_owners];
};