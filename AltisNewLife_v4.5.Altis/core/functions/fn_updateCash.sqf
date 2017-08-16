private ["_type","_modifier","_amount"];
_type = _this select 0;
_modifier = _this select 1;
_amount = _this select 2;
if (_type == "atm") then {
	if (_modifier == "add") then {
		compte_banque = compte_banque + _amount;
		//[[1, player, format["ATM: Added %1 and now has %2",_amount,compte_banque]],"ASY_fnc_logIt",false,false] spawn BIS_fnc_MP;
	};
	if (_modifier == "take") then {
		compte_banque = compte_banque - _amount;
		//[[1, player, format["ATM: Removed %1 and has %2 remaining",_amount,compte_banque]],"ASY_fnc_logIt",false,false] spawn BIS_fnc_MP;
	};
	if (_modifier == "set") then {
		compte_banque = _amount;
		//[[1, player, format["ATM: Set to the amount of %1",compte_banque]],"ASY_fnc_logIt",false,false] spawn BIS_fnc_MP;
	};
	compte_banqueCache = (compte_banque / 2) + 3;
};

if (_type == "cash") then {
	if (_modifier == "add") then {
		argent_liquide = argent_liquide + _amount;
		//[[1, player, format["Cash: Added %1 and now has %2",_amount,argent_liquide]],"ASY_fnc_logIt",false,false] spawn BIS_fnc_MP;
	};
	if (_modifier == "take") then {
		argent_liquide = argent_liquide - _amount;
		//[[1, player, format["Cash: Removed %1 and has %2 remaining",_amount,argent_liquide]],"ASY_fnc_logIt",false,false] spawn BIS_fnc_MP;
	};
	if (_modifier == "set") then {
		argent_liquide = _amount;
		//[[1, player, format["Cash: Set to the amount of %1",argent_liquide]],"ASY_fnc_logIt",false,false] spawn BIS_fnc_MP;
	};
	argent_liquideCache = (argent_liquide / 2) + 5;
};