/* 
 File: fn_wantedBounty.sqf 
 Author: Bryan "Tonic" Boardwine" 
  
 Description: 
 Checks if the person is on the bounty list and awards the cop for killing them. 
*/ 
private["_civ","_cop","_id","_half"]; 
_civ = param [0,Objnull,[Objnull]]; 
_cop = param [1,Objnull,[Objnull]]; 
_half = param [2,false,[false]]; 
if(isNull _civ OR isNull _cop) exitWith {}; 
 
_id = [(getPlayerUID _civ),lhm_wanted_list] call TON_fnc_index; 
if(_id != -1) then 
{ 
 if(_half) then 
 { 
  [[((lhm_wanted_list select _id) select 3) / 2,((lhm_wanted_list select _id) select 3)],"lhm_fnc_bountyReceive",(owner _cop),false] call lhm_fnc_mp; 
 } 
  else 
 { 
  [[(lhm_wanted_list select _id) select 3,(lhm_wanted_list select _id) select 3],"lhm_fnc_bountyReceive",(owner _cop),false] call lhm_fnc_mp; 
 }; 
};