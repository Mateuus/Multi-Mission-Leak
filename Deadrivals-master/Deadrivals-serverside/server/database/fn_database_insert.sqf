private["_queryresult","_inventory","_ownerid","_player","_playerID","_side","_name","_uid","_loadplayer","_createplayer","_creategear","_array","_createwhitelist","_eastlevelarray","_independentlevelarray","_westlevelarray"]; 
_player = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param; 
_side = [_this,1,sideUnknown,[civilian]] call BIS_fnc_param; 
_name = [_this,2,"",[""]] call BIS_fnc_param; 
_uid = [_this,3,"",[""]] call BIS_fnc_param; 
_westlevelarray = ["Rekrut","data\Texture\perso\perso.paa",0]; 
_independentlevelarray = ["Rekrut","data\Texture\perso\perso.paa",0]; 
_eastlevelarray = ["Rekrut","data\Texture\perso\perso.paa",0]; 
_array = []; 
_inventory = [[],0]; 
_ownerid = owner _player; 
_assigneditems = ["ItemMap","ItemCompass","ItemWatch","ItemRadio","ItemGPS"]; 
_clothings = ["U_C_Poloshirt_blue","U_C_Poloshirt_burgundy","U_C_Poloshirt_stripped","U_C_Poloshirt_tricolour","U_C_Poloshirt_salmon","U_C_Poloshirt_redwhite"]; 
_loadoutciv = (_clothings select (floor(random (count _clothings)))); 
_loadouteast = "U_Rangemaster"; 
_loadoutwest = "U_Rangemaster"; 
_loadoutindependent = "U_C_Scientist"; 
_weapon = "hgun_P07_snds_F"; 
_weaponattachments = ["muzzle_snds_L","","",""]; 
_magazine = [["16Rnd_9x21_Mag",16],["16Rnd_9x21_Mag",16],["16Rnd_9x21_Mag",16],["16Rnd_9x21_Mag",16],["16Rnd_9x21_Mag",16]]; 
_stats = [100,100,100,0]; 
_bool = false; 
switch (_side) do { 
case west: { 
_loadplayer = format["SELECT name,playerid FROM West WHERE playerid = '%1'",_uid]; 
}; 
case civilian: { 
_loadplayer = format["SELECT name,playerid FROM Zivilist WHERE playerid = '%1'",_uid]; 
}; 
case independent: { 
_loadplayer = format["SELECT name,playerid FROM Independent WHERE playerid = '%1'",_uid]; 
}; 
case east: { 
_loadplayer = format["SELECT name,playerid FROM east WHERE playerid = '%1'",_uid]; 
}; 
}; 
 
_queryresult = [_loadplayer,2] call SERVERDATABASE_fnc_asyncCall; 
 
if (count _queryResult != 0) exitWith { 
[_player,_side,_uid] spawn SERVERDATABASE_fnc_database_load; 
}; 
 
_createjail = format["INSERT INTO jail SET name = '%1', playerid = '%2'",_name,_uid]; 
[_createjail,1] call SERVERDATABASE_fnc_asyncCall; 
 
_createschliessfach = format["INSERT INTO schliessfach SET playerid = '%1', inventory = '%2', owned = '%3'",_uid,_inventory,_bool]; 
[_createschliessfach,1] call SERVERDATABASE_fnc_asyncCall; 
 
_createwhitelist = format["INSERT INTO whitelist SET name = '%1', independentlevel = '%2', westlevel = '%3', eastlevel = '%4', baned = '%5', combatlog = '%6', playerid = '%7'",_name,_independentlevelarray,_westlevelarray,_eastlevelarray,_bool,_bool,_uid]; 
[_createwhitelist,1] call SERVERDATABASE_fnc_asyncCall; 
if (worldName == "Tanoa") then { 
_createwantedlist = format["INSERT INTO wanted_tanoa SET wantedCrimes = '%1', wantedID = '%2'",_array,_uid]; 
[_createwantedlist,1] call SERVERDATABASE_fnc_asyncCall; 
} else { 
_createwantedlist = format["INSERT INTO wanted_altis SET wantedCrimes = '%1', wantedID = '%2'",_array,_uid]; 
[_createwantedlist,1] call SERVERDATABASE_fnc_asyncCall; 
}; 
_createKrankheit = format["INSERT INTO krankheitenwest SET name = '%1', hitpoints = '%2', playerid = '%3'",_name,_array,_uid]; 
_createplayer = format["INSERT INTO West SET name = '%1', licenses = '%2', talente = '%3', erfolge = '%4', stats = '%5', playerid = '%6'",_name,_array,_array,_array,_stats,_uid]; 
_creategear = format["INSERT INTO westgear SET name = '%1', current_weapon = '%2', handgun_weapon = '%3', uniform = '%4', assigned_items = '%5', backpack_items = '%6', backpack_magazines = '%7', backpack_weapons = '%8', handgun_items = '%9', loaded_magazines = '%10', primary_weapon_items = '%11', secondary_weapon_items = '%12', uniform_items = '%13', uniform_magazines = '%14', uniform_weapons = '%15', vest_items = '%16', vest_magazines = '%17', vest_weapons = '%18', zinventar = '%19', playerid = '%20'",_name,_weapon,_weapon,_loadoutwest,_assigneditems,_array,_array,_array,_weaponattachments,_array,_array,_array,_array,_magazine,_array,_array,_array,_array,_array,_uid]; 
 
[_createKrankheit,1] call SERVERDATABASE_fnc_asyncCall; 
[_createplayer,1] call SERVERDATABASE_fnc_asyncCall; 
[_creategear,1] call SERVERDATABASE_fnc_asyncCall; 
 
_createKrankheit = format["INSERT INTO krankheitenciv SET name = '%1', hitpoints = '%2', playerid = '%3'",_name,_array,_uid]; 
_createplayer = format["INSERT INTO Zivilist SET name = '%1', licenses = '%2', talente = '%3', erfolge = '%4', stats = '%5', playerid = '%6'",_name,_array,_array,_array,_stats,_uid]; 
_creategear = format["INSERT INTO ZivilistGear SET name = '%1', uniform = '%2', assigned_items = '%3', backpack_items = '%4', backpack_magazines = '%5', backpack_weapons = '%6', handgun_items = '%7', loaded_magazines = '%8', primary_weapon_items = '%9', secondary_weapon_items = '%10', uniform_items = '%11', uniform_magazines = '%12', uniform_weapons = '%13', vest_items = '%14', vest_magazines = '%15', vest_weapons = '%16', zinventar = '%17', playerid = '%18'",_name,_loadoutciv,_assigneditems,_array,_array,_array,_array,_array,_array,_array,_array,_array,_array,_array,_array,_array,_array,_uid]; 
 
[_createKrankheit,1] call SERVERDATABASE_fnc_asyncCall; 
[_createplayer,1] call SERVERDATABASE_fnc_asyncCall; 
[_creategear,1] call SERVERDATABASE_fnc_asyncCall; 
 
_createKrankheit = format["INSERT INTO krankheitenindependent SET name = '%1', hitpoints = '%2', playerid = '%3'",_name,_array,_uid]; 
_createplayer = format["INSERT INTO Independent SET name = '%1', licenses = '%2', talente = '%3', erfolge = '%4', stats = '%5', playerid = '%6'",_name,_array,_array,_array,_stats,_uid]; 
_creategear = format["INSERT INTO IndependentGear SET name = '%1', uniform = '%2', assigned_items = '%3', backpack_items = '%4', backpack_magazines = '%5', backpack_weapons = '%6', handgun_items = '%7', loaded_magazines = '%8', primary_weapon_items = '%9', secondary_weapon_items = '%10', uniform_items = '%11', uniform_magazines = '%12', uniform_weapons = '%13', vest_items = '%14', vest_magazines = '%15', vest_weapons = '%16', zinventar = '%17', playerid = '%18'",_name,_loadoutindependent,_assigneditems,_array,_array,_array,_array,_array,_array,_array,_array,_array,_array,_array,_array,_array,_array,_uid]; 
 
[_createKrankheit,1] call SERVERDATABASE_fnc_asyncCall; 
[_createplayer,1] call SERVERDATABASE_fnc_asyncCall; 
[_creategear,1] call SERVERDATABASE_fnc_asyncCall; 
 
_createKrankheit = format["INSERT INTO krankheiteneast SET name = '%1', hitpoints = '%2', playerid = '%3'",_name,_array,_uid]; 
_createplayer = format["INSERT INTO east SET name = '%1', licenses = '%2', talente = '%3', erfolge = '%4', stats = '%5', playerid = '%6'",_name,_array,_array,_array,_stats,_uid]; 
_creategear = format["INSERT INTO eastgear SET name = '%1', uniform = '%2', assigned_items = '%3', backpack_items = '%4', backpack_magazines = '%5', backpack_weapons = '%6', handgun_items = '%7', loaded_magazines = '%8', primary_weapon_items = '%9', secondary_weapon_items = '%10', uniform_items = '%11', uniform_magazines = '%12', uniform_weapons = '%13', vest_items = '%14', vest_magazines = '%15', vest_weapons = '%16', zinventar = '%17', playerid = '%18'",_name,_loadoutindependent,_assigneditems,_array,_array,_array,_array,_array,_array,_array,_array,_array,_array,_array,_array,_array,_array,_uid]; 
 
[_createKrankheit,1] call SERVERDATABASE_fnc_asyncCall; 
[_createplayer,1] call SERVERDATABASE_fnc_asyncCall; 
[_creategear,1] call SERVERDATABASE_fnc_asyncCall; 
 
 
_createEmpty = format["INSERT INTO Empty SET name = '%1', playerid = '%2'",_name,_uid]; 
[_createEmpty,1] call SERVERDATABASE_fnc_asyncCall; 
_createEmpty = format["INSERT INTO Empty1 SET name = '%1', playerid = '%2'",_name,_uid]; 
[_createEmpty,1] call SERVERDATABASE_fnc_asyncCall; 
_createEmpty = format["INSERT INTO Empty2 SET name = '%1', playerid = '%2'",_name,_uid]; 
[_createEmpty,1] call SERVERDATABASE_fnc_asyncCall; 
_createEmpty = format["INSERT INTO Empty3 SET name = '%1', playerid = '%2'",_name,_uid]; 
[_createEmpty,1] call SERVERDATABASE_fnc_asyncCall; 
_createEmpty = format["INSERT INTO Empty4 SET name = '%1', playerid = '%2'",_name,_uid]; 
[_createEmpty,1] call SERVERDATABASE_fnc_asyncCall; 
 
[_player,_side,_uid] spawn SERVERDATABASE_fnc_database_load; 
 
 
 
 
