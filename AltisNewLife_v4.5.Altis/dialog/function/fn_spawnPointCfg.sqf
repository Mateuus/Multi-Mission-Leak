#include <macro.h>
#define IMG "\a3\ui_f\data\map\MapControl\watertower_ca.paa"
#define IMG2 "\a3\ui_f\data\map\GroupIcons\badge_rotate_0_gs.paa"
private["_side","_return"];
_side = [_this,0,civilian,[civilian]] call BIS_fnc_param;
switch (_side) do {
	case west:
	{
	_return = [
			["cop_spawn_1","Gendarmerie de Kavala",IMG],
			["cop_spawn_6","Gendarmerie d'Athira",IMG],
			["cop_spawn_5","Poste frontière",IMG],
			["cop_spawn_2","Garde-côtes",IMG],
			["taxi_spawn_camp","Camp d'Entrainement",IMG2],
			["spawn_gign","QG GIGN",IMG2]
		];
		//if(licop_swat) then {
		//_return = _return + [["spawn_gign","QG GIGN",IMG2]];
		//};	
	};
	case civilian:
	{
		_return = [
					["civ_spawn_1","Kavala",IMG],
					["civ_spawn_3","Athira",IMG],
					["civ_spawn_6","Rodopoli",IMG],
					["civ_spawn_5","Pyrgos",IMG],
				    ["spawn_casino","Casino","\a3\ui_f\data\map\Markers\NATO\b_air.paa"],
					["civ_spawn_reb","Sofia [Ville Rebelle]",IMG2],
					["taxi_spawn_camp","Camp d'Entrainement",IMG2]
				];				
		//if(liciv_rebel) then {
		//_return = _return + [["civ_spawn_reb","Sofia [Ville Rebelle]",IMG2]];
		//_return = _return + [["taxi_spawn_camp","Camp d'Entrainement",IMG2]];
		//};
		if(GETC(life_reblevel) > 0) then {
			switch (GETC(life_reblevel)) do
			{
				case 1: {_return = _return + [["spawn_gang1","QG de la Famille",IMG2]];};
				case 2: {_return = _return + [["spawn_gang2","QG de la Famille",IMG2]];};
				case 3: {_return = _return + [["spawn_gang3","QG de la Famille",IMG2]];};
				case 4: {_return = _return + [["spawn_gang4","QG de la Famille",IMG2]];};
				case 5: {_return = _return + [["spawn_gang5","QG de la Famille",IMG2]];};
				case 6: {_return = _return + [["spawn_gang6","QG de la Famille",IMG2]];};
				case 7: {_return = _return + [["spawn_gang7","QG de la Famille",IMG2]];};
				case 8: {_return = _return + [["spawn_gang8","QG de la Famille",IMG2]];};
				case 9: {_return = _return + [["spawn_gang9","QG de la Famille",IMG2]];};
				case 10: {_return = _return + [["spawn_gang10","QG de la Famille",IMG2]];};
				case 11: {_return = _return + [["spawn_gang11","QG de la Famille",IMG2]];};
				case 12: {_return = _return + [["spawn_gang12","QG de la Famille",IMG2]];};
				case 13: {_return = _return + [["spawn_gang13","QG des Mercenaires",IMG2]];};				
				case 14: {_return = _return + [["spawn_gang14","QG des Mercenaires",IMG2]];};				
			};
		};
		if(GETC(life_tafflevel) > 0) then {
			switch (GETC(life_tafflevel)) do
			{
				case 1: {_return = _return + [["spawn_taff1","Entreprise transport","\a3\ui_f\data\map\MapControl\fuelstation_ca.paa"]];};
				case 2: {_return = _return + [["spawn_taff2","Entreprise dépanneur",IMG]];};
				case 3: {_return = _return + [["spawn_taff3","Chasseur de prime",IMG]];};		
				case 4: {_return = _return + [["spawn_taff4","Cabinet d'avocat",IMG]];};
				case 5: {_return = _return + [["spawn_taff5","Auto-école",IMG]];};	
				case 6: {_return = _return + [["spawn_taff6","Marchand d'armes",IMG]];};		
				case 7: {_return = _return + [["spawn_taff7","Journaliste BFM",IMG]];};		
				case 8: {_return = _return + [["spawn_taff8","Convoyeur de fond",IMG]];};							
			};
		};		
		if(GETC(life_donator) > 0) then {
			_return = _return + [["spawn_don","Neochori [V.I.P]",IMG]];
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
	case independent:
	{
		_return = [
			["medic_spawn_1","Hopital de Kavala","\a3\ui_f\data\map\MapControl\hospital_ca.paa"],
			["medic_spawn_2","Hopital de la Douane","\a3\ui_f\data\map\MapControl\hospital_ca.paa"],
			["medic_spawn_3","Hopital de Pyrgos","\a3\ui_f\data\map\MapControl\hospital_ca.paa"],
			["spawn_casino","Casino","\a3\ui_f\data\map\Markers\NATO\b_air.paa"],
			["taxi_spawn_camp","Camp Entrainement",IMG2]	
		];
	};
	case east: {
		_return = [
			["spawn_adac_kavala","Mairie Kavala",IMG],
			["civ_spawn_3","Athira",IMG],
			["cop_spawn_5","Douane",IMG],
			["cop_spawn_2","Garde cotes",IMG],
			["medic_spawn_3","Pyrgos","\a3\ui_f\data\map\MapControl\hospital_ca.paa"],
			["civ_spawn_6","Rodopoli",IMG],
			["civ_spawn_reb","Sofia",IMG],
			["taxi_spawn_camp","Camp Entrainement",IMG2]
		];
	};
};
_return;
#undef IMG
#undef IMG2