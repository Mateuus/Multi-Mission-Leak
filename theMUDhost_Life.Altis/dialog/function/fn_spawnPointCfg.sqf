#include <macro.h>
/*
	File: fn_spawnPointCfg.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Master configuration for available spawn points depending on the units side.
	
	Return:
	[Spawn Marker,Spawn Name,Image Path]
*/
private["_side","_return"];
_side = [_this,0,civilian,[civilian]] call BIS_fnc_param;

//Spawn Marker, Spawn Name, PathToImage
switch (_side) do
{
	case west:
	{
	    if(__GETC__(life_coplevel) == 0) then
		{
			_return = [
				["cop_spawn_1","Kavala HQ","\a3\ui_f\data\map\MapControl\watertower_ca.paa"],
				["cop_spawn_2","Pyrgos HQ","\a3\ui_f\data\map\MapControl\fuelstation_ca.paa"],
				["cop_spawn_3","Athira HQ","\a3\ui_f\data\map\GroupIcons\badge_rotate_0_gs.paa"]
			];
		};
		
		if(__GETC__(life_coplevel) == 1) then
		{
			_return = [
				["cop_spawn_1","Kavala HQ","\a3\ui_f\data\map\MapControl\watertower_ca.paa"],
				["cop_spawn_2","Pyrgos HQ","\a3\ui_f\data\map\MapControl\fuelstation_ca.paa"],
				["cop_spawn_3","Athira HQ","\a3\ui_f\data\map\GroupIcons\badge_rotate_0_gs.paa"],
				["academy_spawn","Police Academy","\a3\ui_f\data\map\MapControl\watertower_ca.paa"],
				["jail_spawn","Altis Corrections","\a3\ui_f\data\map\MapControl\watertower_ca.paa"]
			];
		};
		
		if(__GETC__(life_coplevel) >= 2) then
		{
			_return = [
				["cop_spawn_1","Kavala HQ","\a3\ui_f\data\map\MapControl\watertower_ca.paa"],
				["cop_kav_cp","Kavala Checkpoint","\a3\ui_f\data\map\MapControl\watertower_ca.paa"],
				["cop_spawn_2","Pyrgos HQ","\a3\ui_f\data\map\MapControl\fuelstation_ca.paa"],
				["cop_spawn_3","Athira HQ","\a3\ui_f\data\map\GroupIcons\badge_rotate_0_gs.paa"],
				["cop_spawn_4","Air HQ","\a3\ui_f\data\map\Markers\NATO\b_air.paa"],
				["cop_spawn_5","HW Patrol","\a3\ui_f\data\map\GroupIcons\badge_rotate_0_gs.paa"],
				["academy_spawn","Police Academy","\a3\ui_f\data\map\MapControl\watertower_ca.paa"],
				["border_spawn_1","North Border","\a3\ui_f\data\map\MapControl\watertower_ca.paa"],
				["border_spawn_2","South Border","\a3\ui_f\data\map\MapControl\watertower_ca.paa"],
				["jail_spawn","Altis Corrections","\a3\ui_f\data\map\MapControl\watertower_ca.paa"]
			];
		};
		
		if(__GETC__(life_coplevel) >= 5) then
		{
			_return = [
				["cop_spawn_1","Kavala HQ","\a3\ui_f\data\map\MapControl\watertower_ca.paa"],
				["cop_kav_cp","Kavala Checkpoint","\a3\ui_f\data\map\MapControl\watertower_ca.paa"],
				["cop_spawn_2","Pyrgos HQ","\a3\ui_f\data\map\MapControl\fuelstation_ca.paa"],
				["cop_spawn_3","Athira HQ","\a3\ui_f\data\map\GroupIcons\badge_rotate_0_gs.paa"],
				["cop_spawn_4","Air HQ","\a3\ui_f\data\map\Markers\NATO\b_air.paa"],
				["cop_spawn_5","HW Patrol","\a3\ui_f\data\map\GroupIcons\badge_rotate_0_gs.paa"],
				["academy_spawn","Police Academy","\a3\ui_f\data\map\MapControl\watertower_ca.paa"],
				["border_spawn_1","North Border","\a3\ui_f\data\map\MapControl\watertower_ca.paa"],
				["border_spawn_2","South Border","\a3\ui_f\data\map\MapControl\watertower_ca.paa"],
				["jail_spawn","Altis Corrections","\a3\ui_f\data\map\MapControl\watertower_ca.paa"],
				["swat_spawn","SWAT HQ","\a3\ui_f\data\map\GroupIcons\badge_rotate_0_gs.paa"]
			];
	   };	
	};
	
	case civilian:
	{
		_return = [];
	
		if(count life_tent > 0) then {
			_markerLocal = createMarkerLocal[format["civ_spawn_tent_%1",getPlayerUID player],life_tent select 1];
			_markerLocal setMarkerShapeLocal "ICON";
			_markerLocal setMarkerTypeLocal "hd_destroy";
			_markerLocal setMarkerColorLocal "ColorBlack";
			_markerLocal setMarkerTextLocal "Tent";
		
			_return = [[format["civ_spawn_tent_%1",getPlayerUID player],"Tent","\a3\ui_f\data\map\locationtypes\vegetationbroadleaf_ca.paa"]];
		};
		
	    if(license_civ_rebel && (__GETC__(life_donator) <= 1 ) && playerSide == civilian ) then {
			_return = _return +
			[
				["civ_spawn_1","Kavala","\a3\ui_f\data\map\MapControl\watertower_ca.paa"],
				["civ_spawn_2","Pyrgos","\a3\ui_f\data\map\MapControl\watertower_ca.paa"],
				["civ_spawn_3","Athira","\a3\ui_f\data\map\MapControl\watertower_ca.paa"],
				["civ_spawn_4","Sofia","\a3\ui_f\data\map\MapControl\watertower_ca.paa"],
				["reb_spawn_1","Rebel Central","\a3\ui_f\data\map\MapControl\watertower_ca.paa"],
				["reb_spawn_2","Rebel South","\a3\ui_f\data\map\MapControl\watertower_ca.paa"],
				["reb_spawn_3","Rebel East","\a3\ui_f\data\map\MapControl\watertower_ca.paa"],
				["rebel_base","Rebel Base","\a3\ui_f\data\map\MapControl\watertower_ca.paa"]
			];
		};
		
		if(!license_civ_rebel && (__GETC__(life_donator) <= 1 ) && playerSide == civilian ) then {
			_return = _return +
			[
				["civ_spawn_1","Kavala","\a3\ui_f\data\map\MapControl\watertower_ca.paa"],
				["civ_spawn_2","Pyrgos","\a3\ui_f\data\map\MapControl\watertower_ca.paa"],
				["civ_spawn_3","Athira","\a3\ui_f\data\map\MapControl\watertower_ca.paa"],
				["civ_spawn_4","Sofia","\a3\ui_f\data\map\MapControl\watertower_ca.paa"]
			];
		};

	    if(license_civ_rebel && (__GETC__(life_donator) >= 2 ) && playerSide == civilian ) then {
			_return = _return +
			[
				["civ_spawn_1","Kavala","\a3\ui_f\data\map\MapControl\watertower_ca.paa"],
				["civ_spawn_2","Pyrgos","\a3\ui_f\data\map\MapControl\watertower_ca.paa"],
				["civ_spawn_3","Athira","\a3\ui_f\data\map\MapControl\watertower_ca.paa"],
				["civ_spawn_4","Sofia","\a3\ui_f\data\map\MapControl\watertower_ca.paa"],
				["reb_spawn_1","Rebel Central","\a3\ui_f\data\map\MapControl\watertower_ca.paa"],
				["reb_spawn_2","Rebel South","\a3\ui_f\data\map\MapControl\watertower_ca.paa"],
				["reb_spawn_3","Rebel East","\a3\ui_f\data\map\MapControl\watertower_ca.paa"],
				["rebel_base","Rebel Base","\a3\ui_f\data\map\MapControl\watertower_ca.paa"],
				["donator_spawn","Donator HQ","\a3\ui_f\data\map\MapControl\watertower_ca.paa"]
			];
		};

		if(!license_civ_rebel && (__GETC__(life_donator) >= 2 ) && playerSide == civilian ) then {
			_return = _return +
			[
				["civ_spawn_1","Kavala","\a3\ui_f\data\map\MapControl\watertower_ca.paa"],
				["civ_spawn_2","Pyrgos","\a3\ui_f\data\map\MapControl\watertower_ca.paa"],
				["civ_spawn_3","Athira","\a3\ui_f\data\map\MapControl\watertower_ca.paa"],
				["civ_spawn_4","Sofia","\a3\ui_f\data\map\MapControl\watertower_ca.paa"],
				["donator_spawn","Donator HQ","\a3\ui_f\data\map\MapControl\watertower_ca.paa"]
			];
		};
		
		if(count life_houses > 0) then {
			{
				_pos = call compile format["%1",_x select 0];
				_house = nearestBuilding _pos;
				_houseName = getText(configFile >> "CfgVehicles" >> (typeOf _house) >> "displayName");
				
				_return set[count _return,[format["house_%1",_house getVariable "uid"],_houseName,"\a3\ui_f\data\map\MapControl\lighthouse_ca.paa"]];
			} foreach life_houses;
		};
		
	};
	
	case independent: {
		_return = [
			["medic_spawn_1","Kavala Hospital","\a3\ui_f\data\map\MapControl\hospital_ca.paa"],
			["medic_spawn_2","Athira Hospital","\a3\ui_f\data\map\MapControl\hospital_ca.paa"],
			["medic_spawn_3","Pygros Hospital","\a3\ui_f\data\map\MapControl\hospital_ca.paa"]
		];
	};
};

_return;