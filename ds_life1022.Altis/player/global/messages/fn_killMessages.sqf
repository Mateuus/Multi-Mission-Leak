/*
	Darkside Life

	Author: Shawn "Huntah" Macgillivray

	Description:
	Displays custom kill messages
*/

private ["_myGang","_killersGang","_targets"];

params [["_killer",objNull,[objNull]]];

_myGang = (group player) getVariable "gangName";
_killersGang = (group _killer) getVariable "gangName";

//Officer kills gang members
if(((side _killer) isEqualTo west)&&(!isNil "_myGang"))exitWith {
	_targets = allPlayers select {(((_x distance player) < 3000)||((group player) isEqualTo (group _x)))||((side _x) isEqualTo west)};
	[0,format ["(Officer) %1 has just killed %2 (%3)",name _killer,name player,_myGang]] remoteExecCall ["DS_fnc_globalMessage",_targets];
};

//Officer kills non-gang members
if((side _killer) isEqualTo west)exitWith {
	_targets = allPlayers select {(((player distance _x) < 3000)||((group player) isEqualTo (group _x)))||((side _x) isEqualTo west)};
	[0,format ["(Officer) %1 has just killed %2",name _killer,name player]] remoteExecCall ["DS_fnc_globalMessage",_targets];
};

//Officer killed by gang member
if((playerSide isEqualTo west)&&(!isNil "_killersGang"))exitWith {
	_targets = allPlayers select {((player distance _x) < 3000)||((group _killer) isEqualTo (group _x))||((side _x) isEqualTo west)};
	[0,format ["%1 (%3) has just killed (Officer) %2",name _killer,name player,_killersGang]] remoteExecCall ["DS_fnc_globalMessage",_targets];
};

//Officer killed by non-gang member
if(playerSide isEqualTo west)exitWith {
	_targets = allPlayers select {((player distance _x) < 3000)||((side _x) isEqualTo west)};
	[0,format ["%1 has just killed (Officer) %2",name _killer,name player]] remoteExecCall ["DS_fnc_globalMessage",_targets];
};

//Check if no gangs
if(isNil "_myGang")then{_myGang = "No Gang"};
if(isNil "_killersGang")then{_killersGang = "No Gang"};
if(playerSide isEqualTo independent)then{_myGang = "WL Civ"};
if((side _killer) isEqualTo independent)then{_killersGang = "WL Civ"};

if(DS_headShot)then {
	_targets = allPlayers select {((_x distance player) < 3000)||((group player) isEqualTo (group _x))||((group _killer) isEqualTo (group _x))};
	[0,format ["%1 (%2) has just killed %3 (%4)  --! HEAD SHOT !--",name _killer,_killersGang,name player,_myGang]] remoteExecCall ["DS_fnc_globalMessage",_targets];
} else {
	_targets = allPlayers select {((_x distance player) < 3000)||((group player) isEqualTo (group _x))||((group _killer) isEqualTo (group _x))};
	[0,format ["%1 (%2) has just killed %3 (%4)",name _killer,_killersGang,name player,_myGang]] remoteExecCall ["DS_fnc_globalMessage",_targets];
};