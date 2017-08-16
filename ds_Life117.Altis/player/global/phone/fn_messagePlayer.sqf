/*
Darkside Life

Author: Shawn "Huntah" Macgillivray

Description:
	Sends/Recives text from players
*/

private["_from","_message","_receiver","_log","_uid"];

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
	_uid = (getPlayerUID _from);
	if(_uid in DS_blockedCallers)exitwith{};
	_log = format["%1: %2",(name _from),_message];
	hint parseText format ["<t color='#FFCC00'><t size='2'><t align='center'>New Message<br/><br/><t color='#33CC33'><t align='left'><t size='1'>To: <t color='#ffffff'>You<br/><t color='#33CC33'>From: <t color='#ffffff'>%1<br/><br/><t color='#33CC33'>Message:<br/><t color='#ffffff'>%2",(name _from),_message];
	
	["phoneMessage",[format["You Received A New Private Message From %1",(name _from)]]] call bis_fnc_showNotification;
	systemChat format ["Text Message from (%1): %2",(name _from),_message];
	DS_recentCallers pushBack (name _from);
	DS_messageLog pushBack _log;
	DS_recentCallers pushBack _from;
	}
	else
	{
	ctrlShow[2400,false];
	_message = ctrlText 1400;
	if(DS_jailed)exitwith{hint "You can not send messages while in jail";systemchat "You can not send messages while in jail";ctrlShow[2400,true];};
	if(lbCurSel 2100 == -1) exitWith {hint "You must select a player you are sending the text to!"; ctrlShow[2400,true];};
	_receiver = call compile format["%1",(lbData[2100,(lbCurSel 2100)])]; 
	if(isNull _receiver) exitWith {ctrlShow[2400,true];};
	if(isNil "_receiver") exitWith {ctrlShow[2400,true];};
	if((_message == "")||(_message == "Enter Message here")) exitWith {hint "You must enter a message to send!";ctrlShow[2400,true];};
	[[true,player,_message],"DS_fnc_messagePlayer",_receiver,false] spawn BIS_fnc_MP;
	hint format["You sent %1 a message: %2",name _receiver,_message];
	ctrlShow[2400,true];
	closeDialog 0;
	[] spawn DS_fnc_menuPhone;
	};
