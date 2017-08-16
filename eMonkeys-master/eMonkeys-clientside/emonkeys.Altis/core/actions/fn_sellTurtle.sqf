/*
	File: fn_sellTurtle.sqf
	
	Description:
	Sells the turtles! Save the turtles!
	This was a super lazy thing to do but I just want to push it...
*/
private["_index","_price","_val"];
if(EMonkeys_inv_turtle == 0) exitWith {
	titleText["You don't have any turtles to sell.","PLAIN"];
};

_index = ["turtle",(call sell_array)] call TON_fnc_index;
_price = ((call sell_array) select _index) select 1;
_val = EMonkeys_inv_turtle;
_price = _price * _val;

if([false,"turtle",EMonkeys_inv_turtle] call EMonkeys_fnc_handleInv) then {
	titleText[format["Du verkaufst %1 Schildkröte(n) für %2€",_val,[_price] call EMonkeys_fnc_numberText],"PLAIN"];
	EMonkeys_c164 = EMonkeys_c164 + _price;
};