private["_queryResult","_query","_count","_houses","_id","_uid","_name","_schlussel","_platz","_inventory","_maxinventory","_versteck","_maxversteck","_bett","_drogenlabor","_garage","_zimmer","_alarmanlage","_armeddoor","_onlinebanking","_geld","_maxgeld","_erstehilfe","_alkohol","_posstring","_house","_pos"]; 
if (worldName == "Tanoa") then { 
 
_query = format["SELECT id, pid, name, schlussel, platz, inventory, maxinventory, versteck, maxversteck, geld, upgrades, pos, renttime, gekundigt FROM houses_tanoa WHERE owned = '%1'",1]; 
 
_houses = [_query,2,true] call SERVERDATABASE_fnc_asyncCall; 
 
{ 
_id = _x select 0; 
_uid = _x select 1; 
_name = _x select 2; 
_schlussel = _x select 3; 
_platz = _x select 4; 
_inventory = _x select 5; 
_maxinventory = _x select 6; 
_versteck = _x select 7; 
_maxversteck = _x select 8; 
_geld = _x select 9; 
_upgrades = _x select 10; 
_posstring = _x select 11; 
_renttime = _x select 12; 
_gekundigt = _x select 13; 
_pos = call compile format["%1",_posstring]; 
_house = nearestObject [_pos, "House"]; 
 
if (_renttime <= 0) then { 
if (_gekundigt) then { 
_query1 = format["UPDATE houses_tanoa SET owned='%1' WHERE id='%2' AND pid='%3'",0,_id,_uid]; 
[_query1,1] call SERVERDATABASE_fnc_asyncCall; 
} else { 
_generaldata = format["SELECT bank FROM Zivilist WHERE playerid = '%1'",_uid]; 
_data = [_generaldata,2] call SERVERDATABASE_fnc_asyncCall; 
_houseType = typeOf _house; 
_price = getNumber(missionconfigfile >> "CfgHousing" >> (_houseType) >> "rentprice"); 
_renttime = getNumber(missionconfigfile >> "CfgHousing" >> (_houseType) >> "renttime"); 
if ((_data select 0) < _price) then { 
_query1 = format["UPDATE houses_tanoa SET owned='%1' WHERE id='%2' AND pid='%3'",0,_id,_uid]; 
[_query1,1] call SERVERDATABASE_fnc_asyncCall; 
} else { 
_query1 = format["UPDATE Zivilist SET bank = bank - '%1' WHERE playerid='%2'",_price,_uid]; 
[_query1,1] call SERVERDATABASE_fnc_asyncCall; 
 
_query1 = format["UPDATE houses_tanoa SET renttime='%1' WHERE id='%2' AND pid='%3'",_renttime,_id,_uid]; 
[_query1,1] call SERVERDATABASE_fnc_asyncCall; 
 
_house setVariable["house_id",_id,true]; 
_house setVariable["house_uid",_uid,true]; 
_house setVariable["house_name",_name,true]; 
_house setVariable["house_schlussel",_schlussel,true]; 
_house setVariable["house_platz",_platz,true]; 
_house setVariable["house_inventory",_inventory,true]; 
_house setVariable["house_maxinventory",_maxinventory,true]; 
_house setVariable["house_versteck",_versteck,true]; 
_house setVariable["house_maxversteck",_maxversteck,true]; 
_house setVariable["house_geld",_geld,true]; 
_house setVariable["house_upgrades",_upgrades,true]; 
_house setVariable["house_renttime",_renttime,true]; 
_house setVariable["house_gekundigt",_gekundigt,true]; 
_house setVariable["house_erstehilfecooldown",false,true]; 
_house setVariable["trunk_in_use",false,true]; 
_house setVariable["house_raid",false,true]; 
_numOfDoors = getNumber(configFile >> "CfgVehicles" >> (typeOf _house) >> "numberOfDoors"); 
for "_i" from 1 to _numOfDoors do { 
_house setVariable [format["bis_disabled_Door_%1",_i],1,true]; 
}; 
}; 
}; 
} else { 
_house setVariable["house_id",_id,true]; 
_house setVariable["house_uid",_uid,true]; 
_house setVariable["house_name",_name,true]; 
_house setVariable["house_schlussel",_schlussel,true]; 
_house setVariable["house_platz",_platz,true]; 
_house setVariable["house_inventory",_inventory,true]; 
_house setVariable["house_maxinventory",_maxinventory,true]; 
_house setVariable["house_versteck",_versteck,true]; 
_house setVariable["house_maxversteck",_maxversteck,true]; 
_house setVariable["house_geld",_geld,true]; 
_house setVariable["house_upgrades",_upgrades,true]; 
_house setVariable["house_renttime",_renttime,true]; 
_house setVariable["house_gekundigt",_gekundigt,true]; 
_house setVariable["house_erstehilfecooldown",false,true]; 
_house setVariable["trunk_in_use",false,true]; 
_house setVariable["house_raid",false,true]; 
_numOfDoors = getNumber(configFile >> "CfgVehicles" >> (typeOf _house) >> "numberOfDoors"); 
for "_i" from 1 to _numOfDoors do { 
_house setVariable [format["bis_disabled_Door_%1",_i],1,true]; 
}; 
}; 
} forEach _houses; 
 
["CALL deleteoldhouse",1] call SERVERDATABASE_fnc_asyncCall; 
} else { 
_query = format["SELECT id, pid, name, schlussel, platz, inventory, maxinventory, versteck, maxversteck, geld, upgrades, pos, renttime, gekundigt FROM houses_altis WHERE owned = '%1'",1]; 
 
_houses = [_query,2,true] call SERVERDATABASE_fnc_asyncCall; 
 
{ 
_id = _x select 0; 
_uid = _x select 1; 
_name = _x select 2; 
_schlussel = _x select 3; 
_platz = _x select 4; 
_inventory = _x select 5; 
_maxinventory = _x select 6; 
_versteck = _x select 7; 
_maxversteck = _x select 8; 
_geld = _x select 9; 
_upgrades = _x select 10; 
_posstring = _x select 11; 
_renttime = _x select 12; 
_gekundigt = _x select 13; 
_pos = call compile format["%1",_posstring]; 
_house = nearestObject [_pos, "House"]; 
 
if (_renttime <= 0) then { 
if (_gekundigt) then { 
_query1 = format["UPDATE houses_altis SET owned='%1' WHERE id='%2' AND pid='%3'",0,_id,_uid]; 
[_query1,1] call SERVERDATABASE_fnc_asyncCall; 
} else { 
_generaldata = format["SELECT bank FROM Zivilist WHERE playerid = '%1'",_uid]; 
_data = [_generaldata,2] call SERVERDATABASE_fnc_asyncCall; 
_houseType = typeOf _house; 
_price = getNumber(missionconfigfile >> "CfgHousing" >> (_houseType) >> "rentprice"); 
_renttime = getNumber(missionconfigfile >> "CfgHousing" >> (_houseType) >> "renttime"); 
if ((_data select 0) < _price) then { 
_query1 = format["UPDATE houses_altis SET owned='%1' WHERE id='%2' AND pid='%3'",0,_id,_uid]; 
[_query1,1] call SERVERDATABASE_fnc_asyncCall; 
} else { 
_query1 = format["UPDATE Zivilist SET bank = bank - '%1' WHERE playerid='%2'",_price,_uid]; 
[_query1,1] call SERVERDATABASE_fnc_asyncCall; 
 
_query1 = format["UPDATE houses_altis SET renttime='%1' WHERE id='%2' AND pid='%3'",_renttime,_id,_uid]; 
[_query1,1] call SERVERDATABASE_fnc_asyncCall; 
 
_house setVariable["house_id",_id,true]; 
_house setVariable["house_uid",_uid,true]; 
_house setVariable["house_name",_name,true]; 
_house setVariable["house_schlussel",_schlussel,true]; 
_house setVariable["house_platz",_platz,true]; 
_house setVariable["house_inventory",_inventory,true]; 
_house setVariable["house_maxinventory",_maxinventory,true]; 
_house setVariable["house_versteck",_versteck,true]; 
_house setVariable["house_maxversteck",_maxversteck,true]; 
_house setVariable["house_geld",_geld,true]; 
_house setVariable["house_upgrades",_upgrades,true]; 
_house setVariable["house_renttime",_renttime,true]; 
_house setVariable["house_gekundigt",_gekundigt,true]; 
_house setVariable["house_erstehilfecooldown",false,true]; 
_house setVariable["trunk_in_use",false,true]; 
_house setVariable["house_raid",false,true]; 
_numOfDoors = getNumber(configFile >> "CfgVehicles" >> (typeOf _house) >> "numberOfDoors"); 
for "_i" from 1 to _numOfDoors do { 
_house setVariable [format["bis_disabled_Door_%1",_i],1,true]; 
}; 
}; 
}; 
} else { 
_house setVariable["house_id",_id,true]; 
_house setVariable["house_uid",_uid,true]; 
_house setVariable["house_name",_name,true]; 
_house setVariable["house_schlussel",_schlussel,true]; 
_house setVariable["house_platz",_platz,true]; 
_house setVariable["house_inventory",_inventory,true]; 
_house setVariable["house_maxinventory",_maxinventory,true]; 
_house setVariable["house_versteck",_versteck,true]; 
_house setVariable["house_maxversteck",_maxversteck,true]; 
_house setVariable["house_geld",_geld,true]; 
_house setVariable["house_upgrades",_upgrades,true]; 
_house setVariable["house_renttime",_renttime,true]; 
_house setVariable["house_gekundigt",_gekundigt,true]; 
_house setVariable["house_erstehilfecooldown",false,true]; 
_house setVariable["trunk_in_use",false,true]; 
_house setVariable["house_raid",false,true]; 
_numOfDoors = getNumber(configFile >> "CfgVehicles" >> (typeOf _house) >> "numberOfDoors"); 
for "_i" from 1 to _numOfDoors do { 
_house setVariable [format["bis_disabled_Door_%1",_i],1,true]; 
}; 
}; 
} forEach _houses; 
 
["CALL deleteoldhouse",1] call SERVERDATABASE_fnc_asyncCall; 
};