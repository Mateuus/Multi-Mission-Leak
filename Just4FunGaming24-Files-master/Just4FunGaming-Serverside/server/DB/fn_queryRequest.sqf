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
private["_unit", "_side", "_uid", "_query", "_queryResult", "_tmp"]; 
 
if( !params[ 
        [ "_unit", objNull,     [objNull]     ], 
        [ "_side", sideUnknown, [sideUnknown] ] 
    ]) exitWith {}; 
 
_uid  = getPlayerUID _unit; 
 
_special = switch( _side ) do { 
    case west: { ", cop_licenses, coplevel, cop_gear" }; 
    case civilian: { ", civ_licenses, arrested, civ_gear" }; 
    case independent: { ", med_licenses, mediclevel, med_gear" }; 
    case east: { ", thw_licenses, thwlevel, thw_gear" }; 
    default { "" }; 
}; 
if( _special isEqualTo "" ) exitWith { 
    diag_log format["queryRequest invalid %1", _this]; 
}; 
 
_query = format[ "SELECT playerid, name, cash, bankacc, adminlevel%1 FROM players WHERE playerid = '%2'", _special, _uid]; 
_queryResult = [_query, 2] call XYDB_fnc_asyncCall; 
 
if( (typeName _queryResult) isEqualTo "STRING" ) exitWith { 
    diag_log format["<ERROR> invalid SQL in queryRequest: %1 - result: %2", _query, _queryResult]; 
}; 
if( _queryResult isEqualTo [] ) exitWith { 
    [] remoteExec ["XY_fnc_insertPlayerInfo", _unit]; 
}; 
 
_tmp = _queryResult select 2; 
_queryResult set[ 2, [_tmp] call XYDB_fnc_numberSafe ]; 
_tmp = _queryResult select 3; 
_queryResult set[ 3, [_tmp] call XYDB_fnc_numberSafe ]; 
 
// Parse licenses 
_new = [_queryResult select 5] call XYDB_fnc_mresToArray; 
if( (typeName _new) isEqualTo "STRING") then { 
    diag_log "UNWRAP A"; 
    _new = call compile format["%1", _new]; 
}; 
_queryResult set[5, _new]; 
 
//Convert tinyint to boolean 
_old = _queryResult select 5; 
for "_i" from 0 to ( count _old ) - 1 do { 
    _data = _old select _i; 
    _old set [_i, [ _data select 0, ([_data select 1, 1] call XYDB_fnc_bool)] ]; 
}; 
_queryResult set[5, _old]; 
 
_new = [_queryResult select 7] call XYDB_fnc_mresToArray; 
if( (typeName _new) isEqualTo "STRING") then { 
    diag_log "UNWRAP B"; 
    _new = call compile format["%1", _new]; 
}; 
_queryResult set[7, _new]; 
 
// Parse data for specific side. 
switch (_side) do { 
    case civilian: { 
        _queryResult set[ 6, [_queryResult select 6, 1] call XYDB_fnc_bool ]; 
 
        _houseData = [_uid] call XY_fnc_fetchPlayerHouses; 
        _queryResult pushBack _houseData; 
 
        _gangData = [_uid] call XYDB_fnc_queryPlayerGang; 
        _queryResult pushBack _gangData; 
    }; 
}; 
 
private _lastPos = []; 
{ 
    if( (_x select 0) isEqualTo _uid && (_x select 1) isEqualTo _side )exitWith { 
        _lastPos = _x select 2; 
    }; 
} forEach XY_lastKnownPositions; 
 
_queryResult pushBack _lastPos; 
 
_queryResult remoteExec ["XY_fnc_requestReceived", _unit];