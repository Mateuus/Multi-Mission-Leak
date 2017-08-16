 
 
 
 
private["_shop","_robber","_action","_robber2"]; 
_shop = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param; 
_robber = [_this,1,ObjNull,[ObjNull]] call BIS_fnc_param;  
_action = [_this,2] call BIS_fnc_param; 
 
if(isNull _shop OR isNull _robber) exitWith {};  
if(!alive _robber) exitWith {}; 
_robber2 = owner _robber;  
 
if((_shop getVariable["rip",false])) exitWith 
{ 
[1,"Hier wird derzeitig schon ausgeraubt."] remoteExecCall ["life_fnc_broadcast",_robber2]; 
}; 
if((_shop getVariable["locked",false])) exitWith 
{ 
[1,"Diese Tankstelle wurde vor Kurzem erst ausgeraubt! - Hier kannst du nicht mehr überfallen.!"] remoteExecCall ["life_fnc_broadcast",_robber2]; 
}; 
if(_robber2 < 1) exitWith {}; 
_shop setVariable["rip",true,true]; 
[_shop,_robber,_action] remoteExec ["life_fnc_robShops2",_robber2];