/*
	Darkside Life

	Author: Shawn "Huntah" Macgillivray

	Description:
	Sends/Recives text from players
*/

private["_receiver","_from","_message","_log"];

_receiver = false;

if(count(_this) > 0)then
	{
	_receiver = [_this,0,false,[false]] call BIS_fnc_param;
	_from = _this select 1;
	_message = _this select 2;
	};

if(_receiver)then
	{
	if((getPlayerUID _from) in DS_blockedCallers)exitwith{};

	if((side _from) isEqualTo civilian)then
		{
		hint parseText format ["<t color='#FFCC00' size='2' align='center'>New Message<br/><br/><t color='#33CC33' align='left'><t size='1'>To: <t color='#ffffff'>You<br/><t color='#33CC33'>From: <t color='#ffffff'>%1<br/><t color='#33CC33'>Gang: <t color='#ffffff'>%2<br/><br/><t color='#33CC33'>Message:<br/><t color='#ffffff'>%3",(name _from),(group _from) getVariable ["gangName","No Gang"],_message];
		}
		else
		{
		hint parseText format ["<t color='#FFCC00' size='2' align='center'>New Message<br/><br/><t color='#33CC33' align='left'><t size='1'>To: <t color='#ffffff'>You<br/><t color='#33CC33'>From: <t color='#ffffff'>%1<br/><br/><t color='#33CC33'>Message:<br/><t color='#ffffff'>%2",(name _from),_message];
		};
	player say3D "phoneCall";
	["phoneMessage",[format["You received a new private message from %1",(name _from)]]] call BIS_fnc_showNotification;
	systemChat format ["Text message from (%1): %2",(name _from),_message];

	_log = format["%1: %2",(name _from),_message];

	if(isNil "DS_messageLog")then{DS_messageLog = [];};
	if(isNil "DS_recentCallers")then{DS_recentCallers = [];};
	DS_recentCallers pushBack (name _from);
	DS_messageLog pushBack _log;
	DS_recentCallers pushBack _from;
	}
	else
	{
	ctrlShow[2400,false];

	if((player getVariable ["restrained",false])||(DS_jailed))exitwith{hint "You can not send messages while restrained or in jail";systemchat "You can not send messages while restrained or in jail";ctrlShow[2400,true];};
	if(lbCurSel 2100 == -1)exitwith{hint "You must select a player you are sending the text to!";ctrlShow[2400,true];};

	_receiver = lbData [2100,lbCurSel 2100];
	_receiver = missionNamespace getVariable _receiver;
	if((isNil "_receiver")||(isNull _receiver))exitwith{ctrlShow[2400,true];};

	_message = ctrlText 1400;
	if((_message == "")||(_message == "Enter Message here"))exitwith{hint "You must enter a message to send!";ctrlShow[2400,true];};
	if(playerSide isEqualTo west)then{_message = format ["(Message From Police) - %1",_message];};

	[true,player,_message] remoteExec ["DS_fnc_messagePlayer",_receiver];
	hint format["You sent %1 a message: %2",name _receiver,_message];

	ctrlShow[2400,true];
	closeDialog 0;
	sleep 0.2;
	[] spawn DS_fnc_menuPhone;
	};