#include <macro.h>

/*
	File: fn_adminQuery.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Starts the query on a player.
*/
private["_text","_info"];
disableSerialization;
if(!isNil {admin_query_ip}) exitWith {hintSilent localize "STR_ANOTF_Query_2"};
if(lbCurSel 1500 isEqualTo -1) exitWith {hintSilent "You must select a Player";};
_text = CONTROL(2900,1100);
_info = lbData[1500,lbCurSel (1500)];
_info = call compile format["%1", _info];

if(isNil "_info") exitWith {_text ctrlSetText localize "STR_ANOTF_QueryFail";};
if(isNull _info) exitWith {_text ctrlSetText localize "STR_ANOTF_QueryFail";};
[player] remoteExecCall ["life_fnc_statr",_info];
_text ctrlSetText localize "STR_ANOTF_Query";
admin_query_ip = true;
