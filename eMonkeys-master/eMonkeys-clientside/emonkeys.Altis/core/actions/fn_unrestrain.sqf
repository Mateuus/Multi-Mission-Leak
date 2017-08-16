/*
	File: fn_unrestrain.sqf
*/
private["_unit"];
_unit = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
if(isNull _unit OR !(_unit getVariable["restrained",FALSE])) exitWith {}; //Error check?

_unit setVariable["restrained",FALSE,TRUE];
_unit setVariable["Escorting",FALSE,TRUE];
_unit setVariable["transporting",FALSE,TRUE];
detach _unit;
player say3D "uncuff";

[[2],"EMonkeys_fnc_bagUseAction",_unit,FALSE] spawn EMonkeys_fnc_MP;

[[0,format["%1 wurde von %2 entfesselt.",_unit getVariable["realname",name _unit], profileName]],"EMonkeys_fnc_broadcast",west,FALSE] call EMonkeys_fnc_MP;
