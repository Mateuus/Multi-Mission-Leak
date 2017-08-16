/*
Darkside Life

Author: Shawn "Huntah" Macgillivray

Description:
	Handles players giving and receiving money
*/

private ["_amount","_atmCash","_increase"];

_amount = _this select 0;
_atmCash = _this select 1;
_increase = _this select 2;



if(_atmCash)then
	{
	if(_increase)then
		{
		DS_atmcoin = DS_atmcoin + _amount;
		}
		else
		{
		DS_atmcoin = DS_atmcoin - _amount;
		};
	}
	else
	{
	if(_increase)then
		{
		DS_coin = DS_coin + _amount;
		}
		else
		{
		DS_coin = DS_coin - _amount;
		};
	};
	
if(DS_coin < 0)then{DS_coin = 0};
if(DS_atmcoin < 0)then{DS_atmcoin = 0};