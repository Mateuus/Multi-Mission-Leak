/* 
 Author: Bryan "Tonic" Boardwine 
 
 Description: 
 Takes partial data of a player and updates it, this is meant to be 
 less network intensive towards data flowing through it for updates. 
*/ 
private["_uid","_side","_value","_mode","_query"]; 
_uid = param [0,"",[""]]; 
_side = param [1,sideUnknown,[civilian]]; 
_mode = param [3,-1,[0]]; 
 
if(_uid == "" OR _side == sideUnknown) exitWith {}; //Bad. 
_query = ""; 
//diag_log format ["updatePartial: %1",_this]; 
switch(_mode) do { 
 case 0: { 
  _value = param [2,0,[0]]; 
  _value = [_value] call DB_fnc_numberSafe; 
  _query = format["UPDATE players SET cash='%1' WHERE playerid='%2'",_value,_uid]; 
 }; 
 
 case 1: { 
  _value = param [2,0,[0]]; 
  _value = [_value] call DB_fnc_numberSafe; 
  _query = format["UPDATE players SET bankacc='%1' WHERE playerid='%2'",_value,_uid]; 
 }; 
 
 case 2: { 
  _value = param [2,[],[[]]]; 
  //Does something license related but I can't remember I only know it's important? 
  for "_i" from 0 to count(_value)-1 do { 
   _bool = [(_value select _i) select 1] call DB_fnc_bool; 
   _value set[_i,[(_value select _i) select 0,_bool]]; 
  }; 
  _value = [_value] call DB_fnc_mresArray; 
  switch(_side) do { 
   case west: {_query = format["UPDATE players SET cop_licenses='%1' WHERE playerid='%2'",_value,_uid];}; 
   case civilian: {_query = format["UPDATE players SET civ_licenses='%1' WHERE playerid='%2'",_value,_uid];}; 
   case independent: {_query = format["UPDATE players SET med_licenses='%1' WHERE playerid='%2'",_value,_uid];}; 
   case east: {_query = format["UPDATE players SET sec_licenses='%1' WHERE playerid='%2'",_value,_uid];}; 
  }; 
 }; 
 
 case 3: { 
  _value = param [2,[],[[]]]; 
  _value = [_value] call DB_fnc_mresArray; 
  switch(_side) do { 
   case west: {_query = format["UPDATE players SET cop_gear='%1' WHERE playerid='%2'",_value,_uid];}; 
   case civilian: {_query = format["UPDATE players SET civ_gear='%1' WHERE playerid='%2'",_value,_uid];}; 
   case independent: {_query = format["UPDATE players SET med_gear='%1' WHERE playerid='%2'",_value,_uid];}; 
   case east: {_query = format["UPDATE players SET sec_gear='%1' WHERE playerid='%2'",_value,_uid];}; 
  }; 
 }; 
 
 case 4: { 
  _value = param [2,false,[true]]; 
  _value = [_value] call DB_fnc_bool; 
  _query = format["UPDATE players SET alive='%1' WHERE playerid='%2'",_value,_uid]; 
 }; 
 
 case 5: { 
  _value = param [2,0,[0]]; 
  _value = [_value] call DB_fnc_numberSafe; 
  _query = format["UPDATE players SET arrested='%1' WHERE playerid='%2'",_value,_uid]; 
 }; 
 
 case 6: { 
  _value1 = param [2,0,[0]]; 
  _value2 = param [4,0,[0]]; 
  _value1 = [_value1] call DB_fnc_numberSafe; 
  _value2 = [_value2] call DB_fnc_numberSafe; 
  _query = format["UPDATE players SET cash='%1', bankacc='%2' WHERE playerid='%3'",_value1,_value2,_uid]; 
 }; 
 
 case 7: { 
  _array = param [2,[],[[]]]; 
  [_uid,_side,_array,0] call TON_fnc_keyManagement; 
 }; 
 
 // survival 
 case 8: { 
  _value = param [2,[],[[]]]; 
  switch(_side) do { 
   case west: {_query = format["UPDATE players SET cop_survival='%1' WHERE playerid='%2'",_value,_uid];}; 
   case civilian: {_query = format["UPDATE players SET civ_survival='%1' WHERE playerid='%2'",_value,_uid];}; 
   case independent: {_query = format["UPDATE players SET med_survival='%1' WHERE playerid='%2'",_value,_uid];}; 
   case east: {_query = format["UPDATE players SET sec_survival='%1' WHERE playerid='%2'",_value,_uid];}; 
  }; 
 }; 
}; 
 
if(_query == "") exitWith {}; 
 
[_query,1] call DB_fnc_asyncCall; 
