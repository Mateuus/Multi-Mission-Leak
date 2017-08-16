#include <macro.h>
/*
	File: fn_sellTurtle.sqf
	
	Description:
	Sells the turtles! Save the turtles!
	This was a super lazy thing to do but I just want to push it...
*/
private["_index","_price","_val","_marketprice"];
if(life_inv_turtle == 0) exitWith {
	titleText["Du hast keine Schildkröten zum verkaufen.","PLAIN"];
};

_index = ["turtle",__GETC__(sell_array)] call TEX_fnc_index;
_price = (__GETC__(sell_array) select _index) select 1;

////Marktsystem Anfang////
_marketprice = ["turtle"] call tanoarpg_fnc_marketGetSellPrice;
if(_marketprice != -1) then
{
	_price = _marketprice;
};
////Marktsystem Ende////

_val = life_inv_turtle;
_price = _price * _val;

if([false,"turtle",life_inv_turtle] call tanoarpg_fnc_handleInv) then {
	titleText[format["You sold %1 turtle(s) for $%2",_val,[_price] call tanoarpg_fnc_numberText],"PLAIN"];
	life_cash = life_cash + _price;
	
	////Marktsystem Anfang////
	if(_marketprice != -1) then
	{
		["turtle", _val] spawn
		{
			sleep 900;
			[_this select 0,_this select 1] call tanoarpg_fnc_marketSell;
		};
	};
	////Marktsystem Ende////
};

[0] call XAS_fnc_updatePartial;
[3] call XAS_fnc_updatePartial;
[player, player, _price, "TURTLESELL", life_atmcash, life_cash] remoteExec ["TEX_fnc_handleDBLog", 2];