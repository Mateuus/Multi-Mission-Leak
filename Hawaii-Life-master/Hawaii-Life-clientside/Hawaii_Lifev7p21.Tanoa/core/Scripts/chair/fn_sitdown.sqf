#include "..\..\..\script_macros.hpp"
private ["_chair","_unit"];
_chair = _this select 0;
_unit = _this select 1; 

if ((_unit distance _chair) > 3) exitWith {
	hint "Du bist zu weit weg";
};

[_unit,"Crew"] remoteExecCall ["life_fnc_animSync",RCLIENT];
_unit setPosATL (getPosATL _chair);
_unit setDir ((getDir _chair) - 180);
player removeAction standup;
standup = _unit addAction ["<t color='#0033CC'>Aufstehen</t>",life_fnc_standup];
_unit setPosATL [getPosATL _unit select 0, getPosATL _unit select 1,((getPosATL _unit select 2) + 1)];