/*
	File: fn_s_onSliderChange.sqf
	Author: Bryan "Tonic" Boardwine

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
		LHM_settings_viewDistanceFoot = round(_value);
		ctrlSetText[2902,format["%1",round(_value)]];
		[] call lhm_fnc_updateViewDistance;
		profileNamespace setVariable["LHM_settings_viewDistanceFoot",round(_value)];
	};

	case 1:
	{
		LHM_settings_viewDistanceCar = round(_value);
		ctrlSetText[2912,format["%1",round(_value)]];
		[] call lhm_fnc_updateViewDistance;
		profileNamespace setVariable["LHM_settings_viewDistanceCar",round(_value)];
	};

	case 2:
	{
		LHM_settings_viewDistanceAir = round(_value);
		ctrlSetText[2922,format["%1",round(_value)]];
		[] call lhm_fnc_updateViewDistance;
		profileNamespace setVariable["LHM_settings_viewDistanceAir",round(_value)];
	};
};

// if slider is changed turn of autoview
if (LHM_settings_AutoViewDistance) then {
	LHM_settings_AutoViewDistance = false;
	profileNamespace setVariable["LHM_settings_AutoViewDistance",false];
	[] call lhm_fnc_settingsMenu;
};