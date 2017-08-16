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

if([false,_food,1] call life_fnc_handleInv) then {
	switch (_food) do
	{
		case "apple": {_val = 10};
		case "rabbit":{ _val = 20};
		case "salema": {_val = 30};
		case "ornate": {_val = 25};
		case "mackerel": {_val = 30};
		case "tuna": {_val = 100};
		case "mullet": {_val = 80};
		case "catshark": {_val = 100};
		case "turtle": {_val = 100};
		case "turtlesoup": {_val = 100};
		case "donuts": {_val = 30};
		case "tbacon": {_val = 40};
		case "peach": {_val = 10};
		case "eis": {_val = 25};
		case "joghurt": {_val = 25};
		case "henmeat": {_val = 30};
		case "roostermeat": {_val = 35};
		case "sheepmeat": {_val = 40};
		case "goatmeat": {_val = 50};
		case "bratwurst": {_val = 100};
		case "pizza": {_val = 80};
		case "gmandeln": {_val = 10};
		case "schokolade": {_val = 40};
		case "praline": {_val = 100};
		case "salat": {_val = 15};
		case "tomate": {_val = 20};
		case "gsalat": {_val = 50};
	};

	life_toilet = life_toilet + round(random 30);
	_sum = life_hunger + _val;
	if(_sum > 100 && life_zustand == "Gesund") then {_sum = 100; life_zustand = "Übelkeit"; hint "Du hast dich überfressen. In deinem Magen brodelt es wie in einem Vulkan!";};
	life_hunger = _sum;
};