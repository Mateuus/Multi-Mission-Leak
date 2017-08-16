/*
	File: fn_jail.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Starts the initial process of jailing.
*/
private["_bad","_unit","_time"]; //<-- Replace Old Line With This
_unit = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
hint format["%1", _unit];
if(isNull _unit) exitWith {}; //Dafuq?
if(_unit != player) exitWith {}; //Dafuq?
if(eM_is_arrested) exitWith {}; //Dafuq i'm already arrested
_bad = [_this,1,false,[false]] call BIS_fnc_param;
_time = [_this,2,15,[0]] call BIS_fnc_param;//-------------Changed--------------

player setVariable["restrained",false,true];
player setVariable["Escorting",false,true];
player setVariable["transporting",false,true];

titleText["Du wurdest inhaftiert und musst deine Zeit absitzen. Wenn du respawnst oder dich ausloggst, wird die Zeit erhöht!","PLAIN"];
hint "Du hat deine Lizenzen verloren!";
player setPos (getMarkerPos "jail_marker");

if(_bad) then
{
	waitUntil {alive player};
	uisleep 1;
};

//Check to make sure they goto check
if(player distance (getMarkerPos "jail_marker") > 40) then
{
	player setPos (getMarkerPos "jail_marker");
};

[1] call EMonkeys_fnc_removeLicenses;
if(EMonkeys_inv_heroinu > 0) then {[false,"heroinu",EMonkeys_inv_heroinu] call EMonkeys_fnc_handleInv;};
if(EMonkeys_inv_heroinp > 0) then {[false,"heroinp",EMonkeys_inv_heroinp] call EMonkeys_fnc_handleInv;};
if(EMonkeys_inv_coke > 0) then {[false,"cocaine",EMonkeys_inv_coke] call EMonkeys_fnc_handleInv;};
if(EMonkeys_inv_cokep > 0) then {[false,"cocainep",EMonkeys_inv_cokep] call EMonkeys_fnc_handleInv;};
if(EMonkeys_inv_turtle > 0) then {[false,"turtle",EMonkeys_inv_turtle] call EMonkeys_fnc_handleInv;};
if(EMonkeys_inv_cannabis > 0) then {[false,"cannabis",EMonkeys_inv_cannabis] call EMonkeys_fnc_handleInv;};
if(EMonkeys_inv_marijuana > 0) then {[false,"marijuana",EMonkeys_inv_marijuana] call EMonkeys_fnc_handleInv;};
eM_is_arrested = true;

removeAllWeapons player;
{player removeMagazine _x} foreach (magazines player);

[[player,_bad,_time],"EMonkeys_fnc_jailSys",false,false] call EMonkeys_fnc_mp;//-------------Changed-----------
[] call SOCK_fnc_updateRequest;