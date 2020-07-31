/*
sharp melee hit
*/
private["_curWep","_curMags","_attach"];
params [["_unit", objNull, [objNull]], ["_shooter", objNull, [objNull]]];
if(isNull _unit OR isNull _shooter) exitWith {player allowDamage true; life_istazed = false;};
if(deadPlayer) exitWith {};

_koildebs = player getVariable ["EMSON", 2];

if(_koildebs == 1) exitWith {};

if(_shooter isKindOf "Man" && !deadPlayer) then
{
	["Remove",0.015] call fnc_doHealth;
};