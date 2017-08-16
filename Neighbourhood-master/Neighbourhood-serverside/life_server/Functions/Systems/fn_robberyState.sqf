 
 
 
 
 
 
 
private["_vault","_state","_funds"]; 
_vault = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param; 
_state = [_this,1,-1,[0]] call BIS_fnc_param; 
_funds = [_this,2,-1,[0]] call BIS_fnc_param; 
 
if(isNull _vault) exitWith {};  
 
switch(_state) do 
{ 
case -1: {_vault setVariable["fed_rob_ip",false,true]; _vault setVariable["fed_locked",false,true];}; 
case 0: 
{ 
[[2,"Der Banküberfall konnte dank dem Sicherheitssystem abgewendet werden."],"life_fnc_broadcast",nil,false] spawn life_fnc_MP; 
_vault setVariable["fed_locked",true,true]; 
sleep (10 * 60);  
_vault setVariable["fed_locked",false,true]; 
_vault setVariable["fed_rob_ip",false,true]; 
}; 
 
case 1: 
{ 
[[1,format["$%1 wurden bei dem Banküberfall auf die Bundesbank entwendet.",[_funds] call life_fnc_numberText]],"life_fnc_broadcast",nil,false] spawn life_fnc_MP; 
_vault setVariable["fed_locked",true,true]; 
sleep (30 * 60);  
_vault setVariable["fed_locked",false,true]; 
_vault setVariable["fed_rob_ip",false,true]; 
 
 
}; 
};