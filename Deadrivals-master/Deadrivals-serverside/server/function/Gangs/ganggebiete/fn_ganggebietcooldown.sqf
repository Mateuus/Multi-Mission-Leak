_flag = [_this,0,Objnull,[Objnull]] call BIS_fnc_param; 
 
_flag setVariable ["einnehmbar",true,true]; 
_flag setVariable ["unterbrochen",true,true]; 
sleep (10 * 60); 
_flag setVariable ["undercontrol",false,true]; 
_flag setVariable ["unterbrochen",false,true]; 
_flag setVariable ["einnehmbar",false,true];