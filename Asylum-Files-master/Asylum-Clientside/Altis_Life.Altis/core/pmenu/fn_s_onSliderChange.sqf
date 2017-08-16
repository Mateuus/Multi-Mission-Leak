/*
	File: fn_s_onSliderChange.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Called when the slider is changed for any field and updates the view distance for it.
*/
private["_mode","_value"];
_mode = [_this,0,-1,[0]] call BIS_fnc_param;
_value = [_this,1,-1,[0]] call BIS_fnc_param;
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
	
	case 3: // sales
	{
		life_configuration set [3, round(_value)];
		ctrlSetText[1902,format["%1%2",round(_value),"%"]];
	};
	
	case 4: // land
	{
		life_configuration set [5, round(_value) * 1000];
		ctrlSetText[1912,format["$%1k/day",round(_value)]];
	};
	
	case 5: // gang
	{
		life_configuration set [6, round(_value) * 1000];
		ctrlSetText[1922,format["$%1k/d/m",round(_value)]];
	};
	
	case 6: // gas
	{
		life_configuration set [7, round(_value)];
		ctrlSetText[1905,format["%1%2",round(_value),"%"]];
	};
};