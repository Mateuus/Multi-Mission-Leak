#include "..\..\script_macros.hpp"
/*
    File: fn_jail.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Starts the initial process of jailing.
*/
private ["_illegalItems"];
params [
 ["_unit",objNull,[objNull]],
 ["_bad",false,[false]], //Hier ein ,
 ["_time",15,[0]] //und dies eingefügt
];
if (isNull _unit) exitWith {}; //Dafuq?
if (_unit != player) exitWith {}; //Dafuq?
if (life_is_arrested) exitWith {}; //Dafuq i'm already arrested
_illegalItems = LIFE_SETTINGS(getArray,"jail_seize_vItems");
player setVariable ["restrained",false,true];
player setVariable ["Escorting",false,true];
player setVariable ["transporting",false,true];
titleText[localize "STR_Jail_Warn","PLAIN"];
hint localize "STR_Jail_LicenseNOTF";
player setPosASL [2000.71,13115.8,2.27392];
if (_bad) then {
 waitUntil {alive player};
 sleep 1;
};
//Check to make sure they goto check
if (player distance2D (getMarkerPos "jail_marker") > 40) then {
    player setPosASL [2000.71,13115.8,2.27392];
};
[1] call life_fnc_removeLicenses;
{
 _amount = ITEM_VALUE(_x);
 if (_amount > 0) then {
 [false,_x,_amount] call life_fnc_handleInv;
 };
} forEach _illegalItems;
life_is_arrested = true;
[] spawn life_fnc_seizeClient;
[player,_bad,_time] remoteExecCall ["life_fnc_jailSys",RSERV]; //Hier wurde nur _time Hinzugefügt
[5] call SOCK_fnc_updatePartial;