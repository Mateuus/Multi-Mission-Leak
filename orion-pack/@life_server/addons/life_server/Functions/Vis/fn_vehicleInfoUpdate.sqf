#include "\life_server\script_macros.hpp"
/*
    File: fn_vehicleInfoUpdate.sqf
    Author: Leon "DerL30N" Beeser
    Description:
    Stores/reads the vehicle informations of VIS in db
*/
private["_ret","_vehicle","_read","_vInfo","_plate","_uid","_query","_tickTime","_queryResult"];
_ret = [_this,0,objNull,[objNull]] call BIS_fnc_param;
_vehicle = [_this,1,objNull,[objNull]] call BIS_fnc_param;
_read = [_this,2,false,[true]] call BIS_fnc_param;
_data = [_this,3,[],[[]]] call BIS_fnc_param;
if (isNull _ret) exitWith {};
_ret = owner _ret;
if (isNull _vehicle) exitWith {};

_vInfo = _vehicle getVariable ["dbInfo",[]];
if (count _vInfo > 0) then {
    _plate = _vInfo select 1;
    _uid = _vInfo select 0;
};

diag_log format["--- VIS -> DB -> Starting DB for %1 ---",_ret];

if (!_read) exitWith {
    // update
	_query = format["UPDATE vehicles SET vis='%3' WHERE pid='%1' AND plate='%2'", _uid, _plate, _data];
	[_query,1] call DB_fnc_asyncCall;
	diag_log "--- VIS -> Saving -> Perm Vehicle -> DB done ---";	
};

if (count _vInfo isEqualTo 0) exitWith {};

_query = format["SELECT vis FROM vehicles WHERE pid='%1' AND plate='%2'", _uid, _plate];

_tickTime = diag_tickTime;
_queryResult = [_query,2] call DB_fnc_asyncCall;

if (EXTDB_SETTING(getNumber,"DebugMode") isEqualTo 1) then {
	diag_log "------------- Client Query Request -------------";
	diag_log format["QUERY: %1",_query];
	diag_log format["Time to complete: %1 (in seconds)",(diag_tickTime - _tickTime)];
	diag_log format["Result: %1",_queryResult];
	diag_log "------------------------------------------------";
};
	
// we dont like bad data
if (!(count _queryResult == 1)) exitWith { diag_log format["--- VIS -> DB -> Error -> Bad data 1 : %1 ---",_queryResult]; };
_queryResult = _queryResult select 0;
if (!(count _queryResult == 5)) exitWith { diag_log format["--- VIS -> DB -> Error -> Bad data 2 : %1 ---",_queryResult]; };

diag_log format["--- VIS -> DB -> Returning result -> %1 ---",_queryResult];
[_queryResult,true] remoteExec ["life_fnc_visVehInfo",_ret];
