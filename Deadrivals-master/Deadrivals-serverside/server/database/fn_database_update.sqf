private["_arrested","_arrestreason","_arrestminutes","_haus","_combatlog","_name","_baned","_titel","_erfolge","_damageall","_talentpoints","_talent","_exp","_time","_position","_stats","_licenses","_zitems","_weaponcargovestcontainer","_vestcontainer","_itemcargvestcontainer","_vest","_weaponcargouniformcontainer","_uniformcontainer","_itemcargouniformcontainer","_uniform","_secondaryweaponitems","_secondaryweapon","_primaryweaponitems","_primaryweapon","_getloadedmagazin","_binocular","_headgear","_handgunweapon","_handgunItems","_goggles","_currentweapon","_weaponcontainer","_queryResult","_query","_name","_side","_uid","_extDB2Message","_generaldata","_geardata","_cash","_bank","_assigneditems","_backpack","_itemcargobackpackcontainer","_backpackcontainer"]; 
_uid = [_this,0,"",[""]] call BIS_fnc_param; 
_side = [_this,1,sideUnknown,[civilian]] call BIS_fnc_param; 
_cash = _this select 2; 
_bank = _this select 3; 
_assigneditems = _this select 4; 
_backpack = _this select 5; 
_itemcargobackpackcontainer = _this select 6; 
_backpackcontainer = _this select 7; 
_weaponcontainer = _this select 8; 
_currentweapon = _this select 9; 
_goggles = _this select 10; 
_handgunItems = _this select 11; 
_handgunweapon = _this select 12; 
_headgear = _this select 13; 
_binocular = _this select 14; 
_getloadedmagazin = _this select 15; 
_primaryweapon = _this select 16; 
_primaryweaponitems = _this select 17; 
_secondaryweapon = _this select 18; 
_secondaryweaponitems = _this select 19; 
_uniform = _this select 20; 
_itemcargouniformcontainer = _this select 21; 
_uniformcontainer = _this select 22; 
_weaponcargouniformcontainer = _this select 23; 
_vest = _this select 24; 
_itemcargvestcontainer = _this select 25; 
_vestcontainer = _this select 26; 
_weaponcargovestcontainer = _this select 27; 
_zitems = _this select 28; 
_licenses = _this select 29; 
_stats = _this select 30; 
_time = _this select 31; 
_exp = _this select 32; 
_talent = _this select 33; 
_talentpoints = _this select 34; 
_damageall = _this select 35; 
_erfolge = _this select 36; 
_titel = _this select 37; 
_baned = _this select 38; 
_name = _this select 39; 
_combatlog = _this select 40; 
 
_query = format ["UPDATE whitelist SET baned = '%1', combatlog = '%2' WHERE playerid = '%3'",_baned,_combatlog,_uid]; 
_queryResult = [_query,1] call SERVERDATABASE_fnc_asyncCall; 
 
switch (_side) do { 
case civilian: { 
_haus = _this select 41; 
_rufpunkte = _this select 42; 
 
_query = format ["UPDATE Zivilist SET cash = '%1',bank = '%2',licenses = '%3',stats = '%4',time = '%5', exp = '%6',talente = '%7',talentpunkte = '%8', erfolge = '%9', title = '%10', hausanzahl = '%11', name = '%12', rufpunkte = '%13'  WHERE playerid = '%14'",_cash,_bank,_licenses,_stats,_time,_exp,_talent,_talentpoints,_erfolge,_titel,_haus,_name,_rufpunkte,_uid]; 
_queryResult = [_query,1] call SERVERDATABASE_fnc_asyncCall; 
 
_query = format ["UPDATE krankheitenciv SET hitpoints = '%1'  WHERE playerid = '%2'",_damageall,_uid]; 
_queryResult = [_query,1] call SERVERDATABASE_fnc_asyncCall; 
 
_query = format ["UPDATE ZivilistGear SET assigned_items = '%1',backpack = '%2',backpack_items = '%3',backpack_magazines = '%4',backpack_weapons = '%5',current_weapon = '%6',goggles = '%7',handgun_items = '%8',handgun_weapon = '%9',headgear = '%10',binocular = '%11',loaded_magazines = '%12',primary_weapon = '%13',primary_weapon_items = '%14',secondary_weapon = '%15',secondary_weapon_items = '%16',uniform = '%17',uniform_items = '%18',uniform_magazines = '%19',uniform_weapons = '%20',vest = '%21',vest_items = '%22',vest_magazines = '%23',vest_weapons = '%24',zinventar = '%25' WHERE playerid = '%26'",_assigneditems,_backpack,_itemcargobackpackcontainer,_backpackcontainer,_weaponcontainer,_currentweapon,_goggles,_handgunItems,_handgunweapon,_headgear,_binocular,_getloadedmagazin,_primaryweapon,_primaryweaponitems,_secondaryweapon,_secondaryweaponitems,_uniform,_itemcargouniformcontainer,_uniformcontainer,_weaponcargouniformcontainer,_vest,_itemcargvestcontainer,_vestcontainer,_weaponcargovestcontainer,_zitems,_uid]; 
_queryResult = [_query,1] call SERVERDATABASE_fnc_asyncCall; 
}; 
case west: { 
_query = format ["UPDATE West SET cash = '%1',bank = '%2',licenses = '%3',stats = '%4',time = '%5', exp = '%6',talente = '%7',talentpunkte = '%8', erfolge = '%9', title = '%10', name = '%11' WHERE playerid = '%12'",_cash,_bank,_licenses,_stats,_time,_exp,_talent,_talentpoints,_erfolge,_titel,_name,_uid]; 
_queryResult = [_query,1] call SERVERDATABASE_fnc_asyncCall; 
 
_query = format ["UPDATE krankheitenwest SET hitpoints = '%1'  WHERE playerid = '%2'",_damageall,_uid]; 
_queryResult = [_query,1] call SERVERDATABASE_fnc_asyncCall; 
 
_query = format ["UPDATE WestGear SET assigned_items = '%1',backpack = '%2',backpack_items = '%3',backpack_magazines = '%4',backpack_weapons = '%5',current_weapon = '%6',goggles = '%7',handgun_items = '%8',handgun_weapon = '%9',headgear = '%10',binocular = '%11',loaded_magazines = '%12',primary_weapon = '%13',primary_weapon_items = '%14',secondary_weapon = '%15',secondary_weapon_items = '%16',uniform = '%17',uniform_items = '%18',uniform_magazines = '%19',uniform_weapons = '%20',vest = '%21',vest_items = '%22',vest_magazines = '%23',vest_weapons = '%24',zinventar = '%25' WHERE playerid = '%26'",_assigneditems,_backpack,_itemcargobackpackcontainer,_backpackcontainer,_weaponcontainer,_currentweapon,_goggles,_handgunItems,_handgunweapon,_headgear,_binocular,_getloadedmagazin,_primaryweapon,_primaryweaponitems,_secondaryweapon,_secondaryweaponitems,_uniform,_itemcargouniformcontainer,_uniformcontainer,_weaponcargouniformcontainer,_vest,_itemcargvestcontainer,_vestcontainer,_weaponcargovestcontainer,_zitems,_uid]; 
_queryResult = [_query,1] call SERVERDATABASE_fnc_asyncCall; 
}; 
 
case independent: { 
_query = format ["UPDATE Independent SET cash = '%1',bank = '%2',licenses = '%3',stats = '%4',time = '%5', exp = '%6',talente = '%7',talentpunkte = '%8', erfolge = '%9', title = '%10', name = '%11' WHERE playerid = '%12'",_cash,_bank,_licenses,_stats,_time,_exp,_talent,_talentpoints,_erfolge,_titel,_name,_uid]; 
_queryResult = [_query,1] call SERVERDATABASE_fnc_asyncCall; 
 
_query = format ["UPDATE krankheitenindependent SET hitpoints = '%1'  WHERE playerid = '%2'",_damageall,_uid]; 
_queryResult = [_query,1] call SERVERDATABASE_fnc_asyncCall; 
 
_query = format ["UPDATE IndependentGear SET assigned_items = '%1',backpack = '%2',backpack_items = '%3',backpack_magazines = '%4',backpack_weapons = '%5',current_weapon = '%6',goggles = '%7',handgun_items = '%8',handgun_weapon = '%9',headgear = '%10',binocular = '%11',loaded_magazines = '%12',primary_weapon = '%13',primary_weapon_items = '%14',secondary_weapon = '%15',secondary_weapon_items = '%16',uniform = '%17',uniform_items = '%18',uniform_magazines = '%19',uniform_weapons = '%20',vest = '%21',vest_items = '%22',vest_magazines = '%23',vest_weapons = '%24',zinventar = '%25' WHERE playerid = '%26'",_assigneditems,_backpack,_itemcargobackpackcontainer,_backpackcontainer,_weaponcontainer,_currentweapon,_goggles,_handgunItems,_handgunweapon,_headgear,_binocular,_getloadedmagazin,_primaryweapon,_primaryweaponitems,_secondaryweapon,_secondaryweaponitems,_uniform,_itemcargouniformcontainer,_uniformcontainer,_weaponcargouniformcontainer,_vest,_itemcargvestcontainer,_vestcontainer,_weaponcargovestcontainer,_zitems,_uid]; 
_queryResult = [_query,1] call SERVERDATABASE_fnc_asyncCall; 
}; 
 
case east: { 
_query = format ["UPDATE east SET cash = '%1',bank = '%2',licenses = '%3',stats = '%4',time = '%5', exp = '%6',talente = '%7',talentpunkte = '%8', erfolge = '%9', title = '%10', name = '%11' WHERE playerid = '%12'",_cash,_bank,_licenses,_stats,_time,_exp,_talent,_talentpoints,_erfolge,_titel,_name,_uid]; 
_queryResult = [_query,1] call SERVERDATABASE_fnc_asyncCall; 
 
_query = format ["UPDATE krankheiteneast SET hitpoints = '%1'  WHERE playerid = '%2'",_damageall,_uid]; 
_queryResult = [_query,1] call SERVERDATABASE_fnc_asyncCall; 
 
_query = format ["UPDATE eastgear SET assigned_items = '%1',backpack = '%2',backpack_items = '%3',backpack_magazines = '%4',backpack_weapons = '%5',current_weapon = '%6',goggles = '%7',handgun_items = '%8',handgun_weapon = '%9',headgear = '%10',binocular = '%11',loaded_magazines = '%12',primary_weapon = '%13',primary_weapon_items = '%14',secondary_weapon = '%15',secondary_weapon_items = '%16',uniform = '%17',uniform_items = '%18',uniform_magazines = '%19',uniform_weapons = '%20',vest = '%21',vest_items = '%22',vest_magazines = '%23',vest_weapons = '%24',zinventar = '%25' WHERE playerid = '%26'",_assigneditems,_backpack,_itemcargobackpackcontainer,_backpackcontainer,_weaponcontainer,_currentweapon,_goggles,_handgunItems,_handgunweapon,_headgear,_binocular,_getloadedmagazin,_primaryweapon,_primaryweaponitems,_secondaryweapon,_secondaryweaponitems,_uniform,_itemcargouniformcontainer,_uniformcontainer,_weaponcargouniformcontainer,_vest,_itemcargvestcontainer,_vestcontainer,_weaponcargovestcontainer,_zitems,_uid]; 
_queryResult = [_query,1] call SERVERDATABASE_fnc_asyncCall; 
}; 
}; 
