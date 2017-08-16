// Written by Kupferkarpfen 
// License: CC BY-NC-SA 4.0 
 
private _vehicle = param[0, objNull, [objNull]]; 
private _timeout = param[1, -1, [-1]]; 
 
diag_log format["registerVehicleForDeletion(%1)", _this]; 
 
if( _vehicle isEqualTo objNull || _timeout < 0 ) exitWith {}; 
 
uisleep _timeout; 
 
if( !(_vehicle isEqualTo objNull) ) then { 
    deleteVehicle _vehicle; 
};