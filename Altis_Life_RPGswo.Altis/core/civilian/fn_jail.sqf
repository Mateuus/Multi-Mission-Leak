#include "..\..\macros.hpp"
/*
	File: fn_jail.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Starts the initial process of jailing.
*/
private["_bad","_unit","_time","_illegalItems"];
_unit = param [0,ObjNull,[ObjNull]];
hint format["%1", _unit];
if(isNull _unit) exitWith {};
if(_unit != player) exitWith {};
if(DWEV_is_arrested) exitWith {};
_bad = param [1,false,[false]];
_time = param [2,15,[0]];
_illegalItems = DWEV_SETTINGS(getArray,"jail_seize_vItems");
player setVariable["restrained",false,true];
player setVariable["Escorting",false,true];
player setVariable["transporting",false,true];

titleText["Willkommen im Knast, viel Spass beim absitzen deiner Strafe. Relog / Respawn verlängert die Strafe!","PLAIN"];
hint "Beim Einfahren hast du deine Waffenlizenz\n\n und alle Illegalen Lizenzen\nVerloren";
player setPos (getMarkerPos "jail_marker");

player unassignItem "ItemMap";
player unassignItem "ItemGPS";
player unassignItem "ItemRadio";
removeAllWeapons player;
removeAllItems player;
removeAllAssignedItems player;
removeUniform player;
removeVest player;
removeBackpack player;
removeHeadgear player;
removeGoggles player;
player forceaddUniform "U_IG_Guerilla2_1";
player setObjectTextureGlobal [0,'textures\kleidung\civ\Jail.paa'];

//Check to make sure they goto check
if(player distance (getMarkerPos "jail_marker") > 40) then
{
	player setPos (getMarkerPos "jail_marker");
};

[1] call DWEV_fnc_removeLicenses;

{
    _amount = ITEM_VALUE(_x);
    if (_amount > 0) then {
        [false,_x,_amount] call DWEV_fnc_handlelnv;
    };
} forEach _illegalItems;

DWEV_is_arrested = true;

removeAllWeapons player;
{player removeMagazine _x} foreach (magazines player);

[player,_bad,_time] remoteExec ["DWEV_fnc_jaiISys",2];

[2] call SOCK_fnc_updatePartial;
[3] call SOCK_fnc_updatePartial;
[5] call SOCK_fnc_updatePartial;
[6] call SOCK_fnc_updatePartial;