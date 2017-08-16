/* 
    File: fn_updateRequest.sqf 
    Author: Bryan "Tonic" Boardwine 
 
    Description: 
    Ain't got time to describe it, READ THE FILE NAME! 
*/ 
 
private _player = param[0, objNull, [objNull]]; 
private _name = param[1, "", [""]]; 
private _side = param[2, sideUnknown, [sideUnknown]]; 
private _cash = param[3, -1, [0]]; 
private _bank = param[4, -1, [0]]; 
private _licenses = param [ 5, [], [[]]]; 
private _gear = param [ 6,[], [[]]]; 
 
if( _player isEqualTo objNull || _name isEqualTo "" || _side isEqualTo sideUnknown || _cash < 0 || _bank < 0 ) exitWith {}; 
 
if( alive _player )then { 
    [_player, _side, getPos _player] call XY_fnc_savePlayerPosition; 
}; 
 
//Parse and setup some data. 
_name = [_name] call XYDB_fnc_mresString; 
_gear = [_gear] call XYDB_fnc_mresArray; 
_cash = [_cash] call XYDB_fnc_numberSafe; 
_bank = [_bank] call XYDB_fnc_numberSafe; 
 
//Does something license related but I can't remember I only know it's important? 
for "_i" from 0 to count(_licenses)-1 do { 
    _licenses set[_i, [(_licenses select _i) select 0, ([(_licenses select _i) select 1] call XYDB_fnc_bool)]]; 
}; 
 
_licenses = [_licenses] call XYDB_fnc_mresArray; 
 
private _uid = getPlayerUID _player; 
private _query = switch (_side) do { 
    case west: { format["UPDATE players SET name='%1', cash='%2', bankacc='%3', cop_gear='%4', cop_licenses='%5', timeupdated = CURRENT_TIMESTAMP WHERE playerid='%6'",_name,_cash,_bank,_gear,_licenses,_uid]; }; 
    case civilian: { format["UPDATE players SET name='%1', cash='%2', bankacc='%3', civ_licenses='%4', civ_gear='%6', arrested='%7', timeupdated = CURRENT_TIMESTAMP WHERE playerid='%5'",_name,_cash,_bank,_licenses,_uid,_gear, [_this select 7] call XYDB_fnc_bool]; }; 
    case independent: { format["UPDATE players SET name='%1', cash='%2', bankacc='%3', med_licenses='%4', med_gear='%6', timeupdated = CURRENT_TIMESTAMP WHERE playerid='%5'",_name,_cash,_bank,_licenses,_uid,_gear]; }; 
    case east: { format["UPDATE players SET name='%1', cash='%2', bankacc='%3', thw_gear='%4', thw_licenses='%5', timeupdated = CURRENT_TIMESTAMP WHERE playerid='%6'",_name,_cash,_bank,_gear,_licenses,_uid]; }; 
}; 
 
[_query, 1] call XYDB_fnc_asyncCall;