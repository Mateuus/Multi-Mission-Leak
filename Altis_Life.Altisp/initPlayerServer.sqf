#define LIFE_SETTINGS(TYPE,SETTING) TYPE(missionConfigFile >> "Life_Settings" >> SETTING)
/*
    File: initPlayerServer.sqf
    Author:

    Description:
    Executed only on server when a player joins mission.
*/

_this select 0 addMPEventHandler ["MPKilled", {_this call fn_whoDoneIt}];
