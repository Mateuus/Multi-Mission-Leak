private["_vehicle","_impound","_vInfo","_vInfo","_plate","_uid","_query","_sql","_unit","_trunk","_vehItems","_vehMags","_vehWeapons","_vehBackpacks","_cargo","_saveItems","_storetext","_resourceItems","_fuel","_damage","_itemList","_totalweight","_weight"]; 
_vehicle = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param; 
_impound = [_this,1,false,[true]] call BIS_fnc_param; 
_unit = [_this,2,ObjNull,[ObjNull]] call BIS_fnc_param; 
_mode = [_this,3,-1,[0]] call BIS_fnc_param; 
_storetext = [_this,4,"",[""]] call BIS_fnc_param; 
_resourceItems = getArray(missionconfigfile >> "Vehicle" >> "no_save_veh_items"); 
 
if(isNull _vehicle OR isNull _unit) exitWith {NOCRIS_impound_inuse = false; (owner _unit) publicVariableClient "NOCRIS_impound_inuse";NOCRIS_GARAGE_STORE = false;(owner _unit) publicVariableClient "NOCRIS_GARAGE_STORE";};  
 
_vInfo = _vehicle getVariable["dbInfo",[]]; 
 
if(count _vInfo > 0) then { 
_plate = _vInfo select 1; 
_uid = _vInfo select 0; 
}; 
 
_fuel = (fuel _vehicle); 
_impoundstatus = 1; 
 
switch(_mode) do { 
case 1: { 
_impoundstatus = 1; 
}; 
case 2: { 
_impoundstatus = 2; 
}; 
case 3: { 
_impoundstatus = 3; 
}; 
case 6: { 
_impoundstatus = 6; 
}; 
}; 
 
if(_impound) exitWith { 
if(count _vInfo == 0) then  { 
NOCRIS_impound_inuse = false; 
(owner _unit) publicVariableClient "NOCRIS_impound_inuse"; 
 
if(!isNil "_vehicle" && {!isNull _vehicle}) then { 
deleteVehicle _vehicle; 
}; 
} else { 
_query = format ["UPDATE vehicles SET active = '0', fuel = '%1', impound = '%2' WHERE pid = '%3' AND plate = '%4'",_fuel,_impoundstatus,_uid,_plate]; 
_queryResult = [_query,1] call SERVERDATABASE_fnc_asyncCall; 
if(!isNil "_vehicle" && {!isNull _vehicle}) then { 
deleteVehicle _vehicle; 
}; 
 
NOCRIS_impound_inuse = false; 
(owner _unit) publicVariableClient "NOCRIS_impound_inuse"; 
}; 
}; 
 
 
if(count _vInfo == 0) exitWith { 
[1,(localize "STR_Garage_Store_NotPersistent")] remoteExecCall ["NETWORK_fnc_broadcast",(owner _unit)]; 
NOCRIS_GARAGE_STORE = false; 
(owner _unit) publicVariableClient "NOCRIS_GARAGE_STORE"; 
}; 
 
_uidplayer = getPlayerUID _unit; 
 
if(_uidplayer != _uid) exitWith { 
[1,(localize "STR_Garage_Store_NoOwnership")] remoteExecCall ["NETWORK_fnc_broadcast",(owner _unit)]; 
NOCRIS_GARAGE_STORE = false; 
(owner _unit) publicVariableClient "NOCRIS_GARAGE_STORE"; 
}; 
 
 
_trunk = _vehicle getVariable["Trunk",[[],0]]; 
_itemList = _trunk select 0; 
_totalweight = 0; 
_items = []; 
{ 
_itemName = _x select 0; 
if(!(_itemName in _resourceItems)) then { 
_ItemNumber = _x select 1; 
_items pushback [_itemName,_ItemNumber]; 
_val = getNumber(missionconfigfile >> "CfgItems" >> "items" >> _itemName >> "weight"); 
_weight = _val * _ItemNumber; 
_totalweight = _weight + _totalweight; 
}; 
} foreach _itemList; 
_trunk = [_items,_totalweight]; 
 
_geheimfach = _vehicle getVariable["Geheimfach",[[],0]]; 
_itemList = _geheimfach select 0; 
_totalweight = 0; 
_items = []; 
{ 
_itemName = _x select 0; 
if(!(_itemName in _resourceItems)) then { 
_ItemNumber = _x select 1; 
_items pushback [_itemName,_ItemNumber]; 
_val = getNumber(missionconfigfile >> "CfgItems" >> "items" >> _itemName >> "weight"); 
_weight = _val * _ItemNumber; 
_totalweight = _weight + _totalweight; 
}; 
} foreach _itemList; 
_geheimfach = [_items,_totalweight]; 
 
_updatevehicle = format ["UPDATE vehicles SET active = '0', inventory = '%1', geheimfach = '%2', fuel = '%3' WHERE pid = '%4' AND plate = '%5'",_trunk,_geheimfach,_fuel,_uid,_plate]; 
_updatevehicle = [_updatevehicle,1] call SERVERDATABASE_fnc_asyncCall; 
 
if(!isNil "_vehicle" && {!isNull _vehicle}) then { 
deleteVehicle _vehicle; 
}; 
 
NOCRIS_GARAGE_STORE = false; 
(owner _unit) publicVariableClient "NOCRIS_GARAGE_STORE"; 
[1,_storetext] remoteExecCall ["NETWORK_fnc_broadcast",(owner _unit)];