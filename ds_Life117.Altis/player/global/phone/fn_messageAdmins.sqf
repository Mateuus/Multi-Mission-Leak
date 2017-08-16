/*
Darkside Life

Author: Shawn "Huntah" Macgillivray

Description:
	Sends messages to all Admins
*/

private["_from","_message","_receiver","_log"];

_receiver = false;



if(count(_this) > 0)then
	{
	_receiver = [_this,0,false,[false]] call BIS_fnc_param;
	_from = _this select 1;
	_message = _this select 2;
	};
_log = "";

if(_receiver)then
	{
	_log = format["(Admin Message) %1: %2",(name _from),_message];
	hint parseText format ["<t color='#FFCC00'><t size='2'><t align='center'>Admin Assistance<br/><br/><t color='#33CC33'><t align='left'><t size='1'>To: <t color='#ffffff'>Admins<br/><t color='#33CC33'>From: <t color='#ffffff'>%1<br/><br/><t color='#33CC33'>Message:<br/><t color='#ffffff'>%2",(name _from),_message];

	["adminCall",[format["Admin Assistance request from: %1",(name _from)]]] call bis_fnc_showNotification;
	systemChat format ["Text Message from (%1): %2",(name _from),_message];
	DS_messageLog pushBack _log;
	DS_recentCallers pushBack _from;
	}
	else
	{
	ctrlShow[2400,false];
	_message = ctrlText 1400;
	if((_message == "")||(_message == "Enter Message here")) exitWith {hint "You must enter a message to send!";ctrlShow[2400,true];};
	{
		if(_x getVariable "DSadmin")then
			{
			[[true,player,_message],"DS_fnc_messageAdmins",_x,false] spawn BIS_fnc_MP;
			};
	}forEach playableUnits;
	hint format["You sent the admins a message: %1",_message];
	ctrlShow[2400,true];
	closeDialog 0;
	[] spawn DS_fnc_menuPhone;
	};
