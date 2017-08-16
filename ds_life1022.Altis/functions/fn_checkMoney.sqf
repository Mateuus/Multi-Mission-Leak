/*
    Darkside Life

	Author: Shawn "Huntah" Macgillivray

	Description:
	Checks if a player has enough money to continue his current action
*/

private ["_return"];

params [
	["_amount",0,[0]],
	["_atmCash",false,[false]]
];

_return = true;

if(_atmCash)then {
	if(DS_atmCoin >= _amount)then {
		_return = false;
	};
} else {
	if(DS_coin >= _amount)then {
		_return = false;
	};
};

_return;