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
player setVariable ["restrainedz",false,true];
player setVariable ["Escorting",false,true];
player setVariable ["transporting",false,true];
[localize "STR_Jail_Warn",5,"gray"] call RPG_Fnc_Msg;
hint localize "STR_Jail_LicenseNOTF";
player setPos (getMarkerPos "jail_marker");
if (_bad) then {
 waitUntil {alive player};
 sleep 1;
};
//Check to make sure they goto check
if (player distance (getMarkerPos "jail_marker") > 40) then {
 player setPos (getMarkerPos "jail_marker");
};
[1] call life_fnc_removeLicenses;
{
 _amount = ITEM_VALUE(_x);
 if (_amount > 0) then {
 [false,_x,_amount] call life_fnc_handleInv;
 };
} forEach _illegalItems;
life_is_arrested = true;

RPG_Fnc_OldUniform = Uniform player;
//RPG_Fnc_OldVest = Vest player;
RPG_Fnc_OldBackpack = Backpack player;

removeAllWeapons player;
{player removeMagazine _x} foreach (magazines player);
removeVest player;
removeBackpack player;
removeGoggles player;
removeHeadGear player;

player addUniform "U_C_Scientist";
sleep 0.2;
player setObjectTextureGlobal [0, "textures\civ\prisoner.jpg"];
[] call life_fnc_playerSkins;

[player,"cellclose"] spawn life_fnc_nearestSound;

if (LIFE_SETTINGS(getNumber,"jail_seize_inventory") isEqualTo 1) then {
 [] spawn life_fnc_seizeClient;
} else {
 removeAllWeapons player;
 {player removeMagazine _x} forEach (magazines player);
};
if (life_HC_isActive) then {
 [player,_bad,_time] remoteExecCall ["HC_fnc_jailSys",HC_Life]; //Hier wurde nur _time Hinzugefügt
} else {
 [player,_bad,_time] remoteExecCall ["life_fnc_jailSys",RSERV]; //Hier wurde nur _time Hinzugefügt
};

[5] call SOCK_fnc_updatePartial;