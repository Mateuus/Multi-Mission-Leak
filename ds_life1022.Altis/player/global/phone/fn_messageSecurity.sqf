/*
	Darkside Life

	Author: Shawn "Huntah" Macgillivray

	Description:
	Sends messages to all Security Contractors
*/

private["_receiver","_from","_message","_log","_targets"];

_receiver = false;

if(count(_this) > 0)then
	{
	_receiver = [_this,0,false,[false]] call BIS_fnc_param;
	_from = _this select 1;
	_message = _this select 2;
	};

if(_receiver)then
	{
	if(!(player getVariable ["security",false]))exitwith{};

	if((side _from) isEqualTo civilian)then
		{
		hint parseText format ["<t color='#FFCC00' size='2' align='center'>Work Call<br/><br/><t color='#33CC33' align='left' size='1'>To: <t color='#ffffff'>Security Contractors<br/><t color='#33CC33'>From: <t color='#ffffff'>%1<br/><t color='#33CC33'>Gang: <t color='#ffffff'>%2<br/><br/><t color='#33CC33'>Message:<br/><t color='#ffffff'>%3",(name _from),(group _from) getVariable ["gangName","No Gang"],_message];
		}
		else
		{
		hint parseText format ["<t color='#FFCC00' size='2' align='center'>Work Call<br/><br/><t color='#33CC33' align='left' size='1'>To: <t color='#ffffff'>Security Contractors<br/><t color='#33CC33'>From: <t color='#ffffff'>%1<br/><br/><t color='#33CC33'>Message:<br/><t color='#ffffff'>%2",(name _from),_message];
		};
	player say3D "phoneCall";
	["securityCall",[format["Security request from: %1",(name _from)]]] call BIS_fnc_showNotification;
	systemChat format ["Text message from (%1): %2",(name _from),_message];

	_log = format["Security request from %1: %2",(name _from),_message];

	if(isNil "DS_messageLog")then{DS_messageLog = [];};
	if(isNil "DS_recentCallers")then{DS_recentCallers = [];};
	DS_messageLog pushBack _log;
	DS_recentCallers pushBack _from;
	}
	else
	{
	ctrlShow[2400,false];

	if((player getVariable ["restrained",false])||(DS_jailed))exitwith{hint "You can not send messages while restrained or in jail";systemchat "You can not send messages while restrained or in jail";ctrlShow[2400,true];};

	_message = ctrlText 1400;
	if((_message == "")||(_message == "Enter Message here"))exitwith{hint "You must enter a message to send!";ctrlShow[2400,true];};

	_targets = allPlayers select {_x getVariable ["security",false]};
	if(!(_targets isEqualTo []))then{[true,player,_message] remoteExec ["DS_fnc_messageSecurity",_targets];};

	hint format["You sent the security contractors a message: %1",_message];

	ctrlShow[2400,true];
	closeDialog 0;
	sleep 0.2;
	[] spawn DS_fnc_menuPhone;
	};