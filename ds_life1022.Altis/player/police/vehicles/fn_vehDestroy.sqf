/*
	Darkside Life

	Author: Shawn "Huntah" Macgillivray

	Description:
	Deletes a vehicle that was carrying illegal items
*/

private["_action","_vehicle","_type","_time","_price","_vehicleData","_upp","_ui","_progress","_pgText","_cP","_myCar","_copLevel","_sp","_smokeSpawn","_smoke","_vehPos","_targets"];
_vehicle = cursorTarget;
_myCar = false;
_copLevel = DS_copLevel;
if((_vehicle getVariable ["policeVehicle",false])&&(!(_vehicle getVariable ["isMCU",false])))exitwith{hint "You can not destroy a police vehicle"};

_action = [
	"Are you sure you want to destroy this vehicle, remember if it destruction is illegal you will be required to compensate the owner",
	"Destroy Vehicle",
	"Destroy",
	"Cancel"
] call BIS_fnc_guiMessage;
if(!_action)exitwith{};

if(_copLevel < 3)exitWith{hint "Your police rank is not high enough to use this feature";};
_vehPos = (position _vehicle);
if(!((_vehicle isKindOf "Car")||(_vehicle isKindOf "Air")||(_vehicle isKindOf "Ship")||(typeOf _vehicle == "Land_Pod_Heli_Transport_04_fuel_F")||(typeOf _vehicle == "Land_Pod_Heli_Transport_04_box_F")||(typeOf _vehicle == "Land_Pod_Heli_Transport_04_covered_F")||(typeOf _vehicle == "Land_Pod_Heli_Transport_04_medevac_F")||(typeOf _vehicle == "Land_Pod_Heli_Transport_04_repair_F")||(typeOf _vehicle == "B_Slingload_01_Cargo_F")||(typeOf _vehicle == "B_Slingload_01_Medevac_F")||(typeOf _vehicle == "B_Slingload_01_Repair_F")||(typeOf _vehicle == "B_Slingload_01_Fuel_F")))exitwith{};
if(player distance cursorTarget > 10) exitWith {};
if((_vehicle isKindOf "Car")||(_vehicle isKindOf "Air")||(_vehicle isKindOf "Ship")||(typeOf _vehicle == "Land_Pod_Heli_Transport_04_fuel_F")||(typeOf _vehicle == "Land_Pod_Heli_Transport_04_box_F")||(typeOf _vehicle == "Land_Pod_Heli_Transport_04_covered_F")||(typeOf _vehicle == "Land_Pod_Heli_Transport_04_medevac_F")||(typeOf _vehicle == "Land_Pod_Heli_Transport_04_repair_F")||(typeOf _vehicle == "B_Slingload_01_Cargo_F")||(typeOf _vehicle == "B_Slingload_01_Medevac_F")||(typeOf _vehicle == "B_Slingload_01_Repair_F")||(typeOf _vehicle == "B_Slingload_01_Fuel_F"))then
	{
	_vehicleData = _vehicle getVariable["vehicle_owners",[]];
	if(((_vehicleData select 0)select 1) == name player)then{_myCar = true;};
	//if(count _vehicleData == 0) exitWith {deleteVehicle _vehicle}; //Bad vehicle.
	_vehicleName = getText(configFile >> "CfgVehicles" >> (typeOf _vehicle) >> "displayName");
	_targets = allPlayers select {(name _x) isEqualTo ((_vehicleData select 0) select 1)};
	[0,format["%1 your %2 is being confiscated as it was found to be used in illegal activities",(_vehicleData select 0) select 1,_vehicleName]] remoteExecCall ["DS_fnc_globalMessage",_targets];
	DS_doingStuff = true;

	_upp = "Planting explosives on vehicle";
	disableSerialization;
	"progressBar" cutRsc ["DS_progress","PLAIN"];
	_ui = uiNameSpace getVariable "DS_progress";
	_progress = _ui displayCtrl 38201;
	_pgText = _ui displayCtrl 38202;
	_pgText ctrlSetText format["%2 (1%1)...","%",_upp];
	_progress progressSetPosition 0.01;
	_cP = 0.01;
	while{true} do
		{
		sleep 0.15;
		_cP = _cP + 0.01;
		_progress progressSetPosition _cP;
		_pgText ctrlSetText format["%3 (%1%2)...",round(_cP * 100),"%",_upp];
		if(_cP >= 1) exitWith {};
		if(player distance _vehicle > 10) exitWith {};
		if(!alive player) exitWith {};
		if(!alive _vehicle) exitWith {};
		};
	"progressBar" cutText ["","PLAIN"];

	if(player distance _vehicle > 10) exitWith {hint "Vehicle destruction cancelled because the vehicle was moved";DS_doingStuff = false;};
	if(!alive player) exitWith {DS_doingStuff = false;};
	if(!alive _vehicle) exitWith {};

	if(!((_vehicle isKindOf "Car")||(_vehicle isKindOf "Air")||(_vehicle isKindOf "Ship")||(typeOf _vehicle == "Land_Pod_Heli_Transport_04_fuel_F")||(typeOf _vehicle == "Land_Pod_Heli_Transport_04_box_F")||(typeOf _vehicle == "Land_Pod_Heli_Transport_04_covered_F")||(typeOf _vehicle == "Land_Pod_Heli_Transport_04_medevac_F")||(typeOf _vehicle == "Land_Pod_Heli_Transport_04_repair_F")||(typeOf _vehicle == "B_Slingload_01_Cargo_F")||(typeOf _vehicle == "B_Slingload_01_Medevac_F")||(typeOf _vehicle == "B_Slingload_01_Repair_F")||(typeOf _vehicle == "B_Slingload_01_Fuel_F")))exitWith{};
	_type = getText(configFile >> "CfgVehicles" >> (typeOf _vehicle) >> "displayName");
	_price = [_vehicle] call DS_fnc_impoundPrice;

	_sp = (position player);
	_smoke = "SmokeShellRed";
	_smokeSpawn = _smoke createVehicle _sp;
	hint "Explosives planted. You have 30 seconds to clear the area";
	DS_doingStuff = false;
	sleep 30;

	if((position _vehicle) distance _vehPos > 10)exitWith{hint "The vehicle moved, therefore was not destroyed";DS_doingStuff = false;};
	if(!alive _vehicle)exitwith{hint "Vehicle already destroyed";DS_doingStuff = false;};

	if(_vehicle getVariable ["bulletProof",false])then
		{
		sleep 10;
		[200000,"has just destroyed a bulletproof vehicle",name player] remoteExec ["DS_fnc_copRewards",west];
		};
	if(_vehicle getVariable ["GCU",false])then
		{
		sleep 10;
		if(_vehicle getVariable ["vehAmmo",false])then
			{
			[300000,"has just destroyed an armed GCU",name player] remoteExec ["DS_fnc_copRewards",west];
			}
			else
			{
			[150000,"has just destroyed an unarmed GCU",name player] remoteExec ["DS_fnc_copRewards",west];
			};
		};
	if(_vehicle getVariable ["convoyVehicle",false])then
		{
		sleep 10;
		[_price,"has just destroyed a convoy vehicle",name player] remoteExec ["DS_fnc_copRewards",west];
		};
	_vehicle setVariable ["destroyed",true,true];
	sleep 1;
	_vehicle setDamage 1;

	if(!_myCar)then
		{
		hint format["You have destroyed a %1\n\nYou have received $%2 for getting this illegal vehicle off the streets!",_type,_price];
		_targets = allPlayers select {(_x distance player) < 3000};
		[0,format["%1 has destroyed %2's %3",name player,(_vehicleData select 0) select 1,_vehicleName]] remoteExecCall ["DS_fnc_globalMessage",_targets];
		[_price,true] remoteExec ["HUNT_fnc_policeBank",2];
		[_price,"has destroyed an illegal vehicle",(name player)] remoteExec ["DS_fnc_copRewards",west];
		if((DS_infoArray select 21) == 15)then { [3] call DS_fnc_questCompleted };
		}
		else
		{
		hint format["You have destroyed your own vehicle, therefore were not paid!",_type,_price];
		};
	};