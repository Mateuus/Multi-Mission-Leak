/*
    File: fn_copMarkers.sqf
    Author: Bryan "Tonic" Boardwine
	
    Description:
    Marks medics on the map for other medics. Only initializes when the actual map is open.
*/
private["_markers","_med"];
_markers = [];
_med = [];
sleep 0.5;
if(visibleMap) then {

    {if(side _x == independent) then {_med set[count _med,_x];}} foreach playableUnits; //Fetch list of medics / independent
    //Create markers
    {
        _marker = createMarkerLocal [format["%1_marker",_x],visiblePosition _x];
        _marker setMarkerColorLocal "ColorYellow";
        _marker setMarkerTypeLocal "Mil_dot";
        _marker setMarkerTextLocal format["%1", name _x];
        _markers set[count _markers,[_marker,_x]];
    } foreach _med;
    while {visibleMap} do
    {
        {
            private["_marker","_unit"];
            _marker = _x select 0;
            _unit = _x select 1;
            if(!isNil "_unit") then
            {
                if(!isNull _unit) then
                {
                    _marker setMarkerPosLocal (visiblePosition _unit);
                };
            };
        } foreach _markers;
        if(!visibleMap) exitWith {};
        sleep 0.02;
    };
    {deleteMarkerLocal (_x select 0);} foreach _markers;
    _markers = [];
    _med = [];
};