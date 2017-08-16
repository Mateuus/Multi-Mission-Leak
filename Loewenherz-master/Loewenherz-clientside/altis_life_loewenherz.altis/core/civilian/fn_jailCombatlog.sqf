/*
	File: fn_jailCombatlog.sqf
	Author Barney

	Description:
	Go home Description, you´re drunk
*/


private ["_player","_time","_gefangene","_handle","_countDown"];
_player = param [0,objNull,[objNull]];
_time = 30 * 60;
LHM_jailcombatlog = true;
lhm_cash = 0;

[] spawn {
		waitUntil {sleep 1;LHM_initDone};
		lhm_hunger = 100;
		lhm_thirst = 100;
		lhm_cash = 0;
		{missionNamespace setVariable[_x,0];} foreach lhm_inv_items;
};

_gefangene = CombatlogJail getVariable ["Gefangene",[]];

if(!((getPlayerUID player) in _gefangene)) then {
	_gefangene pushback (getPlayerUID player);
};
CombatlogJail setVariable ["Gefangene",_gefangene,true];
_handle = [] spawn lhm_fnc_stripDownPlayer;
waitUntil {scriptDone _handle};
player forceAddUniform "U_C_Scientist";

player setposatl [3289.68,13168.3,0.811114];


While {true} do {
	_countDown = [_time,"MM:SS"] call BIS_fnc_secondsToString;
	hintsilent format["Deine Coolness kommt wieder in: \n %1",_countDown];
	if(!LHM_jailcombatlog) exitWIth {hint ""};
	if(((getposatl player) distance [3289.68,13168.3,0.811114]) > 14 ) then {
		player setposatl [3289.68,13168.3,0.811114];
	};
	if(_time <= 0) exitWith {hint ""};
	sleep 1;
	_time = _time - 1;
	if(!alive player) exitWIth {hint ""};
};

_gefangene = CombatlogJail getVariable ["Gefangene",[]];
_gefangene = _gefangene - [getPlayerUID player];
CombatlogJail setVariable ["Gefangene",_gefangene,true];
LHM_jailcombatlog = false;


lhm_is_arrested = 0;
player setposatl [3278.07,13175.7,0.00155067];
[5] call SOCK_fnc_updatePartial;
if(!alive player) exitWIth {hint ""};
hint "Du bist jetzt frei";