#include <macro.h>
/*

	file: fn_showMsg.sqf
	Author: Silex

*/
private["_index","_data"];
_index = [_this,0,0] call BIS_fnc_param;

disableSerialization;
waitUntil {!isNull findDisplay 88888};
_display = findDisplay 88888;
_cMessageList = _display displayCtrl 88882;
_cMessageShow = _display displayCtrl 88887;
_cMessageHeader = _display displayCtrl 88890;

_data = call compile (_cMessageList lnbData[_index,0]);

_cMessageHeader ctrlSetText format["%1 schrieb:",_data select 3];
_cMessageShow ctrlSetText format["%1",_data select 2];