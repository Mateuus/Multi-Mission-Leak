/* 
 Author: Bryan "Tonic" Boardwine 
 Modifyd bei CooliMC 
  
 Description: 
 WHAT THE HELL DO YOU THINK IT DOES?!?!!??!?!!?!??! 
 Edit: Not the right thing, so I must Edit it 
*/ 
if(!isNull life_hc_inUse) exitWith {_this remoteExec ["TEX_fnc_initHouses", life_hc_inUse]}; 
 
private["_queryResult","_query","_count","_houses"]; 
_count = (["SELECT COUNT(*) FROM houses WHERE owned='1'",2] call DB_fnc_asyncCall) select 0; 
_houses = []; 
 
for [{_x=0},{_x<=_count},{_x=_x+10}] do { 
 _query = format["SELECT houses.id, houses.pid, houses.pos, players.name FROM houses INNER JOIN players ON houses.pid=players.playerid WHERE houses.owned='1' LIMIT %1,10",_x]; 
 _queryResult = [_query,2,true] call DB_fnc_asyncCall; 
 if(count _queryResult == 0) exitWith {}; 
 { _houses pushBack _x; } foreach _queryResult; 
}; 
 
mvh setVariable ["Houses", _houses, true];