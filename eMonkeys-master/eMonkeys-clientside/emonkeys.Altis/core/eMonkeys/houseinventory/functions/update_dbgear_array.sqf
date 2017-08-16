private ["_house","_gear"];
_house = _this select 0;
_gear = _this select 1;
[[_house,_gear],"house_inventory_fnc_update_db_gear",false] call EMonkeys_fnc_MP;