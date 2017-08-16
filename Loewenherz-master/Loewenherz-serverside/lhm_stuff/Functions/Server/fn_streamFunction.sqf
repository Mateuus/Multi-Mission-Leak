/* 
Filename: fn_streamFunction.sqf 
 
Description: commits a variable streaming 
 
Parmaters: _this = Array or Single Variable 
Example : ["Var1","Var2","Var3"] spawn lhm_fnc_streamFunction; or 
   ["Var"] spawn lhm_fnc_streamFunction; 
 
Author: Blackd0g 
*/ 
private["_fncName","_tickTime","_varExists","_compileFinal"]; 
_fncName = _this; 
 
if (isNil "_fncName") exitWith {}; 
 
if (isNil "streamedVars" or isNil "pubStreaming_on") then { 
 streamedVars = []; 
 pubStreaming_on = false; 
}; 
 
if(_fncName in streamedVars) exitWith {diag_log format["----------- Error: Streaming Function allready published --------------"]}; 
 
_compileFinal = { 
    private ["_var","_ns","_code","_arr"]; 
    _var = param [0,"",[""]]; 
    _ns = param [1,missionNamespace,[missionNamespace]]; 
    _code = _ns getVariable [_var, 0]; 
    if (typeName _code != typeName {}) exitWith {false}; 
    _arr = toArray str _code; 
    _arr set [0,32]; 
    _arr set [count _arr - 1,32]; 
    _code = compileFinal toString _arr; 
    _ns setVariable [_var, _code]; 
    diag_log format ["compileFinal Function %1...",_var]; 
    true 
}; 
 
waitUntil {!pubStreaming_on}; 
_tickTime = diag_tickTime; 
pubStreaming_on = true; 
 
if (typename _fncName == typename []) then { 
 
 { 
  if (typename _x ==  "STRING") then { 
 
   _varExists = call compile format ["%1",_x]; 
 
   if (!isNil "_varExists") then { 
   diag_log "----------- multi streaming Function --------------"; 
            _handle = [_x] call _compileFinal; 
            waitUntil {_handle}; 
            publicVariable _x; 
   diag_log format["%1",_x]; 
   streamedVars pushBack _x; 
   } else { 
    diag_log format ["---------- Streaming Public Function  %1 not exists! ----------",_x]; 
 
   }; 
  }; 
 } foreach _fncName; 
 
} else { 
 
 if (typename _fncName == "STRING") then { 
  _varExists = call compile format ["%1",_fncName]; 
 
  if (!isNil "_varExists") then { 
  diag_log "------------- streaming single Function --------------"; 
        _handle = [_fncName] call _compileFinal; 
        waitUntil {_handle}; 
        publicVariable _fncName; 
  diag_log format["%1",_fncName]; 
  diag_log "------------------------------------------------------"; 
 
  streamedVars pushBack _fncName; 
  } else { 
   diag_log format ["---------- Streaming Public Function %1 not exists! ----------",_fncName]; 
  }; 
 }; 
}; 
 
pubStreaming_on = false; 
 
diag_log format["###### Streaming Public Function(s) - Total Execution Time %1 seconds - Current streamed Variables = %2 ######",(diag_tickTime) - _tickTime,(count streamedVars)];