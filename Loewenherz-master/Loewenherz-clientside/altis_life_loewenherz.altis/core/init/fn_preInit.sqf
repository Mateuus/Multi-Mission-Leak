/*
    Author: Blackd0g
    File: fn_preInit.sqf

    Description:
    Pre init
*/
if (isServer) exitWith {};
setViewDistance 15;
setObjectViewDistance 15;
setShadowDistance 15;
disableRemoteSensors true;
[] call lhm_fnc_resetStackedEVH;
[] spawn lhm_fnc_skipBriefing;

diag_log "::lhm Client:: preInitialization complete";