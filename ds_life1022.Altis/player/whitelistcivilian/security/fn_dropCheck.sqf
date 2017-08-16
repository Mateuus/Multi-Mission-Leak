/*
	Darkside Life

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

if(_bounty == 0)exitwith{[false,_bounty,_name,true] remoteExec ["DS_fnc_dropPay",_unit];};

[] remoteExecCall ["DS_fnc_informPolice",west];

hint "A security contractor has set up a ride for you to the nearest police station, you will be there in 2 minutes";
systemchat "A security contractor has set up a ride for you to the nearest police station, you will be there in 2 minutes";

sleep 120;

if(player distance _pos > 5) exitwith {};
if(!alive player) exitwith {};

titleText ["", "BLACK FADED", 3];

player setPos (getMarkerPos "cop_spawn_1");

DS_superRestrained = true;

sleep 3;

titleText ["", "BLACK IN", 3];

hint "You have been sent to a police station by a security contractor";
systemchat "You have been sent to a police station by a security contractor";

[true,_bounty,_name,true] remoteExec ["DS_fnc_dropPay",_unit];