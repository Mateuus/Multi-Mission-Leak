 
 
 
 
 
 
 
private["_query","_result","_ret","_id"]; 
 
_unit = [_this,0,objNull,[objNull]] call BIS_fnc_param; 
 
_query = format["SELECT `candidate` FROM `asylumlife%1`.`votes` WHERE `playerid` = '%2'", life_server_instance, getPlayerUID _unit]; 
_result = "Arma2Net.Unmanaged" callExtension format ["Arma2NETMySQLCommand ['asylumlife%2', '%1']", _query, life_server_instance]; 
_result = call compile format["%1", _result]; 
if(isNil {((_result select 0) select 0)}) then 
{ 
_ret = ""; 
} 
else 
{ 
_ret = ((_result select 0) select 0) select 0; 
}; 
 
life_last_vote = _ret; 
(_unit getVariable ["ownerID", -1]) publicVariableClient "life_last_vote";