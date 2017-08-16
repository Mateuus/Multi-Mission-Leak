/* 
 Author: CooliMC 
  
 Description: 
 Cleans up containers inside the house and broadcasts the Variable (New Script by CooliMC) 
*/ 
 
private["_houses","_positions"]; 
_positions = []; 
_houses = (mvh getVariable [format["HousesData_%1", _this],[]]); 
 
{ 
 { 
  deleteVehicle _x; 
 } forEach (_x select 1); 
  
 _positions pushBack (_x select 2); 
} forEach _houses; 
 
if((count _positions) > 0) then 
{ 
 { 
  _house = (nearestObject [_x, "Building"]); 
  _house setVariable["containers",nil,true]; 
 } forEach _positions; 
}; 
 
mvh setVariable [format["HousesData_%1", _this],nil,true];