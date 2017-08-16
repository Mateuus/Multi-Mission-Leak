/*
	Darkside Life

	Author: Shawn "Huntah" Macgillivray

	Description:
	Restrains target
*/

private ["_unit","_targets"];

_unit = cursorTarget;

if(isNull _unit)exitWith{};
if(player distance _unit > 4)exitWith{};
if(_unit getVariable ["restrained",false])exitWith{};
if((side _unit) isEqualTo west)exitWith{};
if(player isEqualTo _unit)exitWith{};
if(!isPlayer _unit)exitWith{};

_unit setVariable ["restrained",true,true];
_unit setVariable ["restrainer",player,true];
_unit setVariable ["surrender",false,true];

[0,player] remoteExec ["DS_fnc_restrained",_unit];

hint format ["You have restrained %1",(name _unit)];
systemChat format ["You have restrained %1",(name _unit)];
titleText [format ["You have restrained %1",(name _unit)],"PLAIN DOWN"];

_targets = allPlayers select {(_x distance player) < 50};
[player,"cuff"] remoteExecCall ["DS_fnc_playSounds",_targets];

if(playerSide isEqualTo west)then {
	[0,format ["Officer %1 has restrained %2",profileName,(name _unit)]] remoteExecCall ["DS_fnc_globalMessage",west];
} else {
	[0,format ["Security Contractor %1 has restrained %2",profileName,(name _unit)]] remoteExecCall ["DS_fnc_globalMessage",west];
};

if(player getVariable ["security",false])then {
	_targets = allPlayers select {_x getVariable ["security",false]};
	[0,format ["Security Contractor %1 has restrained %2",profileName,(name _unit)]] remoteExecCall ["DS_fnc_globalMessage",_targets];
};