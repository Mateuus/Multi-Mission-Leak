/*
	Darkside Life

	Author: Shawn "Huntah" Macgillivray

	Description:
	Sends messages to all players from a gang
*/

private["_action","_from","_message","_receiver","_log"];

disableSerialization;

_receiver = false;

if(count(_this) > 0)then
	{
	_receiver = [_this,0,false,[false]] call BIS_fnc_param;
	_from = _this select 1;
	_gang = (group _from) getVariable ["gangName","Unknown Gang"];
	_message = _this select 2;
	};

if(_receiver)then
	{
	if((getPlayerUID _from) in DS_blockedCallers)exitwith{};

	hint parseText format ["<t color='#FFCC00'><t size='2'><t align='center'>Gang Message<br/><br/><t color='#33CC33'><t align='left'><t size='1'>To: <t color='#ffffff'>%2<br/><t color='#33CC33'>From: <t color='#ffffff'>%3: %4<br/><br/><t color='#33CC33'>Message:<br/><t color='#ffffff'>%1",_message,(group player) getVariable ["gangName","Random Gang"],(name _from),(group _from) getVariable ["gangName","Unknown Gang"]];
	player say3D "phoneCall";
	["phoneMessage",[format["You received a new private message from the gang %1",(group _from) getVariable ["gangName","Unknown Gang"]]]] call BIS_fnc_showNotification;
	systemChat format ["Text message from %2: %1",_message,(group _from) getVariable ["gangName","Unknown Gang"]];

	_log = format ["Text Message from %2: %1",_message,(group _from) getVariable ["gangName","Unknown Gang"]];

	if(isNil "DS_messageLog")then{DS_messageLog = [];};
	if(isNil "DS_recentCallers")then{DS_recentCallers = [];};
	DS_messageLog pushBack _log;
	DS_recentCallers pushBack _from;
	}
	else
	{
	ctrlShow[2400,false];

	_message = ctrlText 1400;
	if((_message == "")||(_message == "Enter Message here")) exitWith {hint "You must enter a message to send!";ctrlShow[2400,true];};

	_action = [
		"Are you sure you want to send this message to all members of the selected gang",
		"Send to gang?",
		"Yes",
		"No"
	] call BIS_fnc_guiMessage;
	if(!_action)exitwith{ctrlShow[2400,true];};

	[true,player,_message] remoteExec ["DS_fnc_messageGang",DS_className];

	hint format["You have sent the following message to all members of the selected gang: \n %1",_message];
	ctrlShow[2400,true];
	closeDialog 0;
	};