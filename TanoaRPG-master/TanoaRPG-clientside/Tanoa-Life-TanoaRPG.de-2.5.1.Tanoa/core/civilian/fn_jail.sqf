/*
	File: fn_jail.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Starts the initial process of jailing.
*/
private["_bad","_unit","_time"];
_unit = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
hintSilent format["%1", _unit];
if(isNull _unit) exitWith {}; //Dafuq?
if(_unit != player) exitWith {}; //Dafuq?
if(life_is_arrested) exitWith {}; //Dafuq i'm already arrested
_time = [_this,2,15,[0]] call BIS_fnc_param;
_bad = [_this,1,false,[false]] call BIS_fnc_param;

player setVariable["restrained",false,true];
player setVariable["Escorting",false,true];
player setVariable["transporting",false,true];

titleText["Du wurdest verurteilt. Bitte sitze deine Haftstrafe ab und versuche nicht zu fliehen.","PLAIN"];
hintSilent "Du hast deine Rebellenlizenz sowie illegale Verarbeitungslizenzen verloren.";
player setPosASL [(getMarkerPos "jail_marker" select 0),(getMarkerPos "jail_marker" select 1),4];

if(_bad) then
{
	waitUntil {alive player};
	uiSleep 1;
};

//Check to make sure they goto check
if(player distance (getMarkerPos "jail_marker") > 100) then
{
	player setPosASL [(getMarkerPos "jail_marker" select 0),(getMarkerPos "jail_marker" select 1),4];
};

[1] call tanoarpg_fnc_removeLicenses;
if(life_inv_heroinu > 0) then {[false,"heroinu",life_inv_heroinu] call tanoarpg_fnc_handleInv;};
if(life_inv_heroinp > 0) then {[false,"heroinp",life_inv_heroinp] call tanoarpg_fnc_handleInv;};
if(life_inv_coke > 0) then {[false,"cocaine",life_inv_coke] call tanoarpg_fnc_handleInv;};
if(life_inv_cokep > 0) then {[false,"cocainep",life_inv_cokep] call tanoarpg_fnc_handleInv;};
if(life_inv_turtle > 0) then {[false,"turtle",life_inv_turtle] call tanoarpg_fnc_handleInv;};
if(life_inv_cannabis > 0) then {[false,"cannabis",life_inv_cannabis] call tanoarpg_fnc_handleInv;};
if(life_inv_marijuana > 0) then {[false,"marijuana",life_inv_marijuana] call tanoarpg_fnc_handleInv;};
if(life_inv_methu > 0) then {[false,"methu",life_inv_methu] call tanoarpg_fnc_handleInv;};
if(life_inv_methp > 0) then {[false,"methp",life_inv_methp] call tanoarpg_fnc_handleInv;};
if(life_inv_bottledwhiskey > 0) then {[false,"bottledwhiskey",life_inv_bottledwhiskey] call tanoarpg_fnc_handleInv;};
if(life_inv_bottledbeer > 0) then {[false,"bottledbeer",life_inv_bottledbeer] call tanoarpg_fnc_handleInv;};

if(life_inv_hmillegal > 0) then {[false,"hmillegal",life_inv_hmillegal] call tanoarpg_fnc_handleInv;};
if(life_inv_energydrink > 0) then {[false,"energydrink",life_inv_energydrink] call tanoarpg_fnc_handleInv;};

life_is_arrested = true;

removeAllItems player;
removeVest player;
removeBackpack player;
removeGoggles player;
removeHeadgear player;
removeAllWeapons player;
{player removeMagazine _x} foreach (magazines player);
removeUniform player;
player forceAddUniform "U_C_Scientist";

[player,_bad,_time] remoteExec ["tanoarpg_fnc_jailSys", 2, false];
[5] call XAS_fnc_updatePartial;