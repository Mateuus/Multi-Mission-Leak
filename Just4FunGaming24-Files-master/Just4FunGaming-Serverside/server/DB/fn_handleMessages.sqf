/* 
 
    file: fn_handleMessages.sqf 
    Author: Silex 
 
*/ 
 
// #KK this function sucks 
 
private _target = param [0, objNull, [objNull]]; 
private _msg = param [1, "", [""]]; 
private _player = param [2, objNull, [objNull]]; 
private _type = param [3, -1, [0]]; 
 
if( _msg isEqualTo "" || isNull _player || _type < 0 ) exitWith {}; 
 
private _pid = getPlayerUID _player; 
private _escapedMsg = [_msg] call XYDB_fnc_mresString; 
 
private _fromName = _player getVariable["realName", "Unbekannt"]; 
private _toName = _target getVariable["realName", "Unbekannt"]; 
 
switch(_type) do { 
    //normal message 
    case 0: { 
        [_msg, name _player, 0] remoteExec ["XY_fnc_clientMessage", _target]; 
        [format["INSERT INTO messages (fromID, toID, message, fromName, toName) VALUES('%1', '%2', '""%3""', '%4', '%5')", _pid, getPlayerUID _target, _escapedMsg, _fromName, _toName], 1] call XYDB_fnc_asyncCall; 
    }; 
    //message to cops 
    case 1: { 
        [_msg, name _player, 1] remoteExec ["XY_fnc_clientMessage", west]; 
        [ format[ "INSERT INTO plog (pid, type, log) VALUES ('%1', '18', '""COP-ANFRAGE: %2""')", _pid, _escapedMsg ], 1 ] call XYDB_fnc_asyncCall; 
    }; 
    //to admins 
    case 2: { 
        [_msg, name _player, 2] remoteExec ["XY_fnc_clientMessage", -2]; 
        [ format[ "INSERT INTO plog (pid, type, log) VALUES ('%1', '18', '""ADMIN-ANFRAGE: %2""')", _pid, _escapedMsg ], 1 ] call XYDB_fnc_asyncCall; 
    }; 
    //ems request 
    case 3: { 
        [_msg, name _player, 5] remoteExec ["XY_fnc_clientMessage", independent]; 
        [ format[ "INSERT INTO plog (pid, type, log) VALUES ('%1', '18', '""MEDIC-ANFRAGE: %2""')", _pid, _escapedMsg ], 1 ] call XYDB_fnc_asyncCall; 
    }; 
    //adminToPerson 
    case 4: { 
        [_msg, name _player, 3] remoteExec ["XY_fnc_clientMessage", _target]; 
        [ format[ "INSERT INTO plog (pid, type, log) VALUES ('%1', '18', '""ADMIN-NACHRICHT AN %2 (%3): %4""')", _pid, name _target, getPlayerUID _target, _escapedMsg ], 1 ] call XYDB_fnc_asyncCall; 
    }; 
    //adminMsgAll 
    case 5: { 
        [_msg, name _player, 4] remoteExec ["XY_fnc_clientMessage", -2]; 
        [ format[ "INSERT INTO plog (pid, type, log) VALUES ('%1', '18', '""ADMIN-NACHRICHT: %2""')", _pid, _escapedMsg ], 1 ] call XYDB_fnc_asyncCall; 
    }; 
    //THW request 
    case 6: { 
        [_msg, name _player, 6] remoteExec ["XY_fnc_clientMessage", east]; 
        [ format[ "INSERT INTO plog (pid, type, log) VALUES ('%1', '18', '""THW-ANFRAGE: %2""')", _pid, _escapedMsg ], 1 ] call XYDB_fnc_asyncCall; 
    }; 
    // Police broadcast 
    case 7: { 
        [ _msg, name _player, 7 ] remoteExec ["XY_fnc_clientMessage", -2]; 
        [ format[ "INSERT INTO plog (pid, type, log) VALUES ('%1', '18', '""POLIZEIMELDUNG: %2""')", _pid, _escapedMsg ], 1 ] call XYDB_fnc_asyncCall; 
    }; 
    // Medic broadcast 
    case 8: { 
        [ _msg, name _player, 8 ] remoteExec ["XY_fnc_clientMessage", -2]; 
        [ format[ "INSERT INTO plog (pid, type, log) VALUES ('%1', '18', '""MEDIC-MELDUNG: %2""')", _pid, _escapedMsg ], 1 ] call XYDB_fnc_asyncCall; 
    }; 
    // THW broadcast 
    case 9: { 
        [ _msg, name _player, 9 ] remoteExec ["XY_fnc_clientMessage", -2]; 
        [ format[ "INSERT INTO plog (pid, type, log) VALUES ('%1', '18', '""THW-MELDUNG: %2""')", _pid, _escapedMsg ], 1 ] call XYDB_fnc_asyncCall; 
    }; 
};