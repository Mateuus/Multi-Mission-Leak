/* 
 File: fn_updateRequest.sqf 
 Author: Bryan "Tonic" Boardwine 
  
 Description: 
 Ain't got time to describe it, READ THE FILE NAME! 
*/ 
private["_uid","_side","_cash","_bank","_licenses","_gear","_name","_query","_thread","_perms","_levelsys"]; 
_uid = [_this,0,"",[""]] call BIS_fnc_param; 
_name = [_this,1,"",[""]] call BIS_fnc_param; 
_side = [_this,2,sideUnknown,[civilian]] call BIS_fnc_param; 
_cash = [_this,3,0,[0]] call BIS_fnc_param; 
_bank = [_this,4,5000,[0]] call BIS_fnc_param; 
_licenses = [_this,5,[],[[]]] call BIS_fnc_param; 
_gear = [_this,6,[],[[]]] call BIS_fnc_param; 
_levelsys = [_this,10,[],[[]]] call BIS_fnc_param; 
 
_text = format ["*** Spielerdaten geladen | SpielerID: %1 | Spielername: %2 | Fraktion: %3 | Bargeld: %2 | Konto: %3 | Lizenzen: %4 | Inventar: %5 |",_uid,_name,_side,_cash,_bank,_licenses,_gear]; 
[7,_text]call TON_fnc_log; 
 
_perms = nil; 
if ((_side == civilian) || (_side == east)) then  
{ 
 _perms = [_this,9,"""[]"""] call BIS_fnc_param; 
}; 
 
 
//Get to those error checks. 
if((_uid == "") OR (_name == "")) exitWith {}; 
 
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
 
switch (_side) do { 
 case west: {_query = format["UPDATE players SET name='%1', cash='%2', bankacc='%3', cop_gear='%4', cop_licenses='%5', levelsys='%6' WHERE playerid='%6'",_name,_cash,_bank,_gear,_licenses,_uid,_levelsys];}; 
 case civilian: {_query = format["UPDATE players SET name='%1', cash='%2', bankacc='%3', civ_licenses='%4', civ_gear='%6', arrested='%7',perms ='%8',levelsys ='%9' WHERE playerid='%5'",_name,_cash,_bank,_licenses,_uid,_gear,[_this select 7] call DB_fnc_bool,_perms,_levelsys];}; 
 case independent: {_query = format["UPDATE players SET name='%1', cash='%2', bankacc='%3', med_licenses='%4', levelsys='%6' WHERE playerid='%5'",_name,_cash,_bank,_licenses,_uid,_levelsys];}; 
 case east: {_query = format["UPDATE players SET name='%1', cash='%2', bankacc='%3', civ_licenses='%4', civ_gear='%6', arrested='%7',perms ='%8',levelsys ='%9' WHERE playerid='%5'",_name,_cash,_bank,_licenses,_uid,_gear,[_this select 7] call DB_fnc_bool,_perms,_levelsys];}; 
}; 
 
 
_queryResult = [_query,1] call DB_fnc_asyncCall;