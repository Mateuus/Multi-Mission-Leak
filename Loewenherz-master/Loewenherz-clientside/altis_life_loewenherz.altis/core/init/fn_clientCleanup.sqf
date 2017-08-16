/*
    Author: H4SHK3KS (ofpectag: PoA)
    File: fn_clientCleanup.sqf

    Written for Pirates of Altis
    http://pirates-of-altis.de/
    The usage of this file is restricted to allowed servers (e.g. PoA)
    You're not allowed to modify this file!
    Licensed under the Arma EULA and Arma Tools EULA.
    For further questions contact the author!

    Description:
    Client cleanup

    Parameters:
    None

    Returns:
    Nothing
*/
_format = format["%1 hat die Lobby betreten",profileName];
[[0,_format],'lhm_fnc_broadcast',true,false] call lhm_fnc_mp;

if(lhm_session_completed) then {
    [] call SOCK_fnc_updateRequest;
};

[] call lhm_fnc_resetStackedEVH;

uiNamespace setVariable ["BIS_fnc_guiMessage_status", true];

Diag_log "::lhm Client:: Cleanup done!";