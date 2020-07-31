/*
	File: fn_spawnPointCfg.sqf
	
	
	Description:
	Master configuration for available spawn points depending on the units side.
	
	Return:
	[Spawn Marker,Spawn Name,Image Path]
*/
private["_side","_return"];
_side = param [0,civilian,[civilian]];

//Spawn Marker, Spawn Name, PathToImage
switch (_side) do
{
	case west:
	{
		_return = [
			["cop_spawn_1","LS SO","\a3\ui_f\data\map\MapControl\watertower_ca.paa"],
			["cop_spawn_2","Morrison","\a3\ui_f\data\map\MapControl\fuelstation_ca.paa"],
			["cop_spawn_3","Los D SO","\a3\ui_f\data\map\MapControl\fuelstation_ca.paa"],
			["cop_spawn_4","Airbase","\a3\ui_f\data\map\Markers\NATO\b_air.paa"],
			["cop_spawn_5","DoC","\a3\ui_f\data\map\GroupIcons\badge_rotate_0_gs.paa"]
		];
	};

	case east:
	{

		if(!license_civ_rebel) then {
			_return = [
				["civ_spawn_1","LS News","\a3\ui_f\data\map\MapControl\watertower_ca.paa"],
				["lakeside_spawn_2","LS Tow","\a3\ui_f\data\map\MapControl\watertower_ca.paa"],
				["lakeside_spawn_3","LS Race","\a3\ui_f\data\map\MapControl\watertower_ca.paa"],
				["civ_spawn_6","Knoxville","\a3\ui_f\data\map\MapControl\watertower_ca.paa"],
				["civ_spawn_5","Bedford","\a3\ui_f\data\map\MapControl\watertower_ca.paa"],
				["civ_spawn_4","Los D","\a3\ui_f\data\map\MapControl\watertower_ca.paa"],
				["civ_spawn_2","Morrison","\a3\ui_f\data\map\MapControl\watertower_ca.paa"],
				["civ_spawn_3","San Crist","\a3\ui_f\data\map\MapControl\watertower_ca.paa"]
			];
			
			if(count life_houses > 0) then {
				{
					_pos = call compile format["%1",_x select 0];
					_house = nearestBuilding _pos;
					_houseName = getText(configFile >> "CfgVehicles" >> (typeOf _house) >> "displayName");
					
					_return pushBack [format["house_%1",_house getVariable "uid"],_houseName,"\a3\ui_f\data\map\MapControl\lighthouse_ca.paa"];
				} foreach life_houses;
			};	
		};

		if(license_civ_rebel && !(rebelshipment getVariable["progress",FALSE]) && !(rebelshipment getVariable["notCaptured",FALSE]) ) then {

			_return = [
				["reb_spawn_1","Rebel 1","\a3\ui_f\data\map\MapControl\watertower_ca.paa"],
				["reb_spawn_2","Rebel 2","\a3\ui_f\data\map\MapControl\watertower_ca.paa"],
				["civ_spawn_4","Los D","\a3\ui_f\data\map\MapControl\watertower_ca.paa"],
				["ld_spawn_1","LD Air","\a3\ui_f\data\map\MapControl\watertower_ca.paa"],
				["ld_spawn_2","LD Hos","\a3\ui_f\data\map\MapControl\watertower_ca.paa"],
				["civ_spawn_6","Knoxville","\a3\ui_f\data\map\MapControl\watertower_ca.paa"],
				["civ_spawn_5","Bedford","\a3\ui_f\data\map\MapControl\watertower_ca.paa"],
				["civ_spawn_2","Morrison","\a3\ui_f\data\map\MapControl\watertower_ca.paa"],
				["civ_spawn_3","San Crist","\a3\ui_f\data\map\MapControl\watertower_ca.paa"]
			];


			
			if(count life_houses > 0) then {
				{
					_pos = call compile format["%1",_x select 0];
					_house = nearestBuilding _pos;
					_houseName = getText(configFile >> "CfgVehicles" >> (typeOf _house) >> "displayName");
					
					_return pushBack [format["house_%1",_house getVariable "uid"],_houseName,"\a3\ui_f\data\map\MapControl\lighthouse_ca.paa"];
				} foreach life_houses;
			};	
		};
		if(license_civ_rebel && (rebelshipment getVariable["progress",FALSE]) || license_civ_rebel && (rebelshipment getVariable["notCaptured",FALSE])) then {

			_return = [
				["civ_spawn_4","Los D","\a3\ui_f\data\map\MapControl\watertower_ca.paa"],
				["ld_spawn_1","LD Air","\a3\ui_f\data\map\MapControl\watertower_ca.paa"],
				["ld_spawn_2","LD Hos","\a3\ui_f\data\map\MapControl\watertower_ca.paa"],
				["civ_spawn_6","Knoxville","\a3\ui_f\data\map\MapControl\watertower_ca.paa"],
				["civ_spawn_5","Bedford","\a3\ui_f\data\map\MapControl\watertower_ca.paa"],
				["civ_spawn_2","Morrison","\a3\ui_f\data\map\MapControl\watertower_ca.paa"],
				["civ_spawn_3","San Crist","\a3\ui_f\data\map\MapControl\watertower_ca.paa"]
			];


			
			if(count life_houses > 0) then {
				{
					_pos = call compile format["%1",_x select 0];
					_house = nearestBuilding _pos;
					_houseName = getText(configFile >> "CfgVehicles" >> (typeOf _house) >> "displayName");
					
					_return pushBack [format["house_%1",_house getVariable "uid"],_houseName,"\a3\ui_f\data\map\MapControl\lighthouse_ca.paa"];
				} foreach life_houses;
			};	
		};
	};
	

	
	case civilian:
	{

		if(!license_civ_rebel) then {
			_return = [
				["civ_spawn_1","LS News","\a3\ui_f\data\map\MapControl\watertower_ca.paa"],
				["lakeside_spawn_2","LS Tow","\a3\ui_f\data\map\MapControl\watertower_ca.paa"],
				["lakeside_spawn_3","LS Race","\a3\ui_f\data\map\MapControl\watertower_ca.paa"],
				["civ_spawn_6","Knoxville","\a3\ui_f\data\map\MapControl\watertower_ca.paa"],
				["civ_spawn_5","Bedford","\a3\ui_f\data\map\MapControl\watertower_ca.paa"],
				["civ_spawn_4","Los D","\a3\ui_f\data\map\MapControl\watertower_ca.paa"],
				["civ_spawn_2","Morrison","\a3\ui_f\data\map\MapControl\watertower_ca.paa"],
				["civ_spawn_3","San Crist","\a3\ui_f\data\map\MapControl\watertower_ca.paa"]
			];
			
			if(count life_houses > 0) then {
				{
					_pos = call compile format["%1",_x select 0];
					_house = nearestBuilding _pos;
					_houseName = getText(configFile >> "CfgVehicles" >> (typeOf _house) >> "displayName");
					
					_return pushBack [format["house_%1",_house getVariable "uid"],_houseName,"\a3\ui_f\data\map\MapControl\lighthouse_ca.paa"];
				} foreach life_houses;
			};	
		};

		if(license_civ_rebel && !(rebelshipment getVariable["progress",FALSE]) && !(rebelshipment getVariable["notCaptured",FALSE]) ) then {

			_return = [
				["reb_spawn_1","Rebel 1","\a3\ui_f\data\map\MapControl\watertower_ca.paa"],
				["reb_spawn_2","Rebel 2","\a3\ui_f\data\map\MapControl\watertower_ca.paa"],
				["civ_spawn_4","Los D","\a3\ui_f\data\map\MapControl\watertower_ca.paa"],
				["ld_spawn_1","LD Air","\a3\ui_f\data\map\MapControl\watertower_ca.paa"],
				["ld_spawn_2","LD Hos","\a3\ui_f\data\map\MapControl\watertower_ca.paa"],
				["civ_spawn_6","Knoxville","\a3\ui_f\data\map\MapControl\watertower_ca.paa"],
				["civ_spawn_5","Bedford","\a3\ui_f\data\map\MapControl\watertower_ca.paa"],
				["civ_spawn_2","Morrison","\a3\ui_f\data\map\MapControl\watertower_ca.paa"],
				["civ_spawn_3","San Crist","\a3\ui_f\data\map\MapControl\watertower_ca.paa"]
			];


			
			if(count life_houses > 0) then {
				{
					_pos = call compile format["%1",_x select 0];
					_house = nearestBuilding _pos;
					_houseName = getText(configFile >> "CfgVehicles" >> (typeOf _house) >> "displayName");
					
					_return pushBack [format["house_%1",_house getVariable "uid"],_houseName,"\a3\ui_f\data\map\MapControl\lighthouse_ca.paa"];
				} foreach life_houses;
			};	
		};
		if(license_civ_rebel && (rebelshipment getVariable["progress",FALSE]) || license_civ_rebel && (rebelshipment getVariable["notCaptured",FALSE])) then {

			_return = [
				["civ_spawn_4","Los D","\a3\ui_f\data\map\MapControl\watertower_ca.paa"],
				["ld_spawn_1","LD Air","\a3\ui_f\data\map\MapControl\watertower_ca.paa"],
				["ld_spawn_2","LD Hos","\a3\ui_f\data\map\MapControl\watertower_ca.paa"],
				["civ_spawn_6","Knoxville","\a3\ui_f\data\map\MapControl\watertower_ca.paa"],
				["civ_spawn_5","Bedford","\a3\ui_f\data\map\MapControl\watertower_ca.paa"],
				["civ_spawn_2","Morrison","\a3\ui_f\data\map\MapControl\watertower_ca.paa"],
				["civ_spawn_3","San Crist","\a3\ui_f\data\map\MapControl\watertower_ca.paa"]
			];


			
			if(count life_houses > 0) then {
				{
					_pos = call compile format["%1",_x select 0];
					_house = nearestBuilding _pos;
					_houseName = getText(configFile >> "CfgVehicles" >> (typeOf _house) >> "displayName");
					
					_return pushBack [format["house_%1",_house getVariable "uid"],_houseName,"\a3\ui_f\data\map\MapControl\lighthouse_ca.paa"];
				} foreach life_houses;
			};	
		};
	};
	
	case independent: {
		_return = [
			["medic_spawn_2","LS Main","\a3\ui_f\data\map\MapControl\hospital_ca.paa"],
			["medic_spawn_4","S&R Main","\a3\ui_f\data\map\MapControl\hospital_ca.paa"],			
			["medic_spawn_3","Los D","\a3\ui_f\data\map\MapControl\hospital_ca.paa"],
			["medic_spawn_1","Morrison","\a3\ui_f\data\map\MapControl\hospital_ca.paa"]
		];
	};
};

_return;
