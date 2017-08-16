#include <macro.h>
private["_dialog","_inv","_lic","_licenses","_near","_near_units","_mstatus","_shrt","_side"];
disableSerialization;

_dialog = findDisplay 3625;
_inv = _dialog displayCtrl 3005;



lbClear _inv;


{
	_str = [_x] call life_fnc_varToStr;
	_shrt = [_x,1] call life_fnc_varHandle;
	_val = missionNameSpace getVariable _x;
	if(_val > 0) then
	{
		_inv lbAdd format["%1x - %2",_val,_str];
		_inv lbSetData [(lbSize _inv)-1,_shrt];
	};
} foreach life_inv_items;