//this addAction ["<t color='#0099FF'>Usiądź</t>","Chair\sitdown.sqf","",0,false,false,"",'player distance _target < 2 && !(_target getVariable["occupied",false]) && isNil "life_sitting_chair" && isNil "life_action_standup"'];
_chair = _this select 0;
_unit = _this select 1;
_chair setVariable["occupied",true,true];

_dir = switch (typeOf _chair) do
{
	case "Land_ChairPlastic_F": { 270 };
	case "Land_Bench_F": { 90 };
	default { 180 };
};

_z = switch (typeOf _chair) do
{
	case "Land_Bench_01_F" : { -0.5 };
	default { 0 };
};


[_unit,"Crew","switch",0] remoteExec ["life_fnc_animSync",0];
waitUntil {animationState player == "crew"};
_unit setPos [(getPosATL _chair select 0),(getPosATL _chair select 1),(getPosATL _chair select 2)-_z];
_unit setDir ((getDir _chair) - _dir);
life_action_standup = _unit addaction ["<t color='#0099FF'>Wstań</t>","Chair\standup.sqf"];
life_sitting_chair = _chair;
_unit setposatl [getPosATL _unit select 0, getPosATL _unit select 1,((getPosATL _unit select 2))];