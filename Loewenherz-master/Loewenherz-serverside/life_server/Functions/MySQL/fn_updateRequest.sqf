/* 
 File: fn_updateRequest.sqf 
 Author: Bryan "Tonic" Boardwine 
 
 Description: 
 Ain't got time to describe it, READ THE FILE NAME! 
*/ 
private["_uid","_side","_cash","_bank","_licenses","_gear","_name","_query","_thread"]; 
_uid = param [0,"",[""]]; 
_name = param [1,"",[""]]; 
_side = param [2,sideUnknown,[civilian]]; 
_cash = param [3,0,[0]]; 
_bank = param [4,5000,[0]]; 
_licenses = param [5,[],[[]]];; 
_gear = param [6,[],[[]]]; 
_prof = param [7,[],[[]]]; 
_survival = param [9,[],[[]]]; 
 
//Get to those error checks. 
if((_uid == "") OR (_name == "")) exitWith {}; 
//diag_log format ["fn_updateRequest: count _this = %1",count _this]; 
//diag_log format ["fn_updateRequest: _this = %1",_this]; 
//Parse and setup some data. 
_name = [_name] call DB_fnc_mresString; 
_gear = [_gear] call DB_fnc_mresArray; 
_cash = [_cash] call DB_fnc_numberSafe; 
_bank = [_bank] call DB_fnc_numberSafe; 
 
//Does something license related but I can't remember I only know it's important? 
for "_i" from 0 to count(_licenses)-1 do { 
 _bool = [(_licenses select _i) select 1] call DB_fnc_bool; 
 _licenses set[_i,[(_licenses select _i) select 0,_bool]]; 
}; 
 
_licenses = [_licenses] call DB_fnc_mresArray; 
// papabears-persistent-proficiency-system // 
_prof = [_prof] call DB_fnc_mresArray; 
// papabears-persistent-proficiency-system // 
 
switch (_side) do { 
 case west: {_query = format["UPDATE players SET name='%1', cash='%2', bankacc='%3', cop_gear='%4', cop_licenses='%5', cop_prof='%7', cop_survival='%8' WHERE playerid='%6'",_name,_cash,_bank,_gear,_licenses,_uid,_prof,_survival];}; 
 case civilian: {_query = format["UPDATE players SET name='%1', cash='%2', bankacc='%3', civ_licenses='%4', civ_gear='%6', arrested='%7', civ_prof='%8', civ_survival='%9' WHERE playerid='%5'",_name,_cash,_bank,_licenses,_uid,_gear,[_this select 8] call DB_fnc_numberSafe,_prof,_survival];}; 
 case independent: {_query = format["UPDATE players SET name='%1', cash='%2', bankacc='%3', med_licenses='%4', med_gear='%6',med_prof='%7', med_survival='%8' WHERE playerid='%5'",_name,_cash,_bank,_licenses,_uid,_gear,_prof,_survival];}; 
 case east: {_query = format["UPDATE players SET name='%1', cash='%2', bankacc='%3', sec_licenses='%4', sec_gear='%6', sec_prof='%7', sec_survival='%8' WHERE playerid='%5'",_name,_cash,_bank,_licenses,_uid,_gear,_prof,_survival];}; 
}; 
 
 
_queryResult = [_query,1] call DB_fnc_asyncCall;