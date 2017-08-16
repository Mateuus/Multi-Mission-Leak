/*
	File: fn_buyLottery.sqf
	Author: John "Paratus" VanderZwet
	
	Description:
	Prompt to buy a lottery ticket and process order if confirmed
*/
_jackpot = life_configuration select 8;
if (_jackpot < 25) then { _jackpot = 25 };

[format["<t align='center'>The current jackpot is <t color='#00FF00'>$%1</t>! Would you like to buy a ticket (for $2,000) now?</t>", [_jackpot * 1000] call life_fnc_numberText]] call life_fnc_confirmMenu;
if(!life_confirm_response) exitWith {};

if(!([2000] call life_fnc_debitCard)) exitWith {systemChat "You do not have enough money to purchase a lottery ticket, peasant."};

[[player],"ASY_fnc_addToLottery",false,false] spawn life_fnc_MP;