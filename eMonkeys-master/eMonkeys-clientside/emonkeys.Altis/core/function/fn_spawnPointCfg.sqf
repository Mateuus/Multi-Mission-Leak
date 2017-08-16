/*
	File: fn_spawnPointCfg.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Master configuration for available spawn points depending on the units side.
	
	Return:
	[Spawn Marker,Spawn Name,Image Path]
*/
private["_side", "_home_spawn_data", "_spawns"];
_side = [_this,0,civilian,[civilian]] call BIS_fnc_param;
_home_spawn_data = missionNamespace getVariable "spawn_home_list";

switch (_side) do
{
	case west: {_side = west};
	case independent: {_side = independent};
	case civilian: {_side = civilian};
	case east: {_side = civilian};
};

_spawns = [];
{
	_x = _x select 0;
	_house_marker_position = getMarkerPos format["%1",_x];
	_house_name1 = format["marker_%1", _x];
	_house = nearestBuilding _house_marker_position;
	_houseName = getText(configFile >> "CfgVehicles" >> (typeOf _house) >> "displayName");
	_house_name1 = createMarkerlocal [_house_name1, _house_marker_position];
	_house_name1 setMarkerTextlocal _houseName;
	_house_name1 setMarkerColorLocal "ColorBlue";
	_house_name1 setMarkerTypeLocal "loc_Lighthouse";
	
	_spawns = _spawns + [ [_x, _houseName, "core\textures\icons\map_house.paa" ] ];

}foreach (_home_spawn_data select 0);

_house_names1 = _home_spawn_data select 0;
EMonkeys_housecount = count _house_names1;

//Spawn Marker, Spawn Name, PathToImage
switch (_side) do
{
	case west:
	{
	_spawns = _spawns +	[
			["cop_spawn_4","Hauptquartier","\a3\ui_f\data\map\Markers\NATO\n_hq.paa"],
			["cop_spawn_1","Polizeistation Kavala","\a3\ui_f\data\map\Markers\NATO\n_unknown.paa"],	
			["cop_spawn_5","Autobahnpolizei","\a3\ui_f\data\map\Markers\NATO\c_car.paa"]
		];
	};
	
	case civilian:
	{		
		if(EMonkeys_VIP > 0)then
		{
		_spawns = _spawns + [
		["monkey_1","Monkey Club Athira","\a3\ui_f\data\map\MapControl\watertower_ca.paa"],
		["monkey_2","Monkey Club Pyrgos","\a3\ui_f\data\map\MapControl\watertower_ca.paa"]
		];
		};

		//Gruppierungen Spawn		
		if((["ap"] call EMonkeys_fnc_permLevel) > 0 && !eM_serverSpawn) then
		{
			_spawns = _spawns + [
			["ap_base","AP-Hauptquartier","\a3\ui_f\data\map\MapControl\transmitter_ca.paa"]
			];
		};
		if((["ff"] call EMonkeys_fnc_permLevel) > 0 && !eM_serverSpawn) then
		{
			_spawns = _spawns + [
			["ff_spawn","FF-Basis","\a3\ui_f\data\map\Markers\NATO\o_unknown.paa"]
			];
		}; 
		if((["soa"] call EMonkeys_fnc_permLevel) > 0 && !eM_serverSpawn) then
		{
			_spawns = _spawns + [
			["soa_spawn","SoA-Basis","\a3\ui_f\data\map\MapControl\watertower_ca.paa"]
			];
		}; 
		if((["ps"] call EMonkeys_fnc_permLevel) > 0 && !eM_serverSpawn) then
		{
			_spawns = _spawns + [
			["ps_spawn","PS-Basis","\a3\ui_f\data\map\Markers\NATO\o_unknown.paa"]
			];
		}; 
		if((["ksk"] call EMonkeys_fnc_permLevel) > 0 && !eM_serverSpawn) then
		{
			_spawns = _spawns + [
			["ksk_spawn","SOG-Basis","\a3\ui_f\data\map\Markers\NATO\o_unknown.paa"]
			];
		};
		if((["dm"] call EMonkeys_fnc_permLevel) > 0 && !eM_serverSpawn) then
		{
			_spawns = _spawns + [
			["dm_spawn","DM-Basis","\a3\ui_f\data\map\MapControl\watertower_ca.paa"]
			];
		};
		if((["bwa"] call EMonkeys_fnc_permLevel) > 0 && !eM_serverSpawn) then
		{
			_spawns = _spawns + [
			["bwa_spawn","BWA-Basis","\a3\ui_f\data\map\Markers\NATO\o_unknown.paa"]
			];
		};
		
		if(!eM_serverSpawn) then
		{
		
	_spawns = _spawns +	[
			["civ_spawn_1","Kavala","\a3\ui_f\data\map\MapControl\watertower_ca.paa"],
			["civ_spawn_2","Pyrgos","\a3\ui_f\data\map\MapControl\watertower_ca.paa"],
			["civ_spawn_3","Athira","\a3\ui_f\data\map\MapControl\watertower_ca.paa"],
			["civ_spawn_4","Sofia","\a3\ui_f\data\map\MapControl\watertower_ca.paa"]
		];
		
		};
			if(eM_serverSpawn) then
		{
			_spawns = _spawns +	[
			["hospital_spawn_kavala","Krankenhaus Kavala","\a3\ui_f\data\map\MapControl\hospital_ca.paa"],
			["hospital_spawn_athira","Krankenhaus Athira","\a3\ui_f\data\map\MapControl\hospital_ca.paa"],
			["hospital_spawn_sofia","Krankenhaus Sofia","\a3\ui_f\data\map\MapControl\hospital_ca.paa"]
		];
		};
		
	};
	

	case independent: {
	_spawns = _spawns +	[
			["medic_spawn_1","Feuerwehr Hauptwache","\a3\ui_f\data\map\MapControl\hospital_ca.paa"],
			["medic_spawn_2","Krankenhaus Athira","\a3\ui_f\data\map\MapControl\hospital_ca.paa"],
			["medic_spawn_3","Krankenhaus Sofia","\a3\ui_f\data\map\MapControl\hospital_ca.paa"]
		];
	};
};

_spawns;