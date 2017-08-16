/*
	File: fn_robSuccess.sqf
	Author: John "Paratus" VanderZwet
	
	Description:
	Robbed a store.. give money!
*/
private["_unit","_x","_robber","_lastRobbed","_success","_rnd"];
_cash = [_this,0,0,[0]] call BIS_fnc_param;
_success = [_this,1,false,[false]] call BIS_fnc_param;

if (_success) then
{
	if (42 in life_talents) then
	{
		_rnd = random 0.201;
		_cash = _cash + (_cash * _rnd);
	};
	hint format["You have robbed the store of $%1!",[_cash] call life_fnc_numberText];
	["cash","add",_cash] call life_fnc_uC;
}
else
{
	hint "You failed to rob the store!";
};