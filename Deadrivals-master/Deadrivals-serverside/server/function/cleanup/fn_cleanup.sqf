private "_deleted"; 
_deleted = false; 
for "_i" from 0 to 1 step 0 do { 
uiSleep (10 * 60); 
{ 
if ((typeOf _x) in ["Land_BottlePlastic_V1_F","Land_TacticalBacon_F","Land_Can_V3_F","Land_CanisterFuel_F", "Land_Can_V3_F","Land_Money_F","Land_Suitcase_F"]) then { 
deleteVehicle _x; 
}; 
} forEach (allMissionObjects "Thing"); 
 
uiSleep (10 * 60); 
{ 
deleteVehicle _x; 
} forEach (allMissionObjects "GroundWeaponHolder"); 
}; 
