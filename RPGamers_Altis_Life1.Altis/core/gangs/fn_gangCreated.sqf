#include "..\..\script_macros.hpp"
/*
    File: fn_gangCreated.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Tells the player that the gang is created and throws him into it.
*/
private "_group";
life_action_gangInUse = nil;

if (BANK < (LIFE_SETTINGS(getNumber,"gang_price"))) exitWith {
    [format [localize "STR_GNOTF_NotEnoughMoney"],5,"gray"] call RPG_Fnc_Msg;
    [format [localize "STR_GNOTF_NotEnoughMoney1",[((LIFE_SETTINGS(getNumber,"gang_price"))-BANK)] call life_fnc_numberText],5,"gray"] call RPG_Fnc_Msg;
    {group player setVariable [_x,nil,true];} forEach ["gang_id","gang_owner","gang_name","gang_members","gang_maxmembers","gang_bank"];
};

BANK = BANK - LIFE_SETTINGS(getNumber,"gang_price");
[1] call SOCK_fnc_updatePartial;

[format [localize "STR_GNOTF_CreateSuccess",(group player) getVariable "gang_name",[(LIFE_SETTINGS(getNumber,"gang_price"))] call life_fnc_numberText],5,"blue"] call RPG_Fnc_Msg;