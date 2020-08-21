/*
*    Format:
       Plik Acid
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
            icon = "\a3\ui_f\data\map\MapControl\watertower_ca.paa";
            license[] = { "", true };
            level[] = { "", "", -1 };
        };

        class Athira {
            displayName = "Athira";
            spawnMarker = "civ_spawn_3";
            icon = "\a3\ui_f\data\map\MapControl\watertower_ca.paa";
            license[] = { "", true };
            level[] = { "", "", -1 };
        };

        class Pyrgos {
            displayName = "Pyrgos";
            spawnMarker = "civ_spawn_2";
            icon = "\a3\ui_f\data\map\MapControl\watertower_ca.paa";
            license[] = { "", true };
            level[] = { "", "", -1 };
        };

        class Paros {
            displayName = "Oreocastro";
            spawnMarker = "civ_spawn_5";
            icon = "\a3\ui_f\data\map\MapControl\watertower_ca.paa";
            license[] = { "", true };
            level[] = { "", "", -1 };
        };

        class Sofia {
            displayName = "Sofia Czerwona";
            spawnMarker = "civ_spawn_4";
            icon = "\a3\ui_f\data\map\MapControl\watertower_ca.paa";
            license[] = { "", true };
            level[] = { "", "", -1 };
        };

        class Donator1 {
            displayName = "lester zlodziej";
            spawnMarker = "don_spawn";
            icon = "\a3\ui_f\data\map\MapControl\watertower_ca.paa";
            license[] = { "don1", true };
            level[] = { "", "", -1 };
        };

        class Donator2 {
            displayName = "Lester zlodziej";
            spawnMarker = "don_spawn";
            icon = "\a3\ui_f\data\map\MapControl\watertower_ca.paa";
            license[] = { "don2", true };
            level[] = { "", "", -1 };
        };

        class Donator3 {
            displayName = "lester zlodziej";
            spawnMarker = "don_spawn";
            icon = "\a3\ui_f\data\map\MapControl\watertower_ca.paa";
            license[] = { "don3", true };
            level[] = { "", "", -1 };
        };
		class Donator4 {
            displayName = "Klub MyśliwskiVIP";
            spawnMarker = "don_spawn";
            icon = "\a3\ui_f\data\map\MapControl\watertower_ca.paa";
            license[] = { "don4", true };
            level[] = { "", "", -1 };
        };

		class sec {
            displayName = "Ochrona";
            spawnMarker = "sec_spawn";
            icon = "\a3\ui_f\data\map\MapControl\watertower_ca.paa";
            license[] = { "sec", true };
            level[] = { "", "", -1 };
        };
		
        class RebelS {
            displayName = "Północna Rebelka";
            spawnMarker = "Rebelop_1";
            icon = "\a3\ui_f\data\map\MapControl\bunker_ca.paa";
            license[] = { "rebel", true };
            level[] = { "", "", -1 };
        };

        class RebelN {
            displayName = "Południowa Rebelka";
            spawnMarker = "Rebelop";
            icon = "\a3\ui_f\data\map\MapControl\bunker_ca.paa";
            license[] = { "rebel", true };
            level[] = { "", "", -1 };
        };

        class RebelE {
            displayName = "Wschodnia Rebelka";
            spawnMarker = "Rebelop_2";
            icon = "\a3\ui_f\data\map\MapControl\bunker_ca.paa";
            license[] = { "rebel", true };
            level[] = { "", "", -1 };
        }; 
		
		class Zolnierz {
            displayName = "Baza Żołnierza";
            spawnMarker = "zolnierz_r_1";
            icon = "\a3\ui_f\data\map\MapControl\bunker_ca.paa";
            license[] = { "zolnierz", true };
            level[] = { "", "", -1 };
        };
    };

    class Cop {
        class Kavala {
            displayName = "Kavala HQ";
            spawnMarker = "cop_spawn_1";
            icon = "\a3\ui_f\data\map\MapControl\watertower_ca.paa";
            license[] = { "", true };
            level[] = { "", "", -1 };
        };

        class Athira {
            displayName = "Athira HQ";
            spawnMarker = "cop_spawn_3";
            icon = "\a3\ui_f\data\map\MapControl\fuelstation_ca.paa";
            license[] = { "", true };
            level[] = { "", "", -1 };
        };

        class Pyrgos {
            displayName = "Pyrgos HQ";
            spawnMarker = "cop_spawn_2";
            icon = "\a3\ui_f\data\map\GroupIcons\badge_rotate_0_gs.paa";
            license[] = { "", true };
            level[] = { "", "", -1 };
        };

        class Wiezienie {
            displayName = "Wiezienie";
            spawnMarker = "cop_spawn_4";
            icon = "\a3\ui_f\data\map\GroupIcons\badge_rotate_0_gs.paa";
            license[] = { "", true };
            level[] = { "", "", -1 };
        };
		
		class Punkt {
            displayName = "Punkt Kontrolnyl Kavala";
            spawnMarker = "cop_spawn_6";
            icon = "\a3\ui_f\data\map\GroupIcons\badge_rotate_0_gs.paa";
            license[] = { "", true };
            level[] = { "", "", -1 };
        };
		
        class HW {
            displayName = "HW Sofia";
            spawnMarker = "cop_spawn_5";
            icon = "\a3\ui_f\data\map\GroupIcons\badge_rotate_0_gs.paa";
            license[] = { "", true };
            level[] = { "", "", -1 };
        };
    };

    class Medic {
        class Kavala {
            displayName = "Szpital Kavala";
            spawnMarker = "medic_spawn_1";
            icon = "\a3\ui_f\data\map\MapControl\hospital_ca.paa";
            license[] = { "", true };
            level[] = { "", "", -1 };
        };

        class Athira {
            displayName = "Szpital Athira";
            spawnMarker = "medic_spawn_2";
            icon = "\a3\ui_f\data\map\MapControl\hospital_ca.paa";
            license[] = { "", true };
            level[] = { "", "", -1 };
        };
		
		class Sofia {
            displayName = "Szpital Sofia";
            spawnMarker = "medic_spawn_4";
            icon = "\a3\ui_f\data\map\MapControl\hospital_ca.paa";
            license[] = { "", true };
            level[] = { "", "", -1 };
        };

        class Pyrgos {
            displayName = "Szpital Pyrgos";
            spawnMarker = "medic_spawn_3";
            icon = "\a3\ui_f\data\map\MapControl\hospital_ca.paa";
            license[] = { "", true };
            level[] = { "", "", -1 };
        };
    };
};
