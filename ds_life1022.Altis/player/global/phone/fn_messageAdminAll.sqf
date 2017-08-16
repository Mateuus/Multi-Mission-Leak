/*
	Darkside Life

	Author: Shawn "Huntah" Macgillivray

	Description:
	Sends messages to all players from an admin
*/

private["_receiver","_from","_message","_log","_action","_targets"];

_receiver = false;
_action = false;

if(count(_this) > 0)then
	{
	_receiver = [_this,0,false,[false]] call BIS_fnc_param;
	_from = _this select 1;
	_message = _this select 2;
	};

if(_receiver)then
	{
	hint parseText format ["<t color='#FFCC00' size='2' align='center'>ADMIN MESSAGE<br/><br/><t color='#33CC33' align='left' size='1'>To: <t color='#ffffff'>All players<br/><t color='#33CC33'>From: <t color='#ffffff'>Admins<br/><br/><t color='#33CC33'>Message:<br/><t color='#ffffff'>%1",_message];
	systemchat format ["SERVER WIDE ADMIN MESSAGE: %1",_message];
	player say3D "phoneCall";
	["phoneMessage",[format["You received a new private message from an Admin",(name _from)]]] call BIS_fnc_showNotification;
	systemChat format ["Text message from (Admins): %1",_message];

	_log = format["Admins: %1",_message];

	if(isNil "DS_messageLog")then{DS_messageLog = [];};
	DS_messageLog pushBack _log;
	}
	else
	{
	ctrlShow[2400,false];

	_message = ctrlText 1400;
	if((_message == "")||(_message == "Enter Message here"))exitwith{hint "You must enter a message to send!";ctrlShow[2400,true];};

	_action = [
		"Are you sure you want to send this Admin Message to ALL players?",
		"Send to all?",
		"Yes",
		"No"
	] call BIS_fnc_guiMessage;
	if(!_action)exitwith{ctrlShow[2400,true];};

	_targets = allPlayers select {_x getVariable ["DSAdmin",false]};
	[0,format ["%1 has sent an admin all message",(name player)]] remoteExecCall ["DS_fnc_globalMessage",_targets];

	[true,player,_message] remoteExec ["DS_fnc_messageAdminAll",-2];

	hint format["You have sent an admin message to all players: %1",_message];

	ctrlShow[2400,true];
	closeDialog 0;
	sleep 0.2;
	[] spawn DS_fnc_menuPhone;
	};