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
		_return = [
			["cop_harcourt","TPD Zentrale",""],
			["cop_georgetown","TPD Georgetown",""],
			["cop_north","TPD Nord",""],
			["cop_checkpointecho","Checkpoint Echo",""],
			["cop_rautake","TPD Rautake",""],
			["cop_bunker","Bunker",""]
		];
	};
	
	case civilian:
	{
		_return = [
			["marktplatz_spawn","Marktplatz","\a3\ui_f\data\map\MapControl\watertower_ca.paa"],
			["civ_spawn_lijnhafen","Lijnhaven","\a3\ui_f\data\map\MapControl\watertower_ca.paa"],
			["civ_spawn_georgetown","Regina","\a3\ui_f\data\map\MapControl\watertower_ca.paa"],
			["civ_spawn_larochelle","La Rochelle","\a3\ui_f\data\map\MapControl\watertower_ca.paa"],
			["civ_spawn_oumere","Ouméré","\a3\ui_f\data\map\MapControl\watertower_ca.paa"]
			
		];
		
		if(license_civ_rebel || license_civ_air) then
		{
			_return = _return + [
				["bala_airstrip","Bala Airstrip","\a3\ui_f\data\map\Markers\NATO\b_air.paa"],
				["tanoa_intl_airport","Tanoa Intl","\a3\ui_f\data\map\Markers\NATO\b_air.paa"]
			];
		};
		
		if(license_civ_rebel) then
		{
			_return = _return + [
				["reb_spawn_1","Rebellen HQ","\a3\ui_f\data\map\MapControl\watertower_ca.paa"],
				["reb_spawn_2","Außenposten","\a3\ui_f\data\map\MapControl\watertower_ca.paa"]
			];
		};
		
		switch (life_gangData select 0) do
		{			

			case 398:	//QuerTransport
			{
				_return = _return + [["spawn_qt","QuerTransport",""]];
			};
			
		};
		
		if(count life_houses > 0) then {
			{
				_pos = call compile format["%1",_x select 0];
				_house = (nearestObject [_pos, "Building"]);
				_houseName = getText(configFile >> "CfgVehicles" >> (typeOf _house) >> "displayName");
				
				_return set[count _return,[format["house_%1",_house getVariable "uid"],_houseName,"\a3\ui_f\data\map\MapControl\lighthouse_ca.paa"]];
			} foreach life_houses;
		};	
	};
	
	case independent: {
		_return = [
			["medic_spawn_3","Lijnhaven","\a3\ui_f\data\map\MapControl\hospital_ca.paa"],
			["medic_spawn_1","Georgetown","\a3\ui_f\data\map\MapControl\hospital_ca.paa"],
			["medic_spawn_2","Harcourt","\a3\ui_f\data\map\MapControl\hospital_ca.paa"]
		];
	};
	
	case east: {
        _return = [
			["imp_spawn_1","Imperium 1",""],
			["imp_spawn_2","Imperium 2",""],
			["reb_spawn_1","Rebellen HQ",""],
			["reb_spawn_2","Reb-Außenposten",""],
			["civ_spawn_georgetown","Georgetown","\a3\ui_f\data\map\MapControl\watertower_ca.paa"],
			["civ_spawn_larochelle","La Rochelle","\a3\ui_f\data\map\MapControl\watertower_ca.paa"],
			["civ_spawn_oumere","Ouméré","\a3\ui_f\data\map\MapControl\watertower_ca.paa"],
			["civ_spawn_lijnhafen","Lijnhaven","\a3\ui_f\data\map\MapControl\watertower_ca.paa"],
			["bala_airstrip","Bala Airstrip","\a3\ui_f\data\map\Markers\NATO\b_air.paa"],
			["tanoa_intl_airport","Tanoa Intl","\a3\ui_f\data\map\Markers\NATO\b_air.paa"]
        ];
    };
};

_return;