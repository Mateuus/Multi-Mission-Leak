 
 
 
 
 
 
 
private["_unit","_ret"]; 
_unit = [_this,0,Objnull,[Objnull]] call BIS_fnc_param; 
_jailSpawn = [_this,1,"",[""]] call BIS_fnc_param; 
_jailRelease = [_this,2,"",[""]] call BIS_fnc_param; 
if(isNull _unit) exitWith {}; 
_ret = [_unit] call life_fnc_wantedPerson; 
[[_ret,_jailSpawn,_jailRelease],"life_fnc_jailMe",_unit,false] spawn life_fnc_MP; 
