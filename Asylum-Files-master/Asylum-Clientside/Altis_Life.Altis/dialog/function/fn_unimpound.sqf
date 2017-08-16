/*
	File: fn_unimpound.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Yeah... Gets the vehicle from the garage.
*/
private["_vehicle","_vid","_pid","_unit","_price","_nearVehicles","_insured","_vData"];
disableSerialization;

_insured = [_this,0,false,[false]] call BIS_fnc_param;

if(lbCurSel 2801 == -1) exitWith {hint "You did not select a vehicle..."};
_vData = call compile (lbData[2801,(lbCurSel 2801)]);
_vehicle = _vData select 0;
_vid = lbValue[2801,(lbCurSel 2801)];
_pid = getPlayerUID player;
_unit = player;

if(isNil "_vehicle") exitWith {hint "The selection had a error..."};

_storeType = switch (playerSide) do
{
	case civilian: { ["civ_car","civ_kart","reb_car","civ_truck","civ_air","civ_ship","bh_car"] };
	case west: { ["cop_car","cop_air","cop_ship"] };
	case independent: { ["med_car","med_air"] };
};

_smallHeli = ["B_Heli_Light_01_F","C_Heli_Light_01_civil_F"];
_smallHeliT = 20;
_largeHeli = ["I_Heli_Transport_02_F", "O_Heli_Light_02_unarmed_F","O_Heli_Transport_04_F","O_Heli_Transport_04_bench_F","O_Heli_Transport_04_covered_F","I_Heli_light_03_unarmed_F"];
_largeHeliT = 21;

if (playerSide == civilian && ((!(_smallHeliT in life_talents) && (_vehicle in _smallHeli)) || (!(_largeHeliT in life_talents) && (_vehicle in _largeHeli)))) exitWith {hint "You do not have the required talent to access this vehicle."};
if (playerSide == civilian && _vehicle == "B_MRAP_01_F" && (!license_civ_bounty || !(126 in life_talents))) exitWith {hint "You must be an active master bounty hunter to access this vehicle"};

_price = _vData select 6;
if (_insured) then { _price = _price + (parseNumber format["%1", _vData select 7]); };

_exit = false;

switch (typeName life_veh_sp) do
{
	case "OBJECT":
	{
		_sp = getPosATL life_veh_sp;
		_dir = getDir life_veh_sp;
	};
	default
	{
		_sp = getMarkerPos life_veh_sp;
		_dir = markerDir life_veh_sp;
	};
};

switch (true) do
{
	case (typeName life_veh_sp == "OBJECT"):
	{
		_nearVehicles = nearestObjects[getPosATL life_veh_sp,["Car","Air","Ship"],4];
		if(count _nearVehicles > 0) exitWith
		{
			hint "There is a vehicle on the spawn point.";
			_exit = true;
		};
		if(!([_price] call life_fnc_debitCard)) exitWith {_exit = true;};
	};
	case (parseNumber life_veh_sp > 0):
	{
		if (life_atmmoney < _price) exitWith {_exit = true;hint "You do not have enough money in your bank to recover this vehicle.";};
		["atm","take",_price] call life_fnc_uC;
	};
	default
	{
		if (life_veh_sp == "") exitWith {hint "No valid vehicle spawn location in range. Try again or report this location to the Asylum.";_exit=true;};
		_nearVehicles = nearestObjects[getMarkerPos life_veh_sp,["Car","Air","Ship"],4];
		if(count _nearVehicles > 0) exitWith
		{
			hint "There is a vehicle on the spawn point.";
			_exit = true;
		};
		if(!([_price] call life_fnc_debitCard)) exitWith {_exit = true;};
	};
};
if (_exit) exitWith {};

closeDialog 0;

if (_insured) then { hint "Spawning insured vehicle. If this vehicle is destroyed, a replacement will be added to your garage within a few hours time. Insurance lasts only during this vehicle session." }
else { hint "Spawning vehicle please wait..."; };

[[_vid,_pid,life_veh_sp,_unit,_price,life_talents,_insured,life_coprole in ["all","detective"]],"ASY_fnc_spawnVehicle",false,false] spawn life_fnc_MP;