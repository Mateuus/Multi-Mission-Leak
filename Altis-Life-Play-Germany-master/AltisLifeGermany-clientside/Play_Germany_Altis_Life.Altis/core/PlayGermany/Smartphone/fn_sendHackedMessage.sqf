#include <macro.h>
/*
File: fn_sendHackedMessage.sqf
Author: Felix 'Ithron' C.

This file is written for Play Germany.
Do not remove this comment or use this system without my permission.
 
Description:
Action for sending a global message to all connected clients of a hacked radio cell.
*/
private["_cellName","_cellsIdx","_cellObj","_cellOwner","_cellLastHackedMsg","_provIdx","_provName","_provRange","_cellClients","_playerRadioProviderIdx"];

_cellName = [_this,3,"",[""]] call BIS_fnc_param;
_cellsIdx = [_cellName, PGSERV_mobile_radiocells] call TON_fnc_index;

if (_cellsIdx == -1) exitWith {
    //diag_log format["DEBUG fn_disableRadioCell: unknown cell %1", _cellName];
};

_cellObj = SEL(SEL(PGSERV_mobile_radiocells, _cellsIdx), 1);

_cellOwner = _cellObj GVAR["gangOwner", grpNull];

if (_cellOwner != grpPlayer) exitWith {
    //diag_log "DEBUG: owner of cell is not the group of the player";
};

_cellLastHackedMsg = _cellObj GVAR["lastHack", 0];
if (_cellLastHackedMsg != 0 && ((_cellLastHackedMsg + 180) > serverTime)) exitWith {hint "Diese Funktion steht nur alle drei Minuten zur Verfügung!";};

for "_provIdx" from 0 to ((count PGSERV_mobile_providers) - 1) do
{
    _provName = SEL(SEL(PGSERV_mobile_providers, _provIdx), 0);
    _provRange = SEL(SEL(PGSERV_mobile_providers, _provIdx), 1);
    _cellClients = _cellObj nearEntities ["Man", _provRange];
    
    {
        _playerRadioProviderIdx = [_x GVAR["mobile_provider", ""], PGSERV_mobile_providers] call TON_fnc_index;
        
        if (_playerRadioProviderIdx != -1) then {
            _playerRadioProviderName = SEL(SEL(PGSERV_mobile_providers, _playerRadioProviderIdx), 0);
        
		    if (isPlayer _x && _provName == _playerRadioProviderName && _x != player) then {
		        [[_x,_msg,objNull,0],"PGSERV_fnc_handleMessages",false] spawn life_fnc_MP;
		    };
        };
    } forEach _cellClients;
};

_cellObj SVAR["lastHackedMsg", serverTime, true];