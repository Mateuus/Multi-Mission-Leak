/* 
 Author: Bryan "Tonic" Boardwine 
  
 Description: 
 Blah 
*/ 
private["_group","_groupID"]; 
_group = param [0,grpNull,[grpNull]]; 
if(isNull _group) exitWith {}; 
 
_groupID = _group getVariable["gang_id",-1]; 
if(_groupID == -1) exitWith {}; 
 
 
//[format["UPDATE gangs SET active='0' WHERE id='%1'",_groupID],1] call DB_fnc_asyncCall; 
[format["DELETE FROM gangs WHERE id='%1'",_groupID],1] call DB_fnc_asyncCall; // LHM 
 
 
_result = [format["SELECT id FROM gangs WHERE active='1' AND id='%1'",_groupID],2] call DB_fnc_asyncCall; 
if(count _result == 0) then { 
 [[_group],"lhm_fnc_gangDisbanded",(units _group),false] call lhm_fnc_mp; 
 sleep 5; 
 deleteGroup _group; 
};