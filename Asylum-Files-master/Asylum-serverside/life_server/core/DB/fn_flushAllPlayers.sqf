 
 
 
 
 
 
 
 
{ 
if (typeName _x == "ARRAY") then 
{ 
(_x select 1) call DB_fnc_update; 
}; 
} forEach life_update_buffer; 
 
life_update_buffer = [];