/*
	File: fn_truckerDropLevel.sqf
	Author: Shawn "Huntah" MAcgillivray
	
	Description:
	For truck drivers to lower their level
*/

private ["_curLevel","_action","_nextLevel"];

_action = false;
_curLevel = (DS_infoArray select 28);

if(_curLevel == 0)exitwith{hint "You are already on the lowest level"};
_nextLevel = 0;

switch(_curLevel)do
	{
	case 1:
		{
		_nextLevel = 0;
		};
	case 2:
		{
		_nextLevel = 0;
		};
	case 3:
		{
		_nextLevel = 0;
		};
	case 4:
		{
		_nextLevel = 0;
		};
	case 5:
		{
		_nextLevel = 2;
		};
	case 6:
		{
		_nextLevel = 2;
		};
	case 7:
		{
		_nextLevel = 5;
		};
	case 8:
		{
		_nextLevel = 5;
		};
	case 9:
		{
		_nextLevel = 7;
		};
	case 10:
		{
		_nextLevel = 7;
		};
	case 11:
		{
		_nextLevel = 7;
		};
	case 12:
		{
		_nextLevel = 9;
		};
	case 13:
		{
		_nextLevel = 9;
		};
	case 14:
		{
		_nextLevel = 9;
		};
	};
		

_action = [
	format ["Are you sure you wish to lower your trucking level to beginning of the previous tier? You will be lowed to level %1",_nextLevel],
	"Warning!",
	"Continue",
	"No Thanks"
] call BIS_fnc_guiMessage;

if(!_action)exitwith{};

_action = [
	format ["Are you really really really sure you wish to lower your trucking level to beginning of the previous tier? You will be lowed to level %1",_nextLevel],
	"Warning!",
	"Really Continue",
	"Oh No!"
] call BIS_fnc_guiMessage;

if(!_action)exitwith{};

_action = [
	format ["Last chance to make sure you've actually read these.. If you hit yes now, there is no going back! You will be lowed to level %1",_nextLevel],
	"Warning!",
	"OMG NO!",
	"YES FFS"
] call BIS_fnc_guiMessage;

if(_action)exitwith{};

DS_infoArray set [28,_nextLevel];
[] call DS_fnc_compileData;

hint format ["Your trucker level has been lowed to level %1",_nextLevel];