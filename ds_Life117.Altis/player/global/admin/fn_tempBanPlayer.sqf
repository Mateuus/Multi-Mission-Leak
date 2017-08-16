/*
	File: fn_tempBanPlayer.sqf
	Author: Shawn "Huntah" Macgillivray
	
	Description:
	For admins/mods to temp ban trolls
*/
private["_reason","_display","_text","_units","_charge","_civvalue","_player","_sleep","_copName"];

_copName = _this select 0;
_reason = _this select 1;

if(isServer)exitWith{};

disableUserInput true;

systemchat format ["You are being temporally banned from the server until the next restart - Reason : %1",_reason];
hint format ["You are being temporally banned from the server until the next restart - Reason : %1",_reason];

DS_tempBans pushBack (getPlayerUID player);
publicVariable "DS_tempBans";

sleep 3;
removeAllWeapons player;
player setPos (getMarkerPos "chopDrop");
player setDamage 1;
[] call DS_fnc_compileData;
	
["tempBan",false,true] call BIS_fnc_endMission;

[[0,format["%1 has been temporally banned from the server (until the next restart) -Reason : %2",(name player),_reason]],"DS_fnc_globalMessage",true,false] spawn BIS_fnc_MP;

sleep 10;
disableUserInput false;