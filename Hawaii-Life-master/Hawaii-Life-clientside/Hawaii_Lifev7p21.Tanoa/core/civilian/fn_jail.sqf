#include "..\..\script_macros.hpp"
/*
	File: fn_jail.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Starts the initial process of jailing.
*/
params [
	["_unit",objNull,[objNull]],
	["_bad",false,[false]],
	["_time",15,[0]]
];
if(isNull _unit) exitWith {}; //Dafuq?
if(_unit != player) exitWith {}; //Dafuq?
if(life_is_arrested) exitWith {}; //Dafuq i'm already arrested

player SVAR ["restrained",false,true];
player SVAR ["masked",false,true];
player SVAR ["Escorting",false,true];
player SVAR ["transporting",false,true];

titleText[localize "STR_Jail_Warn","PLAIN"];
hint localize "STR_Jail_LicenseNOTF";
player setPos (getMarkerPos "jail_marker");
player setPosATL [getPosATL player select 0, getPosATL player select 1,((getPosATL player select 2) + 2.3)];

if(_bad) then {
	waitUntil {alive player};
	sleep 1;
};

//Check to make sure they goto check
player setPos (getMarkerPos "jail_marker");
player setPosATL [getPosATL player select 0, getPosATL player select 1,((getPosATL player select 2) + 2.3)];

[1] call life_fnc_removeLicenses;

life_is_arrested = true;

removeAllWeapons player;
{player removeMagazine _x} foreach (magazines player);
removeVest player;
removeBackpack player;
removeUniform player;
player forceAddUniform "U_IG_Guerilla2_1";
sleep 0.2;
player setObjectTextureGlobal [0,"#(argb,8,8,3)color(0.6,0.3,0.01,1)"];

if (life_HC_isActive) then {
	[player,_bad,_time] remoteExecCall ["HC_fnc_jailSys",HC_Life];
} else {
	[player,_bad,_time] remoteExecCall ["life_fnc_jailSys",RSERV];
};
[5] call SOCK_fnc_updatePartial;