/*
	File: fn_toggleCaptureUI.sqf
	Author: John "Paratus" VanderZwet
	
	Description:
	Toggles the display of capture point user interface.
*/
private ["_point","_data"];

_point = [_this,0,0,[0]] call BIS_fnc_param;

life_capture_zone = _point;
if (_point == 0) exitWith
{
	5 cutText ["","PLAIN"];
	systemChat "You have left the territory control area.";
};

_data = life_capture_list select (_point - 1);
systemChat format["You have entered the control area for %1!", _data select 0];

_label = _data select 0;;
if ((_data select 1) != "0" && (_data select 1) == life_gang) then { _label = life_gang_name; };

// Setup our progress bar.
_upp = format["%1 Ownership", _data select 0];
disableSerialization;
5 cutRsc ["life_progress","PLAIN"];
_ui = uiNameSpace getVariable "life_progress";
_progress = _ui displayCtrl 38201;
_pgText = _ui displayCtrl 38202;
_pgText ctrlSetText format["%2 (%3%1)...","%",_upp,(_data select 2) * 100];
_progress progressSetPosition (_data select 2);
//temp fix for placeables blocking access to the cartel fridge!
_container = call compile format["capture_container_%1",_point];
{deleteVehicle _x} forEach (nearestObjects [_container,["Land_BagFence_Round_F","Land_BagFence_Long_F","Land_BagFence_Short_F","Land_HBarrier_1_F"],5]);