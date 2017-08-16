/*
	Darkside Life

	Author: Shawn "Huntah" Macgillivray

	Description:
	Impounds ones vehicle
*/

private["_vehicle","_type","_time","_price","_vehicleData","_upp","_ui","_progress","_pgText","_cP","_myCar","_pos","_sleep","_waitTime","_owner","_convoy","_pass"];
_vehicle = DS_cursorTarget;
_myCar = false;
_pos = (position _vehicle);
_convoy = false;
_pass = false;
if(DS_doingStuff)exitwith{};
if((_vehicle getVariable ["convoy_truck",false])) then {_convoy = true;};
if(DS_moral < 500)then{_sleep = 0.15;_waitTime = 120}else{_sleep = 0.07;_waitTime = 60};
if((DS_infoArray select 21) > 29)then{_waitTime = 30};
if(!alive _vehicle) exitwith {hint 'You can not impound a destroyed vehicle';};
if(!((_vehicle isKindOf "Car")||(_vehicle isKindOf "Air")||(_vehicle isKindOf "Ship")||(typeOf _vehicle == "Land_Pod_Heli_Transport_04_fuel_F")||(typeOf _vehicle == "Land_Pod_Heli_Transport_04_box_F")||(typeOf _vehicle == "Land_Pod_Heli_Transport_04_covered_F")||(typeOf _vehicle == "Land_Pod_Heli_Transport_04_medevac_F")||(typeOf _vehicle == "Land_Pod_Heli_Transport_04_repair_F")||(typeOf _vehicle == "B_Slingload_01_Cargo_F")||(typeOf _vehicle == "B_Slingload_01_Medevac_F")||(typeOf _vehicle == "B_Slingload_01_Repair_F")||(typeOf _vehicle == "B_Slingload_01_Fuel_F"))) exitWith {};
if(player distance _vehicle > 10) exitWith {};
if((_vehicle isKindOf "Car")||(_vehicle isKindOf "Air")||(_vehicle isKindOf "Ship")||(typeOf _vehicle == "Land_Pod_Heli_Transport_04_fuel_F")||(typeOf _vehicle == "Land_Pod_Heli_Transport_04_box_F")||(typeOf _vehicle == "Land_Pod_Heli_Transport_04_covered_F")||(typeOf _vehicle == "Land_Pod_Heli_Transport_04_medevac_F")||(typeOf _vehicle == "Land_Pod_Heli_Transport_04_repair_F")||(typeOf _vehicle == "B_Slingload_01_Cargo_F")||(typeOf _vehicle == "B_Slingload_01_Medevac_F")||(typeOf _vehicle == "B_Slingload_01_Repair_F")||(typeOf _vehicle == "B_Slingload_01_Fuel_F")) then
	{
	_vehicleData = _vehicle getVariable["vehicle_owners",[]];
	_owner = (_vehicleData select 0) select 0;
	if(((_vehicleData select 0)select 1) == name player)then{_myCar = true;};
	//if(count _vehicleData == 0) exitWith {deleteVehicle _vehicle}; //Bad vehicle.
	_vehicleName = getText(configFile >> "CfgVehicles" >> (typeOf _vehicle) >> "displayName");
	if(!isNil "_owner")then
		{
		[0,format["%1 your %2 is being impounded by the police.",(_vehicleData select 0) select 1,_vehicleName]] remoteExecCall ["DS_fnc_globalMessage",_owner];
		};
	if(!isNil "_owner")then
		{
		systemchat format ["You are impounding a vehicle belonging to %1",(_vehicleData select 0) select 1];
		}
		else
		{
		systemchat "You are impounding a vehicle with no registered owner";
		};

	DS_doingStuff = true;

	_upp = "Impounding Vehicle";
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
		sleep _sleep;
		_cP = _cP + 0.01;
		_progress progressSetPosition _cP;
		_pgText ctrlSetText format["%3 (%1%2)...",round(_cP * 100),"%",_upp];
		if(_cP >= 1) exitWith {};
		if(player distance _vehicle > 10) exitWith {};
		if(player getVariable ["restrained",false])exitwith{};
		if(!alive player) exitWith {};
		};
	"progressBar" cutText ["","PLAIN"];

	if(player distance _vehicle > 10) exitWith {hint "Impounding cancelled"; DS_doingStuff = false;};
	if(player getVariable ["restrained",false])exitwith {hint "Impounding cancelled"; DS_doingStuff = false;};

	hint format ["The vehicle will be impounded in %1 minute(s) if it is still here and empty",(_waitTime/60)];
	systemchat format ["The vehicle will be impounded in %1 minute(s) if it is still here and empty",(_waitTime/60)];
	sleep 5;
	DS_doingStuff = false;

	sleep _waitTime;

	if((position _vehicle) distance _pos > 15)exitwith{hint "Impound cancelled because the vehicle was moved";};

	if(((count crew _vehicle) == 0)||(DS_copLevel > 2)) then
		{
		if(!((_vehicle isKindOf "Car")||(_vehicle isKindOf "Air")||(_vehicle isKindOf "Ship")||(typeOf _vehicle == "Land_Pod_Heli_Transport_04_fuel_F")||(typeOf _vehicle == "Land_Pod_Heli_Transport_04_box_F")||(typeOf _vehicle == "Land_Pod_Heli_Transport_04_covered_F")||(typeOf _vehicle == "Land_Pod_Heli_Transport_04_medevac_F")||(typeOf _vehicle == "Land_Pod_Heli_Transport_04_repair_F")||(typeOf _vehicle == "B_Slingload_01_Cargo_F")||(typeOf _vehicle == "B_Slingload_01_Medevac_F")||(typeOf _vehicle == "B_Slingload_01_Repair_F")||(typeOf _vehicle == "B_Slingload_01_Fuel_F")))exitwith{};
		_type = getText(configFile >> "CfgVehicles" >> (typeOf _vehicle) >> "displayName");
		_pass = true;
		_price = [_vehicle,true] call DS_fnc_impoundPrice;
		_price = round(_price/6);
		if(!(isNil "_owner"))then
			{
			[_price,_owner] remoteExecCall ["DS_fnc_impoundFee",_owner];
			};
		if((_vehicle getVariable ["convoy_truck",false])||(_vehicle getVariable ["truckMission",false]))then {
			{
				deleteVehicle _x;
			}forEach attachedObjects _vehicle;
			deleteVehicle _vehicle;
		} else {
			[_vehicle,true,player] remoteExec ["HUNT_fnc_storeVehicle",2];
		};

		if((DS_infoArray select 21) > 2)then{_price = _price*1.25};
		if((DS_infoArray select 21) > 13)then{_price = _price*2};

		if(!_myCar)then
			{
			hint format["You have impounded a %1\n\nYou have received $%2 for cleaning up the streets!",_type,_price];
			if(!isNil "_owner")then
				{
				[0,format["%1 has impounded %2's %3",name player,(_vehicleData select 0) select 1,_vehicleName]] remoteExecCall ["DS_fnc_globalMessage",_owner];
				};
			_targets = allPlayers select {(_x distance player) < 3000};
			[0,format["%1 has impounded %2's %3",name player,(_vehicleData select 0) select 1,_vehicleName]] remoteExecCall ["DS_fnc_globalMessage",_targets];
			[_price,true,true] spawn DS_fnc_handleMoney;
			[0] spawn DS_fnc_alterStats;
			[2000,true] remoteExec ["HUNT_fnc_policeBank",2];
			}
			else
			{
			hint format["You have impounded your own vehicle, therefore were not paid!",_type,_price];
			_targets = allPlayers select {(_x distance player) < 3000};
			[0,format["%1 has impounded %2's %3",name player,(_vehicleData select 0) select 1,_vehicleName]] remoteExecCall ["DS_fnc_globalMessage",_targets];
			};
		[40,true] spawn DS_fnc_moralAlter;
		}
		else
		{
			hint "Impounding cancelled";
		};
	};