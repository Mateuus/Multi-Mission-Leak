 
 
 
 
 
 
 
private["_ret","_page"]; 
 
_page = 0; 
while {true} do 
{ 
_ret = [_page] call DB_fnc_queryGangs; 
_page = _page + 1; 
waitUntil {typeName _ret == "ARRAY" OR typeName _ret == "STRING" OR isNil "_ret"}; 
 
if(!isNil "_ret") then 
{ 
[_ret] spawn ASY_fnc_receiveGangs; 
} 
else 
{ 
[nil] spawn ASY_fnc_receiveGangs; 
}; 
 
if ((count _ret) < 50) exitWith {}; 
}; 
