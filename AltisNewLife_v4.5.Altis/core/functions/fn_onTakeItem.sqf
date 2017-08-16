private["_unit","_item","_retext"];
_unit = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
_container = [_this,1,ObjNull,[ObjNull]] call BIS_fnc_param;
_item = [_this,2,"",[""]] call BIS_fnc_param;
if(isNull _unit OR _item == "") exitWith {};
_retext = 0;
{	if((playerSide == _x select 2) && ((uniform player) == _x select 0)) then {	_retext = 1;};
} foreach ANL_uniforme;
if (_retext > 0) then { [] call life_fnc_uniform; };