/*
	File: fn_dreruvat.sqf
	Author: John "Paratus" VanderZwet

	Description:
	Refreshes the user interface for the capture zone the player is within.
*/

private ["_point"];
disableSerialization;
_point = life_capture_list select (life_capture_zone - 1);
// Progress bar update
_upp = format["%2 Ownership - %1", _point select 0, _point select 1];
_cP = _point select 2;
_ui = uiNameSpace getVariable "life_progress";
_progress = _ui displayCtrl 38201;
_pgText = _ui displayCtrl 38202;
_progress progressSetPosition _cP;
_pgText ctrlSetText format["%2 (%3%1)...","%",_upp,round((_point select 2) * 100)];
