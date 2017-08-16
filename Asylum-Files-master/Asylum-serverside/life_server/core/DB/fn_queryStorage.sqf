 
 
 
 
 
 
 
private["_query","_result","_ret","_pageNo"]; 
 
_pageNo = [_this,0,0,[0]] call BIS_fnc_param; 
_houses = [_this,1,[],[[]]] call BIS_fnc_param; 
 
_csv = ""; 
{ 
_csv = _csv + (str _x); 
if (_forEachIndex < ((count _houses) - 1)) then { _csv = _csv + ","; }; 
} foreach _houses; 
_csv = [_csv, """", ""] call KRON_Replace; 
 
_query = format["SELECT `houseid`,`houseworldspace`,`worldspace`,`container`,`classname`,`contents`,`id`,`virtual` FROM storage WHERE FIND_IN_SET(`houseid`,""%2"") > 0 ORDER BY `id` LIMIT %1,2", (_pageNo * 2), _csv]; 
diag_log format["[queryStorage] _query = %1", _query]; 
_result = "Arma2Net.Unmanaged" callExtension format ["Arma2NETMySQLCommand ['asylumlife%2', '%1']", _query, life_server_instance]; 
_result = call compile format["%1", _result]; 
if(isNil {((_result select 0) select 0)}) then 
{ 
_ret = []; 
} 
else 
{ 
_ret = (_result select 0); 
}; 
 
_ret;