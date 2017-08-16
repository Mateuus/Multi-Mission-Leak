/*
File: fn_receiveMessage.sqf
Author: Felix 'Ithron' C.

This file is written for Play Germany.
Do not remove this comment or use this system without my permission.

Description:
Recieves a new message and adds it to history.
*/
private["_msg","_fromId","_fromName","_msgType","_alternateNameInHistory"];
if(isServer) exitWith {};

_msg = [_this,0,"",[""]] call BIS_fnc_param;
_fromName = [_this,1,"",[""]] call BIS_fnc_param;
_fromId = [_this,2,0,[0]] call BIS_fnc_param;
_msgType = [_this,3,0,[0]] call BIS_fnc_param;
_alternateNameInHistory = [_this,4,"",[""]] call BIS_fnc_param;

if((_msgType == 2) && {((call life_adminlevel) < 1)}) exitWith {};

//diag_log "DEBUG: TON_fnc_clientMessage trigger";
[_msg, _fromName, _msgType] call TON_fnc_clientMessage;

if (isNil "PG_smartphoneHistory") then { PG_smartphoneHistory = [];};

_msgArray = toArray _msg;
{if (_x == 34) then {_msgArray set [_forEachIndex,39]};} forEach _msgArray;
_msg = toString _msgArray;

if (_alternateNameInHistory != "") then
{
	PG_smartphoneHistory = [[serverTime, "", _alternateNameInHistory, _msg]] + PG_smartphoneHistory;
}
else
{
    PG_smartphoneHistory = [[serverTime, _fromId, _fromName, _msg]] + PG_smartphoneHistory;
};