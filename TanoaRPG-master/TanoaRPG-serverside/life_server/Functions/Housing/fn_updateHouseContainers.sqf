/* 
 BLAH BLAH 
 I LOVE NOTEPAD++ GET OVER IT 
 BLAH! 
*/ 
if(!isNull life_hc_inUse) exitWith {_this remoteExec ["TEX_fnc_updateHouseContainers", life_hc_inUse]}; 
 
private["_housePos","_houseID","_containers","_query","_pos","_className","_weapons","_magazines","_items","_backpacks"]; 
_containers = [_this,0,[]] call BIS_fnc_param; 
_houseID = [_this,1,-1] call BIS_fnc_param; 
_housePos = [_this,2,[]] call BIS_fnc_param; 
if((_houseID == (-1)) || ((count _housePos) == 0)) exitWith {}; 
 
_query = format["Select pos from houses where id='%1'",_houseID]; 
_pos = [_query,2] call DB_fnc_asyncCall; 
 
if((count _pos) == 0) exitWith {}; 
_pos = call compile format["%1",(_pos select 0)]; 
if((_pos distance _housePos) > 2) exitWith {}; 
 
_arr = []; 
{ 
 _className = typeOf _x; 
 _weapons = getWeaponCargo _x; 
 _magazines = getMagazineCargo _x; 
 _items = getItemCargo _x; 
 _backpacks = getBackpackCargo _x; 
  
 _arr set[count _arr,[_className,[_weapons,_magazines,_items,_backpacks]]]; 
} foreach _containers; 
 
_arr = [_arr] call DB_fnc_mresArray; 
_query = format["UPDATE houses SET containers='%1' WHERE id='%2'",_arr,_houseID]; 
[_query,1] call DB_fnc_asyncCall;