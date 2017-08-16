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
		_return = [
			["cop_spawn_1","Georgetown HQ","\a3\ui_f\data\map\MapControl\watertower_ca.paa"],
			["cop_spawn_2","La Rochelle HQ","\a3\ui_f\data\map\MapControl\watertower_ca.paa"],
			["cop_spawn_3","Lijnhaven HQ","\a3\ui_f\data\map\Markers\NATO\watertower_ca.paa"],
			["cop_spawn_4","Air HQ","\a3\ui_f\data\map\GroupIcons\badge_rotate_0_gs.paa"],
			["cop_spawn_5","Küstenwache","\a3\ui_f\data\map\GroupIcons\badge_rotate_0_gs.paa"]
		];
	};
	
	case civilian:
	{
		_return = [];
		if(license_civ_einwohner) then 
		{
			_return = _return + [
				["civ_spawn_2","Katkoula","\a3\ui_f\data\map\MapControl\watertower_ca.paa"]
			];
		};
		if(license_civ_georgetown) then 
		{
			_return = _return + [
				["civ_spawn_3","Georgetown","\a3\ui_f\data\map\MapControl\watertower_ca.paa"]
			];
		};
		if(license_civ_rochelle) then 
		{
			_return = _return + [
				["civ_spawn_4","La Rochelle","\a3\ui_f\data\map\MapControl\watertower_ca.paa"]
			];
		};
		if(license_civ_oumere) then 
		{
			_return = _return + [
				["civ_spawn_5","Ouméré","\a3\ui_f\data\map\MapControl\watertower_ca.paa"]
			];
		};
		if(license_civ_lijnhaven) then 
		{
			_return = _return + [
				["civ_spawn_6","Lijnhaven","\a3\ui_f\data\map\MapControl\watertower_ca.paa"]
			];
		};

		if(license_civ_rebel) then 
		{
			_return = _return + [
				["reb_spawn_1","Rebellen Stadt","\a3\ui_f\data\map\MapControl\watertower_ca.paa"],
				["reb_spawn_2","Rebellen Flughafen","\a3\ui_f\data\map\MapControl\watertower_ca.paa"],
				["reb_spawn_3","Rebellen Schießplatz","\a3\ui_f\data\map\MapControl\watertower_ca.paa"],
				["reb_spawn_4","Rebellen Fahrschule","\a3\ui_f\data\map\MapControl\watertower_ca.paa"]
			];
		};

		if(license_civ_sgt) then 
		{
			_return = _return + [
				["sgt_spawn","Schutzgruppe Tango Basis","\a3\ui_f\data\map\GroupIcons\badge_rotate_0_gs.paa"]
			];
		};
		
		if(count life_houses > 0) then {
			{
				_pos = call compile format["%1",_x select 0];
				_house = nearestBuilding _pos;
				_houseName = getText(configFile >> "CfgVehicles" >> (typeOf _house) >> "displayName");
				
				_return pushBack [format["house_%1",_house getVariable "uid"],_houseName,"\a3\ui_f\data\map\MapControl\lighthouse_ca.paa"];
			} foreach life_houses;
		};
	};
	
	case independent: {
		_return = [
			["thw_spawn_1","Georgetown HQ","\a3\ui_f\data\map\MapControl\hospital_ca.paa"],
			["thw_spawn_2","La Rochelle HQ","\a3\ui_f\data\map\MapControl\hospital_ca.paa"],
			["thw_spawn_4","Lijnhaven HQ","\a3\ui_f\data\map\MapControl\hospital_ca.paa"],
			["thw_spawn_3","Air HQ","\a3\ui_f\data\map\MapControl\hospital_ca.paa"],
			["thw_spawn_5","Katkoula HQ","\a3\ui_f\data\map\MapControl\hospital_ca.paa"]
		];
	};
};

_return;