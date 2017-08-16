/*
	Darkside Life

	Author: Shawn "Huntah" Macgillivray

	Description:
	Sends message from admins
*/

private["_receiver","_from","_message","_log","_action","_alert","_targets"];

_receiver = false;

if(count(_this) > 0)then
	{
	_receiver = [_this,0,false,[false]] call BIS_fnc_param;
	_from = _this select 1;
	_message = _this select 2;
	};

if(_receiver)then
	{
	hint parseText format ["<t color='#FFCC00' size='2' align='center'>New Admin Message<br/><br/><t color='#33CC33' align='left' size='1'>To: <t color='#ffffff'>You<br/><t color='#33CC33'>From: <t color='#ffffff'>ADMINS<br/><br/><t color='#33CC33'>Message:<br/><t color='#ffffff'>%2",(name _from),_message];
	systemchat format ["MESSAGE FROM ADMIN: %1",_message];
	player say3D "phoneCall";
	["phoneMessage",[format["You received a new private message from an admin",(name _from)]]] call BIS_fnc_showNotification;
	systemChat format ["Text message from (Admins): %1",_message];

	_log = format["Admin: %1",_message];

	if(isNil "DS_messageLog")then{DS_messageLog = [];};
	DS_messageLog pushBack _log;
	}
	else
	{
	ctrlShow[2400,false];

	if(lbCurSel 2100 == -1)exitwith{hint "You must select a player you are sending the text to!";ctrlShow[2400,true];};

	_receiver = lbData [2100,lbCurSel 2100];
	_receiver = missionNamespace getVariable _receiver;
	if((isNil "_receiver")||(isNull _receiver))exitwith{ctrlShow[2400,true];};

	_message = ctrlText 1400;
	if((_message == "")||(_message == "Enter Message here"))exitwith{hint "You must enter a message to send!";ctrlShow[2400,true];};

	[true,player,_message] remoteExec ["DS_fnc_messageAdminPlayer",_receiver];
	hint format ["You sent an admin message to %1: %2",name _receiver,_message];

	_alert = format ["%1 has replied to an admin message from %2",(name player),(name _receiver)];
	_targets = allPlayers select {_x getVariable ["DSAdmin",false]};
	[0,_alert] remoteExecCall ["DS_fnc_globalMessage",_targets];

	ctrlShow[2400,true];
	closeDialog 0;
	sleep 0.2;
	[] spawn DS_fnc_menuPhone;
	};