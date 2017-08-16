/*
	File: fn_publicblock.sqf
	Author: Shawn "Huntah" Macgillivray
	
	Description:
	For high ranking cops to enable/disable public cops being able to leave kavala
*/
private["_action","_player"];

_player = (name player);


if(miscInfoArray select 7) then
	{
	miscInfoArray set[7,false];
	publicVariable "miscInfoArray";
	[[_player,"Enabled pub cops to leave the locked areas"],"DS_fnc_DarkSide_ShowAll"] spawn DS_fnc_MP;
	hint "You have Enabled public cops to leave the locked areas";
	}
	else
	{
	miscInfoArray set[7,true];
	publicVariable "miscInfoArray";
	[[_player,"Disable pub cops ability to leave the locked areas"],"DS_fnc_DarkSide_ShowAll"] spawn DS_fnc_MP;
	hint "You have disabled public cops ability to leave the locked areas";
	};