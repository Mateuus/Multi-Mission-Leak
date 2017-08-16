#include <macro.hpp> 
/* 
 File: fn_createBase.sqf 
 Author: Blackd0g 
 
 Description: 
 gets the price of an object 
*/ 
private ["_type", "_price" ,"_categories" ,"_cfg" ,"_index"]; 
 
_type = _this select 0; 
_price = -1; 
_index = -1; 
_categories = [ 
 "Traffic", "Police", "Optional", "Defense", "GangArea", "Lamps", "Admin" 
]; 
 
{ 
 _cfg = [_x] call build_fnc_objects; 
 
 { 
  if (_type == (_x select 0)) exitWith { 
   _index = _forEachIndex; 
  }; 
 }forEach _cfg; 
 
 if (_index != -1) exitWith { 
  _price = (_cfg select _index) select 1; 
 }; 
 
 } forEach _categories; 
 
_price;