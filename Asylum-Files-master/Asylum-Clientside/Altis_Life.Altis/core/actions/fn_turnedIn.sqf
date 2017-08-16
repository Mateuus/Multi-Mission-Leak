/*
	File: fn_turnedIn.sqf
	Author: John "Paratus" VanderZwet
	
	Description:
	Wanted player has turned themselves in!
*/

private ["_jail"];

_jail = [_this,3,false,[false]] call BIS_fnc_param;
if (life_wanted < 1) exitWith {};
if(player getVariable["parole",time] > time) exitWith {hint "Turning yourself in is not available while on parole"};
if (_jail && life_wanted > 100000) exitWith { hint "You cannot turn yourself in to jail at this time.  Pay your warrant value in full instead." };
_handle = scriptNull;
if(_jail) then {_handle = ["<t align='center'>Are you sure you want to turn yourself in and go to prison?</t>"] spawn life_fnc_confirmMenu;}
else {_handle = [format["<t align='center'>You are currently wanted for <t color='#FF0000'>$%1</t>! Pay this off in full now?</t>", [life_wanted] call life_fnc_numberText]] spawn life_fnc_confirmMenu;};
waitUntil {scriptDone _handle};
if(!life_confirm_response) exitWith {};

if (_jail) then
{
	[player] call life_fnc_jail;
}
else
{
	if (life_atmmoney >= life_wanted) then
	{
		[[getPlayerUID player],"life_fnc_wantedPardon",false,false] spawn life_fnc_MP;
		["atm","take",life_wanted] call life_fnc_uC;
		hint "You are free to go. Stay out of trouble!";
	}
	else
	{
		hint "You cannot afford to pay your fines in full.  Consider serving a prison sentence.";
	};
};