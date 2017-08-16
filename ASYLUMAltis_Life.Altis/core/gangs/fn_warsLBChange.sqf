/*
	File: fn_warsLBChange.sqf
	Author: John "Paratus" VanderZwet
	
	Description:
	Gang war UI label change
*/

private ["_control","_index","_label","_gangId"];

disableSerialization;

ctrlEnable [9582, false]; // Challenge
ctrlEnable [9583, false]; // Accept
ctrlEnable [9584, false]; // Cancel

if (life_gang_rank > 1) exitWith {};

_control = _this select 0;
_index = _this select 1;

_gangId = _control lbData _index;

if (life_gang_rank < 2) then
{
	switch (true) do
	{
		case (_gangId in life_gang_wars) : { ctrlEnable [9584, true]; };
		case (_gangId in life_gang_challenges) : { ctrlEnable [9583, true]; };
		default { ctrlEnable [9582, true]; };
	};
};