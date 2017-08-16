/*
	File: fn_drugUsed.sqf
	Author: John "Paratus" VanderZwet / cptjames32
	
	Description:
	Took things a little too far!
*/

_item = _this select 0;

_index = switch (_item) do
{
	case "marijuana": { 0 };
	case "marijuanam": { 0 };
	case "cocainep": { 1 };
	case "heroinp": { 2 };
	case "meth": { 3 };
};

_addInc = switch (_item) do
{
	case "marijuana": { 0.03 };
	case "marijuanam": { 0.05 };
	case "cocainep": { 0.1 };
	case "heroinp": { 0.1 };
	case "meth": { 0.3 };
};

_add = life_addiction select _index;
if (_add > 0.9) then { life_drug_withdrawl = false; };
_add = _add + _addInc;
if (_add > 1) then { _add = 1; };
life_addiction set [_index, _add];
life_used_drug set [_index, time];

if (life_drug_level > 0.9) then
{
	_od = random 1;
	if (_od > 0.6) then { [] spawn life_fnc_overdose; };
};