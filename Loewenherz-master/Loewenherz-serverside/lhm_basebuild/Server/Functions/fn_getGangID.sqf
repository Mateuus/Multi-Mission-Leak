private["_uid","_query","_queryResult","_player","_gangID","_requester"]; 
_player = _this select 0; 
_requester = _this select 1; 
_uid = getPlayerUID _player; 
 
if (isNull _player) exitWith {}; 
if (isNull _requester) exitWith {}; 
 
_query = format["SELECT id, owner, name, members FROM gangs WHERE active='1' AND members LIKE '%2%1%2'",_uid,"%"]; 
 
_queryResult = [_query,2] call DB_fnc_asyncCall; 
 
if (count _queryResult > 0) then { 
 _gangID = (_queryResult select 0); 
// [["Gang ID:",_gangID],"lhm_fnc_showHint",_requester,false] call lhm_fnc_mp; 
 [[[_gangID],{  LHM_Basebuild_ID = (_this select 0);  }],"BIS_fnc_spawn", _requester, false] call LHM_fnc_MP; 
}; 
