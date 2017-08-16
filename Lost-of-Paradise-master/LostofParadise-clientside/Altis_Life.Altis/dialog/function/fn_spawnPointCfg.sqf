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
	case west: //Polizei
	{
		_return = [
			["cop_spawn_1","Kavala HQ","\a3\ui_f\data\map\MapControl\watertower_ca.paa"],
			["cop_spawn_2","Pyrgos HQ","\a3\ui_f\data\map\MapControl\fuelstation_ca.paa"],
			["cop_spawn_3","Athira HQ","\a3\ui_f\data\map\GroupIcons\badge_rotate_0_gs.paa"],
			["cop_spawn_6","Air HQ","\a3\ui_f\data\map\GroupIcons\badge_rotate_0_gs.paa"],
			["cop_spawn_5","Sofia Checkpoint","\a3\ui_f\data\map\Markers\NATO\b_air.paa"],
			["chop_shop_2","Staatsgefängnis","\a3\ui_f\data\map\Markers\NATO\b_air.paa"],
			["bhc_spawn","BHC Base","\a3\ui_f\data\map\Markers\NATO\b_air.paa"]
		];
	};
	
	case independent: //Sanitäter
	{
		_return = [
			["medic_spawn_zen","Zentrale ARS","\a3\ui_f\data\map\MapControl\hospital_ca.paa"],
			["medic_spawn_1","Kavala ARS","\a3\ui_f\data\map\MapControl\hospital_ca.paa"]
		];
	};
	
	case civilian: //Zivilisten
	{
		_return = [
			["civ_spawn_1","Kavala","\a3\ui_f\data\map\MapControl\watertower_ca.paa"],
			["civ_spawn_2","Pyrgos","\a3\ui_f\data\map\MapControl\watertower_ca.paa"],
			["civ_spawn_3","Athira","\a3\ui_f\data\map\MapControl\watertower_ca.paa"],
			["civ_spawn_4","Sofia","\a3\ui_f\data\map\MapControl\watertower_ca.paa"],
			["civ_spawn_5","Flughafen","\a3\ui_f\data\map\MapControl\watertower_ca.paa"]
			//["Kart_Bahn_Spawn","Kartbahn","\a3\ui_f\data\map\MapControl\watertower_ca.paa"]
		];
				if(license_civ_rebel) then {
			_return = _return + [
			["rebel_spawn","Reb. Lager","\a3\ui_f\data\map\MapControl\watertower_ca.paa"],
			["Rebelop_Spawn","Reb. Aussenposten","\a3\ui_f\data\map\MapControl\watertower_ca.paa"]
			];
		};
		
				if(license_civ_bhc) then {
			_return = _return + [["bhc_spawn","BHC HQ","\a3\ui_f\data\map\MapControl\watertower_ca.paa"]];
		};
		
				if(license_civ_kartell) then {
			_return = _return + [["kartell_spawn","Kartell HQ","\a3\ui_f\data\map\MapControl\watertower_ca.paa"]];
		};
		
				if(license_civ_leer) then {
			_return = _return + [["ar_spawn","AR HQ","\a3\ui_f\data\map\MapControl\watertower_ca.paa"]];
		};
		
				if(license_civ_ssg) then {
			_return = _return + [["ssg_spawn","SSG HQ","\a3\ui_f\data\map\MapControl\watertower_ca.paa"]];
		};
		
				if(license_civ_x) then {
			_return = _return + [["x_spawn","eXecute HQ","\a3\ui_f\data\map\MapControl\watertower_ca.paa"]];
		};
		
		//		if(license_civ_kartell) then {
		//	_return = _return + [["kartell_spawn","Ombra HQ","\a3\ui_f\data\map\MapControl\watertower_ca.paa"]];
		//};
		
				if(license_civ_dm) then {
			_return = _return + [["dm_spawn","Dithmarscher HQ","\a3\ui_f\data\map\MapControl\watertower_ca.paa"]];
		};
		
				if(license_civ_donator1) then {
			_return = _return + [["donator","VIP Shop","\a3\ui_f\data\map\MapControl\watertower_ca.paa"]];
		};
		
				if(license_civ_presse) then {
			_return = _return + [["presse_car_spawn","Kirche","\a3\ui_f\data\map\MapControl\watertower_ca.paa"]];
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
};

_return;