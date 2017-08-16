/* 
 
 file: fn_msgRequest.sqf 
 Author: Silex 
  
 Fills the Messagelist 
*/ 
private["_query","_queryResult","_uid","_player"]; 
_uid = param [0,"",[""]]; 
_player = param [1,ObjNull,[ObjNull]]; 
_query = format["SELECT fromID, toID, message, fromName, toName FROM lhm_messages WHERE toID='%1' ORDER BY time DESC",_uid]; 
 
 
_queryResult = [_query,2,true] call DB_fnc_asyncCall; 
waitUntil{!isNil"_queryResult"}; 
 
if(count _queryResult == 0) exitWith {}; 
{ 
 [[1,_x],"lhm_fnc_smartphone",_player,false] call lhm_fnc_mp; 
}forEach _queryResult;