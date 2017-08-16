#include "..\..\script_macros.hpp"
/*
	File: fn_jail.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Starts the initial process of jailing.
*/
private["_bad","_unit","_time"];

params [
	["_unit",objNull,[objNull]],
	["_bad",false,[false]]
];

if(isNull _unit) exitWith {}; //Dafuq?
if(_unit != player) exitWith {}; //Dafuq?
_time = [_this,2,15,[0]] call BIS_fnc_param;
if(life_is_arrested) exitWith {}; //Dafuq i'm already arrested

player SVAR ["restrained",false,true];
player SVAR ["Escorting",false,true];
player SVAR ["transporting",false,true];

titleText[ "Du wurdest festgenommen, sitze deine Zeit ab. Wenn du versuchst, zu respawnen oder die Verbindung zu trennen, erhöht sich deine Zeit!","PLAIN"];
hint  "Bei der Verhaftung hast du folgende Lizenzen verloren\n\nWaffen Lizenz\nRebellen Lizenz";
player setPos (getMarkerPos "jail_marker");

if(_bad) then {
	waitUntil {alive player};
	sleep 1;
};

//Check to make sure they goto check
if(player distance (getMarkerPos "jail_marker") > 200) then {
	player setPos (getMarkerPos "jail_marker");
};

[1] call life_fnc_removeLicenses;

{
	_amount = ITEM_VALUE(_x);
	if(_amount > 0) then {
		[false,_x,_amount] call life_fnc_handleInv;
	};
} forEach ["heroin_unprocessed","heroin_processed","cannabis","marijuana","cocaine_unprocessed","cocaine_processed","turtle_raw"];

life_is_arrested = true;

removeAllWeapons player;
{player removeMagazine _x} forEach (magazines player);

[player,_bad,_time] remoteExecCall ["life_fnc_jailSys",RSERV];

[5] call SOCK_fnc_updatePartial;