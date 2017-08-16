/*
	File: fn_destroyVehicle.sqf
	Author: Shawn "Huntah" Macgillivray
	
	Description:
	Deletes a vehicle that was carrying illegal items
*/
private["_action","_vehicle","_type","_time","_price","_vehicleData","_upp","_ui","_progress","_pgText","_cP","_myCar","_copLevel","_sp","_smokeSpawn","_smoke","_vehPos"];
_vehicle = cursorTarget;
_myCar = false;
_copLevel = DS_coplevel;
if(_vehicle getVariable ["policeVehicle",false])exitwith{hint "You can not destroy a police vehicle"};
_action = [
	"Are you sure you want to destroy this vehicle, remember if it destruction is illegal you will be required to compensate the owner",
	"Destroy Vehicle",
	"Destroy",
	"Cancel"
] call BIS_fnc_guiMessage;
if(!_action)exitwith{};

if(_copLevel < 3)exitWith{hint "Your police rank is not high enough to use this feature";};
_vehPos = (position _vehicle);
if(!((_vehicle isKindOf "Car") || (_vehicle isKindOf "Air") || (_vehicle isKindOf "Ship") || (typeOf _vehicle == "Land_Pod_Heli_Transport_04_fuel_F") || (typeOf _vehicle == "Land_Pod_Heli_Transport_04_box_F") || (typeOf _vehicle == "Land_Pod_Heli_Transport_04_covered_F") || (typeOf _vehicle == "Land_Pod_Heli_Transport_04_medevac_F") || (typeOf _vehicle == "Land_Pod_Heli_Transport_04_repair_F") || (typeOf _vehicle == "B_Slingload_01_Cargo_F") || (typeOf _vehicle == "B_Slingload_01_Medevac_F") || (typeOf _vehicle == "B_Slingload_01_Repair_F") || (typeOf _vehicle == "B_Slingload_01_Fuel_F"))) exitWith {};
if(player distance cursorTarget > 10) exitWith {};
if((_vehicle isKindOf "Car") || (_vehicle isKindOf "Air") || (_vehicle isKindOf "Ship") || (typeOf _vehicle == "Land_Pod_Heli_Transport_04_fuel_F") || (typeOf _vehicle == "Land_Pod_Heli_Transport_04_box_F") || (typeOf _vehicle == "Land_Pod_Heli_Transport_04_covered_F") || (typeOf _vehicle == "Land_Pod_Heli_Transport_04_medevac_F") || (typeOf _vehicle == "Land_Pod_Heli_Transport_04_repair_F") || (typeOf _vehicle == "B_Slingload_01_Cargo_F") || (typeOf _vehicle == "B_Slingload_01_Medevac_F") || (typeOf _vehicle == "B_Slingload_01_Repair_F") || (typeOf _vehicle == "B_Slingload_01_Fuel_F")) then
{
	_vehicleData = _vehicle getVariable["vehicle_owners",[]];
	if(((_vehicleData select 0)select 1) == name player)then{_myCar = true;};
	if(count _vehicleData == 0) exitWith {deleteVehicle _vehicle}; //Bad vehicle.
	_vehicleName = getText(configFile >> "CfgVehicles" >> (typeOf _vehicle) >> "displayName");
	[[0,format["%1 your %2 is being confiscated as it was found to be used in illegal activities",(_vehicleData select 0) select 1,_vehicleName]],"DS_fnc_globalMessage",true,false] spawn BIS_fnc_MP;
	DS_doingStuff = true;
	
	_upp = "Planting Explosive in Vehicle";
	disableSerialization;
	5 cutRsc ["DS_progress","PLAIN"];
	_ui = uiNameSpace getVariable "DS_progress";
	_progress = _ui displayCtrl 38201;
	_pgText = _ui displayCtrl 38202;
	_pgText ctrlSetText format["%2 (1%1)...","%",_upp];
	_progress progressSetPosition 0.01;
	_cP = 0.01;
	while{true} do
	{
		sleep 0.05;
		_cP = _cP + 0.01;
		_progress progressSetPosition _cP;
		_pgText ctrlSetText format["%3 (%1%2)...",round(_cP * 100),"%",_upp];
		if(_cP >= 1) exitWith {};
		if(player distance _vehicle > 10) exitWith {};
		if(!alive player) exitWith {};
	};
	5 cutText ["","PLAIN"];
	
	if(player distance _vehicle > 10) exitWith {hint "Vehicle Destruction Cancelled because the vehicle was moved."; DS_doingStuff = false;};
	if(!alive player) exitWith {DS_doingStuff = false;};
	
		if(!((_vehicle isKindOf "Car") || (_vehicle isKindOf "Air") || (_vehicle isKindOf "Ship") || (typeOf _vehicle == "Land_Pod_Heli_Transport_04_fuel_F") || (typeOf _vehicle == "Land_Pod_Heli_Transport_04_box_F") || (typeOf _vehicle == "Land_Pod_Heli_Transport_04_covered_F") || (typeOf _vehicle == "Land_Pod_Heli_Transport_04_medevac_F") || (typeOf _vehicle == "Land_Pod_Heli_Transport_04_repair_F") || (typeOf _vehicle == "B_Slingload_01_Cargo_F") || (typeOf _vehicle == "B_Slingload_01_Medevac_F") || (typeOf _vehicle == "B_Slingload_01_Repair_F") || (typeOf _vehicle == "B_Slingload_01_Fuel_F"))) exitWith {life_action_inUse = false;};
		_type = getText(configFile >> "CfgVehicles" >> (typeOf _vehicle) >> "displayName");
		_price = [(typeOf _vehicle)] call DS_cop_destroyVehPrice;
		/*
		switch (true) do
		{
			case (_vehicle isKindOf "Car"): {_price = 8000};
			case (_vehicle isKindOf "Ship"): {_price = 11000};
			case (_vehicle isKindOf "Air"): {_price = 15000};
			default {_price = 6500};
		};
		*/
		_sp = (position player);
		_smoke = "SmokeShellRed";
		_smokeSpawn = _smoke createVehicle _sp;
		hint "Explosives Planted, you have 30 seconds to clear the area";
		DS_doingStuff = false;
		sleep 30;
		
		if((position _vehicle) distance _vehPos > 10)exitWith{hint "The vehicle moved, therefore was not destroyed";DS_doingStuff = false;};
		if(!alive _vehicle)exitwith{hint "Vehicle already destroyed";DS_doingStuff = false;};
		
		if(_vehicle getVariable ["bulletProof",false])then
			{
			sleep 10;
			[[200000,"has just destroyed a bulletproof vehicle",name player],"DS_fnc_copRewards",west,false] spawn BIS_fnc_MP;
			};
		if(_vehicle getVariable ["convoyVehicle",false])then
			{
			sleep 10;
			[[55000,"has just destroyed a convoy vehicle",name player],"DS_fnc_copRewards",west,false] spawn BIS_fnc_MP;
			};
		_vehicle setVariable ["destroyed",true,true];
		sleep 1;
		_vehicle setDamage 1;
		
		if(!_myCar)then
			{		
			hint format["You have destroyed a %1\n\nYou have received $%2 for getting this illegal vehicle off the streets!",_type,_price];
			[[0,format["%1 has destroyed %2's %3",name player,(_vehicleData select 0) select 1,_vehicleName]],"DS_fnc_globalMessage",true,false] spawn BIS_fnc_MP;
			[[_price,true],"HUNT_fnc_policeBank",false,false] spawn DS_fnc_MP;
			if((DS_infoArray select 21) == 15)then{[3] call DS_fnc_questCompleted};
			[[_price,"Has destroyed an illegal vehicle",(name player)],"DS_fnc_copRewards",west,false] spawn BIS_fnc_MP;
			}
			else
			{
			hint format["You have destroyed your own vehicle, therefore were not paid!",_type,_price];
			[[0,format["%1 has destroyed %2's %3",name player,(_vehicleData select 0) select 1,_vehicleName]],"DS_fnc_globalMessage",true,false] spawn BIS_fnc_MP;
			};
		
		
};
