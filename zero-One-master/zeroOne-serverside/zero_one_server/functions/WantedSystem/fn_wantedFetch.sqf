/* 
 File: fn_wantedFetch.sqf 
*/ 
private["_ret","_list","_uid"]; 
_ret = param[0,ObjNull,[ObjNull]]; 
if(isNull _ret) exitWith {}; 
_list = []; 
{ 
 _uid = _x select 1; 
 if([_uid] call zero_fnc_wVfC) then { 
  if(!(_uid in jailedUnits)) then { 
   _list pushBack _x; 
  }; 
 }; 
} foreach tFHiSiX; 
[_list] remoteExecCall ["zero_fnc_TFyd",owner _ret]; 
