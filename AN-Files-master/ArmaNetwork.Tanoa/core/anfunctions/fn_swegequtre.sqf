/*
	File: fn_s_onSliderChange.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Called when the slider is changed for any field and updates the view distance for it.
*/
params [
	["_mode",-1,[0]],
	["_value",-1,[0]]
];
if(_mode isEqualTo -1 OR {_value isEqualTo -1}) exitWith {};
disableSerialization;
switch (_mode) do {
	case 0: {
		life_settings_viewDistanceFoot = round(_value);
		ctrlSetText[2902,format["%1",round(_value)]];
		call life_fnc_chabrezaphehu;
	};
	case 1: {
		life_settings_viewDistanceCar = round(_value);
		ctrlSetText[2912,format["%1",round(_value)]];
		call life_fnc_chabrezaphehu;
	};
	case 2: {
		life_settings_viewDistanceAir = round(_value);
		ctrlSetText[2922,format["%1",round(_value)]];
		call life_fnc_chabrezaphehu;
	};
	default {};
};
