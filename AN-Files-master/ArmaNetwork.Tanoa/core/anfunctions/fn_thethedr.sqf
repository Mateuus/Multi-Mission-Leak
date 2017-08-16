/*
	File: fn_thethedr.sqf
	Author: John "Paratus" VanderZwet

	Description:
	Toggles the display of capture point user interface.
*/
private ["_data"];
params [
	["_point",0,[0]]
];

life_capture_zone = _point;
if (_point isEqualTo 0) exitWith
{
	[false] call life_fnc_tufruxatra;
	systemChat "You have left the territory control area.";
};

_data = life_capture_list select (_point - 1);
systemChat format["You have entered the control area for %1!", _data select 1];

_upp = format["%2 Ownership - %1", _data select 0, _data select 1];
disableSerialization;
_progressBar = [] call life_fnc_tufruxatra;
_progress = _progressBar select 1;
_progressText = _progressBar select 2;
_progressText ctrlSetText format["%1...",_upp];
_progress progressSetPosition (_data select 2);

/*
// Setup our progress bar.
_upp = format["%2 Ownership - %1", _data select 0, _data select 1];
disableSerialization;
5 cutRsc ["life_progress","PLAIN"];
_ui = uiNameSpace getVariable "life_progress";
_progress = _ui displayCtrl 38201;
_pgText = _ui displayCtrl 38202;
_pgText ctrlSetText format["%2 (%3%1)...","%",_upp,round((_data select 2) * 100)];
_progress progressSetPosition (_data select 2);
*/
