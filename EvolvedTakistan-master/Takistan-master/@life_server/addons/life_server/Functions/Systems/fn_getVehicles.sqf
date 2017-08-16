#include "\life_server\script_macros.hpp"
/*
	File: fn_getVehicles.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Sends a request to query the database information and returns vehicles.
*/
private["_pid","_side","_type","_unit","_ret","_tickTime","_queryResult"];
_pid = [_this,0,"",[""]] call BIS_fnc_param;
_side = [_this,1,sideUnknown,[west]] call BIS_fnc_param;
_type = [_this,2,"",[""]] call BIS_fnc_param;
_unit = [_this,3,ObjNull,[ObjNull]] call BIS_fnc_param;

//Error checks
if(_pid == "" OR _side == sideUnknown OR _type == "" OR isNull _unit) exitWith {
	if(!isNull _unit) then {
		[[[]],"life_fnc_impoundMenu",(owner _unit),false] call life_fnc_MP;
	};
};

_unit = owner _unit;
_side = switch(_side) do {
	case west:{"cop"};
	case civilian: {"civ"};
	case independent: {"med"};
	default {"Error"};
};

if(_side == "Error") exitWith {
	[[[]],"life_fnc_impoundMenu",(owner _unit),false] call life_fnc_MP;
};

_query = format["vehiclesInfo:%1:%2:%3",_pid,_side,_type];

waitUntil{sleep (random 0.3); !DB_Async_Active};
_tickTime = diag_tickTime;
_queryResult = [_query,2,true] call DB_fnc_asyncCall;

if((EQUAL(EXTDB_SETTINGS("MySQL_Query"),1))) then {
	["diag_log",[
		"------------- Vehicle Query Request -------------",
		format["QUERY: %1",_query],
		format["Time to complete: %1 (in seconds)",(diag_tickTime - _tickTime)],
		format["Result: %1",_queryResult],
		"-------------------------------------------------"
	]] call TON_fnc_logIt;
};

if(typeName _queryResult == "STRING") exitWith {
	[[[]],"life_fnc_impoundMenu",(owner _unit),false] call life_fnc_MP;
};

[[_queryResult],"life_fnc_impoundMenu",_unit,false] call life_fnc_MP;