#include "..\..\macros.hpp"
/*
	ORIGINAL:
	File: fn_spawnPointCfg.sqf 
	Author: Bryan "Tonic" Boardwine
	Description:
	Master configuration for available spawn points depending on the units side.
	
	MODIFIED:
	File: fn_taxiPointCfg.sqf
	Author: MarkusSR1984
	
	Description:
	Erstellt die Liste der verfügbaren Taxiziele
	
	Return:
	[Spawn Marker,Spawn Name,Image Path]
*/
private["_side","_return"];
_side = param [0,civilian,[civilian]];

//Spawn Marker, Spawn Name, PathToImage
_return = 	[
			["civ_spawn_1","Kavala","\a3\ui_f\data\map\MapControl\watertower_ca.paa"],
			["cop_spawn_1","Kavala Polizei","\a3\ui_f\data\map\MapControl\watertower_ca.paa"],
			["medic_spawn_1","Kavala Feuerwehr","\a3\ui_f\data\map\MapControl\hospital_ca.paa"],
			["civ_truck_1","Kavala LKW Händler","\a3\ui_f\data\map\MapControl\watertower_ca.paa"],
			["car_g_1","Kavala Garage","\a3\ui_f\data\map\MapControl\watertower_ca.paa"],
			
			
			["civ_spawn_2","Pyrgos","\a3\ui_f\data\map\MapControl\watertower_ca.paa"],
			["cop_spawn_2","Pyrgos Polizei","\a3\ui_f\data\map\MapControl\fuelstation_ca.paa"],
			["medic_spawn_3","Pygros Feuerwehr","\a3\ui_f\data\map\MapControl\hospital_ca.paa"],
			["civ_truck_2","Pyrgos LKW Händler","\a3\ui_f\data\map\MapControl\watertower_ca.paa"],
			["car_g_3_1","Pyrgos Garage","\a3\ui_f\data\map\MapControl\watertower_ca.paa"],

			
			["civ_spawn_3","Athira","\a3\ui_f\data\map\MapControl\watertower_ca.paa"],
			["cop_spawn_3","Athira Polizei","\a3\ui_f\data\map\GroupIcons\badge_rotate_0_gs.paa"],
			["medic_spawn_2","Athira Feuerwehr","\a3\ui_f\data\map\MapControl\hospital_ca.paa"],
			["civ_truck_4","Athira LKW Händler","\a3\ui_f\data\map\MapControl\watertower_ca.paa"],
			["car_g_3","Athira Garage","\a3\ui_f\data\map\MapControl\watertower_ca.paa"],
			
			["civ_spawn_4","Sofia","\a3\ui_f\data\map\MapControl\watertower_ca.paa"],
			["cop_spawn_7","Sofia Polizei","\a3\ui_f\data\map\MapControl\watertower_ca.paa"],
			["medic_spawn_4","Sofia Feuerwehr","\a3\ui_f\data\map\MapControl\hospital_ca.paa"],
			["civ_truck_3","Sofia LKW Händler","\a3\ui_f\data\map\MapControl\watertower_ca.paa"],
			["car_g_2","Sofia Garage","\a3\ui_f\data\map\MapControl\watertower_ca.paa"],
			
			["casinospawn","Casino","\a3\ui_f\data\map\MapControl\watertower_ca.paa"],
			["air_g_1","Airfield Garage","\a3\ui_f\data\map\MapControl\watertower_ca.paa"],
			["civ_air_1","Helikopter Händler","\a3\ui_f\data\map\MapControl\watertower_ca.paa"],
			["verwahrstelle_taxi","Fahrzeug Verwahrstelle","\a3\ui_f\data\map\MapControl\watertower_ca.paa"],
			
			["dhl_missions","Taxizentrale","\a3\ui_f\data\map\MapControl\watertower_ca.paa"],
			["dhl_1","Taxistand DP 1","\a3\ui_f\data\map\MapControl\watertower_ca.paa"],
			["dhl_2","Taxistand DP 2","\a3\ui_f\data\map\MapControl\watertower_ca.paa"],
			["dhl_3","Taxistand DP 3","\a3\ui_f\data\map\MapControl\watertower_ca.paa"],
			["dhl_4","Taxistand DP 4","\a3\ui_f\data\map\MapControl\watertower_ca.paa"],
			["dhl_5","Taxistand DP 5","\a3\ui_f\data\map\MapControl\watertower_ca.paa"],
			["dhl_6","Taxistand DP 6","\a3\ui_f\data\map\MapControl\watertower_ca.paa"],
			["dhl_7","Taxistand DP 7","\a3\ui_f\data\map\MapControl\watertower_ca.paa"],
			["dhl_8","Taxistand DP 8","\a3\ui_f\data\map\MapControl\watertower_ca.paa"],
			["dhl_9","Taxistand DP 9","\a3\ui_f\data\map\MapControl\watertower_ca.paa"],
			["dhl_10","Taxistand DP 10","\a3\ui_f\data\map\MapControl\watertower_ca.paa"],
			["dhl_11","Taxistand DP 11","\a3\ui_f\data\map\MapControl\watertower_ca.paa"],
			["dhl_12","Taxistand DP 12","\a3\ui_f\data\map\MapControl\watertower_ca.paa"],
			["dhl_13","Taxistand DP 13","\a3\ui_f\data\map\MapControl\watertower_ca.paa"],
			["dhl_14","Taxistand DP 14","\a3\ui_f\data\map\MapControl\watertower_ca.paa"],
			["dhl_15","Taxistand DP 15","\a3\ui_f\data\map\MapControl\watertower_ca.paa"],
			["dhl_16","Taxistand DP 16","\a3\ui_f\data\map\MapControl\watertower_ca.paa"],
			["dhl_17","Taxistand DP 17","\a3\ui_f\data\map\MapControl\watertower_ca.paa"],			
			["dhl_18","Taxistand DP 18","\a3\ui_f\data\map\MapControl\watertower_ca.paa"],
			["dhl_19","Taxistand DP 19","\a3\ui_f\data\map\MapControl\watertower_ca.paa"],
			["dhl_20","Taxistand DP 20","\a3\ui_f\data\map\MapControl\watertower_ca.paa"],
			["dhl_21","Taxistand DP 21","\a3\ui_f\data\map\MapControl\watertower_ca.paa"],
			["dhl_22","Taxistand DP 22","\a3\ui_f\data\map\MapControl\watertower_ca.paa"],
			["dhl_23","Taxistand DP 23","\a3\ui_f\data\map\MapControl\watertower_ca.paa"],
			["dhl_24","Taxistand DP 24","\a3\ui_f\data\map\MapControl\watertower_ca.paa"],
			["dhl_25","Taxistand DP 25","\a3\ui_f\data\map\MapControl\watertower_ca.paa"],
			["Rebel_1","Rebellen HQ","\a3\ui_f\data\map\MapControl\watertower_ca.paa"],
			["Rebel_2","Rebellen Außenposten","\a3\ui_f\data\map\MapControl\watertower_ca.paa"],
			["Rebel_3","Rebellen Außenposten","\a3\ui_f\data\map\MapControl\watertower_ca.paa"]
			
			
			
		];







switch (_side) do
{
	case west:
	{
			["cop_spawn_5","Kontrolle 2","\a3\ui_f\data\map\GroupIcons\badge_rotate_0_gs.paa"],
			["cop_spawn_6","Kontrolle 1","\a3\ui_f\data\map\GroupIcons\badge_rotate_0_gs.paa"],
			["cop_spawn_4","Flughafen COP","\a3\ui_f\data\map\Markers\NATO\b_air.paa"]

	};
	
	case civilian: // Donator und Hausbesitzer NUR wenn sie als Zivilisten Eingeloggt sind
	{
		if(lc_home) then 
		{			
			if(count DWEV_houses > 0) then 
			{
				{
					_pos = call compile format["%1",_x select 0];
					_house = nearestBuilding _pos;
					_houseName = getText(configFile >> "CfgVehicles" >> (typeOf _house) >> "displayName");
				
					_return pushBack [format["house_%1",_house getVariable "uid"],_houseName,"\a3\ui_f\data\map\MapControl\lighthouse_ca.paa"];
					false
				} count DWEV_houses;
			};
		};
		
		if(count DWEV_vehicles > 0) then 
		{
			
			{
				if ((_x isKindOf "LandVehicle") && !(surfaceIsWater position _x) ) then
				{
					_pos = getPos _x;
					_vehicleName = getText(configFile >> "CfgVehicles" >> (typeOf _x) >> "displayName");
					_picture = getText(configFile >> "CfgVehicles" >> (typeOf _x) >> "picture");
					
					_return pushBack [_pos,_vehicleName,_picture];
				};
				
				
				false
			} count DWEV_vehicles;		
		
		};		
				
		
		
		if(__GETC__(DWEV_donator) > 0) then 
		{
			_return = _return + [
								["donator_spawn_1","Premium Shop Süden","\a3\ui_f\data\map\MapControl\waypointcompleted_ca.paa"],
								["donator_spawn_2","Premium Shop Norden","\a3\ui_f\data\map\MapControl\waypointcompleted_ca.paa"]
								];
		};		
	
	};
	
	case independent: {};	
};


_return;