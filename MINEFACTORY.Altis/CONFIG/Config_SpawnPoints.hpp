/*
*    Format:
*        license: ARRAY (This is for limiting spawn to certain things)
*           0: License Name
*           1: License Check Type
*                false: If license isn't set
*                true: If license is set
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
            icon = "MINEFACTORY\icons\civ_spawn.paa";
            license[] = { "", true };
            level[] = { "", "", -1 };
        };

        class Athira {
            displayName = "Athira";
            spawnMarker = "civ_spawn_3";
            icon = "MINEFACTORY\icons\civ_spawn.paa";
            license[] = { "", true };
            level[] = { "", "", -1 };
        };

        class Pyrgos {
            displayName = "Pyrgos";
            spawnMarker = "civ_spawn_2";
            icon = "MINEFACTORY\icons\civ_spawn.paa";
            license[] = { "", true };
            level[] = { "", "", -1 };
        };

        class Sofia {
            displayName = "Sofia";
            spawnMarker = "civ_spawn_4";
            icon = "MINEFACTORY\icons\civ_spawn.paa";
            license[] = { "", true };
            level[] = { "", "", -1 };
        };
		
		class flugfeld {
            displayName = "Flugfeld";
            spawnMarker = "civ_spawn_6";
            icon = "MINEFACTORY\icons\civ_spawn.paa";
            license[] = { "", true };
            level[] = { "", "", -1 };
        };

        class RebelS {
            displayName = "RebellenHQ1";
            spawnMarker = "civ_spawn_5";
            icon = "MINEFACTORY\icons\rebell_spawn.paa";
            license[] = { "rebel", true };
            level[] = { "", "", -1 };
        };

        class RebelN {
            displayName = "RebellenHQ2";
            spawnMarker = "civ_spawn_7";
            icon = "MINEFACTORY\icons\rebell_spawn.paa";
            license[] = { "rebel", true };
            level[] = { "", "", -1 };
        };

        class RebelE {
            displayName = "RebellenHQ3";
            spawnMarker = "civ_spawn_9";
            icon = "MINEFACTORY\icons\rebell_spawn.paa";
            license[] = { "rebel", true };
            level[] = { "", "", -1 };
        };
		
		class RebelF {
            displayName = "RebellenHQ4";
            spawnMarker = "civ_spawn_10";
            icon = "MINEFACTORY\icons\rebell_spawn.paa";
            license[] = { "rebel", true };
            level[] = { "", "", -1 };
        };
//Gangs		
		class gangTF {
            displayName = "TF";
            spawnMarker = "tfspawn";
            icon = "MINEFACTORY\icons\rebell_spawn.paa";
            license[] = { "gang_4", true };
            level[] = { "", "", -1 };
        };
		
		class Donator {
            displayName = "Donator";
            spawnMarker = "don_spawn";
            icon = "\a3\ui_f\data\map\Markers\NATO\b_air.paa";
            license[] = { "donator", true };
            level[] = { "", "", -1 };
        };
		
		class Hunting {
            displayName = "Hunting";
            spawnMarker = "hunting_spawn";
            icon = "\a3\ui_f\data\map\Markers\NATO\b_air.paa";
            license[] = { "gun_big", true };
            level[] = { "", "", -1 };
        };
    };

    class Cop {
        class Kavala {
            displayName = "Kavala HQ";
            spawnMarker = "cop_spawn_1";
            icon = "MINEFACTORY\icons\cop_spawn.paa";
            license[] = { "", true };
            level[] = { "", "", -1 };
        };

        class Pyrgos {
            displayName = "Pyrgos HQ";
            spawnMarker = "cop_spawn_2";
            icon = "MINEFACTORY\icons\cop_spawn.paa";
            license[] = { "", true };
            level[] = { "", "", -1 };
        };

        class Athira {
            displayName = "Athira HQ";
            spawnMarker = "cop_spawn_3";
            icon = "MINEFACTORY\icons\cop_spawn.paa";
            license[] = { "", true };
            level[] = { "", "", -1 };
        };

        class Air {
            displayName = "Air HQ";
            spawnMarker = "cop_spawn_4";
            icon = "MINEFACTORY\icons\cop_spawn.paa";
            license[] = { "", true };
            level[] = { "", "", -1 };
        };

        class HW {
            displayName = "HW Patrol";
            spawnMarker = "cop_spawn_5";
            icon = "MINEFACTORY\icons\cop_patrol_spawn.paa";
            license[] = { "", true };
            level[] = { "", "", -1 };
        };
		
		class Schiesstand {
            displayName = "Schießstand";
            spawnMarker = "cop_spawn_6";
            icon = "MINEFACTORY\icons\rebell_spawn.paa";
            license[] = { "", true };
            level[] = { "", "", -1 };
        };
		
	    class sek {
            displayName = "S.E.K. HQ";
            spawnMarker = "sek_spawn";
            icon = "MINEFACTORY\icons\cop_spawn.paa";
            license[] = { "swat", true };
            level[] = { "", "", -1 };
        };
    };

    class Medic {
        class Kavala {
            displayName = "Kavala Hospital";
            spawnMarker = "medic_spawn_1";
            icon = "\a3\ui_f\data\map\MapControl\hospital_ca.paa";
            license[] = { "", true };
            level[] = { "", "", -1 };
        };

        class Athira {
            displayName = "Athira Regional";
            spawnMarker = "medic_spawn_2";
            icon = "\a3\ui_f\data\map\MapControl\hospital_ca.paa";
            license[] = { "", true };
            level[] = { "", "", -1 };
        };

        class Pyrgos {
            displayName = "Pyrgos Hospital";
            spawnMarker = "medic_spawn_3";
            icon = "\a3\ui_f\data\map\MapControl\hospital_ca.paa";
            license[] = { "", true };
            level[] = { "", "", -1 };
        };
		
		class Sofia {
            displayName = "Sofia Hospital";
            spawnMarker = "medic_spawn_4";
            icon = "\a3\ui_f\data\map\MapControl\hospital_ca.paa";
            license[] = { "", true };
            level[] = { "", "", -1 };
        };
    };
};
