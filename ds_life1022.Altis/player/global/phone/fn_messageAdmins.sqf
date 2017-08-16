/*
	Darkside Life

	Author: Shawn "Huntah" Macgillivray

	Description:
	Sends messages to all Admins
*/

private["_receiver","_from","_message","_log","_action","_targets"];

_receiver = false;

if(count(_this) > 0)then
	{
	_receiver = [_this,0,false,[false]] call BIS_fnc_param;
	_from = _this select 1;
	_message = _this select 2;
	};

if(_receiver)then
	{
	if(DS_adminLevel == 0)exitwith{};
	if((side _from) isEqualTo civilian)then
		{
		hint parseText format ["<t color='#FFCC00' size='2' align='center'>Admin Assistance<br/><br/><t color='#33CC33' align='left' size='1'>To: <t color='#ffffff'>Admins<br/><t color='#33CC33'>From: <t color='#ffffff'>%1<br/><t color='#33CC33'>Gang: <t color='#ffffff'>%2<br/><br/><t color='#33CC33'>Message:<br/><t color='#ffffff'>%3",(name _from),(group _from) getVariable ["gangName","No Gang"],_message];
		}
		else
		{
		hint parseText format ["<t color='#FFCC00' size='2' align='center'>Admin Assistance<br/><br/><t color='#33CC33' align='left' size='1'>To: <t color='#ffffff'>Admins<br/><t color='#33CC33'>From: <t color='#ffffff'>%1<br/><br/><t color='#33CC33'>Message:<br/><t color='#ffffff'>%2",(name _from),_message];
		};
	["adminCall",[format["Admin assistance request from: %1",(name _from)]]] call BIS_fnc_showNotification;
	systemChat format ["Text message from (%1): %2",(name _from),_message];

	_log = format["(Admin Message) %1: %2",(name _from),_message];

	if(isNil "DS_messageLog")then{DS_messageLog = [];};
	if(isNil "DS_recentCallers")then{DS_recentCallers = [];};
	DS_messageLog pushBack _log;
	DS_recentCallers pushBack _from;
	}
	else
	{
	_action = [
		"Any abuse sent to admins will result in an instant kick or ban. Word your messages properly and visit TS for more help, there is not always an admin available in-game",
		"Important",
		"Continue",
		"Cancel"
	] call BIS_fnc_guiMessage;
	if(!_action)exitwith{closeDialog 0;};

	ctrlShow[2400,false];

	_message = ctrlText 1400;
	if((_message == "")||(_message == "Enter Message here"))exitwith{hint "You must enter a message to send!";ctrlShow[2400,true];};

	_targets = allPlayers select {_x getVariable ["DSAdmin",false]};
	if(!(_targets isEqualTo []))then{[true,player,_message] remoteExec ["DS_fnc_messageAdmins",_targets];};

	hint format["You sent the admins a message: %1",_message];

	ctrlShow[2400,true];
	closeDialog 0;
	sleep 0.2;
	[] spawn DS_fnc_menuPhone;
	};