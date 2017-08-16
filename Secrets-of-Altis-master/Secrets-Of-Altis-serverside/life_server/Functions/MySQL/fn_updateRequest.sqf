 
 
 
 
 
 
 
private["_uid","_side","_cash","_bank","_exp","_licenses","_gear","_name","_query","_thread","_erfolge","_serverpoints","_timeplayed"]; 
_uid = [_this,0,"",[""]] call BIS_fnc_param; 
_name = [_this,1,"",[""]] call BIS_fnc_param; 
_side = [_this,2,sideUnknown,[civilian]] call BIS_fnc_param; 
_cash = [_this,3,0,[0]] call BIS_fnc_param; 
_bank = [_this,4,5000,[0]] call BIS_fnc_param; 
_exp = [_this,5,0,[0]] call BIS_fnc_param; 
_serverpoints = [_this,6,0,[0]] call BIS_fnc_param; 
_guthaben = [_this,7,5000,[0]] call BIS_fnc_param; 
_licenses = [_this,8,[],[[]]] call BIS_fnc_param; 
_gear = [_this,9,[],[[]]] call BIS_fnc_param; 
_alive = [_this,10,true,[true]] call BIS_fnc_param; 
_erfolge = [_this,11,[],[[]]] call BIS_fnc_param; 
_timeplayed = [_this,13,0,[0]] call BIS_fnc_param; 
 
 
if((_uid == "") OR (_name == "")) exitWith {}; 
 
 
_name = [_name] call DB_fnc_mresString; 
_gear = [_gear] call DB_fnc_mresArray; 
_cash = [_cash] call DB_fnc_numberSafe; 
_bank = [_bank] call DB_fnc_numberSafe; 
_guthaben = [_guthaben] call DB_fnc_numberSafe; 
_exp = [_exp] call DB_fnc_numberSafe; 
_alive = [_alive] call DB_fnc_bool; 
_timeplayed = [_timeplayed] call DB_fnc_numberSafe; 
 
 
for "_i" from 0 to count(_licenses)-1 do { 
_bool = [(_licenses select _i) select 1] call DB_fnc_bool; 
_licenses set[_i,[(_licenses select _i) select 0,_bool]]; 
}; 
 
for "_i" from 0 to count(_erfolge)-1 do { 
_bool = [(_erfolge select _i) select 1] call DB_fnc_bool; 
_erfolge set[_i,[(_erfolge select _i) select 0,_bool]]; 
}; 
 
_licenses = [_licenses] call DB_fnc_mresArray; 
_erfolge = [_erfolge] call DB_fnc_mresArray; 
 
switch (_side) do { 
case west: {_query = format["UPDATE players SET name='%1', cash='%2', bankacc='%3', cop_gear='%4', cop_licenses='%5', alive='%6', activity='%7', erfolge='%8', guthaben='%9', serverpoints='%10', timeplayed='%11' WHERE playerid='%12'",_name,_cash,_bank,_gear,_licenses,_alive,[_this select 12] call DB_fnc_numberSafe,_erfolge,_guthaben,_serverpoints,_timeplayed,_uid];}; 
case civilian: {_query = format["UPDATE players SET name='%1', cash='%2', bankacc='%3', civ_gear='%4', civ_licenses='%5', alive='%6', exp='%7', arrested='%8', erfolge='%9', guthaben='%10', serverpoints='%11', timeplayed='%12' WHERE playerid='%13'",_name,_cash,_bank,_gear,_licenses,_alive,_exp,[_this select 12] call DB_fnc_bool,_erfolge,_guthaben,_serverpoints,_timeplayed,_uid];}; 
case independent: {_query = format["UPDATE players SET name='%1', cash='%2', bankacc='%3', med_gear='%4', med_licenses='%5', alive='%6', activity='%7', erfolge='%8', guthaben='%9', serverpoints='%10', timeplayed='%11' WHERE playerid='%12'",_name,_cash,_bank,_gear,_licenses,_alive,[_this select 12] call DB_fnc_numberSafe,_erfolge,_guthaben,_serverpoints,_timeplayed,_uid];}; 
}; 
 
_queryResult = [_query,1] call DB_fnc_asyncCall;