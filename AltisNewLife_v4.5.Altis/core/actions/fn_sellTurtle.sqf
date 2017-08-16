#include <macro.h>
private["_index","_price","_val"];
if(life_inv_turtle == 0) exitWith {
	titleText["Vous n'avez pas de tortue a vendre !","PLAIN"];
};
//_index = ["turtle",GETC(sell_array)] call TON_fnc_index;
//_price = (GETC(sell_array) select _index) select 1;
_index = ["turtle",sell_array] call TON_fnc_index;
_price = (sell_array select _index) select 1;
_val = life_inv_turtle;
_price = _price * _val;
if([false,"turtle",life_inv_turtle] call life_fnc_handleInv) then {
	titleText[format["Vous avez vendu %1 tortues pour %2€",_val,[_price] call life_fnc_numberText],"PLAIN"];
	argent_liquide = argent_liquide + _price;
};
