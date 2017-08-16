/* 
 LÖSCHEN, IST UNNÖTIG 
*/ 
private["_house","_houseID","_containers","_query"]; 
_house = param[0,ObjNull,[ObjNull]]; 
if(isNull _house) exitWith {systemChat "House null";}; 
_houseID = _house getVariable["SOyeKO",-1]; 
if(_houseID == -1) exitWith {systemChat "HouseID invalid";}; 
 
_containers = _house getVariable ["containers",[]]; 
 
systemChat format["Number of containers found: %1",count _containers]; 
_arr = []; 
{ 
 _className = typeOf _x; 
 _weapons = getWeaponCargo _x; 
 _magazines = getMagazineCargo _x; 
 _items = getItemCargo _x; 
 _backpacks = getBackpackCargo _x; 
 
 _arr pushBack [_className,[_weapons,_magazines,_items,_backpacks]]; 
} foreach _containers; 
 
_arr = [_arr] call zero_fnc_mresArray; 
_query = format["updateHousescont:%1:%2",_arr,_houseID]; 
[_query,1] call zero_fnc_asyncCall; 
//systemChat "Query ran?"; 
