/*
Darkside Life

Author: Shawn "Huntah" Macgillivray

Description:
	Sends/Recives text from admins
*/

private["_from","_message","_receiver","_log","_alert"];

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
	_log = format["Admin: %1",_message];
	hint parseText format ["<t color='#FFCC00'><t size='2'><t align='center'>New Admin Message<br/><br/><t color='#33CC33'><t align='left'><t size='1'>To: <t color='#ffffff'>You<br/><t color='#33CC33'>From: <t color='#ffffff'>ADMINS<br/><br/><t color='#33CC33'>Message:<br/><t color='#ffffff'>%2",(name _from),_message];
	systemchat format ["MESSAGE FROM ADMIN: %1",_message];
	
	["phoneMessage",[format["You Received A New Private Message From an Admin",(name _from)]]] call bis_fnc_showNotification;
	systemChat format ["Text Message from (Admins): %1",_message];
	DS_messageLog pushBack _log;
	}
	else
	{
	ctrlShow[2400,false];
	_message = ctrlText 1400;
	if(lbCurSel 2100 == -1) exitWith {hint "You must select a player you are sending the text to!"; ctrlShow[2400,true];};
	_receiver = call compile format["%1",(lbData[2100,(lbCurSel 2100)])]; 
	if(isNull _receiver) exitWith {ctrlShow[2400,true];};
	if(isNil "_receiver") exitWith {ctrlShow[2400,true];};
	if((_message == "")||(_message == "Enter Message here")) exitWith {hint "You must enter a message to send!";ctrlShow[2400,true];};
	[[true,player,_message],"DS_fnc_messageAdminPlayer",_receiver,false] spawn BIS_fnc_MP;
	hint format["You sent an admin message to %1 a message: %2",name _receiver,_message];
	_alert = format ["%1 has replied to an admin message from %2",(name player),(name _receiver)];
	{
	if(_x getVariable ["DSAdmin",false])then
		{
		[[0,_alert],"DS_fnc_globalMessage",_x,false] spawn BIS_fnc_MP;
		};
	}forEach playableunits;
	ctrlShow[2400,true];
	closeDialog 0;
	[] spawn DS_fnc_menuPhone;
	};
