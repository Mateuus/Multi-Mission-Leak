/*
*    Format:
*        licenses[]s: ARRAY (This is for limiting spawn to certain things)
*           0: licenses[] Name
*           1: licenses[] Check Type
*                false: If licenses[] isn't set
*                true: If licenses[] is set
*           Example:
*                licenses[] = { { "pilot", true }, { "rebel", false } }; //Shows up for players with pilot and without rebel licenses[].
*
*        level: ARRAY (This is for limiting spawn to certain things)
*            0: Variable to read from
*            1: Variable Value Type (SCALAR / BOOL / EQUAL / INVERSE)
*                SCALAR: VALUE => VALUE
*                BOOL: VALUE EXISTS
*                EQUAL: VALUE == VALUE
*                INVERSE: VALUE <= VALUE
*            2: What to compare to (-1 = Check Disabled)
*
*/
class CfgSpawnPoints {

    class Altis {
        class Civilian {
            class Kavala {
                displayName = "Kavala";
                spawnMarker = "civ_spawn_1";
                icon = "\a3\ui_f\data\map\MapControl\watertower_ca.paa";
                licenses[] = {};
            };

            class Athira {
                displayName = "Athira";
                spawnMarker = "civ_spawn_3";
                icon = "\a3\ui_f\data\map\MapControl\watertower_ca.paa";
                licenses[] = {};
            };

            class Sofia {
                displayName = "Sofia";
                spawnMarker = "civ_spawn_4";
                icon = "\a3\ui_f\data\map\MapControl\watertower_ca.paa";
                licenses[] = {};
            };
			
			class Flughafen {
                displayName = "Flughafen";
                spawnMarker = "civ_spawn_2";
                icon = "\a3\ui_f\data\map\MapControl\watertower_ca.paa";
                licenses[] = {};
            };
			
			class Neureich {
                displayName = "Neureichen Shop";
                spawnMarker = "neureichspawn_1";
                icon = "\a3\ui_f\data\map\MapControl\watertower_ca.paa";
                licenses[] = {"neureich", true};
            };
			
            class RebelN {
                displayName = "Rebellenaußenposten Nord";
                spawnMarker = "reb_spawn_2";
                icon = "\a3\ui_f\data\map\MapControl\bunker_ca.paa";
                licenses[] = {"rebel", true};
				
            };

            class RebelHQ {
                displayName = "Rebellen HQ";
                spawnMarker = "reb_spawn_1";
                icon = "\a3\ui_f\data\map\MapControl\bunker_ca.paa";
                licenses[] = {"rebel", true};
				
            };

			class lafamilia {
                displayName = "LaFamilia Base";
                spawnMarker = "lafamilia_spawn";
                icon = "\a3\ui_f\data\map\MapControl\bunker_ca.paa";
                licenses[] = {"lafamilia", true};
            };

			class sa5 {
                displayName = "SA-5 Base";
                spawnMarker = "sa5_spawn";
                icon = "\a3\ui_f\data\map\MapControl\bunker_ca.paa";
                licenses[] = {"sa5", true};
            };
        };

        class Cop {
            class Kavala {
                displayName = "Kavala HQ";
                spawnMarker = "cop_spawn_1";
                icon = "\a3\ui_f\data\map\MapControl\watertower_ca.paa";
                licenses[] = {};
				
            };

            class Athira {
                displayName = "Luftwache";
                spawnMarker = "cop_spawn_athira_1";
                icon = "\a3\ui_f\data\map\MapControl\fuelstation_ca.paa";
                licenses[] = {};
				
            };

            class Sofia {
                displayName = "Sofia HQ";
                spawnMarker = "cop_spawn_Sofia";
                icon = "\a3\ui_f\data\map\GroupIcons\badge_rotate_0_gs.paa";
                licenses[] = {};
				
            };

            class apds {
                displayName = "APD Süd";
                spawnMarker = "cop_spawn_chalkeia";
                icon = "\a3\ui_f\data\map\Markers\NATO\b_air.paa";
				licenses[] = {};
            };

            class aus {
                displayName = "Ausbildungs Zentrum";
                spawnMarker = "cop_spawn_ausbildung";
                icon = "\a3\ui_f\data\map\GroupIcons\badge_rotate_0_gs.paa";
				licenses[] = {};
            };
        };

        class Medic {
            class Kavala {
                displayName = "Kavala Hospital";
                spawnMarker = "medic_spawn_1";
                icon = "\a3\ui_f\data\map\MapControl\hospital_ca.paa";
                licenses[] = {};
            };

            class Athira {
                displayName = "Neochori Hospital";
                spawnMarker = "medic_spawn_2";
                icon = "\a3\ui_f\data\map\MapControl\hospital_ca.paa";
                licenses[] = {};
            };

            class Pyrgos {
                displayName = "Pyrgos Hospital";
                spawnMarker = "medic_spawn_3";
                icon = "\a3\ui_f\data\map\MapControl\hospital_ca.paa";
                licenses[] = {};
            };
			
            class Sofia {
                displayName = "Sofia Hospital";
                spawnMarker = "medic_spawn_4";
                icon = "\a3\ui_f\data\map\MapControl\hospital_ca.paa";
                licenses[] = {};
            };
        };
		class Imperium {
			class Athira {
                displayName = "Athira";
                spawnMarker = "civ_spawn_3";
                icon = "\a3\ui_f\data\map\MapControl\watertower_ca.paa";
                licenses[] = {};
            };

            class Sofia {
                displayName = "Sofia";
                spawnMarker = "civ_spawn_4";
                icon = "\a3\ui_f\data\map\MapControl\watertower_ca.paa";
                licenses[] = {};
            };
			
			class Flughafen {
                displayName = "Flughafen";
                spawnMarker = "civ_spawn_2";
                icon = "\a3\ui_f\data\map\MapControl\watertower_ca.paa";
                licenses[] = {};
            };
			
			class Neureich {
                displayName = "Neureichen Shop";
                spawnMarker = "neureichspawn_1";
                icon = "\a3\ui_f\data\map\MapControl\watertower_ca.paa";
                licenses[] = {"neureich", true};
            };
			
            class RebelN {
                displayName = "Rebellenaußenposten Nord";
                spawnMarker = "reb_spawn_2";
                icon = "\a3\ui_f\data\map\MapControl\bunker_ca.paa";
                licenses[] = {"rebel", true};
				
            };

            class RebelHQ {
                displayName = "Rebellen HQ";
                spawnMarker = "reb_spawn_1";
                icon = "\a3\ui_f\data\map\MapControl\bunker_ca.paa";
                licenses[] = {"rebel", true};
				
            };
		};
    };
};