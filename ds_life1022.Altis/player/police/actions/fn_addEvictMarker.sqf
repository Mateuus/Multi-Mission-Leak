/*
	Darkside Life

	Author: ShadowRanger (Luke)

	Description:
	Adds an evict marker at the nearest raid zone
*/

private ["_markers","_nearestMarker","_index"];

//Get the nearest raid zone marker
_markers = ["gangarea","gangarea_1","gangzone2","gangarea_2","marker_82","marker_83","marker_67","marker_68","marker_75","marker_78","marker_71","marker_69","marker_73"];
_nearestMarker = [_markers,player] call BIS_fnc_nearestPosition;

//Make sure the player is actually in/near a raid zone
if((player distance (getMarkerPos _nearestMarker)) > 100)exitWith{};

//Find the index of the nearest marker
_index = -1;

{
    if((_x select 0) isEqualTo _nearestMarker)exitWith {
        _index = _forEachIndex;
    };
} forEach DS_raidMarkers;

if(_index isEqualTo -1)exitWith{};

(DS_raidMarkers select _index) set [1,time];
publicVariable "DS_raidMarkers";

//Get some marker info
[[_index],{
    private ["_markerInfo","_markerName","_markerTime","_name","_pos","_text","_marker"];

    _markerInfo = DS_raidMarkers select (_this select 0);
    _markerName = _markerInfo select 0;
    _markerTime = _markerInfo select 1;

    _name = format ["evict_%1",_markerName];
    _pos = getMarkerPos _markerName;
    _text = format ["Raided @ %1",round (_markerTime/60)];

    //Delete the old raid marker if it exists
    deleteMarkerLocal _name;

    //Create a new raid marker
    _marker = createMarkerLocal [_name,_pos];
    _marker setMarkerShapeLocal "ICON";
    _marker setMarkerTypeLocal "hd_flag";
    _marker setMarkerColorLocal "ColorWhite";
    _marker setMarkerTextLocal _text;
}] remoteExec ["BIS_fnc_call",west];