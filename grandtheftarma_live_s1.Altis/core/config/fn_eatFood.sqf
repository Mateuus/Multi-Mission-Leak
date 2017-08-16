/*
	File: fn_eatFood.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Main handling system for eating food.
	*Needs to be revised and made more modular and more indept effects*
*/
private["_food","_val","_sum"];
_food = [_this,0,"",[""]] call GTA_fnc_param;
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
		case "watermelon": {_val = 100};
		case "salad": {_val = 30};
		case "tobacco": {_val = 1};
		case "bubblegum": {_val = 10};
		case "kitkat": {_val = 20};
		case "cream": {_val = 10};
		case "ration_small": {_val = 50};
		case "ration_big": {_val = 100};

		case "kfc_popcorn": {_val = 20};
		case "kfc_wings": {_val = 50};
		case "kfc_bucket": {_val = 100};
		
		case "kebab": {_val = 100};

		case "greggs_sausageroll": {_val = 40};
		case "greggs_pasty": {_val = 50};
		case "greggs_steakbake": {_val = 70};
		case "greggs_sausagebean": {_val = 70};
		case "greggs_cheesebacon": {_val = 70};
	};

	_sum = GTA_hunger + _val;
	if(_sum > 100) then {_sum = 100; /*player setFatigue 1; hint "You have over eaten, you are now feeling fatigued.";*/};
	GTA_hunger = _sum;
};