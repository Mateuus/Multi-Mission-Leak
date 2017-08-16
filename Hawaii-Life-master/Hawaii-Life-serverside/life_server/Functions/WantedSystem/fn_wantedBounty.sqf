#include "\life_server\script_macros.hpp" 
/* 
 File: fn_wantedBounty.sqf 
 Author: Bryan "Tonic" Boardwine" 
 Database Persistence By: ColinM 
 Assistance by: Paronity 
 Stress Tests by: Midgetgrimm 
 
 Description: 
 Checks if the person is on the bounty list and awards the cop for killing them. 
*/ 
private["_civ","_cop","_id","_half","_result","_queryResult","_amount0","_amount1"]; 
_uid = [_this,0,"",[""]] call BIS_fnc_param; 
_civ = [_this,1,Objnull,[Objnull]] call BIS_fnc_param; 
_cop = [_this,2,Objnull,[Objnull]] call BIS_fnc_param; 
_half = [_this,3,false,[false]] call BIS_fnc_param; 
if(isNull _civ OR {isNull _cop}) exitWith {}; 
 
_query = format["SELECT wantedID, wantedName, wantedCrimes, wantedBounty FROM wanted WHERE active='1' AND wantedID='%1'",_uid]; 
_queryResult = [_query,2,true] call DB_fnc_asyncCall; 
 
if !(count _queryResult isEqualTo 0) then 
{ 
 _amount0 = _queryResult select 0; 
 _amount1 = _amount0 select 3; 
 if(_half) then 
 { 
  [((_amount1) / 2),_amount1] remoteExecCall ["life_fnc_bountyReceive",(owner _cop)]; 
  [_cop, _civ, ((_amount1) / 2), 5, 0, 0] remoteExecCall ["TON_fnc_handleDBLog",RSERV]; 
 } 
  else 
 { 
  [_amount1,_amount1] remoteExecCall ["life_fnc_bountyReceive",(owner _cop)]; 
  [_cop, _civ, _amount1, 5, 0, 0] remoteExecCall ["TON_fnc_handleDBLog",RSERV]; 
 }; 
};