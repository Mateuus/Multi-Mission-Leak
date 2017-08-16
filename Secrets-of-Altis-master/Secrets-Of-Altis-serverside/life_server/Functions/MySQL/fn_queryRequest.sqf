 
 
 
 
 
 
 
 
 
 
 
 
private["_uid","_side","_query","_return","_queryResult","_qResult","_handler","_thread","_tickTime","_loops","_returnCount"]; 
_uid = [_this,0,"",[""]] call BIS_fnc_param; 
_side = [_this,1,sideUnknown,[civilian]] call BIS_fnc_param; 
_ownerID = [_this,2,ObjNull,[ObjNull]] call BIS_fnc_param; 
 
if(isNull _ownerID) exitWith {}; 
_ownerID = owner _ownerID; 
 
 
 
 
 
_query = switch(_side) do { 
case west: {_returnCount = 15;    format["SELECT playerid, name, cash, bankacc, adminlevel, donatorlvl, cop_licenses, coplevel, cop_gear, alive, erfolge, serverpoints, apps, guthaben, activity, timeplayed FROM players WHERE playerid='%1'",_uid];}; 
case civilian: {_returnCount = 18;   format["SELECT playerid, name, cash, bankacc, adminlevel, donatorlvl, civ_licenses, arrested, civ_gear, alive, exp, erfolge, serverpoints, apps, guthaben, ausweisdaten, kennzeichen, timeplayed FROM players WHERE playerid='%1'",_uid];}; 
case independent: {_returnCount = 15;  format["SELECT playerid, name, cash, bankacc, adminlevel, donatorlvl, med_licenses, mediclevel, med_gear, alive, erfolge, serverpoints, apps, guthaben, activity, timeplayed FROM players WHERE playerid='%1'",_uid];}; 
 
}; 
 
 
 
_queryResult = [_query,2] call DB_fnc_asyncCall; 
 
 
 
 
 
 
 
 
if(typeName _queryResult == "STRING") exitWith { 
[] remoteExecCall ["SOCK_fnc_insertPlayerInfo",_ownerID]; 
}; 
 
if(count _queryResult == 0) exitWith { 
[] remoteExecCall ["SOCK_fnc_insertPlayerInfo",_ownerID]; 
}; 
 
 
private["_tmp"]; 
 
 
 
_tmp = _queryResult select 2; 
_queryResult set[2,[_tmp] call DB_fnc_numberSafe]; 
 
 
_tmp = _queryResult select 3; 
_queryResult set[3,[_tmp] call DB_fnc_numberSafe]; 
 
 
 
 
_new = [(_queryResult select 6)] call DB_fnc_mresToArray; 
if(typeName _new == "STRING") then {_new = call compile format["%1", _new];}; 
_queryResult set[6,_new]; 
 
_old = _queryResult select 6; 
for "_i" from 0 to (count _old)-1 do 
{ 
_data = _old select _i; 
_old set[_i,[_data select 0, ([_data select 1,1] call DB_fnc_bool)]]; 
}; 
_queryResult set[6,_old]; 
 
 
 
_new = [(_queryResult select 8)] call DB_fnc_mresToArray; 
if(typeName _new == "STRING") then {_new = call compile format["%1", _new];}; 
_queryResult set[8,_new]; 
 
 
switch (_side) do { 
case west: { 
 
_new = [(_queryResult select 10)] call DB_fnc_mresToArray; 
if(typeName _new == "STRING") then {_new = call compile format["%1", _new];}; 
_queryResult set[10,_new]; 
_old = _queryResult select 10; 
for "_i" from 0 to (count _old)-1 do 
{ 
_data = _old select _i; 
_old set[_i,[_data select 0, ([_data select 1,1] call DB_fnc_bool)]]; 
}; 
_queryResult set[10,_old];   
 
 
_tmp = _queryResult select 11; 
_queryResult set[11,[_tmp] call DB_fnc_numberSafe]; 
 
 
_new = [(_queryResult select 12)] call DB_fnc_mresToArray; 
if(typeName _new == "STRING") then {_new = call compile format["%1", _new];}; 
_queryResult set[12,_new]; 
_old = _queryResult select 12; 
for "_i" from 0 to (count _old)-1 do 
{ 
_data = _old select _i; 
_old set[_i,[_data select 0, ([_data select 1,1] call DB_fnc_bool)]]; 
}; 
_queryResult set[12,_old]; 
 
 
_tmp = _queryResult select 13; 
_queryResult set[13,[_tmp] call DB_fnc_numberSafe]; 
 
 
_tmp = _queryResult select 14; 
_queryResult set[14,[_tmp] call DB_fnc_numberSafe]; 
 
_tmp = _queryResult select 15; 
_queryResult set[15,[_tmp] call DB_fnc_numberSafe]; 
 
};  
case civilian: { 
 
_queryResult set[7,([_queryResult select 7,1] call DB_fnc_bool)]; 
 
 
_queryResult set[9,([_queryResult select 9,1] call DB_fnc_bool)]; 
if!(_queryResult select 9)then{ 
_queryResult set[8,[]];  
}; 
 
 
_tmp = _queryResult select 10; 
_queryResult set[10,[_tmp] call DB_fnc_numberSafe];   
 
 
_new = [(_queryResult select 11)] call DB_fnc_mresToArray; 
if(typeName _new == "STRING") then {_new = call compile format["%1", _new];}; 
_queryResult set[11,_new]; 
_old = _queryResult select 11; 
for "_i" from 0 to (count _old)-1 do 
{ 
_data = _old select _i; 
_old set[_i,[_data select 0, ([_data select 1,1] call DB_fnc_bool)]]; 
}; 
_queryResult set[11,_old];  
 
 
_tmp = _queryResult select 12; 
_queryResult set[12,[_tmp] call DB_fnc_numberSafe]; 
 
 
_new = [(_queryResult select 13)] call DB_fnc_mresToArray; 
if(typeName _new == "STRING") then {_new = call compile format["%1", _new];}; 
_queryResult set[13,_new]; 
_old = _queryResult select 13; 
for "_i" from 0 to (count _old)-1 do 
{ 
_data = _old select _i; 
_old set[_i,[_data select 0, ([_data select 1,1] call DB_fnc_bool)]]; 
}; 
_queryResult set[13,_old]; 
 
 
_tmp = _queryResult select 14; 
_queryResult set[14,[_tmp] call DB_fnc_numberSafe]; 
 
 
_new = [(_queryResult select 15)] call DB_fnc_mresToArray; 
_queryResult set[15,_new]; 
 
 
_tmp = _queryResult select 17; 
_queryResult set[17,[_tmp] call DB_fnc_numberSafe]; 
 
 
_houseData = _uid spawn SOA_fnc_fetchPlayerHouses; 
waitUntil {scriptDone _houseData}; 
_queryResult pushBack (missionNamespace getVariable[format["houses_%1",_uid],[]]); 
 
 
_gangData = _uid spawn SOA_fnc_queryPlayerGang; 
waitUntil{scriptDone _gangData}; 
_queryResult pushBack (missionNamespace getVariable[format["gang_%1",_uid],[]]); 
 
}; 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
case independent: { 
 
_new = [(_queryResult select 10)] call DB_fnc_mresToArray; 
if(typeName _new == "STRING") then {_new = call compile format["%1", _new];}; 
_queryResult set[10,_new]; 
_old = _queryResult select 10; 
for "_i" from 0 to (count _old)-1 do 
{ 
_data = _old select _i; 
_old set[_i,[_data select 0, ([_data select 1,1] call DB_fnc_bool)]]; 
}; 
_queryResult set[10,_old]; 
 
 
_tmp = _queryResult select 11; 
_queryResult set[11,[_tmp] call DB_fnc_numberSafe]; 
 
 
_new = [(_queryResult select 12)] call DB_fnc_mresToArray; 
if(typeName _new == "STRING") then {_new = call compile format["%1", _new];}; 
_queryResult set[12,_new]; 
_old = _queryResult select 12; 
for "_i" from 0 to (count _old)-1 do 
{ 
_data = _old select _i; 
_old set[_i,[_data select 0, ([_data select 1,1] call DB_fnc_bool)]]; 
}; 
_queryResult set[12,_old]; 
 
 
_tmp = _queryResult select 13; 
_queryResult set[13,[_tmp] call DB_fnc_numberSafe]; 
 
 
_tmp = _queryResult select 14; 
_queryResult set[14,[_tmp] call DB_fnc_numberSafe]; 
 
_tmp = _queryResult select 15; 
_queryResult set[15,[_tmp] call DB_fnc_numberSafe]; 
}; 
}; 
 
 
_keyArr = missionNamespace getVariable [format["%1_KEYS_%2",_uid,_side],[]]; 
_queryResult set[20,_keyArr]; 
 
_queryResult remoteExec ["SOCK_fnc_requestReceived",_ownerID];