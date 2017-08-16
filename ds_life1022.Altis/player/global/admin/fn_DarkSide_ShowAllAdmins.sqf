/*
	Darkside Life

	Author: Shawn "Huntah" Macgillivray

	Description:
	Tells admins when an admin uses a misc tool
*/

private ["_player","_action","_str"];

if(isNil "DS_adminLevel")exitWith{};

if(DS_adminLevel < 2)exitWith{};
if(!((getPlayerUID player) in DS_adminlist1))exitWith{};
if(!alive player) exitWith {};

_player = _this select 0;
_action = _this select 1;
_str = parseText format ["<t color='#0101DF' size='1.5'><br/>Admin Alert<br/><br/>Misc Action</t><br/><br/>%1 has just used %2",_player,_action];
hint _str;
systemChat format ["%1 has just used %2",_player,_action];