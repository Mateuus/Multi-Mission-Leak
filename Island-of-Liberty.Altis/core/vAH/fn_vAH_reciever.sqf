#include "..\..\script_macros.hpp"
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
		_item = SEL(_info,0);
		_price = SEL(_info,1);
		_seller = SEL(_info,2);
		hint format[localize"STR_AH_Bought",_seller,[_price]call life_fnc_numberText];
		closeDialog 0;
	};
	case 1:
	{
		_seller = SEL(_info,0);
		_price = SEL(_info,1);
		hint parseText format
		[
			"%1 accepted one of your offers, you recieved<br/>
			<t color='#228B22'>%3%2</t><br/>", name _seller,[_price]call life_fnc_numberText,"$"
		];
		ADD(BANK,_price);
	};

};