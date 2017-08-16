/* 
 File: fn_wantedTicket.sqf 
 Author: Bryan "Tonic" Boardwine 
  
 Description: 
 Checks the price of the ticket against the bounty, if => then bounty remove them from the wanted list. 
*/ 
private["_price","_uid","_ind","_entry"]; 
_uid = param [0,"",[""]]; 
_price = param [1,0,[0]]; 
if(_uid == "" OR _price == 0) exitWith {}; 
 
_ind = [_uid,lhm_wanted_list] call TON_fnc_index; 
if(_ind == -1) exitWith {}; 
lhm_wanted_list set[_ind,-1]; 
lhm_wanted_list = lhm_wanted_list - [-1]; 
if (!isNil "lhm_fnc_DeletePlayerWanted") then { 
 [_uid] call lhm_fnc_DeletePlayerWanted; 
};