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

//Spawn Marker, Spawn Name, PathToImage, skySpawn
switch (_side) do
{
	case west:
	{
		_return = [
			["cop_spawn_1","Kavala HQ","\a3\ui_f\data\map\MapControl\watertower_ca.paa"],
			["cop_spawn_2","Pyrgos HQ","\a3\ui_f\data\map\MapControl\fuelstation_ca.paa"],
			["cop_spawn_3","Athira HQ","\a3\ui_f\data\map\GroupIcons\badge_rotate_0_gs.paa"],
			["cop_spawn_4","Autobahnpolizei","\a3\ui_f\data\map\GroupIcons\badge_rotate_0_gs.paa"]
		];

		if (LICENSE_VALUE("sek","cop")) then {
			_return pushBack ["cop_spawn_5","SEK HQ","\a3\ui_f\data\map\GroupIcons\badge_rotate_0_gs.paa"];
		};

		if (LICENSE_VALUE("kripo","cop")) then {
			_return pushBack ["Kripo_vehicle","Kripo HQ","\a3\ui_f\data\map\GroupIcons\badge_rotate_0_gs.paa"];
		};
	};

	case civilian:
	{
		_return = [
			["civ_spawn_1","Kavala","\a3\ui_f\data\map\MapControl\watertower_ca.paa"],
			["civ_spawn_2","Pyrgos","\a3\ui_f\data\map\MapControl\watertower_ca.paa"],
			["civ_spawn_3","Athira","\a3\ui_f\data\map\MapControl\watertower_ca.paa"],
			["civ_spawn_4","Sofia","\a3\ui_f\data\map\MapControl\watertower_ca.paa"],
			["civ_spawn_5","Selankano","\a3\ui_f\data\map\MapControl\watertower_ca.paa"]
		];

		if (LICENSE_VALUE("rebel","civ")) then {
			_return pushBack ["reb_spawn","RebellenLager","\a3\ui_f\data\map\MapControl\watertower_ca.paa"];
		};

		if (LICENSE_VALUE("bm","civ")) then {
			_return pushBack ["bm_spawn","Schwarzmarkt","\a3\ui_f\data\map\MapControl\watertower_ca.paa"];
		};

		if(count life_houses > 0) then {
			{
				_pos = call compile format["%1",_x select 0];
				_house = nearestBuilding _pos;
				_houseName = getText(configFile >> "CfgVehicles" >> (typeOf _house) >> "displayName");

				if((_house getVariable ["HouseSpawnBlockTime",0]) < serverTime) then {
					_return pushBack [format["house_%1",_house getVariable "uid"],_houseName,"\a3\ui_f\data\map\MapControl\lighthouse_ca.paa"];
				};
			} foreach life_houses;
		};
	};

	case independent: {
		if (isNil "life_hsd") then {
			_return = [];
			
			if (FETCH_CONST(life_thwlevel) > 0) then {
				_return = _return + [
					["medic_spawn_1","Kavala Hospital","\a3\ui_f\data\map\MapControl\hospital_ca.paa","thw"],
					["medic_spawn_2","Athira Regional","\a3\ui_f\data\map\MapControl\hospital_ca.paa","thw"],
					["medic_spawn_3","Pygros Hospital","\a3\ui_f\data\map\MapControl\hospital_ca.paa","thw"]
				];
			};
			
			if (FETCH_CONST(life_eventlevel) > 0) then {
				_return = _return + [
					["event_spawn_1","Event Zone","\a3\ui_f\data\map\MapControl\hospital_ca.paa","event"],
					["medic_spawn_1","Kavala Event","\a3\ui_f\data\map\MapControl\hospital_ca.paa","event"],
					["medic_spawn_3","Pygros Event","\a3\ui_f\data\map\MapControl\hospital_ca.paa","event"]
				];
			};
			
				
		} else {
			switch (life_hsd) do {
				case "thw": {
					_return = [
						["medic_spawn_1","Kavala Hospital","\a3\ui_f\data\map\MapControl\hospital_ca.paa","thw"],
						["medic_spawn_2","Athira Regional","\a3\ui_f\data\map\MapControl\hospital_ca.paa","thw"],
						["medic_spawn_3","Pygros Hospital","\a3\ui_f\data\map\MapControl\hospital_ca.paa","thw"]
					];
				};
				case "event": {
				_return = [
					["event_spawn_1","Event Zone","\a3\ui_f\data\map\MapControl\hospital_ca.paa","event"],
					["medic_spawn_1","Kavala Event","\a3\ui_f\data\map\MapControl\hospital_ca.paa","event"],
					["medic_spawn_3","Pygros Event","\a3\ui_f\data\map\MapControl\hospital_ca.paa","event"]
				];
				};
				default {
					_return = [];
					
					if (FETCH_CONST(life_thwlevel) > 0) then {
						_return = _return + [
							["medic_spawn_1","Kavala Hospital","\a3\ui_f\data\map\MapControl\hospital_ca.paa","thw"],
							["medic_spawn_2","Athira Regional","\a3\ui_f\data\map\MapControl\hospital_ca.paa","thw"],
							["medic_spawn_3","Pygros Hospital","\a3\ui_f\data\map\MapControl\hospital_ca.paa","thw"]
						];
					};
					
					if (FETCH_CONST(life_eventlevel) > 0) then {
						_return = _return + [
							["event_spawn_1","Event Zone","\a3\ui_f\data\map\MapControl\hospital_ca.paa","event"],
							["medic_spawn_1","Kavala Event","\a3\ui_f\data\map\MapControl\hospital_ca.paa","event"],
							["medic_spawn_3","Pygros Event","\a3\ui_f\data\map\MapControl\hospital_ca.paa","event"]
						];
					};	
				};
			};
		};
	};
		
    case east: {
        _return = [
            ["ASF_spawn_1","Sicherheitsdienst Hauptquartier","\a3\ui_f\data\map\MapControl\watertower_ca.paa"],
            ["ASF_spawn_2","Kavala Außenstelle","\a3\ui_f\data\map\MapControl\watertower_ca.paa"],
            ["ASF_spawn_3","Sofia Außenstelle","\a3\ui_f\data\map\MapControl\watertower_ca.paa"]
        ];
    };
};

_return