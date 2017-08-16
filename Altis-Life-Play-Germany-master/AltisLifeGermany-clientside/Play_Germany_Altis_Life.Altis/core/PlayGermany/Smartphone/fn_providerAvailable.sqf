#include <macro.h>
/*
File: fn_providerAvailable.sqf
Author: Felix 'Ithron' C.

This file is written for Play Germany.
Do not remove this comment or use this system without my permission.
 
Description:
Checks if the player has a SIM card with a valid provider.
*/

if (playerSide == west || playerSide == independent) then
{
    true;
}
else
{
    private["_providerIdx"];
    
    _providerIdx = [player GVAR["mobile_provider", ""], PGSERV_mobile_providers] call TON_fnc_index;
    
    if (_providerIdx == -1) then
    {
        false;
    }
    else
    {
        true;
    };
};