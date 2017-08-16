#include "..\script_macros.hpp"
/*
	File: fn_vehInvSearch.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Searches the vehicle for illegal items.
*/
private["_vehicle","_vehicleInfo","_value"];
_vehicle = cursorTarget;
if(isNull _vehicle) exitWith {};
if(!((_vehicle isKindOf "Car") || (_vehicle isKindOf "Air") || (_vehicle isKindOf "Ship") || ((typeOf _vehicle) in ["Land_Pod_Heli_Transport_04_box_F","Land_Pod_Heli_Transport_04_fuel_F","B_Slingload_01_Cargo_F","B_Slingload_01_Fuel_F","Land_Pod_Heli_Transport_04_bench_F","Land_Pod_Heli_Transport_04_covered_F"]))) exitWith {};


_vehicleInfo = _vehicle getVariable ["Trunk",[]];
if(EQUAL(count _vehicleInfo,0)) exitWith {hint localize "STR_Cop_VehEmpty"};

_value = 0;
{
	_var = SEL(_x,0);
	_val = SEL(_x,1);
	
	if(EQUAL(ITEM_ILLEGAL(_var),1)) then {
		if(!(EQUAL(ITEM_SELLPRICE(_var),-1))) then {
			_value = _value + (round(_val * ITEM_SELLPRICE(_var) / 2));
		};
	};
} foreach (SEL(_vehicleInfo,0));

if(_value > 0) then {
	[0,"STR_NOTF_VehContraband",true,[[_value] call ES_fnc_numberText]] remoteExec ["ES_fnc_broadcast",-2];
	ES_atmbank = ES_atmbank + _value;

	_vehicle setVariable ["Trunk",[],true];

	["Durchsuchung"] call ES_fnc_xp_add;
	
} else {
	hint localize "STR_Cop_NoIllegalVeh";
};