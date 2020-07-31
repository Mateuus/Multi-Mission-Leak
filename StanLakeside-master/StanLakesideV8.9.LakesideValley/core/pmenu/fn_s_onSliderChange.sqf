/*
	File: fn_s_onSliderChange.sqf
	
	
	Description:
	Called when the slider is changed for any field and updates the view distance for it.
*/
private["_mode","_value"];
_mode = param [0,-1,[0]];
_value = param [1,-1,[0]];
if(_mode == -1 OR _value == -1) exitWith {};
disableSerialization;

switch (_mode) do
{
	case 0:
	{
		tawvd_foot = round(_value);
		ctrlSetText[2902,format["%1",round(_value)]];
		[] call life_fnc_updateViewDistance;
	};
	
	case 1:
	{
		tawvd_car = round(_value);
		ctrlSetText[2912,format["%1",round(_value)]];
		[] call life_fnc_updateViewDistance;
	};
	
	case 2:
	{
		tawvd_air = round(_value);
		ctrlSetText[2922,format["%1",round(_value)]];
		[] call life_fnc_updateViewDistance;
	};
};