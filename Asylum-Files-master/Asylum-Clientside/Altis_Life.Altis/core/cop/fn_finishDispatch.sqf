/*
	File: fn_finishDispatch.sqf
	Author: John "Paratus" VanderZwet
	
	Description:
	Dispatch task situation completed
*/
private["_id"];
_id = [_this,0,0,[0]] call BIS_fnc_param;
_success = [_this,1,false,[false]] call BIS_fnc_param;

if ((life_dispatch) select 0 != _id) exitWith {};

if (_success) then
{
	hint parseText format ["<t color='#316dff'><t size='2'><t align='center'>Dispatch Report<br/><br/><t size='1'><t color='#33CC33'><t color='#33CC33'>Message:<br/><t color='#ffffff'>You have successfully completed your task, <t color='#00ff00'>%1</t>, and received received a bonus of <t color='#00ff00'>$%2</t>.",life_dispatch select 1, [life_dispatch select 2] call life_fnc_numberText];
	["atm","add",life_dispatch select 2] call life_fnc_uC;
	[player,floor ((life_dispatch select 2) * 0.05),true] call life_fnc_addPrestige;
}
else
{
	hint parseText format ["<t color='#316dff'><t size='2'><t align='center'>Dispatch Report<br/><br/><t size='1'><t color='#33CC33'><t color='#33CC33'>Message:<br/><t color='#ffffff'>You have failed your task, <t color='#00ff00'>%1</t>.  Better luck next time.",life_dispatch select 1];
};

life_dispatch = [0,"",0];
[] call life_fnc_hudUpdate;