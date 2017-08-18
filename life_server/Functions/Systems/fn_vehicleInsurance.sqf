/*
	File: fn_vehicleInsurance.sqf
	Author: Kevin Webb
	Description:
	Sets the vehicle to alive and inactive, spawned by the insurance script.
*/
private["_vehicle","_dbInfo"];
_vehicle = [_this,0,objNull,[objNull]] call BIS_fnc_param;
if(isNull _vehicle || isNil "_vehicle") exitWith {};
_dbInfo = _vehicle getVariable ["dbInfo", []];
_uid = _dbInfo select 0;
_plate = _dbInfo select 1;
_vehicle setVariable["dbInfo",[]];
sleep 10;
if(!isNull _vehicle && !isNil "_vehicle") then {
deleteVehicle _vehicle;
};
if(count _dbInfo > 0) then {
	_query = format["UPDATE vehicles SET alive='1', active = '0'  WHERE pid='%1' AND plate='%2'",_uid,_plate];
	waitUntil {!DB_Async_Active};
	_sql = [_query,1] call DB_fnc_asyncCall;
}; 