/*
	Darkside Life

	Author: Shawn "Huntah" Macgillivray

	Description:
	Handles players giving and receiving money
*/

params ["_amount","_atmCash","_increase"];

if(_atmCash)then {
	if(_increase)then {
		DS_atmCoin = DS_atmCoin + _amount;
	} else {
		DS_atmCoin = DS_atmCoin - _amount;
	};
} else {
	if(_increase)then {
		DS_coin = DS_coin + _amount;
	} else {
		DS_coin = DS_coin - _amount;
	};
};

if(DS_coin < 0)then{DS_coin = 0};
if(DS_atmCoin < 0)then{DS_atmCoin = 0};