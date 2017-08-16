/*
	Darkside Life

	Author: ShadowRanger (Luke)

	Description:
	Loads all current evict markers
*/

{
    _markerName = _x select 0;
    _markerTime = _x select 1;

    if(_markerTime > 0)then {
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
    };
} forEach DS_raidMarkers;