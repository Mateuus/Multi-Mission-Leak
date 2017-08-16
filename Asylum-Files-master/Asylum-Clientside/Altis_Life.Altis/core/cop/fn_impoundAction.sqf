/*
	File: fn_impoundAction.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Impounds the vehicle
*/
private["_vehicle","_type","_time","_price","_vehicleData","_upp","_ui","_progress","_pgText","_cP","_seize"];
_seize = _this select 3;
_vehicle = cursorTarget;
if ((typeOf _vehicle in ["O_MRAP_02_F"] || (typeOf _vehicle == "B_G_Offroad_01_armed_F" && (_vehicle getVariable "Life_VEH_color") != 1)) || (_vehicle getVariable["illegalVehicle",false])) then {_seize = true};

if(player distance cursorTarget > 5) exitWith {};
if((_vehicle isKindOf "Car") || (_vehicle isKindOf "Air") || (_vehicle isKindOf "Ship")) then
{
	_vehicleData = _vehicle getVariable["vehicle_info_owners",[]];
	if(count _vehicleData == 0) exitWith {deleteVehicle _vehicle}; //Bad vehicle.
	_vehicleName = getText(configFile >> "CfgVehicles" >> (typeOf _vehicle) >> "displayName");
	
	if (_seize) then 
	{
		[[0,format["%1 your %2 is being seized by the police.",(_vehicleData select 0) select 1,_vehicleName]],"life_fnc_broadcast",true,false] spawn life_fnc_MP;
		_upp = "Seizing Vehicle";
	} else {
		[[0,format["%1 your %2 is being impounded by the police.",(_vehicleData select 0) select 1,_vehicleName]],"life_fnc_broadcast",true,false] spawn life_fnc_MP;
		_upp = "Impounding Vehicle";
	};
	
	life_action_in_use = true;
	//Setup our progress bar.
	disableSerialization;
	5 cutRsc ["life_progress","PLAIN"];
	_ui = uiNameSpace getVariable "life_progress";
	_progress = _ui displayCtrl 38201;
	_pgText = _ui displayCtrl 38202;
	_pgText ctrlSetText format["%2 (1%1)...","%",_upp];
	_progress progressSetPosition 0.01;
	_cP = 0.01;
	while{true} do
	{
		sleep 0.09;
		_cP = _cP + 0.01;
		_progress progressSetPosition _cP;
		_pgText ctrlSetText format["%3 (%1%2)...",round(_cP * 100),"%",_upp];
		if(_cP >= 1) exitWith {};
		if(player distance _vehicle > 10) exitWith {};
		if(!alive player) exitWith {};
		if (!life_action_in_use) exitWith {};
	};
	5 cutText ["","PLAIN"];
	
	if(player distance _vehicle > 10) exitWith {hint "Action cancelled."; life_action_in_use = false;};
	if(!alive player) exitWith {life_action_in_use = false;};
	if (!life_action_in_use) exitWith {};

	//Begin Edit: Potential Fix to allow for impounding of cars with dead bodies in them
	if(({alive _x} count crew _vehicle) == 0) then
	//End Edit
	{
			if(!((_vehicle isKindOf "Car") || (_vehicle isKindOf "Air") || (_vehicle isKindOf "Ship"))) exitWith {};
			_type = getText(configFile >> "CfgVehicles" >> (typeOf _vehicle) >> "displayName");
			switch (true) do
			{
				case (_vehicle isKindOf "Car"): {_price = life_impound_car;};
				case (_vehicle isKindOf "Ship"): {_price = life_impound_boat;};
				case (_vehicle isKindOf "Air"): {_price = life_impound_air;};
			};
			
			if (_seize) then 
			{
				_vehicle setVariable ["insured", false, true];
				[[_vehicle],"ASY_fnc_vehicleDead",false,false] spawn life_fnc_MP;
				hint format["You have seized a %1\n\nYou have received $%2 for cleaning up the streets!",_type,_price];
			}
			else
			{
				life_impound_inuse = true;
				[[_vehicle,true,player],"ASY_fnc_vehicleStore",false,false] spawn life_fnc_MP;
				waitUntil {!life_impound_inuse};
				hint format["You have impounded a %1\n\nYou have received $%2 for cleaning up the streets!",_type,_price];
			};
			["atm","add",_price] call life_fnc_uC;
	}
	else
	{
		hint "Action cancelled.";
	};
};
life_action_in_use = false;