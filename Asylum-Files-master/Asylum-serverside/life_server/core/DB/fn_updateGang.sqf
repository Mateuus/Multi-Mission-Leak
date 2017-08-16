 
 
 
 
 
 
 
if (life_server_training) exitWith {}; 
private["_id","_inviteRank","_query","_sql","_kickRank","_bank"]; 
_id = [_this,0,"0",["0"]] call BIS_fnc_param; 
_inviteRank = [_this,1,0,[0]] call BIS_fnc_param; 
_kickRank = [_this,2,0,[0]] call BIS_fnc_param; 
_bank = [_this,3,-1,[-1]] call BIS_fnc_param; 
 
if (_bank < 0) then 
{ 
_query = format["UPDATE `gangs` SET inviterank='%2',kickrank='%3' WHERE id='%1'",_id,_inviteRank,_kickRank]; 
} 
else 
{ 
_query = format["UPDATE `gangs` SET bank='%2' WHERE id='%1'",_id,_bank]; 
}; 
 
_HC = false; 
if(!isNil "hc_1" && life_HC) then { 
if(!isNull hc_1 && ([HC_UID] call ASY_fnc_isUIDActive)) then { 
_HC = true; 
}; 
}; 
 
if (_HC) then { [[_query,format["asylumlife%1",life_server_instance]],"DB_fnc_doQuery",(owner hc_1),false] spawn life_fnc_MP; } 
else { _sql = "Arma2Net.Unmanaged" callExtension format ["Arma2NETMySQLCommand ['asylumlife%2', '%1']", _query, life_server_instance]; };