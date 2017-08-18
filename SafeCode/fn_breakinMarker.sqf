/*
	File: fn_breakinMarker.sqf
	Author: Kevin Webb
	
	Description:
	Marks house breakins on the map for cops, pretty straight forward.
*/
private["_bMarker","_criminal"];
_criminal = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;

if(life_marked) exitWith {};
life_marked = true;

_bMarker = createMarkerLocal [format["%1_bMarker",_criminal],visiblePosition _criminal];
_bMarker setMarkerColorLocal "ColorRed";
_bMarker setMarkerTextLocal "Home Alarm Sounded!";
_bMarker setMarkerTypeLocal "waypoint";
sleep 120;
deleteMarkerLocal _bMarker;
life_marked = false;