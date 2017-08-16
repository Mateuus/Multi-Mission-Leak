/* 
Filename : fn_getZeus.sqf 
 
Author: Blackd0g 
 
Description: configures and activates Zeus Functions  on the server. 
 
Usage : [[player,3],"name_of_this_fnc",false,false] call lhm_fnc_mp; 
*/ 
private ["_curatorAdminlevel","_curatorRequester","_binConfigPatches","_patchEntry","_cfgPatches"]; 
_curatorRequester = param [0,ObjNull,[ObjNull]]; 
_curatorAdminlevel = param [1,0]; 
 
// Some Checks 
If(_curatorRequester == ObjNull) exitWith {Diag_log "Server: Curator - Error ObjNull"}; 
// Comment the following out if your not using this on Altis RPG 
If(_curatorAdminlevel < 3) exitWith { 
 Diag_log format ["Server: Curator - Player %1 requests Zeus with wrong Adminlevel: '%2' - ABORTED!",bis_curatorUnit,_curatorAdminlevel]; 
 [{hint "You are not allowed to do that. You have the wrong Admin Level!";},"BIS_fnc_Spawn",_curatorRequester,false] call lhm_fnc_mp 
}; 
 
// Check if zeus player is already set 
If (isNil "bis_curatorUnit") then { 
 bis_curatorUnit = _curatorRequester; 
} else { 
// If yes then only reassign to player 
 If (getPlayerUID bis_curatorUnit == "") then { 
  unassignCurator bis_curatorUnit; 
  bis_curatorUnit = _curatorRequester; 
  bis_curatorUnit assignCurator bis_curator; 
  diag_log format ["Server: Curator - assign %1 with %2 - Zeus is ready!",bis_curatorUnit,bis_curator]; 
 } else { 
  if ((getPlayerUID _curatorRequester) != (getPlayerUID bis_curatorUnit)) exitWith { 
   diag_log format ["Server: Curator - Error other Player with %1 UID is using Zeus",(getPlayerUID bis_curatorUnit)]; 
  }; 
 }; 
}; 
 
unassignCurator bis_curatorUnit; 
diag_log format ["Server: Curator - unassign %1 from curator",bis_curatorUnit]; 
 
waitUntil {!isNull bis_curatorUnit}; 
 
If (isNil"ZeusOnline") then { 
 ZeusOnline = false; 
}; 
 
if (!zeusOnline) then { 
diag_log format ["Server: Player %1 authenticated as a Admin - initializing Curator Functions...",bis_curatorUnit]; 
[{hint "initializing Curator Functions...";},"BIS_fnc_Spawn",_curatorRequester,false] call lhm_fnc_mp; 
// create curator modules 
group_curator = createGroup civilian; 
"ModuleCurator_F" createUnit [[0,0,0], group_curator, "bis_curator = this;"]; 
"ModuleCuratorSetAttributesPlayer_F" createUnit [[0,0,0], group_curator, "zeusAttrib = this;"]; 
"ModuleCuratorSetCoefs_F" createUnit [[0,0,0], group_curator, "zeusCosts = this;"]; 
"ModuleCuratorAddPoints_F" createUnit [[0,0,0], group_curator, "zeusRessources = this;"]; 
waitUntil {(!isNil"bis_curator") && (!isNil"zeusAttrib") && (!isNil"zeusCosts") && (!isNil"zeusRessources")}; 
diag_log "Server: Curator - Modules spawned"; 
 
// Set curator points to max 
bis_curator addCuratorPoints 1; 
 
// Scan for available addons 
diag_log "Server: Curator - scanning for available Addons..."; 
_binConfigPatches = configFile >> "CfgPatches"; 
_cfgPatches = []; 
for "_i" from 0 to count (_binConfigPatches)-1 do { 
 _patchEntry = _binConfigPatches select _i; 
 if(isClass _patchEntry) then { 
  _cfgPatches pushBack configName _patchEntry; 
 }; 
 sleep 0.1; 
}; 
 
waitUntil {sleep 1;(count _binConfigPatches) == (count _cfgPatches)}; // Wait till scan is complete 
diag_log format ["Server: Curator - Found %1 Addons!",count _cfgPatches]; 
[{hint "Curator Addons loaded...";},"BIS_fnc_Spawn",_curatorRequester,false] call lhm_fnc_mp; 
// Adds every available addon to curator logic 
bis_curator addCuratorAddons _cfgPatches; 
diag_log curatorAddons bis_curator; 
 
sleep 0.1; 
 
// all curator functions are now for free 
diag_log "Server: Curator - configurating Curator Features..."; 
bis_curator setCuratorWaypointCost 0; 
bis_curator setCuratorCoef ["place", -0]; 
bis_curator setCuratorCoef ["edit", -0]; 
bis_curator setCuratorCoef ["delete", -0]; 
bis_curator setCuratorCoef ["destroy", -0]; 
bis_curator setCuratorCoef ["group", -0]; 
bis_curator setCuratorCoef ["synchronize", -0]; 
 
sleep 1; 
 
ZeusOnline = true; 
 
// Sync curator module with player 
waitUntil {ZeusOnline}; 
bis_curatorUnit assignCurator bis_curator; 
diag_log format ["Server: Curator - assign %1 with %2 - Zeus is ready!",name bis_curatorUnit,bis_curator]; 
}; 
 
// message the player 
If (_curatorRequester == bis_curatorUnit) then { 
[{hint "Zeus request accepted.
 Initialisation complete >>> Press the 'Zeus Key' to start!";},"BIS_fnc_Spawn",_curatorRequester,false] call lhm_fnc_mp; 
} else { 
[{hint "Zeus request failed. 
 please try again!";},"BIS_fnc_Spawn",_curatorRequester,false] call lhm_fnc_mp; 
};