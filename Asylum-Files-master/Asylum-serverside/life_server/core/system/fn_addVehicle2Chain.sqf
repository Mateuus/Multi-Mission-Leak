 
 
 
 
 
 
 
private["_vehicle"]; 
_vehicle = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param; 
if(!(_vehicle in life_vehicles)) then 
{ 
life_vehicles set[count life_vehicles,_vehicle]; 
}; 
 
_dbInfo = _vehicle getVariable["dbInfo",[]]; 
if (count _dbInfo > 2) then 
{ 
if ((_dbInfo select 2) == player) then 
{ 
if (((_vehicle isKindOf "Air") && (23 in life_talents)) || (89 in life_talents)) then 
{ 
if (!(_vehicle in life_tracked)) then { life_tracked set [count life_tracked, _vehicle]; }; 
}; 
 
if ((_vehicle isKindOf "Air") && (22 in life_talents)) then 
{ 
_vehicle addBackpackCargoGlobal ["B_Parachute", 5]; 
}; 
}; 
};