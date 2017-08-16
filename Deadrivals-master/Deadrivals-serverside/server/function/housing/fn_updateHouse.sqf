private["_talente","_talentpunkte","_exp","_groupID","_bank","_maxMembers","_members","_query","_owner","_vorstellung"]; 
params [ 
["_mode",0,[0]], 
["_house",ObjNull,[ObjNull]] 
]; 
 
switch (_mode) do { 
case 0: {   
_upgrades = _house getVariable "house_upgrades"; 
_owner = _house getVariable "house_uid"; 
_houseid = _house getVariable "house_id"; 
_platz = _house getVariable "house_platz"; 
_weightinventory = _house getVariable "house_maxinventory"; 
_weightgeheimversteck = _house getVariable "house_maxversteck"; 
if (worldName == "Tanoa") then { 
_query = format ["UPDATE houses_tanoa SET upgrades = '%1', platz = '%2', maxinventory = '%3', maxversteck = '%4' WHERE pid = '%5' AND id = '%6'",_upgrades,_platz,_weightinventory,_weightgeheimversteck,_owner,_houseid]; 
_queryResult = [_query,1] call SERVERDATABASE_fnc_asyncCall; 
} else { 
_query = format ["UPDATE houses_altis SET upgrades = '%1', platz = '%2', maxinventory = '%3', maxversteck = '%4' WHERE pid = '%5' AND id = '%6'",_upgrades,_platz,_weightinventory,_weightgeheimversteck,_owner,_houseid]; 
_queryResult = [_query,1] call SERVERDATABASE_fnc_asyncCall; 
}; 
}; 
 
case 1: {   
_owner = _house getVariable "house_uid"; 
_houseid = _house getVariable "house_id"; 
_inventory = _house getVariable "house_versteck"; 
if (worldName == "Tanoa") then { 
_query = format ["UPDATE houses_tanoa SET versteck = '%1' WHERE pid = '%2' AND id = '%3'",_inventory,_owner,_houseid]; 
_queryResult = [_query,1] call SERVERDATABASE_fnc_asyncCall; 
} else { 
_query = format ["UPDATE houses_altis SET versteck = '%1' WHERE pid = '%2' AND id = '%3'",_inventory,_owner,_houseid]; 
_queryResult = [_query,1] call SERVERDATABASE_fnc_asyncCall; 
}; 
}; 
 
case 2: {   
_owner = _house getVariable "house_uid"; 
_houseid = _house getVariable "house_id"; 
_inventory = _house getVariable "house_inventory"; 
if (worldName == "Tanoa") then { 
_query = format ["UPDATE houses_tanoa SET inventory = '%1' WHERE pid = '%2' AND id = '%3'",_inventory,_owner,_houseid]; 
_queryResult = [_query,1] call SERVERDATABASE_fnc_asyncCall; 
} else { 
_query = format ["UPDATE houses_altis SET inventory = '%1' WHERE pid = '%2' AND id = '%3'",_inventory,_owner,_houseid]; 
_queryResult = [_query,1] call SERVERDATABASE_fnc_asyncCall; 
}; 
}; 
 
case 3: {   
_owner = _house getVariable "house_uid"; 
_houseid = _house getVariable "house_id"; 
_inventory = _house getVariable "house_geld"; 
if (worldName == "Tanoa") then { 
_query = format ["UPDATE houses_tanoa SET geld = '%1' WHERE pid = '%2' AND id = '%3'",_inventory,_owner,_houseid]; 
_queryResult = [_query,1] call SERVERDATABASE_fnc_asyncCall; 
} else { 
_query = format ["UPDATE houses_altis SET geld = '%1' WHERE pid = '%2' AND id = '%3'",_inventory,_owner,_houseid]; 
_queryResult = [_query,1] call SERVERDATABASE_fnc_asyncCall; 
}; 
}; 
 
case 4: {   
_owner = _house getVariable "house_uid"; 
_houseid = _house getVariable "house_id"; 
_schlussel = _house getVariable "house_schlussel"; 
if (worldName == "Tanoa") then { 
_query = format ["UPDATE houses_tanoa SET schlussel = '%1' WHERE pid = '%2' AND id = '%3'",_schlussel,_owner,_houseid]; 
_queryResult = [_query,1] call SERVERDATABASE_fnc_asyncCall; 
} else { 
_query = format ["UPDATE houses_altis SET schlussel = '%1' WHERE pid = '%2' AND id = '%3'",_schlussel,_owner,_houseid]; 
_queryResult = [_query,1] call SERVERDATABASE_fnc_asyncCall; 
}; 
}; 
 
case 5: {   
_owner = _house getVariable "house_uid"; 
_houseid = _house getVariable "house_id"; 
_gekundigt = _house getVariable "house_gekundigt"; 
if (worldName == "Tanoa") then { 
_query = format ["UPDATE houses_tanoa SET gekundigt = '%1' WHERE pid = '%2' AND id = '%3'",_gekundigt,_owner,_houseid]; 
_queryResult = [_query,1] call SERVERDATABASE_fnc_asyncCall; 
} else { 
_query = format ["UPDATE houses_altis SET gekundigt = '%1' WHERE pid = '%2' AND id = '%3'",_gekundigt,_owner,_houseid]; 
_queryResult = [_query,1] call SERVERDATABASE_fnc_asyncCall;   
}; 
}; 
 
case 6: {   
_owner = _house getVariable "house_uid"; 
_houseid = _house getVariable "house_id"; 
_gekundigt = _house getVariable "house_gekundigt"; 
if (worldName == "Tanoa") then { 
_query = format ["UPDATE houses_tanoa SET gekundigt = '%1' WHERE pid = '%2' AND id = '%3'",_gekundigt,_owner,_houseid]; 
_queryResult = [_query,1] call SERVERDATABASE_fnc_asyncCall; 
} else { 
_query = format ["UPDATE houses_altis SET gekundigt = '%1' WHERE pid = '%2' AND id = '%3'",_gekundigt,_owner,_houseid]; 
_queryResult = [_query,1] call SERVERDATABASE_fnc_asyncCall; 
}; 
}; 
 
case 7: { 
_owner = _house getVariable "house_uid"; 
_houseid = _house getVariable "house_id"; 
_renttime = _house getVariable "house_renttime"; 
if (worldName == "Tanoa") then { 
_query = format ["UPDATE houses_tanoa SET renttime = '%1' WHERE pid = '%2' AND id = '%3'",_renttime,_owner,_houseid]; 
_queryResult = [_query,1] call SERVERDATABASE_fnc_asyncCall; 
} else { 
_query = format ["UPDATE houses_altis SET renttime = '%1' WHERE pid = '%2' AND id = '%3'",_renttime,_owner,_houseid]; 
_queryResult = [_query,1] call SERVERDATABASE_fnc_asyncCall; 
}; 
}; 
}; 
