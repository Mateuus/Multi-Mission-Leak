/*
*    Format:
*        3: STRING (Conditions) - Must return boolean :
*            String can contain any amount of conditions, aslong as the entire
*            string returns a boolean. This allows you to check any levels, licenses etc,
*            in any combination. For example:
*                "call life_coplevel && license_civ_someLicense"
*            This will also let you call any other function.
*
*/
class CfgSpawnPoints {

    class Altis {
        class Civilian {
            class Kavala {
                displayName = "Kavala";
                spawnMarker = "civ_spawn_1";
                icon = "\a3\ui_f\data\map\MapControl\watertower_ca.paa";
                conditions = "!license_civ_rebel";
            };

            class Athira {
                displayName = "Athira";
                spawnMarker = "civ_spawn_3";
                icon = "\a3\ui_f\data\map\MapControl\watertower_ca.paa";
                conditions = "";
            };

            class Pyrgos {
                displayName = "Pyrgos";
                spawnMarker = "civ_spawn_2";
                icon = "\a3\ui_f\data\map\MapControl\watertower_ca.paa";
                conditions = "";
            };

            class Sofia {
                displayName = "Sofia";
                spawnMarker = "civ_spawn_4";
                icon = "\a3\ui_f\data\map\MapControl\watertower_ca.paa";
                conditions = "";
            };

            class RebelN {
                displayName = "Northern Rebel Base";
                spawnMarker = "Rebelop";
                icon = "\a3\ui_f\data\map\MapControl\bunker_ca.paa";
                conditions = "license_civ_rebel";
            };

            class RebelS {
                displayName = "Southern Rebel Base";
                spawnMarker = "Rebelop_1";
                icon = "\a3\ui_f\data\map\MapControl\bunker_ca.paa";
                conditions = "license_civ_rebel";
            };

            class RebelE {
                displayName = "Eastern Rebel Base";
                spawnMarker = "Rebelop_2";
                icon = "\a3\ui_f\data\map\MapControl\bunker_ca.paa";
                conditions = "license_civ_rebel";
            };
        };

        class Cop {
            class Kavala {
                displayName = "Kavala HQ";
                spawnMarker = "cop_spawn_1";
                icon = "\a3\ui_f\data\map\MapControl\watertower_ca.paa";
                conditions = "";
            };

            class Athira {
                displayName = "Athira HQ";
                spawnMarker = "cop_spawn_3";
                icon = "\a3\ui_f\data\map\MapControl\fuelstation_ca.paa";
                conditions = "";
            };

            class Pyrgos {
                displayName = "Pyrgos HQ";
                spawnMarker = "cop_spawn_2";
                icon = "\a3\ui_f\data\map\GroupIcons\badge_rotate_0_gs.paa";
                conditions = "";
            };

            class Air {
                displayName = "Air HQ";
                spawnMarker = "cop_spawn_4";
                icon = "\a3\ui_f\data\map\Markers\NATO\b_air.paa";
                conditions = "call life_coplevel >= 2 && {license_cop_cAir}";
            };

            class HW {
                displayName = "HW Patrol";
                spawnMarker = "cop_spawn_5";
                icon = "\a3\ui_f\data\map\GroupIcons\badge_rotate_0_gs.paa";
                conditions = "call life_coplevel >= 3";
            };
        };

        class Medic {
            class Kavala {
                displayName = "Kavala Hospital";
                spawnMarker = "medic_spawn_1";
                icon = "\a3\ui_f\data\map\MapControl\hospital_ca.paa";
                conditions = "";
            };

            class Athira {
                displayName = "Athira Regional";
                spawnMarker = "medic_spawn_2";
                icon = "\a3\ui_f\data\map\MapControl\hospital_ca.paa";
                conditions = "";
            };

            class Pyrgos {
                displayName = "Pyrgos Hospital";
                spawnMarker = "medic_spawn_3";
                icon = "\a3\ui_f\data\map\MapControl\hospital_ca.paa";
                conditions = "";
            };
        };
    };

    class Tanoa {

        class Civilian {
            class Georgetown {
                displayName = "Georgetown";
                spawnMarker = "civ_spawn_1";
                icon = "\a3\ui_f\data\map\MapControl\watertower_ca.paa";
                conditions = "!license_civ_rebel";
            };

            class Balavu {
                displayName = "Balavu";
                spawnMarker = "civ_spawn_3";
                icon = "\a3\ui_f\data\map\MapControl\watertower_ca.paa";
                conditions = "";
            };

            class Tuvanaka {
                displayName = "Tuvanaka";
                spawnMarker = "civ_spawn_2";
                icon = "\a3\ui_f\data\map\MapControl\watertower_ca.paa";
                conditions = "";
            };

            class Lijnhaven {
                displayName = "Lijnhaven";
                spawnMarker = "civ_spawn_4";
                icon = "\a3\ui_f\data\map\MapControl\watertower_ca.paa";
                conditions = "";
            };

            class Airport {
             displayName = "Airport";
             spawnMarker = "civ_sp_airport";
             icon = "\a3\ui_f\data\map\MapControl\watertower_ca.paa";
             conditions = "license_civ_sp_airport";
            };

            class Oumere {
             displayName = "Ouméré";
             spawnMarker = "civ_sp_oumere";
             icon = "\a3\ui_f\data\map\MapControl\watertower_ca.paa";
             conditions = "license_civ_sp_oumere";
            };

            class LaRochelle {
             displayName = "La Rochelle";
             spawnMarker = "civ_sp_rochelle";
             icon = "\a3\ui_f\data\map\MapControl\watertower_ca.paa";
             conditions = "license_civ_sp_rochelle";
            };

            class RebelNW {
                displayName = "Rebellen HQ";
                spawnMarker = "Rebelop";
                icon = "\a3\ui_f\data\map\MapControl\bunker_ca.paa";
                conditions = "license_civ_rebel";
            };

            class RebelS {
                displayName = "Rebellen Außenposten Süd";
                spawnMarker = "Rebelop_1";
                icon = "\a3\ui_f\data\map\MapControl\bunker_ca.paa";
                conditions = "license_civ_rebel";
            };

            class RebelNE {
                displayName = "Rebellen Außenposten Nordost";
                spawnMarker = "Rebelop_2";
                icon = "\a3\ui_f\data\map\MapControl\bunker_ca.paa";
                conditions = "license_civ_rebel";
            };
        };

        class Cop {
			          class GeorgetownHQ {
                displayName = "Georgetown HQ";
                spawnMarker = "cop_spawn_2";
                icon = "\a3\ui_f\data\map\GroupIcons\badge_rotate_0_gs.paa";
                conditions = "";
            };

			         class Air {
                displayName = "Air HQ";
                spawnMarker = "cop_spawn_4";
                icon = "\a3\ui_f\data\map\GroupIcons\badge_rotate_0_gs.paa";
                conditions = "";
            };

            class NAirport {
                displayName = "Nord Airport";
                spawnMarker = "cop_spawn_1";
                icon = "\a3\ui_f\data\map\GroupIcons\badge_rotate_0_gs.paa";
                conditions = "";
            };

            class SW {
                displayName = "Südwest Revier";
                spawnMarker = "cop_spawn_3";
                icon = "\a3\ui_f\data\map\GroupIcons\badge_rotate_0_gs.paa";
                conditions = "";
            };

            class SO {
                displayName = "Südost Revier";
                spawnMarker = "cop_spawn_5";
                icon = "\a3\ui_f\data\map\GroupIcons\badge_rotate_0_gs.paa";
                conditions = "";
            };
        };

        class Medic {

            class GeorgetownHospital {
                displayName = "Georgetown HQ";
                spawnMarker = "medic_spawn_3";
                icon = "\a3\ui_f\data\map\MapControl\hospital_ca.paa";
                conditions = "";
            };

            class MitteHospital {
                displayName = "Mittewache";
                spawnMarker = "medic_spawn_2";
                icon = "\a3\ui_f\data\map\MapControl\hospital_ca.paa";
                conditions = "";
            };

            class NordHostpital {
                displayName = "Nordwache";
                spawnMarker = "medic_spawn_4";
                icon = "\a3\ui_f\data\map\MapControl\hospital_ca.paa";
                conditions = "";
            };

			         class SuedHospital {
                displayName = "Südwache";
                spawnMarker = "medic_spawn_1";
                icon = "\a3\ui_f\data\map\MapControl\hospital_ca.paa";
                conditions = "";
            };

        };

      class Psm {

            class GeorgetownPsm {
                displayName = "Georgetown";
                spawnMarker = "psm_spawn_1";
                icon = "\a3\ui_f\data\map\GroupIcons\badge_rotate_0_gs.paa";
                conditions = "";
            };

            class ComuStatAlpha {
                displayName = "Vulcan";
                spawnMarker = "psm_spawn_2";
                icon = "\a3\ui_f\data\map\GroupIcons\badge_rotate_0_gs.paa";
                conditions = "";
            };
      };

    };

};
