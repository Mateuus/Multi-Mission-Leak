private["_uiDisp","_time","_timer","_ownerid","_container"]; 
disableSerialization; 
_container = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param; 
_bohrertimer = getNumber(missionconfigfile >> "CfgEvents" >> "diamondjob" >> "diamondjob_bohrer_timer"); 
_time = time + _bohrertimer; 
 
while {true} do { 
if(round(_time - time) < 1) exitWith {}; 
if(!(_container getVariable ["container_bohrung",false])) exitWith {}; 
sleep 0.07; 
}; 
 
if(!(_container getVariable["container_bohrung",false])) exitWith {}; 
 
_container setVariable["container_bohrung",false,true]; 
_container setVariable["container_open",true,true]; 
