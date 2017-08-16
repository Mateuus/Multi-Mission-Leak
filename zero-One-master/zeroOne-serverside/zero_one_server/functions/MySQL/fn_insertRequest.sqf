/* 
 File: fn_insertRequest.sqf 
*/ 
private["_uid","_name","_side","_money","_bank","_licenses","_handler","_thread","_queryResult","_query","_alias"]; 
_uid = param[0,"",[""]]; 
_name = param[1,"",[""]]; 
_money = param[2,0,[0]]; 
_bank = param[3,2500,[0]]; 
_unit = param[4,ObjNull,[ObjNull]]; 
 
if((_uid isEqualTo "") OR (_name isEqualTo "")) exitWith {diag_log "Bad UID or name";}; 
if(isNull _unit) exitWith {diag_log "ReturnToSender is Null!";}; 
 
_query = format["selectPlayerID:%1",_uid]; 
_queryResult = [_query,2] call zero_fnc_asyncCall; 
 
if(typeName _queryResult == "STRING") exitWith {[] remoteExecCall ["zero_fnc_bws",(owner _unit)];}; 
if(count _queryResult != 0) exitWith {[] remoteExecCall ["zero_fnc_bws",(owner _unit)];}; 
 
_name = [_name] call zero_fnc_mresString; 
_alias = [[_name]] call zero_fnc_mresArray; 
_money = [_money] call zero_fnc_numberSafe; 
_bank = [_bank] call zero_fnc_numberSafe; 
 
_query = format["insertPlayerID:%1:%2:%3:%4:%5:%6:%7:%8:%9:%10:%11:%12:%13:%14:%15:%16:%17", 
 _uid, 
 "", 
 _money, 
 _bank, 
 _money, 
 _bank, 
 _money, 
 _bank, 
 "", 
 [], 
 [], 
 [], 
 [], 
 [], 
 [], 
 [], 
 [] 
]; 
 
[_query,1] call zero_fnc_asyncCall; 
[] remoteExecCall ["zero_fnc_bws",(owner _unit)]; 
