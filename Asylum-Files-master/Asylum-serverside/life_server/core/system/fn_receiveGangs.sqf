 
 
 
 
 
 
 
 
private["_session","_index","_talents","_members"]; 
_session = _this select 0; 
 
 
if(isNil "_session") exitWith {}; 
 
{  
_sess = _x; 
_index = -1; 
{ if ((_sess select 0) == (_x select 0)) then { _index = _forEachIndex; }; } foreach life_server_gangs; 
if (_index < 0) then { _index = count life_server_gangs; }; 
_members = if (typeName (_x select 6) == "STRING") then { parseNumber(_x select 6) } else { _x select 6 }; 
_talents = if (typeName (_x select 8) == "STRING") then { call compile (_x select 8) } else { _x select 8 }; 
if (count _x > 1) then { life_server_gangs set [_index, [(_x select 0),(_x select 1),(_x select 2),parseNumber(_x select 3),parseNumber(_x select 4),parseNumber(_x select 5),_members,parseNumber(_x select 7),_talents]]; }; 
} foreach (_session); 
 
