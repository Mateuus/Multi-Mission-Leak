 
 
 
 
 
 
 
 
private["_uid","_name","_newValue"]; 
 
_name = [_this,0,"Unknown",["Unknown"]] call BIS_fnc_param; 
_uid = [_this,4,"",[""]] call BIS_fnc_param; 
 
_packet = _this; 
 
 
if(_uid == "") exitWith {diag_log "Invalid data for player update!"}; 
 
 
_old = []; 
_i = count life_update_buffer; 
{ 
if (typeName _x == "ARRAY") then 
{ 
if (_x select 0 == _uid) then 
{ 
_old = _x select 1; 
_i = _forEachIndex; 
}; 
}; 
} forEach life_update_buffer; 
 
if (count _old > 0) then 
{ 
{ 
_newValue = nil; 
if (count _packet >  _forEachIndex - 1) then { _newValue = _packet select _forEachIndex }; 
if (isNil "_newValue" && !isNil "_x") then 
{ 
_packet set [_forEachIndex, _x]; 
}; 
} forEach _old; 
}; 
 
life_update_buffer set [_i, [_uid, _packet]];