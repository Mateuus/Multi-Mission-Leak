#include "..\script_macros.hpp"
private["_side","_return","_gang"];
_side = [_this,0,civilian,[civilian]] call BIS_fnc_param;
_gang = 0;

switch (_side) do
{
	case west:
	{
	_return = [
	["cop_spawn_1","Kavala","\a3\ui_f\data\map\MapControl\watertower_ca.paa"],
	["cop_spawn_2","Pyrgos","\a3\ui_f\data\map\MapControl\watertower_ca.paa"],
	["cop_spawn_3","Athira","\a3\ui_f\data\map\MapControl\watertower_ca.paa"],
	["cop_spawn_4","Base aérienne","\a3\ui_f\data\map\Markers\NATO\b_air.paa"],
	["cop_spawn_6","Zone de contrôle","\a3\ui_f\data\map\Markers\NATO\b_air.paa"],
	["cop_spawn_5","Douane","\a3\ui_f\data\map\Markers\NATO\b_air.paa"]
	];
};

case civilian:
{
	_gang = life_gangData select 0;
	if(isNil "_gang") then {
		_gang = 0;
	};

	_return = [
	["civ_spawn_1","Kavala","\a3\ui_f\data\map\MapControl\watertower_ca.paa"],
	["civ_spawn_2","Pyrgos","\a3\ui_f\data\map\MapControl\watertower_ca.paa"],
	["civ_spawn_3","Athira","\a3\ui_f\data\map\MapControl\watertower_ca.paa"],
	["civ_spawn_4","Sofia","\a3\ui_f\data\map\MapControl\watertower_ca.paa"],
	["civ_spawn_5","Rodopoli","\a3\ui_f\data\map\MapControl\watertower_ca.paa"]
	];

	if(life_job > 0) then {
		_return = _return + [
		["adac_spawn","Dépannage","\a3\ui_f\data\map\Markers\NATO\b_air.paa"],
		["adac_spawn_2","Dépannage Est","\a3\ui_f\data\map\Markers\NATO\b_air.paa"]
		];
	};

	if(license_civ_LAT) then {
		_return = _return + [["LAT_spawn_1","Entreprise LAT","\a3\ui_f\data\map\MapControl\watertower_ca.paa"]];
	};

	if(license_civ_BIR) then {
		_return = _return + [["cop_spawn_1","QG Kavala","\a3\ui_f\data\map\MapControl\watertower_ca.paa"]];
		_return = _return + [["cop_spawn_3","QG Athira","\a3\ui_f\data\map\MapControl\watertower_ca.paa"]];
	};

	_return = _return + [["spawn_casino","Aéroport","\a3\ui_f\data\map\Markers\NATO\b_air.paa"]];

	if(license_civ_rebel) then {
		_return = _return + [["reb_spawn","Camp Rebelle","\a3\ui_f\data\map\GroupIcons\badge_rotate_0_gs.paa"]];
	};

		if(_gang == 1852) then { // GIRA
			_return = _return + [["spawn_gang_1","QG de la famille","\a3\ui_f\data\map\GroupIcons\badge_rotate_0_gs.paa"]];
		};

		if(_gang == 1764) then { // The Wolfs
			_return = _return + [["spawn_gang_2","QG de la famille","\a3\ui_f\data\map\GroupIcons\badge_rotate_0_gs.paa"]];
		}; 

		if(_gang == 1815) then { // AMA
		_return = _return + [["spawn_gang_3","QG de la famille","\a3\ui_f\data\map\GroupIcons\badge_rotate_0_gs.paa"]];
		};

		if(_gang == 1604) then { // SCU
		_return = _return + [["spawn_gang_4","QG de la famille","\a3\ui_f\data\map\GroupIcons\badge_rotate_0_gs.paa"]];
		};

		/*if(_gang == ?) then { // ?
			_return = _return + [["spawn_gang_5","QG de la famille","\a3\ui_f\data\map\GroupIcons\badge_rotate_0_gs.paa"]];
		}; */

		/*if(_gang == ?) then { // ?
			_return = _return + [["spawn_gang_6","QG de la famille","\a3\ui_f\data\map\GroupIcons\badge_rotate_0_gs.paa"]];
		};*/

		if(_gang == 1759) then { // TS
			_return = _return + [["spawn_gang_7","QG de la famille","\a3\ui_f\data\map\GroupIcons\badge_rotate_0_gs.paa"]];
		};

		/*if(_gang == ?) then { // ?
		_return = _return + [["spawn_gang_8","QG de la famille","\a3\ui_f\data\map\GroupIcons\badge_rotate_0_gs.paa"]];
		};*/

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
["medic_spawn_1","Kavala","\a3\ui_f\data\map\MapControl\hospital_ca.paa"],
["medic_spawn_2","Athira","\a3\ui_f\data\map\MapControl\hospital_ca.paa"],
["medic_spawn_3","Pyrgos","\a3\ui_f\data\map\MapControl\hospital_ca.paa"]
];
};

	case east: {
		_return = [
			["armer_spawn","Camp de l'armée","\a3\ui_f\data\map\MapControl\watertower_ca.paa"]
		];
	};

};

_return;
