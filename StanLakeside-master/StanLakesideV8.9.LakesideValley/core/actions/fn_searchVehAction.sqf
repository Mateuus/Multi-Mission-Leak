/*
	File: fn_searchVehAction.sqf
*/
private["_vehicle","_data"];
_vehicle = cursorTarget;
if((_vehicle isKindOf "Car") || !(_vehicle isKindOf "Air") || !(_vehicle isKindOf "Motorcycle") || !(_vehicle isKindOf "Motorbike") || !(_vehicle isKindOf "Ship")) then
{
	_owners = _vehicle getVariable "vehicle_info_owners";

	if(isNil {_owners}) exitWith { };

	life_action_inUse = true;
	[localize "STR_NOTF_Searching", false] spawn domsg;
	uiSleep 3;
	life_action_inUse = false;
	if(player distance _vehicle > 10 || deadPlayer || !alive _vehicle) exitWith {[localize "STR_NOTF_SearchVehFail", false] spawn domsg;};
	//_inventory = [(_vehicle getVariable "vehicle_info_inv")] call fnc_veh_inv;
	//if(isNil {_inventory}) then {_inventory = "Nothing in storage."};
	_owners = [_owners] call life_fnc_vehicleOwners;
	
	if(_owners == "any<br/>") then
	{
		_owners = "No owners, impound it<br/>";
	};
	
	hint parsetext format["<img size='1' image='cg_mission_files\icons\info.paa'/> <t color='#FFCC00'><t size='0.75'>Vehicle Check:</t><br/> %1 ",_owners];

};