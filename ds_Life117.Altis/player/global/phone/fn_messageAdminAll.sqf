/*
Darkside Life

Author: Shawn "Huntah" Macgillivray

Description:
	Sends messages to all players from an admin
*/

private["_action","_from","_message","_receiver","_log"];

_receiver = false;
_action = false;
if(count(_this) > 0)then
	{
	_receiver = [_this,0,false,[false]] call BIS_fnc_param;
	_from = _this select 1;
	_message = _this select 2;
	};
_log = "";

if(_receiver)then
	{
	_log = format["Admins: %1",_message];
	hint parseText format ["<t color='#FFCC00'><t size='2'><t align='center'>ADMIN MESSAGE<br/><br/><t color='#33CC33'><t align='left'><t size='1'>To: <t color='#ffffff'>All players<br/><t color='#33CC33'>From: <t color='#ffffff'>Admins<br/><br/><t color='#33CC33'>Message:<br/><t color='#ffffff'>%1",_message];
	systemchat format ["SERVER WIDE ADMIN MESSAGE: %1",_message];
	
	["phoneMessage",[format["You Received A New Private Message From an Admin",(name _from)]]] call bis_fnc_showNotification;
	systemChat format ["Text Message from (Admins): %1",_message];
	DS_messageLog pushBack _log;
	}
	else
	{
	ctrlShow[2400,false];
	_message = ctrlText 1400;
	
	if((_message == "")||(_message == "Enter Message here")) exitWith {hint "You must enter a message to send!";ctrlShow[2400,true];};
	_action = [
		"Are you sure you want to send this Admin Message to ALL players?",
		"Send to all?",
		"Yes",
		"No"
	] call BIS_fnc_guiMessage;

	if(!_action)exitwith{ctrlShow[2400,true];};
	{
	if(_x getVariable ["DSAdmin",false])then
		{
		[[0,format["%1 has sent an admin all message",(name player)]],"DS_fnc_globalMessage",_x,false] spawn BIS_fnc_MP;
		};
	}forEach playableunits;
	[[true,player,_message],"DS_fnc_messageAdminAll",true,false] spawn BIS_fnc_MP;
	hint format["You have sent an admin message to all players: Message:\n %1",_message];
	ctrlShow[2400,true];
	closeDialog 0;
	sleep 0.2;
	[] spawn DS_fnc_menuPhone;
	};
