/*
	Darkside Life

	Author: Shawn "Huntah" Macgillivray

	Description:
	Knocks this person out
*/

private ["_targets","_obj","_time"];

params [
	["_victim",objNull,[objNull]],
	["_attacker","",[""]]
];

if(isNull _victim)exitWith{};
if(!(_victim isEqualTo player))exitWith{};
if(_attacker isEqualTo "")exitWith{};

[true] call DS_fnc_disableUserInput;

titleText [format ["%1 has knocked you out",_attacker],"PLAIN"];

_targets = allPlayers select {(_x distance player) < 50};
[player,"punchBreak"] remoteExecCall ["DS_fnc_playSounds",_targets];

player setVariable ["surrender",true,true];
player playMoveNow "Incapacitated";

_obj = "Land_ClutterCutter_small_F" createVehicle [0,0,0];
_obj setPosATL (getPosATL player);
player attachTo [_obj,[0,0,0]];

sleep 5;
_time = diag_tickTime + 10;
waitUntil {(diag_tickTime > _time)||(player getVariable ["restrained",false])};

player playMoveNow "AmovPpneMstpSrasWrflDnon";
//[player,"AidlPpneMstpSnonWnonDnon_AI"] remoteExecCall ["DS_fnc_animSync",_targets];

[false] call DS_fnc_disableUserInput;
if(!(player getVariable ["escorted",false]))then{detach player;};
deleteVehicle _obj;
player setVariable ["robbed",false,true];
player setVariable ["surrender",false,true];