/*
	Author: Shawn "Huntah" Macgillivray
	
	Description:
	Adjust a players view distance
*/

private ["_dialog","_tstatusNew","_mode","_temp","_value"];
disableSerialization;

_value = [_this,0,-1,[0]] call BIS_fnc_param;
if(_value == -1) exitWith {};
DS_viewDistance = (_value*1000);
if(DS_viewDistance < 1)then
	{
	ctrlSetText[10011,"View Distance: Default"];
	}
	else
	{
	ctrlSetText[10011,format["View Distance: %1m",round(DS_viewDistance)]];
	};
setViewDistance DS_viewDistance;
