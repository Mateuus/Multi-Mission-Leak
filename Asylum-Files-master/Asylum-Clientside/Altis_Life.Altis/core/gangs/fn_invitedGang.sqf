/*
	File: fn_invitedGang.sqf
	Author: John "Paratus" VanderZwet
	
	Description:
	Received an invitation to join a gang
*/

private ["_unit","_id","_name"];

_unit = [_this,0,objNull,[objNull]] call BIS_fnc_param;
_id = [_this,1,"",[""]] call BIS_fnc_param;
_name = [_this,2,"",[""]] call BIS_fnc_param;

[[1,2], format["%1 has sent you an invitation to join the gang, %2. Press 9 within 30 seconds to accept!", name _unit, _name]] spawn life_fnc_broadcast;

life_gang_invited = time;
life_gang_invite = _id;
life_gang_invite_name = _name;