/* 
 
 file: fn_handleMessages.sqf 
 Author: Silex 
 
*/ 
 
private["_msg","_to","_target","_player","_type","_pid","_fromName"]; 
_target = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param; 
_msg = [_this,1,"",[""]] call BIS_fnc_param; 
_player = [_this,2,ObjNull,[ObjNull]] call BIS_fnc_param; 
_type = [_this,3,-1,[0]] call BIS_fnc_param; 
 
if (!(isNull _player)) then 
{ 
 _pid = getPlayerUID _player; 
 _fromName = _player getVariable["realname",name _player]; 
} 
else 
{ 
    _pid = ""; 
    _fromName = "Unbekannt"; 
}; 
 
switch(_type) do 
{ 
 // normal message 
 case 0: 
 { 
     _to = call compile format["%1", _target]; 
  if(isNull _to) exitWith {}; 
         
        [[_msg,_player,0],"PG_fnc_deliverMessage",_to,false] spawn life_fnc_MP; 
 }; 
     
 // message to cops 
 case 1: 
 { 
        [[_msg,_fromName,_pid,1],"PG_fnc_receiveMessage",west,false] spawn life_fnc_MP; 
 }; 
     
 // player to admin 
 case 2: 
 {  
  [[_msg,_fromName,_pid,2],"PG_fnc_receiveMessage",true,false] spawn life_fnc_MP; 
 }; 
     
 // message to medics/alac 
 case 3: 
 {  
  [[_msg,_fromName,_pid,5],"PG_fnc_receiveMessage",independent,false] spawn life_fnc_MP; 
 }; 
     
 // admin to player 
 case 4: 
 { 
  _to = call compile format["%1", _target]; 
  if(isNull _to) exitWith {}; 
  
  [[_msg,_fromName,"",4,"Administrator"],"PG_fnc_receiveMessage",_to,false] spawn life_fnc_MP; 
 }; 
     
 // admin to all 
 case 5: 
 { 
  [[_msg,_fromName,"",4,"Administrator"],"PG_fnc_receiveMessage",true,false] spawn life_fnc_MP; 
 }; 
     
 // message to ASF 
 case 6: 
 { 
  [[_msg,_fromName,_pid,6],"PG_fnc_receiveMessage",east,false] spawn life_fnc_MP; 
 }; 
     
 // cops to all 
 case 7: 
 { 
  [[_msg,_fromName,"",7,"Polizei"],"PG_fnc_receiveMessage",true,false] spawn life_fnc_MP; 
 }; 
     
 // event to all 
 case 8: 
 { 
  [[_msg,_fromName,"",11,"Event Team"],"PG_fnc_receiveMessage",true,false] spawn life_fnc_MP; 
 }; 
};