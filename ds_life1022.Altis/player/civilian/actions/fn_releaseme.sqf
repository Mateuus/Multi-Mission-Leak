/*
	Darkside Life

	Author: Shawn "Huntah" Macgillivray

	Description:
	Releases the civ from jail
*/

if(!DS_jailed)exitwith{};

DS_jailRelease = true;

if(_this select 1)exitwith
	{
	player setdamage 0;
	DS_jailed = false;
	player setVariable ["jailed",DS_jailed,true];
	[] spawn DS_fnc_removeCharges;
	[] call DS_fnc_compileData;
	player linkItem "ItemMap";
	DS_bailValue = 0;
	hint "An Admin has released you from jail";
	[0,format["%1 has been released from jail by the admins", name player]] remoteExecCall ["DS_fnc_globalMessage",west];
	systemchat "An Admin has released you from jail";
	player setPos (getMarkerPos "respawn_civilian");
	};

player setdamage 0;
DS_jailed = false;
player setVariable ["jailed",DS_jailed,true];
[] spawn DS_fnc_removeCharges;
[] call DS_fnc_compileData;
player linkItem "ItemMap";
DS_bailValue = 0;
hint "The police have released you from jail";
[0,format["%1 has been released from jail by the police", name player]] remoteExecCall ["DS_fnc_globalMessage",west];
systemchat "The police have released you from jail";
player setPos (getMarkerPos "respawn_civilian");