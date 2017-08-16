/*
	File: fn_bountyDropCheck.sqf
	Author: Shawn "Huntah" Macgillivray
	
	Description:
	Checks if player has a bounty and informs the bounty hunter and teleports player to nearest police station
*/
private["_athira","_pyrgos","_sofia","_kavala","_location","_name","_unit","_pos","_unitName","_nameName"];

_unit = _this select 0;
_pos = (position player);
_name = player;
_uid = getPlayerUID player;
_bounty = 0;

if(player getVariable ["escorted",false])exitwith{};

_bounty = DS_wanted_stats select 0; 

if(_bounty == 0)exitwith{[[false,_bounty,_name,true],"DS_fnc_bountyDropPay",_unit,false] spawn BIS_fnc_MP;};

[[],"DS_fnc_bountyInformPolice",west,false] spawn DS_fnc_MP;

hint "A Security Contractor has set up a ride for you to the nearest police station, you will be there in 2 minutes";
systemchat "A Security Contractor has set up a ride for you to the nearest police station, you will be there in 2 minutes";

sleep 120;

if(player distance _pos > 5) exitwith {};
if(!alive player) exitwith {};

titleText ["", "BLACK FADED", 3];

player setPos (getMarkerPos "cop_spawn_1");

DS_superRestrained = true;

sleep 3;

titleText ["", "BLACK IN", 3];

hint "You have been sent to a police station by a Security Contractor";
systemchat "You have been sent to a police station by a Security Contractor";

[[true,_bounty,_name,true],"DS_fnc_bountyDropPay",_unit,false] spawn DS_fnc_MP;
