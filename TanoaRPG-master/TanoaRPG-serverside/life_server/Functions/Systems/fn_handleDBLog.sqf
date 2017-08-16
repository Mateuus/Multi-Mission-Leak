/* 
 
    file: fn_handleDBLog.sqf 
    Author: Nukefliege 
 
*/    
if(!isNull life_hc_inUse) exitWith {_this remoteExec ["TEX_fnc_handleDBLog", life_hc_inUse]}; 
     
private["_betrag","_target","_player","_textType","_query","_pid","_toID","_textType"]; 
_player = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param; 
_target = [_this,1,ObjNull,[ObjNull]] call BIS_fnc_param; 
_betrag = [_this,2,-1] call BIS_fnc_param; 
_textType     = [_this,3,"",[""]] call bis_fnc_param; 
_atm     = [_this,4,-1] call BIS_fnc_param; 
_cash     = [_this,5,-1] call BIS_fnc_param; 
 
if(isNULL _target)  exitWith {}; 
_pid = getPlayerUID _player; 
_toID = getPlayerUID _target; 
_fromName = name _player; 
_toName = name _target; 
_query = format["INSERT INTO geldlog (von, zu, betrag, type, vonname, zuname, curcash, curatm) VALUES('%1', '%2', '%3', '""%4""', '%5', '%6', '%7', '%8')",_pid,_toID,_betrag,_textType,_fromName,_toName,_cash,_atm]; 
//diag_log format["Query: %1",_query]; 
//waitUntil{!DB_Async_Active}; 
[_query,1] call DB_fnc_asyncCall;