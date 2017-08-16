private["_trunk","_chanceberechnung","_player","_diamondjob_marker","_diamondjob_container_marker","_select_diamondjob_marker","_getpositioncontainer","_getpositionnpc","_container","_infonpc","_npc_direction","_ownerid"]; 
_player = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param; 
_ownerid = owner _player; 
if (NOCRIS_EVENT_RUNING) exitwith {NOCRIS_DIAMONDJOB_PLAYERID pushback (getplayeruid _player); publicVariable "NOCRIS_DIAMONDJOB_PLAYERID"; [] remoteExecCall ["CLIENT_fnc_diamondjob_request",_ownerid];}; 
NOCRIS_EVENT_RUNING = true; 
publicVariable "NOCRIS_EVENT_RUNING"; 
 
_diamondjob_marker = getArray(missionconfigfile >> "CfgEvents" >> "diamondjob" >> NOCRIS_DIAMONDJOB_SELECT >> "diamondjob_marker"); 
_diamondjob_container_marker = getText(missionconfigfile >> "CfgEvents" >> "diamondjob" >> NOCRIS_DIAMONDJOB_SELECT >> "diamondjob_container_marker"); 
 
_random = floor random(count _diamondjob_marker); 
_select_diamondjob_marker = _diamondjob_marker select _random; 
 
_getpositionnpc = getMarkerPos _select_diamondjob_marker; 
_npc_direction = markerDir _select_diamondjob_marker; 
 
_getpositioncontainer = getMarkerPos (_diamondjob_container_marker); 
_container_direction = markerDir (_diamondjob_container_marker); 
 
_infonpc = createGroup west createUnit ["i_g_soldier_unarmed_f", _getpositionnpc, [], 0, "FORM"]; 
_infonpc allowDamage false; 
_infonpc enableSimulation false; 
_infonpc setDir _npc_direction; 
_infonpc setVectorUp (surfaceNormal (getMarkerPos _select_diamondjob_marker)); 
 
[_infonpc, ["Informant befragen",CLIENT_fnc_diamondjob_question]] remoteExec ["addAction", -2, _infonpc]; 
 
_posX = (_getpositionnpc select 0); 
_posY = (_getpositionnpc select 1); 
_posZ = (_getpositionnpc select 2); 
_currentPos = getPosATL _infonpc; 
_fixX = (_currentPos select 0) - _posX; 
_fixY = (_currentPos select 1) - _posY; 
_fixZ = (_currentPos select 2) - _posZ; 
_infonpc setPosATL [(_posX - _fixX), (_posY - _fixY), (_posZ - _fixZ)]; 
_infonpc setDir _npc_direction; 
_infonpc setVectorUp (surfaceNormal (getMarkerPos _select_diamondjob_marker)); 
 
NOCRIS_EVENT_INFONPC = _infonpc; 
publicVariable "NOCRIS_EVENT_INFONPC"; 
NOCRIS_EVENT_INFONPC_MARKER = _getpositionnpc; 
publicVariable "NOCRIS_EVENT_INFONPC_MARKER"; 
NOCRIS_EVENT_CONTAINER_MARKER = _getpositioncontainer; 
publicVariable "NOCRIS_EVENT_CONTAINER_MARKER"; 
NOCRIS_EVENT_TIME = 500; 
publicVariable "NOCRIS_EVENT_TIME"; 
NOCRIS_DIAMONDJOB_PLAYERID pushback (getplayeruid _player); 
publicVariable "NOCRIS_DIAMONDJOB_PLAYERID"; 
 
[] remoteExecCall ["CLIENT_fnc_diamondjob_map",_ownerid]; 
 
while {NOCRIS_EVENT_TIME > 0} do { 
NOCRIS_EVENT_TIME = NOCRIS_EVENT_TIME - 1; 
publicVariable "NOCRIS_EVENT_TIME"; 
sleep 1; 
}; 
 
_chanceberechnung = round(random 4); 
switch (_chanceberechnung) do { 
case 0: {_trunk = [[["blutdiamant",100],["arifle_AK12_F_NGWEAPON",1],["arifle_AK12_GL_F_NGWEAPON",1],["30Rnd_762x39_Mag_F_NGWEAPON",10]],0];}; 
case 1: {_trunk = [[["blutdiamant",75],["Laserdesignator_NGWEAPON",1],["arifle_AKM_F_hex_NGWEAPON",1],["bipod_02_F_hex_NGWEAPON",3]],0];}; 
case 2: {_trunk = [[["blutdiamant",120],["Laserdesignator_NGWEAPON",2],["U_BG_Guerilla1_1_NGWEAPON",1]],0];}; 
case 3: {_trunk = [[["blutdiamant",200],["30Rnd_762x39_Mag_F_NGWEAPON",30],["optic_Arco_NGWEAPON",2],["Laserdesignator_NGWEAPON",1]],0];}; 
case 4: {_trunk = [[["blutdiamant",170],["arifle_AK12_F_NGWEAPON",3],["Laserdesignator_NGWEAPON",1],["optic_Arco_NGWEAPON",5]],0];}; 
}; 
 
_container = createVehicle["Land_Cargo40_blue_F",[0,0,999],[],0,"NONE"]; 
_container allowDamage false; 
_container enableSimulation false; 
_container setVariable["container_open",false,true]; 
_container setVariable["container_bohrung",false,true]; 
_container setVariable["trunk_in_use",false,true]; 
_container setVariable["Trunk",_trunk, true]; 
_container setPosATL _getpositioncontainer; 
_container setDir _container_direction; 
_container setVectorUp (surfaceNormal (getMarkerPos _diamondjob_container_marker)); 
 
[_container, ["Container öffnen",CLIENT_fnc_diamondjob_opencontainer,"",0,false,false,"",' playerSide == civilian && {_target getVariable["container_open",false]} ']] remoteExec ["addAction", -2, _container]; 
[_container, ["Bohrer anbringen",CLIENT_fnc_diamondjob_placebohrer,"",0,false,false,"",' playerSide == civilian && {!(_target getVariable["container_open",false])} && {!(_target getVariable["container_bohrung",false])}']] remoteExec ["addAction", -2, _container]; 
[_container, ["Container schließen",CLIENT_fnc_diamondjob_bohrungbeenden,"",0,false,false,"",' playerSide == west && {_target getVariable ["container_bohrung",false]} ' ]] remoteExec ["addAction", -2, _container]; 
 
clearWeaponCargoGlobal _container; 
clearMagazineCargoGlobal _container; 
clearItemCargoGlobal _container; 
clearBackpackCargoGlobal _container; 
 
_posX = (_getpositioncontainer select 0); 
_posY = (_getpositioncontainer select 1); 
_posZ = (_getpositioncontainer select 2); 
_currentPos = getPosATL _container; 
_fixX = (_currentPos select 0) - _posX; 
_fixY = (_currentPos select 1) - _posY; 
_fixZ = (_currentPos select 2) - _posZ; 
_container setPosATL [(_posX - _fixX), (_posY - _fixY), (_posZ - _fixZ)]; 
_container setDir _container_direction; 
_container setVectorUp (surfaceNormal (getMarkerPos _diamondjob_container_marker)); 
 
NOCRIS_EVENT_CONTAINER = _container; 
publicVariable "NOCRIS_EVENT_CONTAINER"; 
 
[] spawn SERVER_fnc_resetevent;