/* 
 File: fn_updateRequest.sqf 
 Author: Bryan "Tonic" Boardwine 
 
 Description: 
 Ain't got time to describe it, READ THE FILE NAME! 
*/ 
private["_uid","_side","_cash","_bank","_licenses","_gear","_stats","_name","_isalive","_expLevel","_expCount","_expKills","_expDeaths","_civTime","_query","_thread"]; 
_uid = [_this,0,"",[""]] call BIS_fnc_param; 
_name = [_this,1,"",[""]] call BIS_fnc_param; 
_side = [_this,2,sideUnknown,[civilian]] call BIS_fnc_param; 
_cash = [_this,3,0,[0]] call BIS_fnc_param; 
_bank = [_this,4,5000,[0]] call BIS_fnc_param; 
_licenses = [_this,5,[],[[]]] call BIS_fnc_param; 
_gear = [_this,6,[],[[]]] call BIS_fnc_param; 
_stats = [_this,7,[100,100],[[]]] call BIS_fnc_param; 
_civTime = [_this,9,0,[0]] call BIS_fnc_param; 
_expLevel = [_this,10,0,[0]] call BIS_fnc_param; 
_expCount = [_this,11,0,[0]] call BIS_fnc_param; 
_expKills = [_this,12,0,[0]] call BIS_fnc_param; 
_expDeaths = [_this,13,0,[0]] call BIS_fnc_param; 
 
//Get to those error checks. 
if((_uid isEqualTo "") OR {(_name isEqualTo "")}) exitWith {}; 
 
//Parse and setup some data. 
_name = [_name] call DB_fnc_mresString; 
_gear = [_gear] call DB_fnc_mresArray; 
_stats = [_stats] call DB_fnc_mresArray; 
_cash = [_cash] call DB_fnc_numberSafe; 
_bank = [_bank] call DB_fnc_numberSafe; 
_civTime = [_civTime] call DB_fnc_numberSafe; 
_expLevel = [_expLevel] call DB_fnc_numberSafe; 
_expCount = [_expCount] call DB_fnc_numberSafe; 
_expKills = [_expKills] call DB_fnc_numberSafe; 
_expDeaths = [_expDeaths] call DB_fnc_numberSafe; 
 
//Does something license related but I can't remember I only know it's important? 
for "_i" from 0 to count(_licenses)-1 do { 
 _bool = [(_licenses select _i) select 1] call DB_fnc_bool; 
 _licenses set[_i,[(_licenses select _i) select 0,_bool]]; 
}; 
 
_licenses = [_licenses] call DB_fnc_mresArray; 
 
switch (_side) do { 
 case west: {_query = format["UPDATE players SET name='%1', cash='%2', bankacc='%3', cop_gear='%4', cop_licenses='%5', cop_stats='%6' WHERE playerid='%7'",_name,_cash,_bank,_gear,_licenses,_stats,_uid];}; 
 case civilian: {_query = format["UPDATE players SET name='%1', cash='%2', bankacc='%3', civ_licenses='%4', civ_gear='%5', arrested='%6', civ_stats='%7', civTime='%9', level='%10', expcount='%11', kills='%12', deaths='%13' WHERE playerid='%8'",_name,_cash,_bank,_licenses,_gear,[_this select 8] call DB_fnc_bool,_stats,_uid,_civTime,_expLevel,_expCount,_expKills,_expDeaths];}; 
 case independent: {_query = format["UPDATE players SET name='%1', cash='%2', bankacc='%3', med_licenses='%4', med_gear='%5', med_stats='%6' WHERE playerid='%7'",_name,_cash,_bank,_licenses,_gear,_stats,_uid];}; 
}; 
 
 
_queryResult = [_query,1] call DB_fnc_asyncCall; 
