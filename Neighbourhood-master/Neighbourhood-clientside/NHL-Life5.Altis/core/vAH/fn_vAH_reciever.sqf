/*
	File: fn_vAH_reciever.sqf
	Description: messages and gives moneys etc from some auction house shiz
	Author: Ryan. Edited by Fresqo for our auction house
*/
private["_seller","_price","_item"];
_mode = [_this,0,-1] call BIS_FNC_PARAM;
_info = [_this,1,-1] call BIS_FNC_PARAM;

switch (_mode) do
{
	case 0:
	{
		_item = _info select 0;
		_price = _info select 1;
		_seller = _info select 2;
		hint format["Du hast ein Item %1 für $%2 gekauft",_seller,[_price]call life_fnc_numberText];
		closeDialog 0;
	};
	case 1:
	{
		_seller = _info select 0;
		_price = _info select 1;
		hint parseText format
		[
			"%1 hat dein Item gekauft, du bekommst<br/>
			<t color='#228B22'>%3%2</t><br/>", name _seller,[_price]call life_fnc_numberText,"$"
		];
		life_atmcash = life_atmcash + _price;
	};

};