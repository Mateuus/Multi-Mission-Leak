private["_unit","_coords"];
_unit = lbData[2902,lbCurSel (2902)];
_unit = call compile format["%1", _unit];
if(isNil "_unit") exitwith {};
if(isNull _unit) exitWith {};
if(name player == name _unit) exitwith {};

_coords = position player;
_coords set [0,(_coords select 0) + 3];
if(vehicle player == player) then 
{
_unit setPos [_coords select 0, _coords select 1, 0];
} else {
vehicle _unit setPos [_coords select 0, _coords select 1, 0];	
_unit setPos [_coords select 0, _coords select 1, 0];
};
hint format["Du hast %1 zu dir teleportiert", name _unit];

