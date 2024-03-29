/*
*    Format:
*        licenses: ARRAY (This is for limiting spawn to certain things)
*           0: License Name
*           1: License Check Type
*                false: If license isn't set
*                1: If license is set
*           Example:
*                licenses[] = { { "pilot", 1 }, { "rebel", false } }; //Shows up for players with pilot and without rebel license.
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
    class Civilian {
        class Kavala {
            displayName = "Kavala";
            spawnMarker = "civ_spawn_1";
            icon = "\a3\ui_f\data\map\MapControl\watertower_ca.paa";
            licenses[] = { { "", 1 } };
            level[] = { "", "", -1 };
        };

        class Athira {
            displayName = "Athira";
            spawnMarker = "civ_spawn_3";
            icon = "\a3\ui_f\data\map\MapControl\watertower_ca.paa";
            licenses[] = { { "", 1 } };
            level[] = { "", "", -1 };
        };

        class Pyrgos {
            displayName = "Pyrgos";
            spawnMarker = "civ_spawn_2";
            icon = "\a3\ui_f\data\map\MapControl\watertower_ca.paa";
            licenses[] = { { "", 1 } };
            level[] = { "", "", -1 };
        };

        class Sofia {
            displayName = "Sofia";
            spawnMarker = "civ_spawn_4";
            icon = "\a3\ui_f\data\map\MapControl\watertower_ca.paa";
            licenses[] = { { "", 1 } };
            level[] = { "", "", -1 };
        };

        class Zaros {
            displayName = "Zaros";
            spawnMarker = "civ_spawn_5";
            icon = "\a3\ui_f\data\map\MapControl\watertower_ca.paa";
            licenses[] = { { "", 1} };
            level[] = { "", "", -1 };
        };

        class RebelN {
            displayName = "Rebel Outpost";
            spawnMarker = "Rebelop_1";
            icon = "\a3\ui_f\data\map\MapControl\bunker_ca.paa";
            licenses[] = { { "advrebel", 1 } };
            level[] = { "", "", -1 };
        };
		
		class RebelG {
            displayName = "Rebel HQ";
            spawnMarker = "rebelo";
            icon = "\a3\ui_f\data\map\MapControl\bunker_ca.paa";
            licenses[] = { { "advrebel", 1 } };
            level[] = { "", "", -1 };
        };
				
    };

    class Cop {
        class Kavala {
            displayName = "Kavala HQ";
            spawnMarker = "cop_spawn_1";
            icon = "\a3\ui_f\data\map\MapControl\watertower_ca.paa";
            licenses[] = { { "", 1 } };
            level[] = { "", "", -1 };
        };

        class Athira {
            displayName = "Athira HQ";
            spawnMarker = "cop_spawn_3";
            icon = "\a3\ui_f\data\map\MapControl\watertower_ca.paa";
            licenses[] = { { "", 1 } };
            level[] = { "", "", -1 };
        };

        class Pyrgos {
            displayName = "Training Ground";
            spawnMarker = "cop_spawn_2";
            icon = "\a3\ui_f\data\map\MapControl\watertower_ca.paa";
            licenses[] = { { "", 1 } };
            level[] = { "", "", -1 };
        };
    };

    class Medic {
        class Kavala {
            displayName = "Kavala Hospital";
            spawnMarker = "medic_spawn_1";
            icon = "\a3\ui_f\data\map\MapControl\hospital_ca.paa";
            licenses[] = { { "", 1 } };
            level[] = { "", "", -1 };
        };

        class Athira {
            displayName = "Athira Regional";
            spawnMarker = "medic_spawn_2";
            icon = "\a3\ui_f\data\map\MapControl\hospital_ca.paa";
            licenses[] = { { "", 1 } };
            level[] = { "", "", -1 };
        };
/*
        class Pyrgos {
            displayName = "Pyrgos Hospital";
            spawnMarker = "medic_spawn_3";
            icon = "\a3\ui_f\data\map\MapControl\hospital_ca.paa";
            licenses[] = { { "", 1 } };
            level[] = { "", "", -1 };

        };
        */
    };
};
