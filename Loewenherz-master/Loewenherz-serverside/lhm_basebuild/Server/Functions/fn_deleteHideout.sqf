/* 
Filename: fn_deleteHideout.sqf 
 
Description: Removes all Objects from Hideout 
*/ 
private["_gangID","_input"]; 
_gangID = _this select 0; 
 
if (_gangID == -1) exitWith {diag_log "LHM_BASEBUILD: Invalid Gang ID! Cancel Hideout removing."}; 
 
_input = format ["CALL removeGangHideout(%1)",_gangID]; 
[_input,1] spawn DB_fnc_asyncCall; 
Diag_log format ["LHM_BASEBUILD: Removing Gang Hideout with ID %1",_gangID];