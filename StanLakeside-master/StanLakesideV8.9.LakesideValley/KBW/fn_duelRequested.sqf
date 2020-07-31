/*
fn_duelrequested.sqf
Kevin Webb
Tells us someone wants to 1v1 us bro
*/
if(dialog) then {closeDialog 0};
params [["_dueler", objNull, [objNull]], ["_stake", 0, [0]], ["_point", [], [[]]]];

if(_stake > cash_in_bank) exitWith {
	[format["%1 challenged you to a race, however you did not have enough funds to meet the stake",name _dueler], false] spawn domsg;
};
_wording = format[
"%1 has requested to race you; the stake in this race is set at $%2. It looks like the race endpoint is %3 meters from here. Do you accept?",
name _dueler,
[_stake] call life_fnc_numberText,
round(player distance _point)
];
_action = [
	_wording,
	"1v1 me bro!",
	"Yes",
	"No"
] call BIS_fnc_guiMessage;
life_racers = [];
if(_action) then {
	[str player + "racer",1] remoteExecCall ["life_fnc_netSetVar",_dueler];
	vehicle player enableSimulation false;
	[] spawn {uiSleep 29; vehicle player enableSimulation true}; //failsafe!
	["Race accepted! Please wait for the race to begin.", false] spawn domsg;
} else {
	[str player + "racer",-1] remoteExecCall ["life_fnc_netSetVar",_dueler];
};