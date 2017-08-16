/* 
 Author: Bryan "Tonic" Boardwine 
 
 Description: 
 Fetches all the players houses and sets them up. 
*/ 
private["_query","_houses"]; 
if(_this == "") exitWith {}; 
 
_query = format["housingFetchPlayerHouse:%1",_this]; 
waitUntil{!DB_Async_Active}; 
_houses = [_query,2,true] call DB_fnc_asyncCall; 
 
_return = []; 
{ 
 _pos = call compile format["%1",_x select 1]; 
 _house = nearestBuilding _pos; 
 _house allowDamage false; 
 _containers = []; 
 _house setVariable["slots",[],true]; 
 _house setVariable["house_security",_x select 4,true]; 
 if(!isNil {(_house getVariable "containers")}) then { 
  {if(!isNull _x) then {deleteVehicle _x;};} foreach (_house getVariable "containers"); 
 }; 
 
 _trunk = _x select 2; 
 _containerData = _x select 3; 
 _house setVariable["Trunk",_trunk,true]; 
  
 for "_x" from 0 to 10 do {_house animate [format["door_%1_rot",_x],0]; _house setVariable [format["bis_disabled_Door_%1",_x],1,true];}; 
  
 { 
  if(count _x == 0) exitWith {}; //No containers / items. 
  _className = _x select 0; 
  _weapons = (_x select 1) select 0; 
  _magazines = (_x select 1) select 1; 
  _items = (_x select 1) select 2; 
  _backpacks = (_x select 1) select 3; 
 
  //Setup the variables 
  _positions = [_house] call life_fnc_getBuildingPositions; 
  if(_forEachIndex >= count _positions) exitWith {}; 
  _pos = _positions select _forEachIndex; 
  _slots = _house getVariable ["slots",[]]; 
  _slots pushBack _forEachIndex; 
  _house setVariable["slots",_slots,true]; 
 
  _container = createVehicle[_className,_pos,[],0,"NONE"]; 
  waitUntil{!isNil "_container"}; 
  waitUntil{!isNull _container}; 
  _container allowDamage false; 
  _container enableRopeAttach false; 
  _container enableSimulation false; 
  _container setPosATL [_pos select 0,_pos select 1,(_pos select 2) - 0.3]; 
  _container setVectorUp [0,0,1]; 
  _container setVariable ["containerHouse",_house,true]; 
 
  _containers pushBack _container; 
  clearWeaponCargoGlobal _container; 
  clearItemCargoGlobal _container; 
  clearMagazineCargoGlobal _container; 
  clearBackpackCargoGlobal _container; 
  //Add weapons to the crate. 
  { 
   _weaponCount = (_weapons select 1) select _forEachIndex; 
   _container addWeaponCargoGlobal [_x,_weaponCount]; 
  } foreach (_weapons select 0); 
 
  //Add magazines 
  { 
   _magazineCount = (_magazines select 1) select _forEachIndex; 
   _container addMagazineCargoGlobal [_x,_magazineCount]; 
  } foreach (_magazines select 0); 
 
  //Add items 
  { 
   _itemCount = (_items select 1) select _forEachIndex; 
   _container addItemCargoGlobal [_x,_itemCount]; 
  } foreach (_items select 0); 
 
  //Add backpacks 
  { 
   _backpackCount = (_backpacks select 1) select _forEachIndex; 
   _container addBackpackCargoGlobal [_x,_backpackCount]; 
  } foreach (_backpacks select 0); 
 
 } foreach _containerData; 
 
 _house setVariable["containers",_containers,true]; 
 _return pushBack [_x select 1,_containers]; 
} foreach _houses; 
 
missionNamespace setVariable[format["houses_%1",_this],_return];