/*
	Author: Shawn "Huntah" Macgillivray
	
	Description:
	Adds variables to an npc
*/
private["_npc","_infoArray","_type"];

_npc = _this select 0;
_infoArray = _this select 1;
_type = _this select 2;

if(_type == 0)then
	{
	_npc setVariable ["lastUser",(name player),true];
	};
	


			