/* 
 File: fn_wantedFetch.sqf 
 Author: Bryan "Tonic" Boardwine" 
  
 Description: 
 Displays wanted list information sent from the server. 
*/ 
private["_ret","_list","_jailedUnits"]; 
_ret = param [0,ObjNull,[ObjNull]]; 
if(isNull _ret) exitWith {}; 
 
_ret = owner _ret; 
_jailedUnits = []; 
{if(_x distance (getMarkerPos "jail_marker") < 120) then {_jailedUnits pushBack getPlayerUID _x}} count playableUnits; 
 
_list = []; 
{ 
 _uid = _x select 1; 
 if([_uid] call lhm_fnc_isUIDActive) then 
 { 
  if(!(_uid in _jailedUnits)) then { 
   _list pushBack _x; 
  }; 
 }; 
} foreach lhm_wanted_list; 
[[_list],"lhm_fnc_wantedList",_ret,false] call lhm_fnc_mp;