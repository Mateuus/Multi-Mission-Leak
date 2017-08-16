/* 
 File: fn_wantedBounty.sqf 
*/ 
private["_civ","_cop","_index","_half"]; 
_civ = param[0,Objnull,[Objnull]]; 
_cop = param[1,Objnull,[Objnull]]; 
_half = param[2,false,[false]]; 
if(isNull _civ || isNull _cop) exitWith {}; 
 
_index = [_civ getVariable["aOsyc",name _civ],tFHiSiX] call zero_fnc_oKzQhZKu; 
if(_index != -1) then { 
 if(_half) then { 
  [((tFHiSiX select _index) select 3) / 2,((tFHiSiX select _index) select 3),_civ] remoteExecCall ["zero_fnc_cqjIweI",(owner _cop)]; 
 }else{ 
  [(tFHiSiX select _index) select 3,(tFHiSiX select _index) select 3,_civ] remoteExecCall ["zero_fnc_cqjIweI",(owner _cop)]; 
 }; 
}; 
