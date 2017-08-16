 
 
 
 
 
 
 
 
private ["_query","_result","_ret"]; 
 
_query = "SELECT `value` FROM config ORDER BY `index`"; 
_result = "Arma2Net.Unmanaged" callExtension format ["Arma2NETMySQLCommand ['asylumlife%2', '%1']", _query, life_server_instance]; 
_result = call compile format["%1", _result]; 
if(isNil {((_result select 0) select 0)}) then 
{ 
_ret = []; 
} 
else 
{ 
_ret = _result select 0; 
for "_i" from 0 to 10 do 
{ 
if (typeName (_ret select _i) == "ARRAY") then { _ret set [_i, (_ret select _i) select 0] }; 
switch (_i) do 
{ 
case 9; 
case 2: { _ret set [_i, [_ret select _i,1] call DB_fnc_bool] }; 
case 3; 
case 5; 
case 6; 
case 7; 
case 10; 
case 8: { _ret set [_i, parseNumber (_ret select _i)] };  
}; 
}; 
}; 
 
life_configuration = _ret; 
publicVariable "life_configuration";