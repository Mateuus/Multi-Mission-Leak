 
 
 
 
 
 
 
private["_max","_locations","_officers","_i","_v","_center","_started"]; 
 
if (life_activeSWAT) exitWith { diag_log "SWAT requested but already activated!" }; 
 
_max = [_this,0,1,[1]] call BIS_fnc_param; 
_locations = [_this,1,[],[[]]] call BIS_fnc_param; 
_center = [_this,2,[],[[]]] call BIS_fnc_param; 
 
life_swat_officers = []; 
life_swat_active = []; 
life_deploySWAT = []; 
publicVariable "life_deploySWAT"; 
 
 
{ 
if (side _x == west && (_x getVariable ["swatlevel",0] > 0 || ((_x getVariable ["copLevel",0]) > 2))) then 
{ 
life_swat_officers pushBack _x; 
}; 
if(count life_swat_officers == _max) exitWith {}; 
} forEach allPlayers; 
 
if (count life_swat_officers == 0) exitWith { diag_log "No SWAT officers are available for dispatch." }; 
life_summonedSWAT = true; 
life_activeSWAT = false; 
life_swatPosOptions = _locations; 
life_swatPos = _center; 
{publicVariable _x} forEach ["life_summonedSWAT","life_activeSWAT","life_swatPosOptions","life_swatPos"]; 
[[_locations, _center], "life_fnc_swatDispatched", life_swat_officers, false] spawn life_fnc_MP; 
 
 
life_swat_deployed = true; 
life_activeSWAT = true; 
 
_started = time; 
waitUntil {(((time - _started > 60) && (count life_swat_active > 0)) || !life_activeSWAT || ((count life_swat_officers) == (count life_swat_active)) || (time - _started > 90))}; 
 
if (life_activeSWAT && count life_swat_active > 0) then 
{ 
_leader = 0; 
{ if ((_x getVariable ["copLevel",0]) > ((life_swat_active select _leader) getVariable ["copLevel",0])) then { _leader = _forEachIndex; }; } forEach life_swat_active; 
{ 
life_roleSWAT = switch (true) do 
{ 
case (_leader == _forEachIndex): { 2 }; 
case (_forEachIndex == 5 || (_forEachIndex == 6 && _leader == 5)): { 1 }; 
default { 0 }; 
}; 
(_x getVariable ["ownerID", -1]) publicVariableClient "life_roleSWAT"; 
} forEach life_swat_active; 
 
_started = time; 
waitUntil { time - _started > 60 || count life_deploySWAT > 0 }; 
if (count life_deploySWAT == 0) then { life_deploySWAT = (_locations select 0) select 1; publicVariable "life_deploySWAT"; }; 
 
 
if (surfaceIsWater life_deploySWAT) then 
{ 
if(life_deploySWAT select 2 > 100) exitWith {}; 
_v = "B_Boat_Transport_01_F" createVehicle (getMarkerPos "sky_dive"); 
_v lock 0; 
} 
else 
{ 
 
_v = "I_MRAP_03_F" createVehicle (getMarkerPos "sky_dive"); 
_v setObjectTextureGlobal [0,"images\mrap_03_police_co.jpg"]; 
_v lock 2; 
}; 
if(!isNil "_v") then { 
_v call ASY_fnc_setIdleTime; 
clearMagazineCargoGlobal _v; 
clearWeaponCargoGlobal _v; 
clearItemCargoGlobal _v; 
 
_slot = 0; 
{ 
if (_leader == _forEachIndex) then { _x action ["getInDriver", _v] } 
else 
{ 
if (surfaceIsWater life_deploySWAT) then 
{ 
if (_slot < 4) then 
{ 
_x action ["GetInTurret", _v, [_slot]]; 
_slot = _slot + 1; 
}; 
} 
else 
{ 
_x action ["getInCargo", _v]; 
}; 
}; 
} forEach life_swat_active; 
 
_v setPos life_deploySWAT; 
}; 
{ if (_x distance life_deploySWAT > 20) then { _x setPos [(life_deploySWAT select 0) + ((random 10) - 5), (life_deploySWAT select 1) + ((random 10) - 5), life_deploySWAT select 2] }; } forEach life_swat_active; 
 
waitUntil { !life_activeSWAT }; 
}; 
 
life_deploySWAT = []; 
publicVariable "life_deploySWAT"; 
life_swat_deployed = false; 
life_swat_active = []; 
if (!isNil "_v") then  
{ 
if (!isNull _v) then { deleteVehicle _v; }; 
};