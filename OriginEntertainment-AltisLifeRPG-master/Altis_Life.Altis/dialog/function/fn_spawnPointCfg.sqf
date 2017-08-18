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
			["cop_spawn_1","W.A | Kavala","icons\policespawn.paa"],
			["cop_spawn_1_1","W.A | Airstrip","icons\policespawn.paa"],
			["jail_spawn","W.A | Airstrip","icons\policespawn.paa"]
		];
	};
	
	case civilian:
          {
 					//If American has a rebel license
					if(license_civ_rebel && playerSide == civilian && license_country1 && !license_country2) then {
                    _return = [
									["civ_spawn_1","W.A | Kavala","icons\civspawn.paa"],
									["civ_spawn_3","W.A | Athira","icons\civspawn.paa"],
									["reb_spawn_3","W.A | Outpost","icons\rebspawn.paa"],
									["reb_spawn_1","S.A | Outpost","icons\rebspawn.paa"]
                                    ];
                    };

 					//If American has no rebel license
					if(!license_civ_rebel && playerSide == civilian && license_country1 && !license_country2) then {
                    _return = [
									["civ_spawn_1","W.A | Kavala","icons\civspawn.paa"],
									["civ_spawn_3","W.A | Athira","icons\civspawn.paa"]
                                    ];
                    };     		

 					//If Canadian has a rebel license
					if(license_civ_rebel && playerSide == civilian && !license_country1 && license_country2) then {
                    _return = [
									["civ_spawn_2","E.A | Pyrgos","icons\civspawn.paa"],
									["civ_spawn_4","E.A | Sofia","icons\civspawn.paa"],
									["reb_spawn_2","E.A Outpost","icons\rebspawn.paa"],
									["reb_spawn_1","S.A Outpost","icons\rebspawn.paa"]
                                    ];
                    };			

 					//If Canadian
					if(!license_civ_rebel && playerSide == civilian && !license_country1 && license_country2) then {
                    _return = [
									["civ_spawn_2","E.A | Pyrgos","icons\civspawn.paa"],
									["civ_spawn_4","E.A | Sofia","icons\civspawn.paa"]
                                    ];
                    };						
                   
					//If civilian has a rebel license but no passport
					if(license_civ_rebel && playerSide == civilian && !license_country1 && !license_country2) then {
                    _return = [
									["civ_spawn_1","W.A | Kavala","icons\civspawn.paa"],
									["civ_spawn_3","W.A | Athira","icons\civspawn.paa"],
									["civ_spawn_2","E.A | Pyrgos","icons\civspawn.paa"],
									["civ_spawn_4","E.A | Sofia","icons\civspawn.paa"],
									["reb_spawn_3","W.A Outpost","icons\rebspawn.paa"],
									["reb_spawn_2","E.A Outpost","icons\rebspawn.paa"],
                                    ["reb_spawn_1","S.A Outpost","icons\rebspawn.paa"]
                                    ];
                    };
					
					//New Spawns
					if(!license_civ_rebel && playerSide == civilian && !license_country1 && !license_country2) then {
                    _return = [
									["civ_spawn_1","W.A | Kavala","icons\civspawn.paa"],
									["civ_spawn_3","W.A | Athira","icons\civspawn.paa"],
									["civ_spawn_2","E.A | Pyrgos","icons\civspawn.paa"],
									["civ_spawn_4","E.A | Sofia","icons\civspawn.paa"]
                                    ];
                    };
					if(count life_houses > 0) then {
					{
					_pos = call compile format["%1",_x select 0];
					_house = nearestBuilding _pos;
					_houseName = getText(configFile >> "CfgVehicles" >> (typeOf _house) >> "displayName");
				
					_return pushBack [format["house_%1",_house getVariable "uid"],_houseName,"icons\homespawn.paa"];
					} foreach life_houses;
				};	   
            };
	
	case independent: {
		_return = [
			["medic_spawn_1","Kavala Hospital","\a3\ui_f\data\map\MapControl\hospital_ca.paa"],
			["medic_spawn_2","Athira Regional","\a3\ui_f\data\map\MapControl\hospital_ca.paa"],
			["medic_spawn_3","Pygros Hospital","\a3\ui_f\data\map\MapControl\hospital_ca.paa"]
		];
	};
	
	case east: 
	{
		_return = [
			["cop_spawn_4_1","E.A | Sofia DP","icons\policespawn.paa"],
			["cop_spawn_2","E.A | Pyrgos DP","icons\policespawn.paa"]
		];
	};
};

_return;