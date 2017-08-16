/*
	File: fn_sellTurtle.sqf
	
	Description:
	Sells the turtles! Save the turtles!
	This was a super lazy thing to do but I just want to push it...
*/
private["_index","_price","_val"];
if(EMonkeys_inv_goldbar == 0) exitWith {
	titleText["Du hast keine Goldbarren zum Verkauf.","PLAIN"];
};

_index = ["goldbar",(call sell_array)] call TON_fnc_index;
_price = ((call sell_array) select _index) select 1;
_val = EMonkeys_inv_goldbar;
_price = _price * _val;

if([false,"goldbar",EMonkeys_inv_goldbar] call EMonkeys_fnc_handleInv) then {
	titleText[format["Du verkaufst %1 Goldbarren für%2€ ein guter Preis!",_val,[_price] call EMonkeys_fnc_numberText],"PLAIN"];
	EMonkeys_c164 = EMonkeys_c164 + _price;
};
