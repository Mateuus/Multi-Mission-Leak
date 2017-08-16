private ["_unit","_pos","_roofcheck"];

_unit = _this select 0;
_pos = getposASL _unit;
_eyepos = eyepos _unit;	
_ret = false;
_Array = [];
_roof= [_eyepos select 0,_eyepos select 1, (_eyepos select 2) + 20];
_WallFront = [(_eyepos select 0) + (((25)*sin(getdir _unit))), (_eyepos select 1) + ((25)*cos(getdir _unit)),(_eyepos select 2)];
_WallBack = [(_eyepos select 0) + (((-25)*sin(getdir _unit))), (_eyepos select 1) + ((-25)*cos(getdir _unit)),(_eyepos select 2)];
_WallRight = [(_eyepos select 0) + (((25)*sin(getdir _unit + 90))), (_eyepos select 1) + ((0)*cos(getdir _unit)),(_eyepos select 2)];
_WallLeft = [(_eyepos select 0) + (((-25)*sin(getdir _unit + 90))), (_eyepos select 1) + ((0)*cos(getdir _unit)),(_eyepos select 2)];

_roofcheck = (lineIntersectsWith [_eyepos,_roof,_unit,_unit,true]);
if (count _roofcheck == 0) exitwith {
	_ret
};

_wallcheckFront = (lineIntersectsWith [_eyepos,_WallFront,_unit,_unit,true]);
_wallcheckBack = (lineIntersectsWith [_eyepos,_WallBack,_unit,_unit,true]);
_wallcheckRight = (lineIntersectsWith [_eyepos,_WallRight,_unit,_unit,true]);
_wallcheckLeft = (lineIntersectsWith [_eyepos,_WallLeft,_unit,_unit,true]);

if ((_roofcheck select 0) iskindof "building") then {
	{
		if ((_x select 0) iskindof "building") then {
			_Array = _Array + [_x select 0];
		};
	} foreach [_wallcheckFront,_wallcheckBack,_wallcheckRight,_wallcheckLeft];
	if ({_x == (_roofcheck select 0)} count _Array >= 2) then {
		_ret = true;		
	} else {
		_ret = false;		
	};
};

_ret;