#include <macro.h>
/*
	File: fn_sellTurtle.sqf
	
	Description:
	Sells the turtles! Save the turtles!
	This was a super lazy thing to do but I just want to push it...
*/
private["_index","_price","_val","_marketprice"];
if(life_inv_goldbar == 0) exitWith {
	titleText["Du hast kein Gold zum verkaufen.","PLAIN"];
};

_index = ["goldbar",__GETC__(sell_array)] call TEX_fnc_index;
_price = (__GETC__(sell_array) select _index) select 1;

////Marktsystem Anfang////
_marketprice = ["goldbar"] call tanoarpg_fnc_marketGetSellPrice;
if(_marketprice != -1) then
{
	_price = _marketprice;
};
////Marktsystem Ende////

_val = life_inv_goldbar;
_price = _price * _val;

if([false,"goldbar",life_inv_goldbar] call tanoarpg_fnc_handleInv) then {
	titleText[format["Du hast %1 Goldbarren für $%2 verkauft",_val,[_price] call tanoarpg_fnc_numberText],"PLAIN"];
	life_cash = life_cash + _price;
	
	////Marktsystem Anfang////
	if(_marketprice != -1) then
	{
		["goldbar", _val] spawn
		{
			sleep 900;
			[_this select 0,_this select 1] call tanoarpg_fnc_marketSell;
		};
	};
	////Marktsystem Ende////
};

[0] call XAS_fnc_updatePartial;
[3] call XAS_fnc_updatePartial;
[player, player, _price, "GOLDSELL", life_atmcash, life_cash] remoteExec ["TEX_fnc_handleDBLog", 2];
