 
 
 
 
 
 
 
 
private["_uid","_name","_side","_money","_bank","_exp","_licenses","_handler","_thread","_queryResult","_query","_alias"]; 
_uid = [_this,0,"",[""]] call BIS_fnc_param; 
_name = [_this,1,"",[""]] call BIS_fnc_param; 
_money = [_this,2,0,[""]] call BIS_fnc_param; 
_bank = [_this,3,20000,[""]] call BIS_fnc_param; 
_exp = [_this,4,0,[""]] call BIS_fnc_param; 
_returnToSender = [_this,5,ObjNull,[ObjNull]] call BIS_fnc_param; 
 
 
if((_uid == "") OR (_name == "")) exitWith {systemChat "Bad UID or name";}; 
if(isNull _returnToSender) exitWith {systemChat "ReturnToSender is Null!";}; 
 
_query = format["SELECT playerid, name FROM players WHERE playerid='%1'",_uid]; 
_queryResult = [_query,2] call DB_fnc_asyncCall; 
 
 
if(typeName _queryResult == "STRING") exitWith {remoteExecCall ["SOCK_fnc_dataQuery",(owner _returnToSender)]}; 
if(count _queryResult != 0) exitWith {remoteExecCall ["SOCK_fnc_dataQuery",(owner _returnToSender)]}; 
 
 
_name = [_name] call DB_fnc_mresString; 
_alias = [[_name]] call DB_fnc_mresArray; 
_money = [_money] call DB_fnc_numberSafe; 
_bank = [_bank] call DB_fnc_numberSafe; 
_exp = [_exp] call DB_fnc_numberSafe; 
 
 
_query = format["INSERT INTO players (playerid, name, cash, bankacc, exp, aliases, cop_licenses, med_licenses, civ_licenses, civ_gear, cop_gear, erfolge) VALUES('%1', '%2', '%3', '%4', '%5', '%6','""[]""','""[]""','""[]""','""[]""','""[]""','""[]""')", 
_uid, 
_name, 
_money, 
_bank, 
_exp, 
_alias 
]; 
 
[_query,1] call DB_fnc_asyncCall; 
[] remoteExecCall ["SOCK_fnc_dataQuery",(owner _returnToSender)];