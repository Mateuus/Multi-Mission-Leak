/*
	File: fn_spawnPointCfg.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Master configuration for available spawn points depending on the units side.

	Return:
	[Spawn Marker,Spawn Name,Image Path]
*/
private["_side","_ret","_housespawnpos","_housecount","_houseName","_pos","_marker","_house"];
_side = param [0,civilian,[civilian]];
_ret = [];
_housespawns = [];
//if ((((player getVariable ["LHM_Donatorlevel","0"])) > 0)) then {
	_housespawnpos = player getVariable ["LHM_HousingSpawns",[]];
	_housecount = 0;
	{
		_housecount = _housecount + 1;
		_pos = _x;
		//_house = nearestBuilding _pos;

		_marker = createMarkerLocal [format["house_%1",_housecount],_pos];
		//_houseName = getText(configFile >> "CfgVehicles" >> (typeOf _house) >> "displayName");
		//_marker setMarkerTextLocal _houseName;
		//_marker setMarkerColorLocal "ColorBlue";
		//_marker setMarkerTypeLocal "loc_Lighthouse";

		_housespawns pushback [(format["house_%1",_housecount]),(format["Haus %1",_housecount]),"\a3\ui_f\data\map\MapControl\custommark_ca.paa"];
	} foreach _housespawnpos;
//};
//Spawn Marker, Spawn Name, PathToImage
switch (_side) do
{
	case west:
	{
		_ret = [
					["cop_spawn_1","Kavala HQ","\a3\ui_f\data\map\MapControl\watertower_ca.paa"],
					["cop_spawn_2","Pyrgos HQ","\a3\ui_f\data\map\MapControl\fuelstation_ca.paa"],
					["cop_spawn_3","Athira HQ","\a3\ui_f\data\map\GroupIcons\badge_rotate_0_gs.paa"],
					["cop_spawn_6","Neochori HQ","\a3\ui_f\data\map\GroupIcons\badge_rotate_0_gs.paa"], // neu
					["cop_spawn_4","Air HQ","\a3\ui_f\data\map\Markers\NATO\b_air.paa"],
					["cop_spawn_7","HWP","\a3\ui_f\data\map\Markers\NATO\b_air.paa"],
					["cop_spawn_5","BP North","\a3\ui_f\data\map\GroupIcons\badge_rotate_0_gs.paa"]
				]  + _housespawns;
	};

	case civilian:
	{
		_ret = [
					["civ_spawn_1","Kavala","\a3\ui_f\data\map\MapControl\watertower_ca.paa"],
					["civ_spawn_5","Neochori","\a3\ui_f\data\map\MapControl\watertower_ca.paa"], // neu
					["civ_spawn_2","Pyrgos","\a3\ui_f\data\map\MapControl\watertower_ca.paa"],
					["civ_spawn_3","Athira","\a3\ui_f\data\map\MapControl\watertower_ca.paa"],
					["civ_spawn_4","Sofia","\a3\ui_f\data\map\MapControl\watertower_ca.paa"]
				]  + _housespawns;
	};

	case independent: {
		_ret = [
					["medic_spawn_1","Kavala Hospital","\a3\ui_f\data\map\MapControl\hospital_ca.paa"],
					["medic_spawn_2","Athira Regional","\a3\ui_f\data\map\MapControl\hospital_ca.paa"],
					["medic_spawn_3","Pygros Hospital","\a3\ui_f\data\map\MapControl\hospital_ca.paa"],
					["medic_spawn_4","Sofia Station","\a3\ui_f\data\map\MapControl\hospital_ca.paa"], // LHM
					["medic_spawn_5","Neochori Station","\a3\ui_f\data\map\MapControl\hospital_ca.paa"] // neu
				]  + _housespawns;
	};

	case east: {
		_ret =	[
					["sec_spawn_1","Security HQ Athira","\a3\ui_f\data\map\MapControl\watertower_ca.paa"], // security
					["sec_spawn_2","Security HQ Kavala","\a3\ui_f\data\map\MapControl\watertower_ca.paa"]
				];
	};

};

_ret