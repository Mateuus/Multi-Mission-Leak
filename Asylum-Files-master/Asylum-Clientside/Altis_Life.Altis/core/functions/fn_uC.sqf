/*
	File: fn_uC.sqf
	Author: Skalicon / Paratus
	
	Description:
	Updates the players Inventory and ATM cash.
*/
if (X_Server) exitWith {};

private ["_type","_modifier","_amount","_banned"];
_type = _this select 0;
_modifier = _this select 1;
_amount = _this select 2;

if ((life_moneyCache != (life_money / 2) + 5) || (life_atmmoneyCache != (life_atmmoney / 2) + 3)) exitWith
{
	[] spawn 
	{
		life_corruptData = true;
		[[911, player, "Money MEMORY HACK! Ban!"],"ASY_fnc_logIt",false,false] spawn life_fnc_MP;
		//sleep 4;
		//[[name player],"ASY_fnc_banPlayer",false,false] spawn life_fnc_MP;
	};
};

if (_type == "atm") then {
	if (_modifier == "add") then {
		life_atmmoney = life_atmmoney + _amount;
		if (life_atmmoney > 1000000) then
		{
			_preCap = life_atmmoney;
			life_atmmoney = 1000000;
			life_wealthPrestige = life_wealthPrestige + (_preCap - 1000000);
			[] call life_fnc_achievementScan;
		};
		//[[1, player, format["ATM: Added %1 and now has %2",_amount,life_atmmoney]],"ASY_fnc_logIt",false,false] spawn life_fnc_MP;
	};
	if (_modifier == "take") then {
		life_atmmoney = life_atmmoney - _amount;
		//[[1, player, format["ATM: Removed %1 and has %2 remaining",_amount,life_atmmoney]],"ASY_fnc_logIt",false,false] spawn life_fnc_MP;
	};
	if (_modifier == "set") then {
		life_atmmoney = _amount;
		//[[1, player, format["ATM: Set to the amount of %1",life_atmmoney]],"ASY_fnc_logIt",false,false] spawn life_fnc_MP;
	};
};

if (_type == "cash") then {
	if (_modifier == "add") then {
		life_money = life_money + _amount;
		//[[1, player, format["Cash: Added %1 and now has %2",_amount,life_money]],"ASY_fnc_logIt",false,false] spawn life_fnc_MP;
	};
	if (_modifier == "take") then {
		life_money = life_money - _amount;
		//[[1, player, format["Cash: Removed %1 and has %2 remaining",_amount,life_money]],"ASY_fnc_logIt",false,false] spawn life_fnc_MP;
	};
	if (_modifier == "set") then {
		life_money = _amount;
		//[[1, player, format["Cash: Set to the amount of %1",life_money]],"ASY_fnc_logIt",false,false] spawn life_fnc_MP;
	};
};

life_atmmoneyCache = (life_atmmoney / 2) + 3;
life_moneyCache = (life_money / 2) + 5;
[] spawn life_fnc_sessionUpdate;