/*
Darkside Life

Author: Shawn "Huntah" Macgillivray

Description:
	Plays a message globally
*/
private["_type","_message","_policeOnly"];
_type = [_this,0,0,[[],0]] call BIS_fnc_param;
_message = [_this,1,"",[""]] call BIS_fnc_param;
_important = [_this,2,false,[false]] call BIS_fnc_param;

if(isNil {_policeOnly})then{_policeOnly = false;};

if((_policeOnly)&&(playerside != west))exitwith{};

if(_message == "") exitwith {};

switch (_type) do
	{
	case 0: {systemChat _message};
	case 1: {hintSilent format["%1", _message]};
	case 2: {titleText[format["%1",_message],"PLAIN"];};
	};

if((_important)&&(_type == 0))then
	{
	DS_newsLog pushBack _message;
	};