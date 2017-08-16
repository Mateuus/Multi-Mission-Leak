/* 
 File: fn_getVehicles.sqf 
*/ 
private["_pid","_side","_type","_unit","_tickTime","_queryResult","_query"]; 
_pid = param[0,"",[""]]; 
_side = param[1,sideUnknown,[west]]; 
_type = param[2,"",[""]]; 
_unit = param[3,ObjNull,[ObjNull]]; 
 
if(_pid isEqualTo "" || _side isEqualTo sideUnknown || _type isEqualTo "" || isNull _unit) exitWith { 
 if(!isNull _unit) then { 
  [[]] remoteExec ["zero_fnc_hCByM",(owner _unit)]; 
 }; 
}; 
 
_side = switch(_side) do { 
 case west:{"cop"}; 
 case civilian: {"civ"}; 
 case independent: {"med"}; 
 case east: {"civ"}; 
 default {"Error"}; 
}; 
 
if(_side isEqualTo "Error") exitWith { 
 [[]] remoteExec ["zero_fnc_hCByM",(owner _unit)]; 
}; 
 
_query = format["selectVehicle:%1:%2:%3",_pid,_side,_type]; 
_queryResult = [_query,2,true] call zero_fnc_asyncCall; 
 
if(typeName _queryResult == "STRING") exitWith { 
 [[]] remoteExec ["zero_fnc_hCByM",(owner _unit)]; 
}; 
[_queryResult] remoteExec ["zero_fnc_hCByM",(owner _unit)]; 
