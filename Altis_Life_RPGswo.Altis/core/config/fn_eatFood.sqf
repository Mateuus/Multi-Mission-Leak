#include "..\..\macros.hpp"
/*
	File: fn_eatFood.sqf
	Author: Bryan "Tonic" Boardwine
	Modyfied by: MarkusSR1984 (Division Wolf e.V.)
	
	Description:
	Main handling system for eating food.
	*Needs to be revised and made more modular and more indept effects*
*/
private["_food","_hungerDiff","_hungerSum","_thirstDiff","_thirstSum","_drink","_eat"];
_food = param [0,"",[""]];
if(_food == "") exitWith {};

_takeableDrugItems = ["beer","vodka","moonshine","cocainp","marijuana","heroinp","cocainep","meth","dmt","zauberpilz","schlafmohnp","methge","dmtge","cocainege","heroinge","marijuanage","zauberpilzge","heroinsp","joint","schlafmohnstreck"];
_drink = M_CONFIG(getNumber,"VirtualItems",_food,"drink");
if (!(_drink isEqualTo -1)) then{_thirstDiff = _drink;} else {_thirstDiff = 0;};
_eat = M_CONFIG(getNumber,"VirtualItems",_food,"edible");
if (!(_eat isEqualTo -1)) then{_hungerDiff = _eat;} else {_hungerDiff = 0;};

if([false,_food,1] call DWEV_fnc_handlelnv) then 
{
	if ((_thirstDiff >= 30) && !(_food IN _takeableDrugItems)) then {player setFatigue 0;};
	_thirstSum = (DWEV_thirst + _thirstDiff);
	if (_thirstSum >= 100) then {_thirstSum = 100; if !(_food IN _takeableDrugItems) then {player setFatigue 0;};};
	DWEV_thirst = _thirstSum;
	
	_hungerSum = DWEV_hunger + _hungerDiff;
	if(_hungerSum > 100) then {_hungerSum = 100; player setFatigue 1; hint "Du hast zuviel gegessen und fühlst dich müde.";};
	DWEV_hunger = _hungerSum;
	
	if (_food IN _takeableDrugItems) then
	{
		[_food] call DWEV_fnc_takeDrugs;
	};
};