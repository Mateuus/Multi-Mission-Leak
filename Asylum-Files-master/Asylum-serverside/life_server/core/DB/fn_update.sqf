 
 
 
 
 
 
 
private["_uid","_name","_unit","_side","_money","_bank","_arrested","_licenses","_gear","_query","_result","_array","_gear","_alive","_worldSpace","_inv","_string","_quoteUnicode","_newArray","_guid","_holstered","_damage","_thirst","_hunger","_talents","_drugs","_fields","_cashField","_bankField"]; 
 
if (life_server_training) exitWith {}; 
_packet = _this; 
 
_worldSpace = switch (worldName) do 
{ 
case "Stratis": { "worldspace_strat" }; 
case "Tanoa": { "worldspace_tanoa" }; 
default { "worldspace" }; 
}; 
 
_cashField = "cash";  
_bankField = "bankacc";  
 
_name = [_packet,0,"Unknown",["Unknown"]] call BIS_fnc_param; 
_side = [_packet,1,civilian,[civilian]] call BIS_fnc_param; 
_uid = [_packet,4,"",[""]] call BIS_fnc_param; 
_licenses = _packet select 5; 
_packet set [22, life_server_instance]; 
_name = [_name, "\", ""] call KRON_Replace; 
_name = [_name, "'", ""] call KRON_Replace; 
_name = [_name, """", ""] call KRON_Replace; 
_packet set [0, _name]; 
 
 
 
 
 
 
 
 
 
if((_uid == "") OR (_name == "")) exitWith {diag_log "[DB Update] Query Request - Error uid or name is empty.";}; 
_fields = []; 
 
switch (_side) do 
{ 
case west: 
{ 
_fields = ["name", nil, _cashField, _bankField, nil, "cop_licenses", nil, "cop_gear", nil, "cop_alive", "cop_inventory", "cop_holstered", "damage", "thirst", "hunger", nil, nil, "cop_talents", "cop_exp", nil, nil, "drugs", "instance", nil, "prestige", "pre_talents", "wealth", "achievements", "stats", "title", nil, nil, nil, nil, nil]; 
if (!isNil "_licenses") then 
{ 
for "_i" from 0 to (count _licenses)-1 do 
{ 
_bool = [(_licenses select _i) select 1] call DB_fnc_bool; 
_licenses set[_i,[(_licenses select _i) select 0,_bool]]; 
}; 
_packet set [5, _licenses]; 
}; 
_packet set [5, [_packet select 5] call DB_fnc_mresArray]; 
_packet set [7, [_packet select 7] call DB_fnc_mresArray]; 
_packet set [10, [_packet select 10] call DB_fnc_mresArray]; 
}; 
 
case independent: 
{ 
_fields = ["name", nil, _cashField, _bankField, nil, nil, nil, nil, nil, nil, nil, nil, "damage", "thirst", "hunger", nil, nil, "med_talents", "med_exp", nil, nil, nil, "instance", nil, nil, nil, "wealth", "achievements", "stats", "title", nil, nil, nil, nil, nil]; 
}; 
 
case civilian: 
{ 
_fields = ["name", nil, _cashField, _bankField, nil, "civ_licenses", "arrested", "civ_gear", _worldSpace, "alive", "civ_inventory", "civ_holstered", "damage", "thirst", "hunger", format["gang%1",life_server_instance], format["gangrank%1",life_server_instance], "civ_talents", "civ_exp", "pain", "broken", "drugs", "instance", nil, nil, nil, "wealth", "achievements", "stats", "title", "revive", "customtexture", "parole", "honor", "honortalents"]; 
 
 
if (!(isNil "_packet select 6")) then 
{ 
if ((_packet select 6 > 0)) then { _packet set [7, nil]; }; 
}; 
if  (!(_packet select 9)) then { _packet set [8, "NULL"]; }; 
if (!isNil "_licenses") then 
{ 
for "_i" from 0 to (count _licenses)-1 do 
{ 
_bool = [(_licenses select _i) select 1] call DB_fnc_bool; 
_licenses set[_i,[(_licenses select _i) select 0,_bool]]; 
}; 
_packet set [5, _licenses]; 
}; 
_packet set [5, [_packet select 5] call DB_fnc_mresArray]; 
_packet set [7, [_packet select 7] call DB_fnc_mresArray]; 
_packet set [10, [_packet select 10] call DB_fnc_mresArray]; 
_packet set [31, [str (_packet select 31), "\", "\\"] call KRON_Replace]; 
_packet set [31, [_packet select 31, """", "`"] call KRON_Replace]; 
 
}; 
}; 
 
 
{ 
if (!isNil "_x") then 
{ 
switch (true) do 
{ 
case (typeName _x == "BOOL"): { _packet set [_forEachIndex, [_x] call DB_fnc_bool] }; 
case (typeName _x == "NUMBER"): { _packet set [_forEachIndex, [_x] call DB_fnc_numberSafe] }; 
 
}; 
}; 
} forEach _packet; 
 
 
_updates = ""; 
_updatesGlobal = ""; 
{ 
if (!isNil "_x") then 
{ 
_value = _packet select _forEachIndex; 
if (!isNil "_value") then 
{ 
if (_x in ["wealth","achievements","stats", "honor", "honortalents"]) then 
{ 
if (_updatesGlobal != "") then { _updatesGlobal = _updatesGlobal + ", "; }; 
if (typeName _value == "STRING") then 
{ 
if (_value == "NULL") then { _updatesGlobal = _updatesGlobal + format["%1=NULL", _x]; } 
else { _updatesGlobal = _updatesGlobal + format["%1='%2'", _x, _value]; }; 
} 
else { _updatesGlobal = _updatesGlobal + format["%1='%2'", _x, _value]; }; 
} 
else 
{ 
if (_updates != "") then { _updates = _updates + ", "; }; 
if (typeName _value == "STRING") then 
{ 
if (_value == "NULL") then { _updates = _updates + format["%1=NULL", _x]; } 
else { _updates = _updates + format["%1='%2'", _x, _value]; }; 
} 
else { _updates = _updates + format["%1='%2'", _x, _value]; }; 
}; 
}; 
}; 
} forEach _fields; 
 
if (_updates != "") then 
{ 
_query = format["UPDATE %3 SET %1 WHERE playerid='%2'", _updates, _uid, srv_table_players]; 
[_query] call DB_fnc_asyncQuery; 
}; 
 
if (_updatesGlobal != "") then 
{ 
_query = format["UPDATE players_global SET %1 WHERE playerid='%2'", _updatesGlobal, _uid]; 
[_query] call DB_fnc_asyncQuery; 
};