/*
	File: fn_updateCash.sqf
	Author: Skalicon
	
	Description:
	Updates the players Inventory and ATM cash.
*/
private ["_type","_modifier","_amount"];
_type = _this select 0;
_modifier = _this select 1;
_amount = _this select 2;
/*
if ((GTA_money_cashCache != (GTA_money_cash / 2) + 5) || (GTA_money_bankCache != (GTA_money_bank / 2) + 3)) exitWith
{
	[] spawn 
	{
		[[1, format["The Asylum server has detected %1 (ID %2) hacking money. Please report this to an administrator.", name player, getPlayerUID player]],"life_fnc_broadcast",nil,false] spawn BIS_fnc_MP;
		sleep 3;
		endMission "Loser";
	};
};
*/
if (_type == "atm") then {
	if (_modifier == "add") then {
		GTA_money_bank = GTA_money_bank + _amount;
		//[[1, player, format["ATM: Added %1 and now has %2",_amount,GTA_money_bank]],"ASY_fnc_logIt",false,false] call GTA_fnc_remoteExec;
	};
	if (_modifier == "take") then {
		GTA_money_bank = GTA_money_bank - _amount;
		//[[1, player, format["ATM: Removed %1 and has %2 remaining",_amount,GTA_money_bank]],"ASY_fnc_logIt",false,false] call GTA_fnc_remoteExec;
	};
	if (_modifier == "set") then {
		GTA_money_bank = _amount;
		//[[1, player, format["ATM: Set to the amount of %1",GTA_money_bank]],"ASY_fnc_logIt",false,false] call GTA_fnc_remoteExec;
	};
	GTA_money_bankCache = (GTA_money_bank / 2) + 3;
};

if (_type == "cash") then {
	if (_modifier == "add") then {
		GTA_money_cash = GTA_money_cash + _amount;
		//[[1, player, format["Cash: Added %1 and now has %2",_amount,GTA_money_cash]],"ASY_fnc_logIt",false,false] call GTA_fnc_remoteExec;
	};
	if (_modifier == "take") then {
		GTA_money_cash = GTA_money_cash - _amount;
		//[[1, player, format["Cash: Removed %1 and has %2 remaining",_amount,GTA_money_cash]],"ASY_fnc_logIt",false,false] call GTA_fnc_remoteExec;
	};
	if (_modifier == "set") then {
		GTA_money_cash = _amount;
		//[[1, player, format["Cash: Set to the amount of %1",GTA_money_cash]],"ASY_fnc_logIt",false,false] call GTA_fnc_remoteExec;
	};
	GTA_money_cashCache = (GTA_money_cash / 2) + 5;
};




