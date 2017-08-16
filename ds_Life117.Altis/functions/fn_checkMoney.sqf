/*
	Author: Shawn "Huntah" Macgillivray
	
	Description:
	Checks if a player has enough money to continue his current action
*/

private ["_amount","_atmCash","_return"];

_amount = _this select 0;
_atmCash = _this select 1;
_return = true;

if(_atmCash)then
	{
	if(DS_atmcoin >= _amount)then
		{
		_return = false;
		};
	}
	else
	{
	if(DS_coin >= _amount)then
		{
		_return = false;
		};
	};
_return;