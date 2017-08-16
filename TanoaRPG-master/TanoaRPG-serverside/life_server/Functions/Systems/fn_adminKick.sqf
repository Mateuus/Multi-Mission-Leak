/* 
 File: fn_adminFreeze.sqf 
 Author: CooliMC "Marc" 
  
 Description: 
 Freeze the Target and Sends it over the Network 
*/ 
 
private["_author","_target"]; 
_author = _this select 0; 
_target = _this select 1; 
 
if(serverCommandAvailable "#kick") then 
{ 
 [_author, _target, 3, "[ADMIN-Menu]", "Hat vom Server gekickt"] spawn TEX_fnc_logIt; 
 [1,format["Du hast %1 vom Server gekickt",_target getVariable["realname",name _target]],false] remoteExec ["tanoarpg_fnc_broadcast", _author,false]; 
 "ArmaLeakTeam" serverCommand format ["#kick %1",(name _target)]; 
} else { 
 [_author, _target, 3, "[ADMIN-Menu]", "Hat versucht vom Server zu kicken", "[SERVERCOMMAND-NOT-AVAILABLE-ERROR]"] spawn TEX_fnc_logIt; 
 [1,format["Du hast versucht %1 vom Server zu kicken (Fehlende Berechtigung)",_target getVariable["realname",name _target]],false] remoteExec ["tanoarpg_fnc_broadcast", _author,false]; 
};