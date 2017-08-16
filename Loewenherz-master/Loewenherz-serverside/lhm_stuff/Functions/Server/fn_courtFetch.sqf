/* 
 File: fn_courtFetch.sqf 
 Author: Blackd0g 
 
 Description: 
 Displays wanted list information sent from the server. 
*/ 
private["_ret","_list","_jailedUnits","_uidConv","_convicted"]; 
_ret = param [0,ObjNull,[ObjNull]]; 
_convicted = param [1,ObjNull,[ObjNull]]; 
_uidConv = getPlayerUID _convicted; 
 
if(isNull _ret) exitWith {}; 
if(isNull _convicted) exitWith {}; 
 
_ret = owner _ret; 
 
_list = []; 
{ 
 _uid = _x select 1; 
 if([_uid] call lhm_fnc_isUIDActive) then 
 { 
  if(_uidConv == _uid) then { 
   _list pushBack _x; 
  }; 
 }; 
} foreach lhm_wanted_list; 
 
[[_list,name _convicted],"lhm_fnc_convictedList",_ret,false] call lhm_fnc_mp;