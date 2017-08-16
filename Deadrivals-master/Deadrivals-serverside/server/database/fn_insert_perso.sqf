private["_dir","_arrested","_arrestreason","_arrestminutes","_haus","_combatlog","_name","_baned","_titel","_erfolge","_damageall","_talentpoints","_talent","_exp","_time","_position","_alive","_stats","_licenses","_zitems","_weaponcargovestcontainer","_vestcontainer","_itemcargvestcontainer","_vest","_weaponcargouniformcontainer","_uniformcontainer","_itemcargouniformcontainer","_uniform","_secondaryweaponitems","_secondaryweapon","_primaryweaponitems","_primaryweapon","_getloadedmagazin","_binocular","_headgear","_handgunweapon","_handgunItems","_goggles","_currentweapon","_weaponcontainer","_queryResult","_query","_name","_side","_uid","_extDB2Message","_generaldata","_geardata","_cash","_bank","_assigneditems","_backpack","_itemcargobackpackcontainer","_backpackcontainer"]; 
_uid = [_this,0,"",[""]] call BIS_fnc_param; 
_name = [_this,1,"",[""]] call BIS_fnc_param; 
_bild = _this select 2; 
_adress = _this select 3; 
_birthday = _this select 4; 
_serial = round(random(100000000)); 
 
_createperso = format["INSERT INTO perso SET playerid = '%1', name = '%2', bild = '%3', adress = '%4', birthday = '%5', serial = '%6'",_uid,_name,_bild,_adress,_birthday,_serial]; 
[_createperso,1] call SERVERDATABASE_fnc_asyncCall; 
 
