/*
*    Format:
*        level: ARRAY (This is for limiting items to certain things)
*            0: Variable to read from
*            1: Variable Value Type (SCALAR / BOOL / EQUAL)
*            2: What to compare to (-1 = Check Disabled)
*
*/
class CfgSpawnPoints {
    class Civilian {
        class Kavala {
            displayName = "Kavala";
            spawnMarker = "civ_spawn_1";
            icon = "";
            license = "";
            level[] = { "", "", -1 };
        };

        class Athira {
            displayName = "Athira";
            spawnMarker = "civ_spawn_3";
            icon = "";
            license = "";
            level[] = { "", "", -1 };
        };

        class Pyrgos {
            displayName = "Pyrgos";
            spawnMarker = "civ_spawn_2";
            icon = "";
            license = "";
            level[] = { "", "", -1 };
        };

        class Sofia {
            displayName = "Sofia";
            spawnMarker = "civ_spawn_4";
            icon = "";
            license = "";
            level[] = { "", "", -1 };
        };

        class RebelS {
            displayName = "Rebellen Aussenposten Nord";
            spawnMarker = "Rebelop_3";
            icon = "";
            license = "rebel";
            level[] = { "", "", -1 };
        };

        class RebelE {
            displayName = "Eastern Rebelen Aussenposten";
            spawnMarker = "Rebelop_2";
            icon = "";
            license = "rebel";
            level[] = { "", "", -1 };
        };
		
        class Rebellenlagerg {
            displayName = "Rebellenlager Island of Liberty";
            spawnMarker = "reb_spawn";
            icon = "";
            license = "rebel";
            level[] = { "", "", -1 };
        };
		
        class Rebellenschwarz {
            displayName = "Rebellenlager Aussenposten";
            spawnMarker = "rebel_spawn_schwarzmarkt";
            icon = "";
            license = "rebel";
            level[] = { "", "", -1 };
        };
		
    };

    class Cop {
        class Kavala {
            displayName = "Kavala HQ";
            spawnMarker = "cop_spawn_1";
            icon = "";
            license = "";
            level[] = { "", "", -1 };
        };

        class Pyrgos {
            displayName = "Pyrgos HQ";
            spawnMarker = "cop_spawn_2";
            icon = "";
            license = "";
            level[] = { "", "", -1 };
        };

        class Air {
            displayName = "Air HQ";
            spawnMarker = "cop_spawn_4";
            icon = "";
            license = "";
            level[] = { "life_coplevel", "SCALAR", 2 };
        };

        class HW {
            displayName = "Autobahnpolizei";
            spawnMarker = "cop_spawn_5_1";
            icon = "";
            license = "";
            level[] = { "life_coplevel", "SCALAR", 3 };
        };
		
		class training {
            displayName = "Grundausbildung";
            spawnMarker = "cop_training";
            icon = "";
            license = "";
            level[] = { "life_coplevel", "SCALAR", 1 };
        };
		
		class traininggelaende {
            displayName = "Trainingsgelände";
            spawnMarker = "spawn_cop1";
            icon = "";
            license = "";
            level[] = { "life_coplevel", "SCALAR", 1 };
        };
		
		class polizeiairfield {
            displayName = "Polizei Airfield";
            spawnMarker = "cop_spawn_12";
            icon = "";
            license = "";
            level[] = { "life_coplevel", "SCALAR", 1 };
        };
    };

    class Medic {
        class Kavala {
            displayName = "MTD Medizinisch Kavala";
            spawnMarker = "medic_spawn_1";
            icon = "";
            license = "";
            level[] = { "", "", -1 };
        };
		
		class Kavallamtd {
            displayName = "MTD Teschnik Kavala";
            spawnMarker = "medic_spawn_6";
            icon = "";
            license = "";
            level[] = { "", "", -1 };
        };

        class Athira {
            displayName = "MTD Medizinisch Athira";
            spawnMarker = "medic_spawn_2";
            icon = "";
            license = "";
            level[] = { "", "", -1 };
        };
		
		class Athiramtd {
            displayName = "MTD Teschnik Athira";
            spawnMarker = "mtd_spawn2";
            icon = "";
            license = "";
            level[] = { "", "", -1 };
        };

        class Pyrgos {
            displayName = "MTD Medizinisch Pyrgos";
            spawnMarker = "medic_spawn_3";
            icon = "";
            license = "";
            level[] = { "", "", -1 };
        };
		
		
		class pyrgosmtd {
            displayName = "MTD Teschnik Pyrgos";
            spawnMarker = "mtd_spawn3";
            icon = "";
            license = "";
            level[] = { "", "", -1 };
        };

		class sofiamedic {
            displayName = "MTD Medizinisch Sofia";
            spawnMarker = "medic_spawn_4";
            icon = "";
            license = "";
            level[] = { "", "", -1 };
        };
		
		class sofiamtd {
            displayName = "MTD Teschnik Sofia";
            spawnMarker = "mtd_spawn4";
            icon = "";
            license = "";
            level[] = { "", "", -1 };
        };
    };
};
