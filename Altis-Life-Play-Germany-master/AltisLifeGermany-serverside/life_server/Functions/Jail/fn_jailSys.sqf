/* 
 File: fn_jailSys.sqf 
 Author: Bryan "Tonic" Boardwine 
 
 Description: 
 I forget? 
*/ 
private["_unit","_bad","_id","_ret","_time","_arrested"]; 
_unit = [_this,0,Objnull,[Objnull]] call BIS_fnc_param; 
if(isNull _unit) exitWith {}; 
_bad = [_this,1,false,[false]] call BIS_fnc_param; 
_time = [_this,2,15,[0]] call BIS_fnc_param; 
_arrested = false; 
 
if (_time > 0) then { _arrested = true; }; 
 
if(_bad) then //Load time from database 
{ 
 diag_log "***GefängnisZeit*** Zeit wird von DB geladen..."; 
 
 _query = format["civilianJailGetTime:%1",getPlayerUID _unit]; 
 waitUntil{!DB_Async_Active}; 
 _result = [_query,2] call DB_fnc_asyncCall; 
 _result = (_result select 0); 
 
 diag_log format["***GefängnisZeit*** ... zurückgesetzt %1", _result]; 
 
 _time = _result; 
} 
else //Set time to database 
{ 
 diag_log "***GefängnisZeit*** Sende an DB"; 
 _query = format["playerUpdateArrested+JailTime:%1:%2:%3", [_arrested] call DB_fnc_bool, _time, getPlayerUID _unit]; 
 diag_log _query; 
 waitUntil{!DB_Async_Active}; 
 _result = [_query,1] call DB_fnc_asyncCall; 
}; 
 
diag_log format["***GefängnisZeit*** Gefängnis Zeit für Spieler %1 ist %2",name _unit , _time]; 
_id = owner _unit; 
 
_ret = [_unit] call life_fnc_wantedPerson; 
[[_ret,_bad,_time],"life_fnc_jailMe",_id,false] spawn life_fnc_MP;