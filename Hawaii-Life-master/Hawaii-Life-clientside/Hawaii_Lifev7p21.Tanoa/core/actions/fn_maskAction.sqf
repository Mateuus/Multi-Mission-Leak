/*
	File: fn_maskAction.sqf
	Author: Larry aka. Tim
*/
private["_unit"];
params [
	["_unit",objNull,[objNull]]
];

_unit setVariable["masked",true,true];
[player] remoteExecCall ["life_fnc_masked",_unit];
hint "Du hast ihm eine Maske ueber den Kopf gezogen. Er kann nun nichts mehr sehen.";