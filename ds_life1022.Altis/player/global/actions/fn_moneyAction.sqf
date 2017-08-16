/*
	Darkside Life

	Author: Shawn "Huntah" Macgillivray

	Description:
	Gives a scroll wheel option to pickup nearby money
*/

private["_obj","_val","_player","_money"];

_money = (nearestObjects [player, ["Land_Money_F"], 3] select 0);
_val = (_money getVariable "item") select 1;

DS_money_pickup = player addAction [format["<t color='#00FF00'>Pick up money ($%1)</t>",[_val] call DS_fnc_numberText],DS_fnc_pickupMoney, "", 0,false,false,"",""];