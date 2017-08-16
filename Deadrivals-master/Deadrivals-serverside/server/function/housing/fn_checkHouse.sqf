private["_housePos","_query"]; 
_house = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param; 
_uid = [_this,1,"",[""]] call BIS_fnc_param; 
_name = [_this,2,"",[""]] call BIS_fnc_param; 
_player = [_this,3,ObjNull,[ObjNull]] call BIS_fnc_param; 
_renttime = [_this,4,0,[0]] call BIS_fnc_param; 
_player = owner _player; 
 
if (isNull _house || _uid isEqualTo "") exitWith {}; 
 
_housePos = getPosATL _house; 
 
if (worldName == "Tanoa") then { 
_query = format["SELECT id FROM houses_tanoa WHERE pos='%1'",_housePos]; 
_queryResult = [_query,2] call SERVERDATABASE_fnc_asyncCall; 
 
if (count _queryResult != 0) exitwith { 
[] remoteExec ["CLIENT_fnc_houseNotAvailable",_player]; 
}; 
 
_array = []; 
_bool = false; 
_inventory = [[],0]; 
 
_query = format["INSERT INTO houses_tanoa SET pid = '%1', name = '%2', schlussel = '%3', inventory = '%4', versteck = '%5', geld = '%6', pos = '%7', owned = '%8', upgrades = '%9' , renttime = '%10' , gekundigt = '%11'",_uid,_name,_array,_inventory,_inventory,_inventory,_housePos,1,_array,_renttime,_bool]; 
[_query,1] call SERVERDATABASE_fnc_asyncCall; 
 
sleep 2; 
 
_query = format["SELECT id, pid, name, schlussel, platz, inventory, maxinventory, versteck, maxversteck, geld, upgrades, renttime, gekundigt FROM houses_tanoa WHERE pos='%1' AND pid='%2' AND owned='1'",_housePos,_uid]; 
 
_houses = [_query,2] call SERVERDATABASE_fnc_asyncCall; 
 
_house setVariable["house_randomid",round(random 99999),true]; 
_house setVariable["house_id",(_houses select 0),true]; 
_house setVariable["house_uid",(_houses select 1),true]; 
_house setVariable["house_name",(_houses select 2),true]; 
_house setVariable["house_schlussel",(_houses select 3),true]; 
_house setVariable["house_platz",(_houses select 4),true]; 
_house setVariable["house_inventory",(_houses select 5),true]; 
_house setVariable["house_maxinventory",(_houses select 6),true]; 
_house setVariable["house_versteck",(_houses select 7),true]; 
_house setVariable["house_maxversteck",(_houses select 8),true]; 
_house setVariable["house_geld",(_houses select 9),true]; 
_house setVariable["house_upgrades",(_houses select 10),true]; 
_house setVariable["house_renttime",(_houses select 11),true]; 
_house setVariable["house_gekundigt",(_houses select 12),true]; 
_house setVariable["house_erstehilfecooldown",false,true]; 
_house setVariable["trunk_in_use",false,true]; 
_house setVariable["house_raid",false,true]; 
 
[_house] remoteExec ["CLIENT_fnc_houseBought",_player]; 
 
} else { 
_query = format["SELECT id FROM houses_altis WHERE pos='%1'",_housePos]; 
_queryResult = [_query,2] call SERVERDATABASE_fnc_asyncCall; 
 
if (count _queryResult != 0) exitwith { 
[] remoteExec ["CLIENT_fnc_houseNotAvailable",_player]; 
}; 
 
_array = []; 
_bool = false; 
_inventory = [[],0]; 
 
_query = format["INSERT INTO houses_altis SET pid = '%1', name = '%2', schlussel = '%3', inventory = '%4', versteck = '%5', geld = '%6', pos = '%7', owned = '%8', upgrades = '%9' , renttime = '%10' , gekundigt = '%11'",_uid,_name,_array,_inventory,_inventory,_inventory,_housePos,1,_array,_renttime,_bool]; 
[_query,1] call SERVERDATABASE_fnc_asyncCall; 
 
sleep 2; 
 
_query = format["SELECT id, pid, name, schlussel, platz, inventory, maxinventory, versteck, maxversteck, geld, upgrades, renttime, gekundigt FROM houses_altis WHERE pos='%1' AND pid='%2' AND owned='1'",_housePos,_uid]; 
 
_houses = [_query,2] call SERVERDATABASE_fnc_asyncCall; 
 
_house setVariable["house_randomid",round(random 99999),true]; 
_house setVariable["house_id",(_houses select 0),true]; 
_house setVariable["house_uid",(_houses select 1),true]; 
_house setVariable["house_name",(_houses select 2),true]; 
_house setVariable["house_schlussel",(_houses select 3),true]; 
_house setVariable["house_platz",(_houses select 4),true]; 
_house setVariable["house_inventory",(_houses select 5),true]; 
_house setVariable["house_maxinventory",(_houses select 6),true]; 
_house setVariable["house_versteck",(_houses select 7),true]; 
_house setVariable["house_maxversteck",(_houses select 8),true]; 
_house setVariable["house_geld",(_houses select 9),true]; 
_house setVariable["house_upgrades",(_houses select 10),true]; 
_house setVariable["house_renttime",(_houses select 11),true]; 
_house setVariable["house_gekundigt",(_houses select 12),true]; 
_house setVariable["house_erstehilfecooldown",false,true]; 
_house setVariable["trunk_in_use",false,true]; 
_house setVariable["house_raid",false,true]; 
 
[_house] remoteExec ["CLIENT_fnc_houseBought",_player]; 
};