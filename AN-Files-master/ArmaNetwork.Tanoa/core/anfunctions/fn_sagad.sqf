/*

	file: fn_showMsg.sqf
	Author: Silex

*/
private["_index","_data"];
_index = param [0,0];
disableSerialization;
_display = findDisplay 88888;
_cMessageList = _display displayCtrl 88882;
_cMessageShow = _display displayCtrl 88887;
_data = call compile (_cMessageList lnbData[_index,0]);
_cMessageShow ctrlSetText format["%1",_data select 2];
ctrlEnable[2401,true];
