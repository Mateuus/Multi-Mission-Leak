/*
	File: fn_setGroupTrackMarker.sqf
	Author: John "Paratus" VanderZwet
	
	Description:
	Shows a bounty tracking marker from friends bounty
*/

private ["_visible","_uid","_name","_pos","_radius"];

_visible = [_this,0,false,[false]] call BIS_fnc_param;
_uid = [_this,1,"",[""]] call BIS_fnc_param;
_name = [_this,2,"",[""]] call BIS_fnc_param;
_pos = [_this,3,[0,0,0],[[]]] call BIS_fnc_param;
_radius = [_this,4,0,[0]] call BIS_fnc_param;


if (isNil "_uid") exitWith {};
if (_uid == "" || _name == "") exitWith {};

deleteMarkerLocal format["bounty_group_%1", _uid];
deleteMarkerLocal format["bounty_dot_group_%1", _uid];

if (!_visible || !(3 in life_talents)) exitWith {};

_marker = createMarkerLocal [format["bounty_group_%1", _uid], _pos];
_marker setMarkerShapeLocal "ELLIPSE";
_marker setMarkerSizeLocal [_radius, _radius];
_marker setMarkerTypeLocal "mil_dot";
_marker setMarkerBrushLocal "DiagGrid";
_marker setMarkerColorLocal "ColorOrange";
_marker setMarkerTextLocal format["Fugitive %1", _name];

_marker2 = createMarkerLocal [format["bounty_dot_group_%1", _uid], _pos];
_marker2 setMarkerShapeLocal "ICON";
_marker2 setMarkerTypeLocal "mil_dot";
_marker2 setMarkerColorLocal "ColorOrange";
_marker2 setMarkerTextLocal format["Fugitive %1", _name];

_uid spawn
{
	_group = group player;
	_marker = format["bounty_group_%1", _this];
	waitUntil { sleep 4; ((getMarkerPos _marker) select 0 == 0 || _group != group player) };
	deleteMarkerLocal format["bounty_group_%1", _this];
	deleteMarkerLocal format["bounty_dot_group_%1", _this];
};