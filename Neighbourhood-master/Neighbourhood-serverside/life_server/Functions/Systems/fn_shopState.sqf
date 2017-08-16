 
 
 
private["_shop","_robber","_action","_state"]; 
_shop = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param; 
_robber = [_this,1,ObjNull,[ObjNull]] call BIS_fnc_param;  
_action = [_this,2] call BIS_fnc_param; 
_state = [_this,3,-1,[0]] call BIS_fnc_param; 
if(isNull _shop) exitWith {}; 
 
switch (_state) do 
{ 
case -1:  
{ 
_shop setVariable["locked",true,true]; 
[[_shop,_robber,_action,-1],"life_fnc_shopState",true,true] spawn life_fnc_MP; 
}; 
case 0:  
{ 
_shop setVariable["rip",false,true]; 
sleep 2700; 
[[_shop,_robber,_action,0],"life_fnc_shopState",true,true] spawn life_fnc_MP; 
_shop setVariable["locked",false,true]; 
 
}; 
};