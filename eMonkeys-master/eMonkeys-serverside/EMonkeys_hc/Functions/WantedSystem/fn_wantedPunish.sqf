/* 
 File: fn_wantedPunish.sqf 
 Author: Bryan "Tonic" Boardwine 
  
 Description: 
 Checks to see if the person is wanted, if they are it will punish them. 
*/ 
private["_uid","_index"]; 
_uid = [_this,0,"",[""]] call BIS_fnc_param; 
if(_uid == "") exitWith {}; 
 
_index = [_uid,EMonkeys_wanted_list] call TON_fnc_index; 
if(_index == -1) exitWith {}; 
[[0],"EMonkeys_fnc_removeLicenses",_uid,false] call EMonkeys_fnc_mp;