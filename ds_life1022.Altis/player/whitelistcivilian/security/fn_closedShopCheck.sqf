/*
	Darkside Life

	Author: Shawn "Huntah" Macgillivray

	Description:
	Checks a closed shop and sees if it should instead be opened
*/

private ["_security"];

_security = {(_x distance player < 150)&&(_x getVariable ["security",false])} count allPlayers;

if(!(_security isEqualTo 0))exitWith{};

switch(true)do {
	case (player distance gasdesk1 < 150): {_station = gasdesk1};
	case (player distance gasdesk2 < 150): {_station = gasdesk2};
	case (player distance gasdesk3 < 150): {_station = gasdesk3};
	case (player distance gasdesk4 < 150): {_station = gasdesk4};
	case (player distance gasdesk5 < 150): {_station = gasdesk5};
	case (player distance gasdesk6 < 150): {_station = gasdesk6};
	case (player distance gasdesk7 < 150): {_station = gasdesk7};
	case (player distance gasdesk8 < 150): {_station = gasdesk8};
	case (player distance gasdesk9 < 150): {_station = gasdesk9};
	case (player distance gasdesk10 < 150): {_station = gasdesk10};
	default {_station = 0};
};

if(_station isEqualTo 0)exitWith{};

_station setVariable ["closed",false,true];