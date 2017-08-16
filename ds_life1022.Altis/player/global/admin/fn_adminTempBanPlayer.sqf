/*
    Darkside Life

	Author: Shawn "Huntah" Macgillivray

	Description:
	Temp bans the player from the server
*/

private ["_reason"];

_reason = _this select 0;

if(player getVariable ["beingBanned",false])exitWith{};
player setVariable ["beingBanned",true,true];

disableUserInput true;

systemChat format ["You are being temporarily banned from the server until the next restart - Reason : %1",_reason];
hint format ["You are being temporarily banned from the server until the next restart - Reason : %1",_reason];

DS_tempBans pushBack (getPlayerUID player);
publicVariable "DS_tempBans";

sleep 3;
removeAllWeapons player;
player setPos (getMarkerPos "chopDrop");
player setDamage 1;
player setVariable ["beingBanned",nil,true];
[] call DS_fnc_compileData;

["tempBan",false,true] call BIS_fnc_endMission;

[0,format["%1 has been temporarily banned from the server (until the next restart) - Reason : %2",(name player),_reason]] remoteExecCall ["DS_fnc_globalMessage",-2];

sleep 10;
disableUserInput false;
disableUserInput true;
disableUserInput false;