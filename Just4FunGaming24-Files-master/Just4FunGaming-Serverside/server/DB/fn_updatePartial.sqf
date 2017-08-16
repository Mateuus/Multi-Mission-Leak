// Written by Kupferkarpfen 
// License: CC BY-NC-SA 4.0 
 
private _unit = param [0, objNull, [objNull] ]; 
private _side = param [1, sideUnknown, [sideUnknown] ]; 
private _mode = param [2, -1, [0] ]; 
private _packet = param [3, [], [[]] ]; 
 
if( _unit isEqualTo objNull || _side isEqualTo sideUnknown || _mode < 0 ) exitWith { 
    diag_log format["Invalid updatePartial call (%1)", _this]; 
}; 
 
private _uid = getPlayerUID _unit; 
// Only save position if this is not the "Anti-Combatlog (tm)" packet 
 
private _pos = getPos _unit; 
if( !(alive _unit) || (_mode isEqualTo 1 && (_packet isEqualTo [])) ) then { 
    _pos = []; 
}; 
[_unit, _side, _pos] call XY_fnc_savePlayerPosition; 
 
private _query = ""; 
 
switch(_mode) do { 
 
    case 0: { 
        _query = format[ "UPDATE players SET cash = '%1', bankacc = '%2', timeupdated = CURRENT_TIMESTAMP WHERE playerid = '%3'", 
                [ _packet select 0 ] call XYDB_fnc_numberSafe, 
                [ _packet select 1 ] call XYDB_fnc_numberSafe, 
                _uid 
            ]; 
    }; 
    case 1: { 
        _query = format[ "UPDATE players SET %1 = '%2', timeupdated = CURRENT_TIMESTAMP WHERE playerid = '%3'", 
                switch(_side) do { case west: { "cop_gear" }; case civilian: { "civ_gear" }; case independent: { "med_gear" }; case east: { "thw_gear" }; }, 
                [ _packet ] call XYDB_fnc_mresArray, 
                _uid 
            ]; 
    }; 
    case 2: { 
        _query = format[ "UPDATE players SET arrested = '%1', timeupdated = CURRENT_TIMESTAMP WHERE playerid = '%2'", 
                [_packet select 0] call XYDB_fnc_bool, 
                _uid 
            ]; 
    }; 
    default { 
        diag_log format["<ERROR> INVALID MODE CALL: ", _this]; 
    }; 
}; 
 
if( _query isEqualTo "" ) exitWith {}; 
[ _query, 1 ] call XYDB_fnc_asyncCall;