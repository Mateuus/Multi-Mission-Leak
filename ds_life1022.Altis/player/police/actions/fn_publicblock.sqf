/*
	Darkside Life

	Author: Shawn "Huntah" Macgillivray

	Description:
	For high ranking cops to enable/disable public cops being able to leave Kavala
*/

private["_action","_player"];

_player = (name player);

if(miscInfoArray select 7) then
	{
	miscInfoArray set[7,false];
	publicVariable "miscInfoArray";
	hint "You have enabled public cops to leave the locked areas";
	}
	else
	{
	miscInfoArray set[7,true];
	publicVariable "miscInfoArray";
	hint "You have disabled public cops ability to leave the locked areas";
	};