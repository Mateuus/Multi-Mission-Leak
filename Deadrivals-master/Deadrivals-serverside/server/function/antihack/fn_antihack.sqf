[] spawn 
{ 
while {true} do 
{ 
{ 
if(!alive _x) then  
{ 
_dbInfo = _x getVariable["vehicle_info_owners",[]]; 
if(count _dbInfo == 0) then  
{ 
deleteVehicle _x; 
}; 
}; 
} foreach allMissionObjects "LandVehicle"; 
}; 
}; 
 
[] spawn 
{ 
while {true} do 
{ 
{ 
if(!alive _x) then  
{ 
_dbInfo = _x getVariable["vehicle_info_owners",[]]; 
if(count _dbInfo == 0) then  
{ 
deleteVehicle _x; 
}; 
}; 
} foreach allMissionObjects "Air"; 
}; 
};