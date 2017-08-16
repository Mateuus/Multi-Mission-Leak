/*
	File: fn_updateCaptureUI.sqf
	Author: John "Paratus" VanderZwet
	
	Description:
	Refreshes the user interface for the capture zone the player is within.
*/

private ["_point"];

_point = life_capture_list select (life_capture_zone - 1);

_label = _point select 0;
if ((_point select 1) != "0" && (_point select 1) == life_gang) then { _label = life_gang_name; };


// Progress bar update
_cP = _point select 2;
_ui = uiNameSpace getVariable "life_progress";
_progress = _ui displayCtrl 38201;
_pgText = _ui displayCtrl 38202;
_progress progressSetPosition _cP;
_pgText ctrlSetText format["%3 Ownership (%1%2)...",round(_cP * 100),"%",(_point select 0)];