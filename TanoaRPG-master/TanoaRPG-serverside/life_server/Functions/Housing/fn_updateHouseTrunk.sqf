/* 
 Author: Bryan "Tonic" Boardwine 
  
 Description: 
 Updates the storage for a house blah blah 
*/ 
if(!isNull life_hc_inUse) exitWith {_this remoteExec ["TEX_fnc_updateHouseTrunk", life_hc_inUse]}; 
 
private["_query","_pos","_trunk","_houseID","_housePos"]; 
_trunk = [_this,0,[[],0]] call BIS_fnc_param; 
_houseID = [_this,1,-1] call BIS_fnc_param; 
_housePos = [_this,2,[]] call BIS_fnc_param; 
if((_houseID == (-1)) || ((count _housePos) == 0)) exitWith {}; 
 
_query = format["Select pos from houses where id='%1'",_houseID]; 
_pos = [_query,2] call DB_fnc_asyncCall; 
 
if((count _pos) == 0) exitWith {}; 
_pos = call compile format["%1",(_pos select 0)]; 
if((_pos distance _housePos) > 2) exitWith {}; 
 
_trunk = [_trunk] call DB_fnc_mresArray; 
_query = format["UPDATE houses SET inventory='%1' WHERE id='%2'",_trunk,_houseID]; 
[_query,1] call DB_fnc_asyncCall;