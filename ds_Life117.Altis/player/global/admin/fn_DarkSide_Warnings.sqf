/*
	File: fn_DarkSide_Warnings.sqf
	Author: Shawn "Huntah" Macgillivray
	
	Description:
	Plays warning message to players when admins activate it
*/

private ["_message"];

_message = _this select 0;

player say3D "AdminWarning";

_str = parseText format ["<t color='#0101DF' size='1.5'><br/>Admin Alert<br/><br/>Global Warning</t><br/><br/>%1",_message];
hint _str;
systemchat format ["%1",_message];
titleText [format ["%1", _message],"plain down"];