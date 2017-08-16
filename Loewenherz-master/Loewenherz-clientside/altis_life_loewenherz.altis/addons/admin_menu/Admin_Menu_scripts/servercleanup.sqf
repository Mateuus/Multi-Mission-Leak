/*
serverCleanup.sqf

Description: 
Cleanup some unused stuff and hacked in vehicles

Author : Blackd0g
*/
private ["_pos","_class","_items","_speed"];

_speed = 0.3; // Cleanup Speed

CleanupVehicleList = "";
CleanupVehicleList = ">>> Server-Cleanup <<<\n";
CleanupVehicleList = CleanupVehicleList + "WARNING: Game will freeze for some time while it scans for objects...\n\n";
hint CleanupVehicleList;

sleep 2;

_pos = getArray(configFile >> "CfgWorlds" >> worldName >> "centerPosition");
CleanupVehicleList = CleanupVehicleList + format["Delete Items:\n"];

_class = (nearestObjects [_pos, ["LandVehicle","Air","Ship","Land_Suitcase_F","Land_Money_F","WeaponholderSimulated","GroundWeaponHolder","WeaponHolder","Land_TacticalBacon_F","Land_BottlePlastic_V1_F","Land_Can_V3_F","Land_ClutterCutter_small_F"], 25000]) + allDead;
_items = count _class;

{
	if (_x != objNull) then
	{
		If (_x isKindOf "AllVehicles") then {
			[[_x,true,player],"TON_fnc_vehicleStore",false,false] call lhm_fnc_mp;
		} else {
			deleteVehicle _x;
		};
	CleanupVehicleList = CleanupVehicleList + format["'%1'\n",typeOf _x];
	hint CleanupVehicleList;
	};
sleep _speed;
} forEach _class;

CleanupVehicleList = CleanupVehicleList + format["\nSERVER: MANUAL CLEANUP \n Deleted %1 Items!",_items];
hint CleanupVehicleList;
cutText [format["\nMANUAL CLEANUP \n Deleted %1 Items!",_items], "PLAIN DOWN",1];
diag_log format ["\nSERVER: MANUAL CLEANUP \n Deleted %1 Items!",_items];