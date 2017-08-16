/*
*    Format:
*        licenses: ARRAY (This is for limiting spawn to certain things)
*           0: License Name
*           1: License Check Type
*                false: If license isn't set
*                true: If license is set
*           Example:
*                licenses[] = { { "pilot", true }, { "rebel", false } }; //Shows up for players with pilot and without rebel license.
*
*        level: ARRAY (This is for limiting spawn to certain things)
*            0: Variable to read from
*            1: Variable Value Type (SCALAR / BOOL / EQUAL / INVERSE)
*                SCALAR: VALUE => VALUE
*                BOOL: VALUE EXISTS
*                EQUAL: VALUE isEqualTo VALUE
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
				conditions = "";
            };

            class Athira {
                displayName = "Athira";
                spawnMarker = "civ_spawn_2";
                icon = "\a3\ui_f\data\map\MapControl\watertower_ca.paa";
                conditions = "";
            };

            class rebel {
                displayName = "Rebellen Stadt";
                spawnMarker = "civ_spawn_rebel";
                icon = "\a3\ui_f\data\map\MapControl\watertower_ca.paa";
                conditions = "license_civ_rebel";
            };
        };

        class Cop {
			class HQ {
                displayName = "Kavala HQ";
                spawnMarker = "cop_spawn_kavala";
                icon = "\a3\ui_f\data\map\MapControl\fuelstation_ca.paa";
                conditions = "";
            };
            class Athria {
                displayName = "Athira HQ";
                spawnMarker = "cop_spawn_athira";
                icon = "\a3\ui_f\data\map\MapControl\fuelstation_ca.paa";
                conditions = "";
            };
			class Air {
                displayName = "Air HQ";
                spawnMarker = "cop_spawn_air";
                icon = "\a3\ui_f\data\map\MapControl\fuelstation_ca.paa";
                conditions = "";
            };
			class Carmen {
                displayName = "Carmen Marktplatz";
                spawnMarker = "cop_spawn_carmen";
                icon = "\a3\ui_f\data\map\MapControl\fuelstation_ca.paa";
                conditions = "getplayerUID player in ['76561198169276185','76561198208681004']";
            };
        };

        class Medic {
			class kavala {
                displayName = "Kavala Krankenhaus";
                spawnMarker = "medic_spawn_1";
                icon = "\a3\ui_f\data\map\MapControl\hospital_ca.paa";
                conditions = "";
            };

			class athira {
                displayName = "Haupt-Krankenhaus";
                spawnMarker = "medic_spawn_2";
                icon = "\a3\ui_f\data\map\MapControl\hospital_ca.paa";
                conditions = "";
            };
        };
    };

};