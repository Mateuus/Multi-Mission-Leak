 
 
 
 
 
 
 
private["_uid","_side","_value","_mode","_query"]; 
_uid = [_this,0,"",[""]] call BIS_fnc_param; 
_side = [_this,1,sideUnknown,[civilian]] call BIS_fnc_param; 
_mode = [_this,3,-1,[0]] call BIS_fnc_param; 
 
if(_uid == "" OR _side == sideUnknown) exitWith {};  
_query = ""; 
 
switch(_mode) do { 
case 0: { 
_value = [_this,2,0,[0]] call BIS_fnc_param; 
_value = [_value] call DB_fnc_numberSafe; 
_query = format["UPDATE players SET cash='%1' WHERE playerid='%2'",_value,_uid]; 
}; 
 
case 1: { 
_value = [_this,2,0,[0]] call BIS_fnc_param; 
_value = [_value] call DB_fnc_numberSafe; 
_query = format["UPDATE players SET bankacc='%1' WHERE playerid='%2'",_value,_uid]; 
}; 
 
case 2: { 
_value = [_this,2,[],[[]]] call BIS_fnc_param; 
 
for "_i" from 0 to count(_value)-1 do { 
_bool = [(_value select _i) select 1] call DB_fnc_bool; 
_value set[_i,[(_value select _i) select 0,_bool]]; 
}; 
_value = [_value] call DB_fnc_mresArray; 
switch(_side) do { 
case west: {_query = format["UPDATE players SET cop_licenses='%1' WHERE playerid='%2'",_value,_uid];}; 
case civilian: {_query = format["UPDATE players SET civ_licenses='%1' WHERE playerid='%2'",_value,_uid];}; 
case independent: {_query = format["UPDATE players SET med_licenses='%1' WHERE playerid='%2'",_value,_uid];}; 
case east: {_query = format["UPDATE players SET adac_licenses='%1' WHERE playerid='%2'",_value,_uid];}; 
}; 
}; 
 
case 3: { 
_value = [_this,2,[],[[]]] call BIS_fnc_param; 
_value = [_value] call DB_fnc_mresArray; 
switch(_side) do { 
case west: {_query = format["UPDATE players SET cop_gear='%1' WHERE playerid='%2'",_value,_uid];}; 
case civilian: {_query = format["UPDATE players SET civ_gear='%1' WHERE playerid='%2'",_value,_uid];}; 
case independent: {_query = format["UPDATE players SET med_gear='%1' WHERE playerid='%2'",_value,_uid];}; 
case east: {_query = format["UPDATE players SET adac_gear='%1' WHERE playerid='%2'",_value,_uid];}; 
}; 
}; 
 
case 4: { 
_value = [_this,2,[],[[]]] call BIS_fnc_param; 
_value = [_value] call DB_fnc_mresArray; 
_query = format["UPDATE players SET ausweisdaten='%1' WHERE playerid='%2'",_value,_uid]; 
}; 
 
case 5: { 
_value = [_this,2,false,[true]] call BIS_fnc_param; 
_value = [_value] call DB_fnc_bool; 
_query = format["UPDATE players SET arrested='%1' WHERE playerid='%2'",_value,_uid]; 
}; 
 
case 6: { 
_value1 = [_this,2,0,[0]] call BIS_fnc_param; 
_value2 = [_this,4,0,[0]] call BIS_fnc_param; 
_value1 = [_value1] call DB_fnc_numberSafe; 
_value2 = [_value2] call DB_fnc_numberSafe; 
_query = format["UPDATE players SET cash='%1', bankacc='%2' WHERE playerid='%3'",_value1,_value2,_uid]; 
}; 
 
case 7: { 
_value = [_this,2,0,[0]] call BIS_fnc_param; 
_value = [_value] call DB_fnc_numberSafe; 
_query = format["UPDATE players SET exp='%1' WHERE playerid='%2'",_value,_uid]; 
}; 
 
case 8: { 
_array = [_this,2,[],[[]]] call BIS_fnc_param; 
[_uid,_side,_array,0] call SOA_fnc_keyManagement; 
}; 
 
case 9: {  
_value = [_this,2,0,[0]] call BIS_fnc_param; 
_value1 = [_this,4,[],[[]]] call BIS_fnc_param; 
_value2 = [_this,6,false,[true]] call BIS_fnc_param; 
_value = [_value] call DB_fnc_numberSafe; 
_value1 = [_value1] call DB_fnc_mresArray; 
_value2 = [_value2] call DB_fnc_bool; 
switch(_side) do { 
case west: {_query = format["UPDATE players SET cash='%1', cop_gear='%2', alive='%3' WHERE playerid='%4'",_value,_value1,_value2,_uid];}; 
case civilian: {_query = format["UPDATE players SET cash='%1', civ_gear='%2', alive='%3' WHERE playerid='%4'",_value,_value1,_value2,_uid];}; 
case independent: {_query = format["UPDATE players SET cash='%1', med_gear='%2', alive='%3' WHERE playerid='%4'",_value,_value1,_value2,_uid];}; 
case east: {_query = format["UPDATE players SET cash='%1', adac_gear='%2', alive='%3' WHERE playerid='%4'",_value,_value1,_value2,_uid];}; 
}; 
}; 
 
case 10: { 
_value = [_this,2,0,[0]] call BIS_fnc_param; 
_value = [_value] call DB_fnc_numberSafe; 
_query = format["UPDATE players SET activity='%1' WHERE playerid='%2'",_value,_uid]; 
}; 
 
case 11: { 
_value = [_this,2,[],[[]]] call BIS_fnc_param; 
for "_i" from 0 to count(_value)-1 do { 
_bool = [(_value select _i) select 1] call DB_fnc_bool; 
_value set[_i,[(_value select _i) select 0,_bool]]; 
}; 
_value = [_value] call DB_fnc_mresArray; 
_query = format["UPDATE players SET erfolge='%1' WHERE playerid='%2'",_value,_uid]; 
}; 
 
case 12: { 
_value = [_this,2,0,[0]] call BIS_fnc_param; 
_value = [_value] call DB_fnc_numberSafe; 
_query = format["UPDATE players SET serverpoints='%1' WHERE playerid='%2'",_value,_uid]; 
}; 
 
case 13: { 
_value = [_this,2,[],[[]]] call BIS_fnc_param; 
for "_i" from 0 to count(_value)-1 do { 
_bool = [(_value select _i) select 1] call DB_fnc_bool; 
_value set[_i,[(_value select _i) select 0,_bool]]; 
}; 
_value = [_value] call DB_fnc_mresArray; 
_query = format["UPDATE players SET apps='%1' WHERE playerid='%2'",_value,_uid]; 
}; 
 
case 14: { 
_value = [_this,2,"",[""]] call BIS_fnc_param; 
_value = [_value] call DB_fnc_mresString; 
_query = format["UPDATE players SET phone='%1' WHERE playerid='%2'",_value,_uid]; 
}; 
 
case 15: { 
_value = [_this,2,[],[[]]] call BIS_fnc_param; 
_value = [_value] call DB_fnc_mresArray; 
_query = format["UPDATE players SET phonekontakte='%1' WHERE playerid='%2'",_value,_uid]; 
}; 
 
case 16: { 
_value = [_this,2,"",[""]] call BIS_fnc_param; 
_value = [_value] call DB_fnc_mresString; 
_query = format["UPDATE players SET kennzeichen='%1' WHERE playerid='%2'",_value,_uid]; 
}; 
}; 
 
if(_query == "") exitWith {}; 
 
[_query,1] call DB_fnc_asyncCall;