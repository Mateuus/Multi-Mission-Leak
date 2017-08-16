// Written by Kupferkarpfen 
// License: CC BY-NC-SA 4.0 
 
private[ "_vehicle", "_color", "_vid" ]; 
 
if( !params[ 
        [ "_vehicle", objNull, [objNull] ], 
        [ "_color",   -1,      [0]       ] 
    ]) exitWith {}; 
 
if( !(alive _vehicle) ) exitWith {}; 
 
_vid = _vehicle getVariable["dbInfo", -1]; 
if(_vid < 0) exitWith {}; 
 
[ format[ "UPDATE vehicles SET color = '%1' WHERE id = '%2'", _color, _vid ], 1 ] call XYDB_fnc_asyncCall;