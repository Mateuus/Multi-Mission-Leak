/*
	File: fn_eatFood.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Main handling system for eating food.
	*Needs to be revised and made more modular and more indept effects*
*/
private["_food","_val","_sum"];
_food = [_this,0,"",[""]] call BIS_fnc_param;
if(_food == "") exitWith {};
_val = 10;

if([false,_food,1] call life_fnc_handleInv) then {
	switch (_food) do
	{
		case "apple": {_val = 10};
		case "rabbitp":{ _val = 20};
		case "dogp": {_val = 30};
		case "chickenp": {_val = 20};
		case "salema": {_val = 30};
		case "ornate": {_val = 25};
		case "mackerel": {_val = 30};
		case "tuna": {_val = 100};
		case "mullet": {_val = 80};
		case "catshark": {_val = 100};
		case "turtle": {_val = 100};
		case "turtlesoup": {_val = 100};
		case "donuts": {_val = 30};
		case "banana": {_val = 40};
		case "tbacon": {_val = 40};
		case "peach": {_val = 10};
		case "ginger": {_val = 5};
		case "berry": {_val = 5; life_thirst = life_thirst + 5; if (life_thirst > 100) then { life_thirst = 100 };};
		case "redburger": {if (life_smoking) then {systemChat "You satisfy the munchies."; _val = 80} else {_val = 40}};
		case "toasty": {if (life_smoking) then {systemChat "You satisfy the munchies."; _val = 80} else {_val = 40}};
		case "sandwich": {if (life_smoking) then {systemChat "You satisfy the munchies."; _val = 80} else {_val = 40}};
	};

	_sum = life_hunger + _val;
	if(_sum > 100) then {_sum = 100; player setFatigue 1; hint "You have over eaten, you are now feeling fatigued.";};
	life_hunger = _sum;
};