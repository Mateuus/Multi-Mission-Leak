/*
	Darkside Life

	Author: Shawn "Huntah" Macgillivray

	Description:
	Removes someones bounty
*/

private ["_uid","_charge","_type","_bounty","_current","_arrayToEnter","_found","_fail","_tempArray"];

_uid = (getPlayerUID player);

DS_wanted_stats = [0];
player setVariable["bounty",0,true];

{
	if(_uid == (_x select 0))then
		{
		DS_wantedList set [_forEachIndex,-1];
		DS_wantedList = DS_wantedList - [-1];
		publicVariable "DS_wantedList";
		};
}forEach DS_wantedList;

[] call DS_fnc_compileData;