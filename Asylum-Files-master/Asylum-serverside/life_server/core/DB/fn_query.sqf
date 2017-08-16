 
 
 
 
 
 
 
 
 
 
private["_uid","_side","_sql","_query","_old","_houses","_houseLocs","_worldSpace","_unit","_cash","_bank"]; 
_uid = [_this,0,"",[""]] call BIS_fnc_param; 
_side = [_this,1,civilian,[civilian]] call BIS_fnc_param; 
_unit = [_this,2,objNull,[objNull]] call BIS_fnc_param; 
 
 
if(_uid == "") exitWith {"Invalid UID"}; 
 
_houseLocs = ""; 
_worldSpace = switch (worldName) do 
{ 
case "Stratis": { "worldspace_strat" }; 
case "Tanoa": { "worldspace_tanoa" }; 
default { "worldspace" }; 
}; 
_cash = "cash";  
_bank = "bankacc";  
 
switch (_side) do 
{ 
case west: 
{ 
_query = format["SELECT p.playerid, p.name, p.%3, p.%4, g.coplevel, p.cop_licenses, p.cop_gear, g.adminlevel, p.blacklist, p.cop_inventory, '' AS holster, p.damage, p.thirst, p.hunger, p.instance, TIME_TO_SEC(TIMEDIFF(NOW(), p.`lastupdated`)) diff, g.swatlevel, g.donatorlvl, p.cop_talents, p.cop_exp, p.drugs, p.precinct, p.prestige, p.pre_talents, g.wealth, g.achievements, p.cop_alive, g.stats, p.title, g.keys, g.lootrewards FROM %2 as p, players_global as g WHERE p.playerid='%1' AND p.playerid=g.playerid", _uid, srv_table_players, _cash, _bank]; 
}; 
 
case independent: 
{ 
_query = format["SELECT p.playerid, p.name, p.%4, p.%5, g.adminlevel, p.blacklist, p.damage, p.thirst, p.hunger, p.instance, TIME_TO_SEC(TIMEDIFF(NOW(), p.`lastupdated`)) diff, g.donatorlvl, p.med_talents, p.med_exp, p.%2, p.alive, g.wealth, g.achievements, g.stats, p.title, g.keys, g.lootrewards FROM %3 as p, players_global as g WHERE p.playerid='%1' AND p.playerid=g.playerid", _uid, _worldSpace, srv_table_players, _cash, _bank]; 
}; 
 
case sideLogic: 
{ 
_query = format["SELECT playerid, name, adminlevel FROM players WHERE playerid='%1'",_uid]; 
}; 
 
case civilian: 
{ 
_query = "SELECT p.playerid, p.name, p."+_cash+", p."+_bank+", p.civ_licenses, p.arrested, g.adminlevel, g.donatorlvl, p.civ_gear, p."+_worldSpace+", p.alive, 'ASYLUM' AS houselocs, p.civ_inventory, '' AS holster, p.damage, p.thirst, p.hunger, p.instance, TIME_TO_SEC(TIMEDIFF(NOW(), p.`lastupdated`)) diff, p.gang"+(str life_server_instance)+", p.gangrank"+(str life_server_instance)+", 'ASYLUM' AS housepos, p.civ_talents, p.civ_exp, p.pain, p.broken, p.drugs, g.wealth, g.achievements, g.stats, p.title, p.revive, p.customtexture, p.parole, g.mailbox, g.honor, g.honortalents, g.keys, g.lootrewards FROM "+srv_table_players+" as p, players_global as g WHERE p.playerid = '"+_uid+"' AND p.playerid=g.playerid"; 
}; 
}; 
 
_ret = [_query,2,false] call DB_fnc_asyncQuery; 
 
if(count _ret == 0) then 
{ 
[]; 
} 
else 
{ 
switch(_side) do 
{ 
case west: 
{ 
_new = [(_ret select 6)] call DB_fnc_mresToArray; 
if(typeName _new == "STRING") then {_new = call compile format["%1", _new];}; 
_ret set[6,_new]; 
_new = [(_ret select 5)] call DB_fnc_mresToArray; 
if(typeName _new == "STRING") then {_new = call compile format["%1", _new];}; 
_ret set[5,_new]; 
 
_new = [(_ret select 9)] call DB_fnc_mresToArray; 
if(typeName _new == "STRING") then {_new = call compile format["%1", _new];}; 
_ret set[9,_new]; 
 
_new = [(_ret select 10)] call DB_fnc_mresToArray; 
if(typeName _new == "STRING") then {_new = call compile format["%1", _new];}; 
_ret set[10,_new]; 
 
_new = [(_ret select 18)] call DB_fnc_mresToArray; 
if(typeName _new == "STRING") then {_new = call compile format["%1", _new];}; 
_ret set[18,_new]; 
 
_new = [(_ret select 20)] call DB_fnc_mresToArray; 
if(typeName _new == "STRING") then {_new = call compile format["%1", _new];}; 
if (isNil "_new") then { _ret set[20, [0,[0,0,0,0]]]; } 
else { _ret set[20,_new]; }; 
 
_new = [(_ret select 23)] call DB_fnc_mresToArray; 
if(typeName _new == "STRING") then {_new = call compile format["%1", _new];}; 
_ret set[23,_new]; 
 
_new = [(_ret select 25)] call DB_fnc_mresToArray; 
if(typeName _new == "STRING") then {_new = call compile format["%1", _new];}; 
_ret set[25,_new]; 
 
_new = [(_ret select 27)] call DB_fnc_mresToArray; 
if(typeName _new == "STRING") then {_new = call compile format["%1", _new];}; 
_ret set[27,_new]; 
 
_new = [(_ret select 29)] call DB_fnc_mresToArray; 
if(typeName _new == "STRING") then {_new = call compile format["%1", _new];}; 
_ret set[29,_new]; 
 
_new = [(_ret select 30)] call DB_fnc_mresToArray; 
if(typeName _new == "STRING") then {_new = call compile format["%1", _new];}; 
_ret set[30,_new]; 
 
_old = _ret select 5; 
for "_i" from 0 to (count _old)-1 do 
{ 
_data = _old select _i; 
_old set[_i,[_data select 0, ([_data select 1,1] call DB_fnc_bool)]]; 
}; 
_ret set[5,_old]; 
}; 
 
case independent: 
{ 
_new = [(_ret select 12)] call DB_fnc_mresToArray; 
if(typeName _new == "STRING") then {_new = call compile format["%1", _new];}; 
_ret set[12,_new]; 
 
_new = [(_ret select 17)] call DB_fnc_mresToArray; 
if(typeName _new == "STRING") then {_new = call compile format["%1", _new];}; 
_ret set[17,_new]; 
 
_new = [(_ret select 18)] call DB_fnc_mresToArray; 
if(typeName _new == "STRING") then {_new = call compile format["%1", _new];}; 
_ret set[18,_new]; 
 
_new = [(_ret select 20)] call DB_fnc_mresToArray; 
if(typeName _new == "STRING") then {_new = call compile format["%1", _new];}; 
_ret set[20,_new]; 
 
_new = [(_ret select 21)] call DB_fnc_mresToArray; 
if(typeName _new == "STRING") then {_new = call compile format["%1", _new];}; 
_ret set[21,_new]; 
 
 
_wantedLevel = 0; 
_query = format["SELECT * FROM %2 WHERE playerid = '%1'", _uid, srv_table_wanted]; 
_row = [_query,2,false] call DB_fnc_asyncQuery; 
if (count _row > 0) then 
{ 
_wantedLevel = (_row select 3); 
_index = [(getPlayerUID _unit),life_wanted_list] call life_fnc_index; 
if(_index == -1) then { _index = count life_wanted_list; }; 
_crimes = [(_row select 2)] call DB_fnc_mresToArray; 
if(typeName _crimes == "STRING") then {_crimes = call compile format["%1", _crimes];}; 
_newData = [(_row select 1), (_row select 0), _crimes, _row select 3, _row select 4]; 
if (!isNull _unit) then { _newData set [0, name _unit] }; 
life_wanted_list set[_index, _newData]; 
}; 
_ret set[22, _wantedLevel]; 
}; 
 
case civilian: 
{ 
 
 
 
 
 
 
_new = [(_ret select 8)] call DB_fnc_mresToArray; 
if(typeName _new == "STRING") then {_new = call compile format["%1", _new];}; 
_ret set[8,_new]; 
 
_new = [(_ret select 4)] call DB_fnc_mresToArray; 
if(typeName _new == "STRING") then {_new = call compile format["%1", _new];}; 
_ret set[4,_new]; 
 
_new = [(_ret select 12)] call DB_fnc_mresToArray; 
if(typeName _new == "STRING") then {_new = call compile format["%1", _new];}; 
_ret set[12,_new]; 
 
_new = [(_ret select 13)] call DB_fnc_mresToArray; 
if(typeName _new == "STRING") then {_new = call compile format["%1", _new];}; 
_ret set[13,_new]; 
 
_new = [(_ret select 22)] call DB_fnc_mresToArray; 
if(typeName _new == "STRING") then {_new = call compile format["%1", _new];}; 
_ret set[22,_new]; 
 
_new = [(_ret select 26)] call DB_fnc_mresToArray; 
if (isNil "_new") then { _ret set[26, [0,[0,0,0,0]]]; } 
else { if(typeName _new == "STRING") then {_new = call compile format["%1", _new];}; _ret set[26,_new]; }; 
 
_new = [(_ret select 28)] call DB_fnc_mresToArray; 
if(typeName _new == "STRING") then {_new = call compile format["%1", _new];}; 
_ret set[28,_new]; 
 
_new = [(_ret select 29)] call DB_fnc_mresToArray; 
if(typeName _new == "STRING") then {_new = call compile format["%1", _new];}; 
_ret set[29,_new]; 
 
_new = [(_ret select 32)] call DB_fnc_mresToArray; 
if(typeName _new == "STRING") then {_new = call compile format["%1", _new];}; 
_ret set[32,_new]; 
 
_new = [(_ret select 33)] call DB_fnc_mresToArray; 
if(typeName _new == "STRING") then {_new = call compile format["%1", _new];}; 
_ret set[33,_new]; 
 
_new = [(_ret select 36)] call DB_fnc_mresToArray; 
if(typeName _new == "STRING") then {_new = call compile format["%1", _new];}; 
_ret set[36,_new]; 
 
_new = [(_ret select 37)] call DB_fnc_mresToArray; 
if(typeName _new == "STRING") then {_new = call compile format["%1", _new];}; 
_ret set[37,_new]; 
 
_new = [(_ret select 38)] call DB_fnc_mresToArray; 
if(typeName _new == "STRING") then {_new = call compile format["%1", _new];}; 
_ret set[38,_new]; 
 
_old = _ret select 4; 
for "_i" from 0 to (count _old)-1 do 
{ 
_data = _old select _i; 
_old set[_i,[_data select 0, ([_data select 1,1] call DB_fnc_bool)]]; 
}; 
 
_ret set[4,_old]; 
 
 
_wantedLevel = 0; 
_query = format["SELECT * FROM %2 WHERE playerid = '%1'", _uid, srv_table_wanted]; 
_row = [_query,2,false] call DB_fnc_asyncQuery; 
if (count _row > 0) then 
{ 
_wantedLevel = (_row select 3); 
_index = [(getPlayerUID _unit),life_wanted_list] call life_fnc_index; 
if(_index == -1) then { _index = count life_wanted_list; }; 
_crimes = [(_row select 2)] call DB_fnc_mresToArray; 
if(typeName _crimes == "STRING") then {_crimes = call compile format["%1", _crimes];}; 
_newData = [(_row select 1), (_row select 0), _crimes, _row select 3, _row select 4]; 
life_wanted_list set[_index, _newData]; 
}; 
_ret set[39, _wantedLevel]; 
 
 
_query = format["SELECT `oid`,`worldspace`,`id` FROM asylumlife%1.houses WHERE owners = '%2' LIMIT 10",life_server_instance, _uid]; 
if (_ret select 19 != "0") then { _query = format["SELECT `oid`,`worldspace`,`id` FROM asylumlife%1.houses WHERE owners = '%2' OR oid = '%3' LIMIT 10",life_server_instance, _uid, _ret select 19]; }; 
_sql = [_query,2,true] call DB_fnc_asyncQuery; 
if(count _sql == 0) then 
{ 
_houses = []; 
_houseLocs = []; 
} 
else 
{ 
_houses = []; 
_houseLocs = []; 
{ 
_houses pushBack (_x select 0); 
_houseLocs pushBack (call compile (_x select 1)); 
} forEach _sql; 
}; 
_ret set[11,_houses]; 
_ret set[21,_houseLocs]; 
 
if !((_ret select 19) in ["","0"]) then 
{ 
{ 
if (_x select 0 == _ret select 19) exitWith 
{ 
life_gangexp = _x select 7; 
life_gangtalents = _x select 8; 
(_unit getVariable ["ownerID", -1]) publicVariableClient "life_gangexp"; 
(_unit getVariable ["ownerID", -1]) publicVariableClient "life_gangtalents"; 
}; 
} forEach life_server_gangs; 
}; 
}; 
}; 
 
_ret; 
};