private["_vehicle","_plate","_uid","_query","_sql","_dbInfo","_thread"]; 
_vehicle = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param; 
_mode = [_this,1,1,[0]] call BIS_fnc_param; 
if(isNull _vehicle) exitWith {};  
 
_dbInfo = _vehicle getVariable["dbInfo",[]]; 
if(count _dbInfo == 0) exitWith {}; 
_uid = _dbInfo select 0; 
_plate = _dbInfo select 1; 
switch (_mode) do { 
case 1: { 
_resourceItems = getArray(missionconfigfile >> "Vehicle" >> "no_save_veh_items"); 
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
}foreach _itemList; 
_trunk = [_items,_totalweight]; 
 
_query = format ["UPDATE vehicles SET inventory = '%3' WHERE pid = '%1' AND plate = '%2'",_uid,_plate,_trunk]; 
_queryResult = [_query,1] call SERVERDATABASE_fnc_asyncCall; 
}; 
 
case 2: { 
_tuning = _vehicle getVariable["tuning",[-1,-1,-1,-1,-1,-1,-1,-1,-1]]; 
_query = format ["UPDATE vehicles SET tuning = '%1' WHERE pid = '%2' AND plate = '%3'",_tuning,_uid,_plate]; 
_queryResult = [_query,1] call SERVERDATABASE_fnc_asyncCall; 
}; 
 
case 3: { 
_tuningcolor = _vehicle getVariable["tuningcolor",[-1,-1,-1]]; 
_query = format ["UPDATE vehicles SET tuningcolor = '%1', color = '-2' WHERE pid = '%2' AND plate = '%3'",_uid,_plate,_tuningcolor]; 
_queryResult = [_query,1] call SERVERDATABASE_fnc_asyncCall; 
}; 
 
case 4: { 
_resourceItems = getArray(missionconfigfile >> "Vehicle" >> "no_save_veh_items"); 
_trunk = _vehicle getVariable["Geheimfach",[[],0]]; 
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
}foreach _itemList; 
_trunk = [_items,_totalweight]; 
 
_query = format ["UPDATE vehicles SET geheimfach = '%3' WHERE pid = '%1' AND plate = '%2'",_uid,_plate,_trunk]; 
_queryResult = [_query,1] call SERVERDATABASE_fnc_asyncCall; 
}; 
}; 
