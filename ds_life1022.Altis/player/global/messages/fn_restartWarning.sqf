/*
	Darkside Life

	Author: Shawn "Huntah" Macgillivray

	Description:
	Displays on screen timers for many things
*/

private ["_displayStr"];

_displayStr = "";

switch(_this)do
	{
	case 30:
		{
		_displayStr = "The server will be restarting in 30 minutes. Please finish what you are doing as soon as possible";
		};
	case 25:
		{
		_displayStr = "The server will be restarting in 25 minutes. Please finish what you are doing as soon as possible";
		};
	case 20:
		{
		_displayStr = "The server will be restarting in 20 minutes. Please finish what you are doing as soon as possible";
		};
	case 15:
		{
		_displayStr = "The server will be restarting in 15 minutes. Please finish what you are doing as soon as possible";
		};
	case 10:
		{
		_displayStr = "The server will be restarting in 10 minutes. Please finish what you are doing as soon as possible";
		};
	case 5:
		{
		_displayStr = "The server will be restarting in 5 minutes. Please finish what you are doing as soon as possible";
		};
	case 0:
		{
		_displayStr = "The server will be restarting at any time now, do not begin anything important";
		[] call DS_fnc_compileData;
		};
	case 666:
		{
		_displayStr = "The pending server restart has been cancelled, you may carry on as per normal";
		};
	};

if(_displayStr == "")exitwith{};

player say3D "Alert";
systemchat format ["%1",_displayStr];
hint format ["%1",_displayStr];
titleText [format["%1",_displayStr], "PLAIN DOWN", 1];
sleep 2;
systemchat format ["%1",_displayStr];
hint format ["%1",_displayStr];