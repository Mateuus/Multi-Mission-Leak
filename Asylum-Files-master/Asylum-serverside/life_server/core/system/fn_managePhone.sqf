 
 
 
 
 
 
 
 
private["_unit","_target","_terminate","_users"]; 
_unit = [_this,0,objNull,[objNull]] call BIS_fnc_param; 
_target = [_this,1,objNull,[objNull]] call BIS_fnc_param; 
_terminate = [_this,2,false,[false]] call BIS_fnc_param; 
_cleanupOnly = [_this,3,false,[false]] call BIS_fnc_param; 
 
 
 
if (!_cleanupOnly) then 
{ 
 
if (_terminate) then 
{ 
{ 
if (_unit in (_x select 1)) then 
{ 
_users = _x select 1; 
_users = _users - [_unit]; 
(_x select 0) radioChannelRemove [_unit]; 
life_phone_channel = -1; 
(_unit getVariable ["ownerID", -1]) publicVariableClient "life_phone_channel"; 
life_phone_status = 0; (_unit getVariable ["ownerID", -1]) publicVariableClient "life_phone_status"; 
life_phone_groups set [_forEachIndex, [(_x select 0), _users]]; 
}; 
} forEach life_phone_groups; 
} 
 
 
else 
{ 
if (isNull _target) exitWith {}; 
_index = -1; 
_available = -1; 
{ 
if (_unit in (_x select 1)) exitWith { _index = _forEachIndex }; 
if (_index < 0 && count (_x select 1) == 0) then { _available = _forEachIndex }; 
} forEach life_phone_groups; 
if (_index < 0 && _available < 0) exitWith { _msg = "Cell carrier is at capacity and cannot create new calls!"; [[[0,2],_msg],"life_fnc_broadcast",_unit,false] spawn life_fnc_MP; [[[0,2],_msg],"life_fnc_broadcast",_target,false] spawn life_fnc_MP; }; 
if (_index < 0) then { _index = _available; }; 
_units = (life_phone_groups select _index) select 1; 
life_phone_channel = (life_phone_groups select _index) select 0; 
if (!(_unit in _units)) then { _units pushBack _unit; (_unit getVariable ["ownerID", -1]) publicVariableClient "life_phone_channel"; }; 
if (!(_target in _units)) then { _units pushBack _target; (_target getVariable ["ownerID", -1]) publicVariableClient "life_phone_channel"; }; 
life_phone_groups set [_index, [(life_phone_groups select _index) select 0, _units]]; 
((life_phone_groups select _index) select 0) radioChannelAdd [_unit]; 
((life_phone_groups select _index) select 0) radioChannelAdd [_target]; 
}; 
}; 
 
 
{ 
_count = 0; 
{ if (!isNull _x) then { _count = _count + 1; } } forEach (_x select 1); 
if (_count < 2) then 
{ 
_chan = _x select 0; 
{ 
_chan radioChannelRemove [_x]; 
life_phone_status = 0; (_x getVariable ["ownerID", -1]) publicVariableClient "life_phone_status"; 
life_phone_channel = -1; 
(_x getVariable ["ownerID", -1]) publicVariableClient "life_phone_channel"; 
} forEach (_x select 1); 
life_phone_groups set [_forEachIndex, [(_x select 0), []]]; 
}; 
} forEach life_phone_groups;