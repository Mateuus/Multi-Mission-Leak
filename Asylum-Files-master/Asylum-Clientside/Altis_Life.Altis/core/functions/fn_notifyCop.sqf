/*
	File: fn_notifyCop.sqf
	Author: Alan
	
	Description:
	Notifies Cops with a message.
*/
if(playerSide != west) exitWith {}; //Not a cop
_message = [_this,0,"",[""]] call BIS_fnc_param;
if(_message == "") exitwith {};

hint _message;