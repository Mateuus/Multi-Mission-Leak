/*
	File: fn_captureSel.sqf
	Author: John "Paratus" VanderZwet
	
	Description:
	Selected capture item for information
*/
private["_display","_list","_text","_data"];

disableSerialization;
_display = findDisplay 2300;
_text = _display displayCtrl 2310;
_list = _display displayCtrl 2305;
_data = life_capture_list select (parseNumber (lbData[2305,lbCurSel 2305]));

if (_data select 5 != "") then
{
	_name = [_data select 5] call life_fnc_varToStr;
	_container = (call compile (format["capture_container_%1",(parseNumber (lbData[2305,lbCurSel 2305]))+1]));
	_value = (_container getVariable ["gangContainer", ["",0]]) select 1;
	_value = if (_data select 5 in ["life_money","life_inv_dirty_money"]) then { format["$%1", [_value] call life_fnc_numberText] } else { str _value };
	_text ctrlSetStructuredText parseText format["%1 <t color='#00ccaa'>%2</t>", _value, _name];
}
else
{
	_text ctrlSetStructuredText parseText "No container for this capture";
};