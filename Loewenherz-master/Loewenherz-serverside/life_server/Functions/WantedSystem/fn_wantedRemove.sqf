/* 
 File: fn_wantedRemove.sqf 
 Author: Bryan "Tonic" Boardwine 
  
 Description: 
 Removes a person from the wanted list. 
*/ 
private["_uid","_index"]; 
_uid = param [0,"",[""]]; 
if(_uid == "") exitWith {}; //Bad data 
 
_index = [_uid,lhm_wanted_list] call TON_fnc_index; 
if(_index == -1) exitWith {}; 
lhm_wanted_list set[_index,-1]; 
lhm_wanted_list = lhm_wanted_list - [-1]; 
if (!isNil "lhm_fnc_DeletePlayerWanted") then { 
 [_uid] call lhm_fnc_DeletePlayerWanted; 
};