 
 
 
 
 
if(muell_counter > 0) then 
{ 
muell_counter = muell_counter - 1; 
} else { 
muell_counter = 0; 
}; 
publicVariable "muell_counter"; 
 
[] call life_fnc_hudUpdate;