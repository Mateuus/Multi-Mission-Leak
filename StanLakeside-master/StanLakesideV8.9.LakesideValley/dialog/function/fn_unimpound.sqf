#include <macro.h>
/*
	File: fn_unimpound.sqf
	
	
	Description:
	Yeah... Gets the vehicle from the garage.
*/
private["_vehicle","_vid","_pid","_unit","_price"];
disableSerialization;
if(lbCurSel 2802 isEqualTo -1) exitWith {[localize "STR_Global_NoSelection", false] spawn domsg;};
_vehicle = lbData[2802,(lbCurSel 2802)];
_vehicle = (call compile format["%1",_vehicle]) select 0;
_vid = lbValue[2802,(lbCurSel 2802)];
_pid = getPlayerUID player;
_unit = player;

if(isNil "_vehicle") exitWith {[localize "STR_Garage_Selection_Error", false] spawn domsg;};
if(life_garage_sp isEqualTo "reb_ag_2" &&  {_vehicle in ["IVORY_CRJ200_1","IVORY_ERJ135_1","IVORY_YAK42D_1"]}) exitWith {["These jet planes cannot be used on this short runway.", false] spawn domsg;};
_price = 50;
if(_price == -1) then {_price = 50;} else {_price = (__GETC__(life_garage_prices) select _price) select 1;};
if(cash_in_bank < _price) exitWith {[format[(localize "STR_Garage_CashError"),[_price] call life_fnc_numberText], false] spawn domsg;};

if(typeName life_garage_sp isEqualTo "ARRAY") then {
	[_vid,_pid,life_garage_sp select 0,_unit,_price,life_garage_sp select 1] remoteExec ["TON_fnc_spawnVehicle",(call life_fnc_HCC)];
} else {
	if(life_garage_sp in ["med_air_2","med_air_2_1"]) then {
		[_vid,_pid,life_garage_sp,_unit,_price] remoteExec ["TON_fnc_spawnVehicle",(call life_fnc_HCC)];
	} else {
		[_vid,_pid,(getMarkerPos life_garage_sp),_unit,_price,markerDir life_garage_sp] remoteExec ["TON_fnc_spawnVehicle",(call life_fnc_HCC)];
	};
};

[localize "STR_Garage_SpawningVeh", false] spawn domsg;

["bank","take",_price] call life_fnc_handleCash;