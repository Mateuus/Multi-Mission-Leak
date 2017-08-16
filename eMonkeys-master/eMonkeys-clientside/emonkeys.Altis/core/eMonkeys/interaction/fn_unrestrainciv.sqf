/*
	File: fn_unrestrain.sqf
*/
private["_unit"];
_unit = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
if(isNull _unit OR !(_unit getVariable["restrainedciv",FALSE])) exitWith {}; //Error check?

_unit setVariable["restrainedciv",FALSE,TRUE];
_unit setVariable["Escortingciv",FALSE,TRUE];
_unit setVariable["transportingciv",FALSE,TRUE];
detach _unit;
player say3D "uncuff";
[true,"handcuffs",1] call EMonkeys_fnc_handleInv;

[[2],"EMonkeys_fnc_bagUseAction",_unit,FALSE] spawn EMonkeys_fnc_MP;

[[0,format["%1 wurde von %2 entfesselt.",name _unit, name player]],"EMonkeys_fnc_broadcast" /*,west,FALSE*/] call EMonkeys_fnc_MP;