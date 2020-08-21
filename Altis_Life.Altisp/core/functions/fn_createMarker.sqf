/*
	File: fn_createMarker.sqf
	
	Description:
	Create Marker when someone call Police/Medic.
*/

Private["_playerName","_pos","_marker","_text","_i"];
_playerName = [_this,0,"",[""]] call BIS_fnc_param;
_prefix = [_this,2,"WZYWAJACY",["WZYWAJACY"]] call BIS_fnc_param;
_i = 0;

_pos = _this select 1;
_text = format["%2 %1", _playerName, _prefix];
_playerName = format["%2%1", _playerName, _prefix];

deleteMarkerLocal _playerName;
_marker = createMarkerLocal [_playerName, _pos];;
_marker setMarkerShapeLocal "ICON";
_marker setMarkerTypeLocal "mil_dot";
_marker setMarkerTextLocal _text;

while {true} do
{
	_i = _i + 1;
	if(_i >= 120) exitWith {deleteMarkerLocal _playerName;};
	_marker setMarkerColorLocal "ColorRed";
	sleep 0.5;
	_marker setMarkerColorLocal "ColorWhite";
	sleep 0.5;
};