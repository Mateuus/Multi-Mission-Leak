 
 
 
 
 
 
 
 
_unit = [_this,0,objNull,[objNull]] call BIS_fnc_param; 
_type = [_this,1,0,[0]] call BIS_fnc_param; 
if (isNull _unit || _type < 1) exitWith { diag_log format["[doOpenLootCrate] BAD DATA"] }; 
 
 
_query = format["SELECT `keys`,`lootrewards` FROM `arma3life`.`players_global` WHERE playerid='%1'", getPlayerUID _unit]; 
_ret = [_query,2,false] call DB_fnc_asyncQuery; 
if (count _ret == 0) exitWith { diag_log format["[doOpenLootCrate] No global player for ID %1", getPlayerUID _unit] }; 
 
 
_keys = [(_ret select 0)] call DB_fnc_mresToArray; 
if(typeName _keys == "STRING") then {_keys = call compile format["%1", _keys];}; 
_owned = [(_ret select 1)] call DB_fnc_mresToArray; 
if(typeName _owned == "STRING") then {_owned = call compile format["%1", _owned];}; 
 
 
if (_keys select (_type - 1) == 0) exitWith {diag_log format["%1 tried to open a crate without a key!", getPlayerUID _unit]}; 
_keys set [_type - 1, (_keys select (_type - 1)) - 1]; 
 
 
_tier = [_type] call life_fnc_lootCrateItems; 
_quality = switch (true) do 
{ 
case (random 35 < 1): { 2 };  
case (random 10 < 1): { 1 };  
default { 0 }; 
}; 
_reward = ((_tier select _quality) call BIS_fnc_selectRandom) select 0; 
 
 
if (_reward in _owned) then 
{ 
_query = format["INSERT INTO `arma3life`.`lootmarket` (`item`,`account`) VALUES ('%1','%2')", _reward, getPlayerUID _unit]; 
_ret = [_query] call DB_fnc_asyncQuery; 
_query = format["UPDATE `arma3life`.`players_global` SET `keys`='%2' WHERE playerid='%1'", getPlayerUID _unit, _keys]; 
_ret = [_query] call DB_fnc_asyncQuery; 
} 
else 
{ 
_owned pushBack _reward; 
_query = format["UPDATE `arma3life`.`players_global` SET `keys`='%2', `lootrewards`='%3' WHERE playerid='%1'", getPlayerUID _unit, _keys, _owned]; 
_ret = [_query] call DB_fnc_asyncQuery; 
}; 
 
 
life_lootReturn = _reward; 
(_unit getVariable ["ownerID", -1]) publicVariableClient "life_lootReturn"; 
life_lootKeys = _keys; 
(_unit getVariable ["ownerID", -1]) publicVariableClient "life_lootKeys"; 
 
[4444, _unit, format["%1 opened crate type %2 for reward %3.", name _unit, _type, _reward], "keylog"] spawn ASY_fnc_logIt;