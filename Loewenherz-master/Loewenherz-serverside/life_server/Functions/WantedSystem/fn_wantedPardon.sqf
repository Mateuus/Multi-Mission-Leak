/* 
 File: fn_wantedPardon.sqf 
 Author: Bryan "Tonic" Boardwine 
  
 Description: 
 Unwants / pardons a person from the wanted list. 
*/ 
private["_uid"]; 
_uid = param [0,"",[""]]; 
if(_uid == "") exitWith {}; 
 
_index = [_uid,lhm_wanted_list] call TON_fnc_index; 
 
if(_index != -1) then 
{ 
 lhm_wanted_list set[_index,-1]; 
 lhm_wanted_list = lhm_wanted_list - [-1]; 
 //publicVariable "lhm_wanted_list"; 
 if (!isNil "lhm_fnc_DeletePlayerWanted") then { 
  [_uid] call lhm_fnc_DeletePlayerWanted; 
 }; 
};