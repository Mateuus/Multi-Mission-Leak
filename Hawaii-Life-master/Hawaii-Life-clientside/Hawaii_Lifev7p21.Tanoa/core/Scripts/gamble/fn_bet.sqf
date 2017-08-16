#include "..\..\..\script_macros.hpp"
/*
	File:	fn_bet.sqf
	Date:   31.03.2016
	Author: Patrick "Lucian" Schmidt
	Disclaimer: No one is allowed to use and edit my Script except for the DE100-ALTIS.life,hawaii-life.net server and me.
	
	Description:
	Take a look for yourself.
*/

private["_val","_Startticket","_endTicket","_return","_tmp","_exited"];

if (life_gamble_serverCooldown) exitWith {hint "Aufgrund eines Arma Bugs kann der Hawaii-Jackpot erst 5 Minuten nach dem Start des Servers benutzt werden."};
_val = _this select 0;
if((typeName _val != "SCALAR")) exitWith {hint localize "STR_ATM_notnumeric"};
if (_val < 10000 || _val > 20000000) exitWith {hint "Mindesteinsatz $10,000 Maximaleinsatz $20,000,000"};
if(_val > BANK) exitWith {hint  "Du hast nicht genug Geld auf dem Konto"};
_return = 0;
_exited = false;
if (!isNil {life_gamble_teil}) then {
	if (count life_gamble_teil >= 10) exitWith {hint "Der Hawaii-Jackpot ist schon zu!";_exited = true;};
	if (count life_gamble_teil > 0) then {
		{
			_tmp = _x;
			if ((getPlayerUID player) in _tmp) then {
				_return = _return + 1;
			};
		} forEach life_gamble_teil;
	};
};
if (_exited) exitWith {};
if (_return > 1) exitWith {hint "Du kannst nur 2x in den Hawaii-Jackpot gehen."};
if (!isNil {life_gamble_starttime}) then {
	if (( life_gamble_starttime + 120 - serverTime) >= 10) then {
		_Startticket = life_gamble_amt + 1;
		_endTicket = life_gamble_amt + _val;
		life_gamble_teil pushBack [getPlayerUID player,name player,_Startticket,_endTicket,_val,player];
		SUB(BANK,_val);
		ADD(life_gamble_amt,_val);
		// [5,format["<t size= '1.6' color='#f19727'>Hawaii-Jackpot</t><br/><br/><t size= '1.2'>%1ist mit $%2 in den Hawaii-Jackpot reingegangen.<br/><br/>Aktueller Wert:<br/>$%3</t>",name Player,[_val] call life_fnc_numberText,[life_gamble_amt] call life_fnc_numberText],false] remoteExecCall ["life_fnc_broadcast",RCLIENT];
		//[] spawn life_fnc_RefreshPot;
		PVAR_ALL("life_gamble_teil");
		PVAR_ALL("life_gamble_amt");
	} else {
		hint "Der Hawaii-Jackpot ist schon zu!";
	};
} else {
	SUB(BANK,_val);
	if (life_HC_isActive) then {
		[getPlayerUID player,name player,_val,player] remoteExec ["HC_fnc_startJackpot",HC_Life];
	} else {
		[getPlayerUID player,name player,_val,player] remoteExec ["TON_fnc_startJackpot",RSERV];
	};
};
[1] call SOCK_fnc_updatePartial;