// Written by Kupferkarpfen 
// License: CC BY-NC-SA 4.0 
 
private _player = param[0, objNull, [objNull]]; 
private _name = param[1, "", [""]]; 
private _cash = param[2, -1, [0]]; 
private _bank = param[3, -1, [0]]; 
 
if( isNull _player || _name isEqualTo "" || _cash < 0 || _bank < 0 ) exitWith { 
    diag_log format["<SERROR> Invalid call to insertRequest(%1)", _this]; 
}; 
 
private _uid = getPlayerUID _player; 
 
// Check if player really doesn't exist... 
if( ([ format["SELECT playerid, name FROM players WHERE playerid = '%1'", _uid], 2 ] call XYDB_fnc_asyncCall) isEqualTo [] ) then { 
    // Insert player 
    [ format["INSERT INTO players (playerid, name, cash, bankacc, cop_licenses, med_licenses, civ_licenses, civ_gear, cop_gear, med_gear, thw_gear, thw_licenses) VALUES('%1', '%2', '%3', '%4','""[]""','""[]""','""[]""','""[]""','""[]""','""[]""','""[]""','""[]""')", 
        _uid, 
        [_name] call XYDB_fnc_mresString, 
        [_cash] call XYDB_fnc_numberSafe, 
        [_bank] call XYDB_fnc_numberSafe 
    ], 1 ] call XYDB_fnc_asyncCall; 
}; 
[] remoteExec ["XY_fnc_dataQuery", _player];