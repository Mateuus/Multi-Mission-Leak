#include <macro.h>
/*
	File: fn_unimpound.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Yeah... Gets the vehicle from the garage.
*/
private["_vehicle","_vid","_pid","_unit","_price"];
disableSerialization;
if(lbCurSel 2802 isEqualTo -1) exitWith {hint localize "STR_Global_NoSelection";titletext[localize "STR_Global_NoSelection","Plain"]; };
_vehicle = lbData[2802,(lbCurSel 2802)];
_vehicle = (call compile format["%1",_vehicle]) select 0;
_vid = lbValue[2802,(lbCurSel 2802)];
_pid = getPlayerUID player;
_unit = player;

if(isNil "_vehicle") exitWith {hint localize "STR_Garage_Selection_Error"; titletext[localize "STR_Garage_Selection_Error","Plain"];};

_price = [_vehicle,__GETC__(lhm_garage_prices)] call TON_fnc_index;
if(_price isEqualTo -1) then {_price = 1000;} else {_price = (__GETC__(lhm_garage_prices) select _price) select 1;};
if(lhm_atmcash < _price) exitWith {hint format[(localize "STR_Garage_CashError"),[_price] call lhm_fnc_numberText];titletext[format[(localize "STR_Garage_CashError"),[_price] call lhm_fnc_numberText],"Plain"];};

closedialog 0;

if(lhm_garage_sp isEqualType []) then {
	[[_vid,_pid,lhm_garage_sp select 0,_unit,_price,lhm_garage_sp select 1],"TON_fnc_spawnVehicle",false,false] call lhm_fnc_mp;
} else {
	if(lhm_garage_sp in ["medic_spawn_1","medic_spawn_2","medic_spawn_3","sec_heli_dach"]) then {
		[[_vid,_pid,lhm_garage_sp,_unit,_price],"TON_fnc_spawnVehicle",false,false] call lhm_fnc_mp;
	} else {
		[[_vid,_pid,(getMarkerPos lhm_garage_sp),_unit,_price,markerDir lhm_garage_sp],"TON_fnc_spawnVehicle",false,false] call lhm_fnc_mp;
	};
};

hint localize "STR_Garage_SpawningVeh";

lhm_atmcash = lhm_atmcash - _price;
[1] call SOCK_fnc_updatePartial;
