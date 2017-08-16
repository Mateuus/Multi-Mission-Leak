disableSerialization;

// script
params [["_markerBaseName", "", [""]]];

{
    _x params ["_x_markerBaseName"];
    if (_markerBaseName == _x_markerBaseName) exitWith { 
        marker_Cop_Zones deleteAt _forEachIndex; 
        publicVariable "marker_Cop_Zones";
        { 
            private ["_markerString"];
            _markerString = format ["%1_%2", _markerBaseName, _x];
            deleteMarker _markerString; 
            [_markerString, false] call CBA_fnc_setMarkerPersistent;
            nil 
        } count ["A","T"];
        true 
    };
} forEach marker_Cop_Zones;


true 