 
 
 
 
 
 
 
private["_idleTime","_insured","_time","_delay","_dbInfo","_uid","_plate","_trunk","_sql","_item","_revive","_ammo","_maxAmmo"]; 
 
systemChat "Performing cleanup..."; 
 
{ 
_revive = _x getVariable ["Revive", nil]; 
_timeOfDeath = _x getVariable ["ToD", time]; 
if ((isNil "_revive") || ((time - _timeOfDeath) > 300)) then 
{ 
deleteVehicle _x; 
}; 
} foreach allDeadMen; 
 
{ 
if (((_x isKindOf "Car") || (_x isKindOf "Air") || (_x isKindOf "Ship")) && typeOf _x != "Steerable_Parachute_F") then { 
_idleTime = _x getVariable["idleTime",0]; 
if (alive _x) then {  
if (_idleTime > 0) then { 
_isKart = false;  
if (count (crew _x) == 0 || _isKart) then { 
_time = time; 
_spawned = _x getVariable["spawned",false]; 
if (_spawned) then{_delay = 120;} else{_delay = 600;}; 
if (_isKart) then 
{ 
if (_x distance (getMarkerPos "go_karts") > 150) then { _delay = 0; }; 
}; 
if ((_time - _idleTime) >= _delay) then {  
_dbInfo = _x getVariable["dbInfo",[]]; 
if(count _dbInfo != 0) then { 
_uid = _dbInfo select 0; 
_plate = _dbInfo select 1; 
_alarm = 0; 
if ((_dbInfo select 3)) then { _alarm = 1; }; 
_ammo = 0; 
if ((typeOf _x) == "B_G_Offroad_01_armed_F") then 
{ 
_maxAmmo = 400; 
{ 
_ammo = _ammo + (_x select 1); 
} forEach (magazinesAmmoFull _x); 
_ammo = _ammo / _maxAmmo; 
}; 
[_plate,_uid,_x,0,_alarm,_ammo] call DB_fnc_updateVehicle; 
sleep 0.1; 
}; 
deleteVehicle _x; 
}; 
}; 
} else { 
_owned = _x getVariable ["owner", nil]; 
_trunk = _x getVariable ["Trunk", nil]; 
if (isNil "_owned" && isNil "_trunk") then { deleteVehicle _x; }; 
}; 
} else { 
_spawned = _x getVariable["spawned",false]; 
_insured = _x getVariable["insured",false]; 
if (!_spawned && !_insured) then {  
[_x] spawn ASY_fnc_vehicleDead; 
sleep 0.1; 
}; 
deleteVehicle _x; 
}; 
} else { 
_revive = _x getVariable ["Revive", nil]; 
_owned = _x getVariable ["owner", nil]; 
_trunk = _x getVariable ["Trunk", nil]; 
_idleTime = _x getVariable ["idleTime", 0]; 
if (!((typeOf _x) in ASYObjectWhitelist) && ((_idleTime > 0 && (time - _idleTime) > 1800) || (_idleTime == 0 && isNil "_revive" && isNil "_owned" && isNil "_trunk" && (isNull (ropeAttachedTo _x))))) then 
{ 
deleteVehicle _x; 
}; 
}; 
} forEach vehicles; 
 
{ 
if((typeOf _x) in ["Jonzie_Lightbar_Hwy","Land_Axe_F","Land_WoodPile_F","Land_WoodenLog_F","Land_ExtensionCord_F","Land_Canteen_F","Land_BakedBeans_F","Land_PowderedMilk_F","Land_BottlePlastic_V1_F","Land_TacticalBacon_F","Land_Can_V3_F","Land_CanisterFuel_F", "Land_Can_V3_F","Land_Money_F","Land_Suitcase_F","Land_Defibrillator_F","Land_Screwdriver_V1_F","Land_BloodBag_F","Land_PainKillers_F","Land_DuctTape_F","Land_File_F","Land_Bucket_F","Land_DrillAku_F","Land_Pliers_F","Land_MultiMeter_F","Land_Sleeping_bag_folded_F","Bomb"]) then 
{ 
if (isNull (attachedTo _x)) then 
{ 
_item = _x getVariable "item"; 
_owner = _x getVariable "owner"; 
_idleTime = _x getVariable ["idleTime", 0]; 
if (!isNil "_item" && isNil "_owner" && ((_idleTime > 0 && (time - _idleTime) > 300) || _idleTime == 0)) then { deleteVehicle _x; }; 
}; 
}; 
} foreach (allMissionObjects "Thing"); 
 
{ 
deleteVehicle _x; 
} foreach (allMissionObjects "GroundWeaponHolder"); 
 
systemChat "Cleanup complete.";