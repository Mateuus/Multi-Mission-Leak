/*
	Author: Shawn "Huntah" Macgillivray
	
	Description:
	Forces Veh unlocked
*/
private["_vehicle","_type","_time","_price","_vehicleData","_upp","_ui","_progress","_pgText","_cP","_myCar"];
_vehicle = cursorTarget;
_myCar = false;
if(!((_vehicle isKindOf "Car") || (_vehicle isKindOf "Air") || (_vehicle isKindOf "Ship"))) exitWith {};
if(player distance cursorTarget > 10) exitWith {};
if((_vehicle isKindOf "Car") || (_vehicle isKindOf "Air") || (_vehicle isKindOf "Ship")) then
	{
	_vehicleData = _vehicle getVariable["vehicle_owners",[]];
	if(((_vehicleData select 0)select 1) == name player)then{_myCar = true;};
	_vehicleName = getText(configFile >> "CfgVehicles" >> (typeOf _vehicle) >> "displayName");
	DS_doingStuff = true;
	
	_upp = "Forcing Vehicles locks open";
	//Setup our progress bar.
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
		sleep 0.10;
		_cP = _cP + 0.01;
		_progress progressSetPosition _cP;
		_pgText ctrlSetText format["%3 (%1%2)...",round(_cP * 100),"%",_upp];
		if(_cP >= 1) exitWith {};
		if(player distance _vehicle > 10) exitWith {};
		if(!alive player) exitWith {};
	};
	5 cutText ["","PLAIN"];
	
	if(player distance _vehicle > 10) exitWith {DS_doingStuff = false;};
	if(!alive player) exitWith {DS_doingStuff = false;};
	if((count crew _vehicle) != 0) then
		{
		if(!((_vehicle isKindOf "Car") || (_vehicle isKindOf "Air") || (_vehicle isKindOf "Ship"))) exitWith {DS_doingStuff = false;};
		_type = getText(configFile >> "CfgVehicles" >> (typeOf _vehicle) >> "displayName");
		hint "Locks Broken";
		if(local _vehicle)then
			{
			_vehicle lock 0;
			}
			else
			{
			[[_vehicle,0], "DS_fnc_vehGlobalLock",_vehicle,false] spawn DS_fnc_MP;
			};
		if((DS_infoArray select 23) == 6)then
			{
			[3] call DS_fnc_questCompleted;
			};
		}
		else
		{
		hint "You can not force the doors unlocked when there is no body inside";
		};
	};
DS_doingStuff = false;