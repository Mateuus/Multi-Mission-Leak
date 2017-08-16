/*
	File: fn_showBroadcast.sqf
	Author: John "Paratus" VanderZwet
	
	Description:
	Show the AAN ticker
*/

disableserialization;

_header = _this select 0;
_line = _this select 1;
_from = _this select 2;

70 cutrsc ["rscAAN","plain"];
_display = uinamespace getvariable "BIS_AAN";
_textHeader = _display displayctrl 3001;
_textHeader ctrlsetstructuredtext parseText format["<t size='2'>%1</t><br />A paid message from %2", _header, _from];
_textHeader ctrlcommit 0;

_textLine = _display displayctrl 3002;
_textLine ctrlsetstructuredtext parseText format["              %1          %1", _line];
_textLine ctrlcommit 0;
_textLinePos = ctrlposition _textLine;
_textLinePos set [0,-100];
_textLine ctrlSetPosition _textLinePos;
_textLine ctrlcommit 1500;

_textClock = _display displayctrl 3003;
_textClock ctrlsettext ([daytime,"HH:MM"] call bis_fnc_timetostring);
_textClock ctrlcommit 0;

sleep 20;
70 cutText ["", "plain"];