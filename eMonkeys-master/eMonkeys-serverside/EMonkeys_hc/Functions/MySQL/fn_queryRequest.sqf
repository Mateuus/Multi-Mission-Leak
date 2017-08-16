/* 
 File: fn_queryRequest.sqf 
 Author: Bryan "Tonic" Boardwine 
  
 Description: 
 Handles the incoming request and sends an asynchronous query  
 request to the database. 
  
 Return: 
 ARRAY - If array has 0 elements it should be handled as an error in client-side files. 
 STRING - The request had invalid handles or an unknown error and is logged to the RPT. 
*/ 
private["_uid","_side","_query","_return","_queryResult","_qResult","_handler","_thread","_tickTime","_loops","_returnCount"]; 
_uid = [_this,0,"",[""]] call BIS_fnc_param; 
_side = [_this,1,sideUnknown,[civilian]] call BIS_fnc_param; 
_ownerID = [_this,2,ObjNull,[ObjNull]] call BIS_fnc_param; 
 
if(isNull _ownerID) exitWith {}; 
_ownerID = _ownerID; 
 
/* 
 _returnCount is the count of entries we are expecting back from the async call. 
 The other part is well the SQL statement. 
*/ 
_query = switch(_side) do { 
 case west: {format["SELECT playerid, name, cash, bankacc, adminlevel, donatorlvl, cop_licenses, coplevel, cop_gear, blacklist, levelsys  FROM players WHERE playerid='%1'",_uid];}; 
 case civilian: {format["SELECT playerid, name, cash, bankacc, adminlevel, donatorlvl, civ_licenses, arrested, civ_gear, perms, levelsys, blacklist FROM players WHERE playerid='%1'",_uid];}; 
 case independent: {format["SELECT playerid, name, cash, bankacc, adminlevel, donatorlvl, med_licenses, mediclevel, levelsys, blacklist FROM players WHERE playerid='%1'",_uid];}; 
 case east: {format["SELECT playerid, name, cash, bankacc, adminlevel, donatorlvl, civ_licenses, arrested, civ_gear, perms, levelsys, blacklist FROM players WHERE playerid='%1'",_uid];}; 
}; 
 
 
_tickTime = diag_tickTime; 
_queryResult = [_query,2] call DB_fnc_asyncCall; 
 
if(typeName _queryResult == "STRING") exitWith { 
 [[],"SOCK_fnc_insertPlayerInfo",_ownerID,false,true] call EMonkeys_fnc_mp; 
}; 
 
if(count _queryResult == 0) exitWith { 
 [[1],"SOCK_fnc_insertPlayerInfo",_ownerID,false,true] call EMonkeys_fnc_mp; 
}; 
 
//Blah conversion thing from a2net->extdb 
private["_tmp"]; 
_tmp = _queryResult select 2; 
_queryResult set[2,[_tmp] call DB_fnc_numberSafe]; 
_tmp = _queryResult select 3; 
_queryResult set[3,[_tmp] call DB_fnc_numberSafe]; 
 
//Parse licenses (Always index 6) 
_new = [(_queryResult select 6)] call DB_fnc_mresToArray; 
if(typeName _new == "STRING") then {_new = call compile format["%1", _new];}; 
_queryResult set[6,_new]; 
 
//Convert tinyint to boolean 
_old = _queryResult select 6; 
for "_i" from 0 to (count _old)-1 do 
{ 
 _data = _old select _i; 
 _old set[_i,[_data select 0, ([_data select 1,1] call DB_fnc_bool)]]; 
}; 
 
_queryResult set[6,_old]; 
//Parse data for specific side. 
switch (_side) do { 
 case west: { 
  _new = [(_queryResult select 8)] call DB_fnc_mresToArray; 
  if(typeName _new == "STRING") then {_new = call compile format["%1", _new];}; 
  _queryResult set[8,_new]; 
  _queryResult set[9,([_queryResult select 9,1] call DB_fnc_bool)]; 
  _queryResult set[10,_queryResult select 10]; 
  _queryResult set[11,_queryResult select 11]; 
 }; 
 case east: { 
  _new = [(_queryResult select 8)] call DB_fnc_mresToArray; 
  if(typeName _new == "STRING") then {_new = call compile format["%1", _new];}; 
  _queryResult set[8,_new]; 
  _queryResult set[7,([_queryResult select 7,1] call DB_fnc_bool)]; 
  _queryResult set[10,_queryResult select 10]; 
  _queryResult set[11,([_queryResult select 11,1] call DB_fnc_bool)]; 
  _fuelstationData = _uid spawn TON_fnc_fetchPlayerFuelstation; 
  waitUntil{scriptDone _fuelstationData}; 
  _queryResult pushBack (missionNamespace getVariable[format["fuelstation_%1",_uid],[]]); 
 }; 
 case civilian: { 
  _new = [(_queryResult select 8)] call DB_fnc_mresToArray; 
  if(typeName _new == "STRING") then {_new = call compile format["%1", _new];}; 
  _queryResult set[8,_new]; 
  _queryResult set[7,([_queryResult select 7,1] call DB_fnc_bool)]; 
  _queryResult set[10,_queryResult select 10]; 
  _queryResult set[11,([_queryResult select 11,1] call DB_fnc_bool)]; 
  _fuelstationData = _uid spawn TON_fnc_fetchPlayerFuelstation; 
  waitUntil{scriptDone _fuelstationData}; 
  _queryResult pushBack (missionNamespace getVariable[format["fuelstation_%1",_uid],[]]); 
 }; 
 case independent: { 
 _queryResult set[10,_queryResult select 8]; 
 _queryResult set[9,([_queryResult select 9,1] call DB_fnc_bool)]; 
 }; 
}; 
 
//_keyArr = missionNamespace getVariable [format["%1_KEYS_%2",_uid,_side],[]]; 
//_queryResult set[13,_keyArr]; 
[_queryResult,"SOCK_fnc_requestReceived",_ownerID,false] call EMonkeys_fnc_mp;