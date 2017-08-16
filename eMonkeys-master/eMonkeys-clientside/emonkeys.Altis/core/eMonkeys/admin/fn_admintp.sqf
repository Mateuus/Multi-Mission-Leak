private["_unit","_coords"];
_unit = lbData[2902,lbCurSel (2902)];
_unit = call compile format["%1", _unit];
if(isNil "_unit") exitwith {};
if(isNull _unit) exitWith {};
if(name player == name _unit) exitwith {};


_coords = position _unit;
_coords set [0,(_coords select 0) + 10];
player setPos [_coords select 0, _coords select 1, 0];		//player setPos [_coords]; ??
hint format["Teleportiert zu %1", name _unit];