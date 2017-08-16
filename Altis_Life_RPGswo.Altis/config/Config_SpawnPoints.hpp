/*
*    Format:
*        3: STRING (Conditions) - Must return boolean :
*            String can contain any amount of conditions, aslong as the entire
*            string returns a boolean. This allows you to check any levels, licenses etc,
*            in any combination. For example:
*                "call DWEV_coplevel && license_civ_someLicense"
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
                conditions = "!lc_rebel || (call DWEV_adminlevel > 0) || DWEV_stranger";
            };

            class Athira {
                displayName = "Athira";
                spawnMarker = "civ_spawn_3";
                icon = "\a3\ui_f\data\map\MapControl\watertower_ca.paa";
                conditions = "lc_athira";
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
                conditions = "lc_sofia";
            };

            class Zaros {
                displayName = "Zaros";
                spawnMarker = "civ_spawn_5";
                icon = "\a3\ui_f\data\map\MapControl\watertower_ca.paa";
                conditions = "lc_spzaros";
            };
			
			class Neochori {
                displayName = "Neochori";
                spawnMarker = "civ_spawn_6";
                icon = "\a3\ui_f\data\map\MapControl\watertower_ca.paa";
                conditions = "lc_spneochori";
            };
			
			class Paintball {
                displayName = "Paintball";
                spawnMarker = "DWEV_spawn_paintball";
                icon = "\a3\ui_f\data\map\MapControl\watertower_ca.paa";
                conditions = "lc_sppaint";
            };
			
			class Casino {
                displayName = "Casino";
                spawnMarker = "casinospawn";
                icon = "\a3\ui_f\data\map\MapControl\watertower_ca.paa";
                conditions = "lc_spcasino";
            };
			
			class Airfield {
                displayName = "Airfield";
                spawnMarker = "trigger_airfield_heli_garage";
                icon = "\a3\ui_f\data\map\MapControl\watertower_ca.paa";
                conditions = "lc_spairfield";
            };
			
			class Jet_Airfield {
                displayName = "Jet Airfield";
                spawnMarker = "civ_jet_1";
                icon = "\a3\ui_f\data\map\MapControl\watertower_ca.paa";
                conditions = "lc_spjet";
            };
			
			class Verwahrstelle {
                displayName = "Verwahrstelle";
                spawnMarker = "restspawn_car_heli";
                icon = "\a3\ui_f\data\map\MapControl\watertower_ca.paa";
                conditions = "lc_spverwahrstelle";
            };
			
			class Kartbahn {
                displayName = "Kartbahn";
                spawnMarker = "trigger_karbahn";
                icon = "\a3\ui_f\data\map\MapControl\watertower_ca.paa";
                conditions = "lc_spkartbahn";
            };
			
			class RebellenHQ {
                displayName = "Rebellen HQ";
                spawnMarker = "reb_v_1";
                icon = "\a3\ui_f\data\map\MapControl\bunker_ca.paa";
                conditions = "lc_sprebell";
            };
			
			class Shockwave {
                displayName = "Uran Garage";
                spawnMarker = "shockwave_g_1";
                icon = "\a3\ui_f\data\map\MapControl\lighthouse_ca.paa";
                conditions = "lc_shockwave";
            };
			
			class Donator_1 {
                displayName = "Premium Spawn Süden";
                spawnMarker = "donator_spawn_1";
                icon = "\a3\ui_f\data\map\MapControl\waypointcompleted_ca.paa";
                conditions = "(call DWEV_donator > 0) || lc_sppremium";
            };
			
			class Donator_2 {
                displayName = "Premium Spawn Norden";
                spawnMarker = "donator_spawn_2";
                icon = "\a3\ui_f\data\map\MapControl\waypointcompleted_ca.paa";
                conditions = "(call DWEV_donator > 0) || lc_sppremium";
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
                displayName = "Athira";
                spawnMarker = "cop_spawn_3";
                icon = "\a3\ui_f\data\map\GroupIcons\badge_rotate_0_gs.paa";
                conditions = "";
            };

            class Pyrgos {
                displayName = "Pyrgos HQ";
                spawnMarker = "cop_spawn_2";
                icon = "\a3\ui_f\data\map\MapControl\fuelstation_ca.paa";
                conditions = "";
            };
			
			class Sofia {
                displayName = "Sofia";
                spawnMarker = "cop_spawn_7";
                icon = "\a3\ui_f\data\map\GroupIcons\badge_rotate_0_gs.paa";
                conditions = "";
            };

            class Air {
                displayName = "Flughafen";
                spawnMarker = "cop_spawn_4";
                icon = "\a3\ui_f\data\map\Markers\NATO\b_air.paa";
                conditions = "";
            };

            class HW_2 {
                displayName = "Kontrolle 2";
                spawnMarker = "cop_spawn_5";
                icon = "\a3\ui_f\data\map\GroupIcons\badge_rotate_0_gs.paa";
                conditions = "";
            };
			
			class HW_1 {
                displayName = "Kontrolle 1";
                spawnMarker = "cop_spawn_6";
                icon = "\a3\ui_f\data\map\GroupIcons\badge_rotate_0_gs.paa";
                conditions = "";
            };
			
			class Paintball {
                displayName = "Paintball";
                spawnMarker = "DWEV_spawn_paintball";
                icon = "\a3\ui_f\data\map\MapControl\watertower_ca.paa";
                conditions = "";
            };
        };

        class Medic {
            class Kavala {
                displayName = "Kavala";
                spawnMarker = "medic_spawn_1";
                icon = "\a3\ui_f\data\map\MapControl\hospital_ca.paa";
                conditions = "";
            };

            class Athira {
                displayName = "Athira";
                spawnMarker = "medic_spawn_2";
                icon = "\a3\ui_f\data\map\MapControl\hospital_ca.paa";
                conditions = "";
            };

            class Pyrgos {
                displayName = "Pyrgos";
                spawnMarker = "medic_spawn_3";
                icon = "\a3\ui_f\data\map\MapControl\hospital_ca.paa";
                conditions = "";
            };
			
			class Sofia {
                displayName = "Sofia";
                spawnMarker = "medic_spawn_4";
                icon = "\a3\ui_f\data\map\MapControl\hospital_ca.paa";
                conditions = "";
            };
			
			class Kontrolle {
                displayName = "Kontrollstation 1";
                spawnMarker = "medic_spawn_5";
                icon = "\a3\ui_f\data\map\MapControl\hospital_ca.paa";
                conditions = "";
            };
			
			class Paintball {
                displayName = "Paintball";
                spawnMarker = "DWEV_spawn_paintball";
                icon = "\a3\ui_f\data\map\MapControl\watertower_ca.paa";
                conditions = "";
            };
        };
		
		class WSC {
            class HQ_Ost {
                displayName = "HQ Ost";
                spawnMarker = "opfor_spawn_2";
                icon = "\a3\ui_f\data\map\MapControl\watertower_ca.paa";
                conditions = "";
            };
			
			class HQ_Mitte {
                displayName = "HQ Mitte";
                spawnMarker = "opfor_spawn_1";
                icon = "\a3\ui_f\data\map\MapControl\watertower_ca.paa";
                conditions = "";
            };
			
			class HQ_West {
                displayName = "HQ West";
                spawnMarker = "opfor_spawn_3";
                icon = "\a3\ui_f\data\map\MapControl\watertower_ca.paa";
                conditions = "";
            };
			
			class Paintball {
                displayName = "Paintball";
                spawnMarker = "DWEV_spawn_paintball";
                icon = "\a3\ui_f\data\map\MapControl\watertower_ca.paa";
                conditions = "";
            };

        };
    };

    class Tanoa {

        class Civilian {
            class Ravita {
                displayName = "Ravi-ta Island";
                spawnMarker = "civ_spawn_1";
                icon = "\a3\ui_f\data\map\MapControl\watertower_ca.paa";
                conditions = "";
            };

            class Georgetown {
                displayName = "Georgetown";
                spawnMarker = "civ_spawn_2";
                icon = "\a3\ui_f\data\map\MapControl\watertower_ca.paa";
                conditions = "";
            };

            class Oumere {
                displayName = "Ouméré";
                spawnMarker = "civ_spawn_3";
                icon = "\a3\ui_f\data\map\MapControl\watertower_ca.paa";
                conditions = "";
            };

            class Lijnhaven {
                displayName = "Lijnhaven";
                spawnMarker = "civ_spawn_4";
                icon = "\a3\ui_f\data\map\MapControl\watertower_ca.paa";
                conditions = "";
            };

            class Tavu {
                displayName = "Tavu";
                spawnMarker = "civ_spawn_5";
                icon = "\a3\ui_f\data\map\MapControl\watertower_ca.paa";
                conditions = "lc_tavu";
            };

            class Katkoula {
                displayName = "Katkoula";
                spawnMarker = "civ_spawn_6";
                icon = "\a3\ui_f\data\map\MapControl\watertower_ca.paa";
                conditions = "lc_katkoula";
            };

            class Tuvanaka {
                displayName = "Tuvanaka";
                spawnMarker = "civ_spawn_7";
                icon = "\a3\ui_f\data\map\MapControl\watertower_ca.paa";
                conditions = "lc_tuvanaka";
            };
			
			class Airport {
                displayName = "Tuvanaka";
                spawnMarker = "Tanoa International Airport";
                icon = "\a3\ui_f\data\map\Markers\NATO\b_air.paa";
                conditions = "lc_tanoaAir";
            };
        };

        class Cop {
            class Georgetown {
                displayName = "Georgetown HQ";
                spawnMarker = "cop_spawn_2";
                icon = "\a3\ui_f\data\map\MapControl\fuelstation_ca.paa";
                conditions = "";
            };

            class Ravita {
                displayName = "Ravi-ta";
                spawnMarker = "cop_spawn_1";
                icon = "\a3\ui_f\data\map\GroupIcons\badge_rotate_0_gs.paa";
                conditions = "";
            };
        };

        class Medic {

            class Georgetown {
                displayName = "Georgetown";
                spawnMarker = "medic_spawn_2";
                icon = "\a3\ui_f\data\map\MapControl\hospital_ca.paa";
                conditions = "";
            };

            class Ravita {
                displayName = "Ravi-ta";
                spawnMarker = "medic_spawn_1";
                icon = "\a3\ui_f\data\map\MapControl\hospital_ca.paa";
                conditions = "";
            };
        };
		
		class WSC {};

    };

};
