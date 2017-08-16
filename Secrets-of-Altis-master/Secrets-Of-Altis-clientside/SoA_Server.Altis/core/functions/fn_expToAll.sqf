/*

		fn_expToAll.sqf
		Author: G00golplexian
		
		Description: Gives everybody or determined person XP.
*/

private["_exp","_check"];
_exp = _this select 0;
_check = _this select 1;

switch(_check) do {
	case 0: {life_exp = life_exp + _exp;};
	case 1: {if(life_level < 6) then {life_exp = life_exp - (_exp/4)} else {life_exp = life_exp - _exp}};
	case 2: {life_exp = _exp};
};

[] spawn life_fnc_exptolevel;