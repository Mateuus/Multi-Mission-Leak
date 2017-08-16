/* 
 File: fn_wantedPunish.sqf 
 Author: Bryan "Tonic" Boardwine 
  
 Description: 
 Checks to see if the person is wanted, if they are it will punish them. 
*/ 
private["_uid","_index"]; 
_uid = param [0,"",[""]]; 
if(_uid == "") exitWith {}; 
 
_index = [_uid,lhm_wanted_list] call TON_fnc_index; 
if(_index == -1) exitWith {}; 
[[0],"lhm_fnc_removeLicenses",_uid,false] call lhm_fnc_mp;