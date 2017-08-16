scriptName "fn_dropLoot";
/*--------------------------------------------------------------------
	Author: Maverick (ofpectag: MAV)
    File: fn_dropLoot.sqf

	<Maverick Applications>
    Written by Maverick Applications (www.maverick-apps.de)
    You're not allowed to use this file without permission from the author!
--------------------------------------------------------------------*/
#define __filename "fn_dropLoot.sqf"

// Fetch container name from config
_containerClass = getText(missionConfigFile >> "Maverick_ConvoySidemission" >> "ConvoyConfigurationsPool" >> mav_convoy_class >> "Loot" >> "container");

// Fetch loot type from config
_lootType = getText(missionConfigFile >> "Maverick_ConvoySidemission" >> "ConvoyConfigurationsPool" >> mav_convoy_class >> "Loot" >> "type");

// Fetch loot from config
_loot = getArray(missionConfigFile >> "Maverick_ConvoySidemission" >> "ConvoyConfigurationsPool" >> mav_convoy_class >> "Loot" >> "data");

// Create container
_container = _containerClass createVehicle (getPos mav_convoy_mainVehicle);
mav_convoy_allMissionObjects pushBack _container;

// Clear container
clearWeaponCargoGlobal _container;
clearMagazineCargoGlobal _container;
clearItemCargoGlobal _container;
clearBackpackCargoGlobal _container;

// Fill container with loot
if (_lootType == "virtual") exitWith {
	mav_convoy_mainVehicle setVariable ["Trunk",[_loot,5000],true];
	[mav_convoy_mainVehicle,{ES_vehicles pushBack _this}] remoteExec ["BIS_fnc_spawn"];
};
if (_lootType == "real") exitWith {
	{
		if ((_x select 2) == "WEAPON") then {
			_container addWeaponCargoGlobal [_x select 0, _x select 1];
		};
		if ((_x select 2) == "MAGAZINE") then {
			_container addMagazineCargoGlobal [_x select 0, _x select 1];
		};
		if ((_x select 2) == "WEAPON") then {
			_container addItemCargoGlobal [_x select 0, _x select 1];
		};
		if ((_x select 2) == "BACKPACK") then {
			_container addBackpackCargoGlobal [_x select 0, _x select 1];
		};
	} forEach _loot;
};