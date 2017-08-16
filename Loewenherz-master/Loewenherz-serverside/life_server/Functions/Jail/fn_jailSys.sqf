/* 
 File: fn_jailSys.sqf 
 Author: Bryan "Tonic" Boardwine 
  
 Description: 
 I forget? 
*/ 
private["_unit","_bad","_id","_ret"]; 
_unit = param [0,ObjNull,[ObjNull]]; 
if(isNull _unit) exitWith {}; 
_bad = param [1,false,[false]]; 
_id = owner _unit; 
 
_ret = [_unit] call lhm_fnc_wantedPerson; 
[[_ret,_bad],"lhm_fnc_jailMe",_id,false] call lhm_fnc_mp;