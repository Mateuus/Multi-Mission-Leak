/**
 * Copyright © 2015 DnA, Grand Theft ArmA.
 * All Rights Reserved.
 */

private [ "_object", "_start", "_end", "_id" ];
_object = [ _this, 0, objNull, [objNull,""] ] call GTA_fnc_param;

//--- Object to string
if ( typeName _object == typeName objNull ) then {

	_object = str _object;

};

//--- Get hash and colon indexes
_start = _object find "#";
_end = _object find ":";

//--- Check idexes
if ( _start == -1 || { _end == -1 } ) exitWith { [ "Unable to parse object id from '%1'", _object ] call BIS_fnc_error; -1 };

//--- Offset start and end indexes
_start = _start + 2;
_start = _start - _end;

//--- Trim
_id = _object select [ _start, _end ];

//--- Return
_id
