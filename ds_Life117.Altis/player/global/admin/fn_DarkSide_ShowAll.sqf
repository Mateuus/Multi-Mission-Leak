/*
	File: fn_DarkSide_ShowAll.sqf
	Author: Shawn "Huntah" Macgillivray
	
	Description:
	Tells admins when an admin uses a misc tool
*/

private ["_adminLevel","_player","_value","_str","_action"];

//if(isServer)exitwith{};
_adminLevel = (DS_adminlevel);

if(_adminLevel < 3) exitwith {};// Not a high enough admin
if(((getPlayerUID player) in DS_adminlist3)||((getPlayerUID player) in DS_adminlist4))then
	{
	if(!alive player) exitwith {};
	_player = _this select 0;
	_action = _this select 1;
	_str = parseText format ["<t color='#0101DF' size='1.5'><br/>Admin Alert<br/><br/>Misc Action</t><br/><br/>%1 has just used %2",_player,_action];
	hint _str;
	systemchat format ["%1 has just used %2",_player,_action];
	};