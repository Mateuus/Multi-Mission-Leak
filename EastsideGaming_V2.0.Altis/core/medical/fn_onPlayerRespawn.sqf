#include "..\..\script_macros.hpp"
/*
    File: fn_onPlayerRespawn.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Does something but I won't know till I write it...
*/
private ["_unit","_corpse","_containers"];
_unit = _this select 0;
_corpse = _this select 1;
life_corpse = _corpse;

//Set some vars on our new body.
_unit setVariable ["restrained",false,true];
_unit setVariable ["Escorting",false,true];
_unit setVariable ["transporting",false,true];
_unit setVariable ["playerSurrender",false,true];
_unit setVariable ["steam64id",getPlayerUID player,true]; //Reset the UID.
_unit setVariable ["realname",profileName,true]; //Reset the players name.
"ColorCorrections" ppEffectEnable false;
"dynamicBlur" ppEffectEnable false;
"esg_injured" cutFadeOut 1;
_unit setVariable ["esg_bewusstlos",false,true];
_unit setVariable ["esg_damagestore",0,true];
_unit setVariable ["esg_bewusstlos_delay",0,true];
_unit setVariable ["esg_bewusstlos_stab",0,true];
_unit setVariable ["esg_stabinpro",false,true];
_unit setVariable ["esg_laststab",0,true];
_unit setDamage 0;

_unit addRating 1e12; //Set our rating to a high value, this is for a ARMA engine thing.
player playMoveNow "AmovPpneMstpSrasWrflDnon";

[] call life_fnc_setupActions;
[_unit,life_settings_enableSidechannel,playerSide] remoteExecCall ["TON_fnc_manageSC",RSERV];
player enableFatigue false;
