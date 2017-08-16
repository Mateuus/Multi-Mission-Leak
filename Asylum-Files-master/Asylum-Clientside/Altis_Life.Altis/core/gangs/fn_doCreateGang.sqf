/*
	File: fn_doCreateGang.sqf
	Author: John "Paratus" VanderZwet
	
	Description:
	Player submitted new gang name; create it up!
*/

private ["_house","_uid","_owners","_value"];

_house = cursorTarget;
if (!(_house isKindOf "House")) exitWith {};
if (life_gang != "0") exitWith {hint "You are already a member of a gang and cannot create a new one.";};
//if (player distance _house > 20) exitWith {hint "You're too far from the center of the house.";};

_buildingID = [_house] call life_fnc_getBuildID;
if (!(_house in life_houses)) exitWith {hint "You do not own this property!";};

_value = ctrlText 9522;
_len = [_value] call KRON_StrLen;
if(_len > 20) exitWith {hint "The maximum character limit for a gang name is 20."};

[[_value,_house,player],"ASY_fnc_addGang",false,false] spawn life_fnc_MP;