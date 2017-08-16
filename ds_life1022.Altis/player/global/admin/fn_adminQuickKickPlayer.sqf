/*
    Darkside Life

	Author: Shawn "Huntah" Macgillivray

	Description:
	Kicks the player from the server
*/

private ["_reason"];

_reason = _this select 0;

if(player getVariable ["beingKicked",false])exitWith{};
player setVariable ["beingKicked",true,true];

disableUserInput true;

systemChat format ["You are being kicked by an admin for %1",_reason];
hint format ["You are being kicked by an admin for %1",_reason];
player say3D "flashbang";

sleep 3;
removeAllWeapons player;
player setPos (getMarkerPos "chopDrop");
player setDamage 1;
player setVariable ["beingKicked",nil,true];
[] call DS_fnc_compileData;

["quickKick",false,true] call BIS_fnc_endMission;

[0,format["%1 has been kicked from the server - Reason : %2",(name player),_reason]] remoteExecCall ["DS_fnc_globalMessage",-2];

sleep 10;
disableUserInput false;
disableUserInput true;
disableUserInput false;