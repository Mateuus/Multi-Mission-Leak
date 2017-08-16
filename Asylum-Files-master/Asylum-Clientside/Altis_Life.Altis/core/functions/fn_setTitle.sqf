/*
	File: fn_setTitle.sqf
	Author: John "Paratus" VanderZwet
	
	Description:
	Sets player title for display and persistence
*/

private["_title"];
_title = [_this,0,"No Title",[""]] call BIS_fnc_param;

if (_title == "No Title") then
{
	player setVariable ["life_title", nil, true];
}
else
{
	player setVariable ["life_title", _title, true];
};