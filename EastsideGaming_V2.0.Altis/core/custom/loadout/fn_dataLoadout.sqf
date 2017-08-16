#include "..\..\..\script_macros.hpp"
/*
    File: fn_dataQuery.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Starts the 'authentication' process and sends a request out to
    the server to check for player information.
*/
private ["_uid","_side","_sender"];
_sender = player;
_uid = getPlayerUID _sender;
_side = playerSide;
[_uid,_side,_sender] remoteExec ["ESG_fnc_loadoutRequest",2];