/* 
 File: fn_jailSys.sqf 
*/ 
private["_unit","_bad","_ret","_time","_query","_result"]; 
_unit = param[0,Objnull,[Objnull]]; 
if(isNull _unit) exitWith {}; 
_bad = param[1,false,[false]]; 
_time = param[2,15,[0]]; 
 
if(_bad) then { 
 _query = format["selectJailTimer:%1",getPlayerUID _unit]; 
 _result = [_query,2] call zero_fnc_asyncCall; 
 _result = (call compile format["%1", _result]) select 0; 
 _time = _result; 
}else{ 
 _query = format["updateJailTimer:%1:%2", _time, getPlayerUID _unit]; 
 _result = [_query,1] call zero_fnc_asyncCall; 
}; 
 
jailedUnits pushBack (getPlayerUID _unit); 
_ret = [_unit] call zero_fnc_wantedPerson; 
[_ret,_bad,_time] remoteExec ["zero_fnc_wwqZ",(owner _unit)]; 
