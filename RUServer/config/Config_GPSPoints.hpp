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
class CfgGPSPoints {

    class Tanoa {

        class Civilian {
            class Georgetown {
                displayName = "Georgetown";
                gpsMarker = "civ_spawn_1";
                icon = "\a3\ui_f\data\map\MapControl\watertower_ca.paa";
                conditions = "";
            };

			         class Balavu {
                displayName = "Balavu";
                gpsMarker = "civ_spawn_3";
                icon = "\a3\ui_f\data\map\MapControl\watertower_ca.paa";
                conditions = "";
            };

            class Tuvanaka {
                displayName = "Tuvanaka";
                gpsMarker = "civ_spawn_2";
                icon = "\a3\ui_f\data\map\MapControl\watertower_ca.paa";
                conditions = "";
            };

            class Lijnhaven {
                displayName = "Lijnhaven";
                gpsMarker = "civ_spawn_4";
                icon = "\a3\ui_f\data\map\MapControl\watertower_ca.paa";
                conditions = "";
            };

            class RebelNW {
                displayName = "North Western Rebel Base";
                gpsMarker = "Rebelop";
                icon = "\a3\ui_f\data\map\MapControl\bunker_ca.paa";
                conditions = "";
            };

            class RebelS {
                displayName = "Southern Rebel Base";
                gpsMarker = "Rebelop_1";
                icon = "\a3\ui_f\data\map\MapControl\bunker_ca.paa";
                conditions = "";
            };

            class RebelNE {
                displayName = "North Eastern Rebel Base";
                gpsMarker = "Rebelop_2";
                icon = "\a3\ui_f\data\map\MapControl\bunker_ca.paa";
                conditions = "";
            };
			         class SEHospital {
                displayName = "South East Hospital";
                gpsMarker = "medic_spawn_1";
                icon = "\a3\ui_f\data\map\MapControl\hospital_ca.paa";
                conditions = "";
            };

            class TanoukaHospital {
                displayName = "Tanouka Regional";
                gpsMarker = "medic_spawn_2";
                icon = "\a3\ui_f\data\map\MapControl\hospital_ca.paa";
                conditions = "";
            };

            class NEAirportHospital {
                displayName = "North East Airport Hospital";
                gpsMarker = "medic_spawn_3";
                icon = "\a3\ui_f\data\map\MapControl\hospital_ca.paa";
                conditions = "";
            };
			         class Airshop {
                displayName = "$STR_MAR_Air_Shop";
                gpsMarker = "airshop";
                icon = "icons\ico_airfield.paa";
                conditions = "";
            };
			         class Airshop1 {
                displayName = "$STR_MAR_Air_Shop";
                gpsMarker = "airshop_1";
                icon = "icons\ico_airfield.paa";
                conditions = "";
            };
			         class Airshop2 {
                displayName = "$STR_MAR_Air_Shop";
                gpsMarker = "airshop_2";
                icon = "icons\ico_airfield.paa";
                conditions = "";
            };
			         class Airshop3 {
                displayName = "$STR_MAR_Air_Shop";
                gpsMarker = "airshop_3";
                icon = "icons\ico_airfield.paa";
                conditions = "";
            };

			         class Copper {
                displayName = "$STR_MAR_Copper_Mine";
                gpsMarker = "copper_mine";
                icon = "icons\ico_copper.paa";
                conditions = "";
            };
			         class Copper2 {
                displayName = "$STR_Process_Copper";
                gpsMarker = "copper_mine_1";
                icon = "icons\ico_copper.paa";
                conditions = "";
            };
			         class CopperT {
                displayName = "$STR_MAR_Iron_Copper_Trader";
                gpsMarker = "iron_copper_trader";
                icon = "icons\ico_trader.paa";
                conditions = "";
            };
			         class Rock {
                displayName = "$STR_MAR_Rock_Quarry";
                gpsMarker = "rock_quarry";
                icon = "icons\ico_rock.paa";
                conditions = "";
            };
			         class RockP {
                displayName = "$STR_MAR_Rock_Processing";
                gpsMarker = "rock_processing";
                icon = "icons\ico_process.paa";
                conditions = "";
            };
			         class CementT {
                displayName = "$STR_MAR_Cement_Trader";
                gpsMarker = "oil_trader_3_1";
                icon = "icons\ico_trader.paa";
                conditions = "";
            };
			         class Iron {
                displayName = "$STR_MAR_Iron_Mine";
                gpsMarker = "iron_mine";
                icon = "icons\ico_iron.paa";
                conditions = "";
            };
			         class IronP {
                displayName = "$STR_MAR_Iron_processing";
                gpsMarker = "iron_processing";
                icon = "icons\ico_process.paa";
                conditions = "";
            };
			         class IronT {
                displayName = "$STR_MAR_Iron_Copper_Trader";
                gpsMarker = "iron_copper_trader";
                icon = "icons\ico_trader.paa";
                conditions = "";
            };
			         class Salt {
                displayName = "$STR_MAR_Salt_Mine";
                gpsMarker = "salt_mine";
                icon = "icons\ico_saltProcessed.paa";
                conditions = "";
            };
			         class SaltP {
                displayName = "$STR_MAR_Salt_Processing";
                gpsMarker = "salt_processing";
                icon = "icons\ico_process.paa";
                conditions = "";
            };
			         class SaltT {
                displayName = "$STR_MAR_Salt_Trader";
                gpsMarker = "salt_trader";
                icon = "icons\ico_trader.paa";
                conditions = "";
            };
			         class Sand {
                displayName = "$STR_MAR_Sand_Mine";
                gpsMarker = "sand_mine";
                icon = "icons\ico_sand.paa";
                conditions = "";
            };
			         class SandP {
                displayName = "$STR_MAR_Sand_Processing";
                gpsMarker = "sand_processing";
                icon = "icons\ico_process.paa";
                conditions = "";
            };
			         class GlassT {
                displayName = "$STR_MAR_Glass_Trader";
                gpsMarker = "glass_trader";
                icon = "icons\ico_trader.paa";
                conditions = "";
            };
			         class Diamond {
                displayName = "$STR_MAR_Diamond_Mine";
                gpsMarker = "diamond_mine";
                icon = "icons\ico_diamondCut.paa";
                conditions = "";
            };
			         class DiamondP {
                displayName = "$STR_MAR_Diamond_Processing";
                gpsMarker = "diamond_processing";
                icon = "icons\ico_process.paa";
                conditions = "";
            };
			         class DiamondT {
                displayName = "$STR_MAR_Diamond_Trader";
                gpsMarker = "diamond_trader";
                icon = "icons\ico_trader.paa";
                conditions = "";
            };
			         class Oil1 {
                displayName = "$STR_MAR_Oil_Field";
                gpsMarker = "oil_field_1";
                icon = "";
                conditions = "";
            };
			         class Oil2 {
                displayName = "$STR_MAR_Oil_Field";
                gpsMarker = "oil_field_2";
                icon = "";
                conditions = "";
            };
			         class OilP1 {
                displayName = "$STR_MAR_FuelTank_Storage";
                gpsMarker = "fuel_storage_1";
                icon = "icons\ico_process.paa";
                conditions = "";
            };
			         class OilP2 {
                displayName = "$STR_MAR_FuelTank_Storage";
                gpsMarker = "fuel_storage_2";
                icon = "icons\ico_process.paa";
                conditions = "";
            };
			         class OilT {
                displayName = "$STR_MAR_Oil_Trader";
                gpsMarker = "oil_trader";
                icon = "icons\ico_trader.paa";
                conditions = "";
            };

			         class Heroin {
                displayName = "$STR_MAR_Heroin_Field";
                gpsMarker = "heroin_1";
                icon = "icons\ico_heroinProcessed.paa";
                conditions = "";
            };
			         class Cocaine {
                displayName = "$STR_MAR_Cocaine_Field";
                gpsMarker = "cocaine_1";
                icon = "icons\ico_cocaineProcessed.paa";
                conditions = "";
            };
			         class Marijuana {
                displayName = "$STR_MAR_Weed_Field";
                gpsMarker = "weed_1";
                icon = "icons\ico_marijuana.paa";
                conditions = "";
            };
			         class Dealer {
                displayName = "$STR_MAR_Drug_Dealer";
                gpsMarker = "Dealer_1";
                icon = "icons\ico_drug.paa";
                conditions = "";
            };
			         class Dealer1 {
                displayName = "$STR_MAR_Drug_Dealer";
                gpsMarker = "Dealer_1_3";
                icon = "icons\ico_drug.paa";
                conditions = "";
            };
			         class Dealer2 {
                displayName = "$STR_MAR_Drug_Dealer";
                gpsMarker = "Dealer_1_4";
                icon = "icons\ico_drug.paa";
                conditions = "";
            };
			         class DealerT {
                displayName = "$STR_MAR_Turtle_Dealer";
                gpsMarker = "turle_dealer";
                icon = "icons\ico_turtle.paa";
                conditions = "";
            };
			         class DealerT1 {
                displayName = "$STR_MAR_Turtle_Dealer";
                gpsMarker = "turle_dealer_1";
                icon = "icons\ico_turtle.paa";
                conditions = "";
            };
			         class DealerT2 {
                displayName = "$STR_MAR_Turtle_Dealer";
                gpsMarker = "turle_dealer_2";
                icon = "icons\ico_turtle.paa";
                conditions = "";
            };
			         class GoldbarDealer {
                displayName = "$STR_MAR_Gold_Bars_Buyer";
                gpsMarker = "gold_bar_dealer";
                icon = "icons\ico_goldbar.paa";
                conditions = "";
            };
			         class Jail {
                displayName = "$STR_MAR_Tanoa_Corrections";
                gpsMarker = "jail_marker";
                icon = "icons\ico_jail.paa";
                conditions = "";
            };

        };

        class Cop {
            class NAirport {
                displayName = "North Airport HQ";
                gpsMarker = "cop_spawn_1";
                icon = "\a3\ui_f\data\map\MapControl\watertower_ca.paa";
                conditions = "";
            };

            class SWAirport {
                displayName = "South Western Airport HQ";
                gpsMarker = "cop_spawn_3";
                icon = "\a3\ui_f\data\map\MapControl\fuelstation_ca.paa";
                conditions = "";
            };

            class GeorgetownHQ {
                displayName = "Georgetown HQ";
                gpsMarker = "cop_spawn_2";
                icon = "\a3\ui_f\data\map\GroupIcons\badge_rotate_0_gs.paa";
                conditions = "";
            };

            class Air {
                displayName = "Air HQ";
                gpsMarker = "cop_spawn_4";
                icon = "\a3\ui_f\data\map\Markers\NATO\b_air.paa";
                conditions = "";
            };

            class HW {
                displayName = "HW Patrol";
                gpsMarker = "cop_spawn_5";
                icon = "\a3\ui_f\data\map\GroupIcons\badge_rotate_0_gs.paa";
                conditions = "";
            };

			         class Georgetown {
                displayName = "Georgetown";
                gpsMarker = "civ_spawn_1";
                icon = "\a3\ui_f\data\map\MapControl\watertower_ca.paa";
                conditions = "";
            };
			         class Balavu {
                displayName = "Balavu";
                gpsMarker = "civ_spawn_3";
                icon = "\a3\ui_f\data\map\MapControl\watertower_ca.paa";
                conditions = "";
            };
            class Tuvanaka {
                displayName = "Tuvanaka";
                gpsMarker = "civ_spawn_2";
                icon = "\a3\ui_f\data\map\MapControl\watertower_ca.paa";
                conditions = "";
            };
            class Lijnhaven {
                displayName = "Lijnhaven";
                gpsMarker = "civ_spawn_4";
                icon = "\a3\ui_f\data\map\MapControl\watertower_ca.paa";
                conditions = "";
            };
            class RebelNW {
                displayName = "North Western Rebel Base";
                gpsMarker = "Rebelop";
                icon = "\a3\ui_f\data\map\MapControl\bunker_ca.paa";
                conditions = "";
            };
            class RebelS {
                displayName = "Southern Rebel Base";
                gpsMarker = "Rebelop_1";
                icon = "\a3\ui_f\data\map\MapControl\bunker_ca.paa";
                conditions = "";
            };
            class RebelNE {
                displayName = "North Eastern Rebel Base";
                gpsMarker = "Rebelop_2";
                icon = "\a3\ui_f\data\map\MapControl\bunker_ca.paa";
                conditions = "";
            };
			         class SEHospital {
                displayName = "South East Hospital";
                gpsMarker = "medic_spawn_1";
                icon = "\a3\ui_f\data\map\MapControl\hospital_ca.paa";
                conditions = "";
            };
            class TanoukaHospital {
                displayName = "Tanouka Regional";
                gpsMarker = "medic_spawn_2";
                icon = "\a3\ui_f\data\map\MapControl\hospital_ca.paa";
                conditions = "";
            };
            class NEAirportHospital {
                displayName = "North East Airport Hospital";
                gpsMarker = "medic_spawn_3";
                icon = "\a3\ui_f\data\map\MapControl\hospital_ca.paa";
                conditions = "";
            };
			         class Airshop {
                displayName = "$STR_MAR_Air_Shop";
                gpsMarker = "airshop";
                icon = "icons\ico_airfield.paa";
                conditions = "";
            };
			         class Airshop1 {
                displayName = "$STR_MAR_Air_Shop";
                gpsMarker = "airshop_1";
                icon = "icons\ico_airfield.paa";
                conditions = "";
            };
			         class Airshop2 {
                displayName = "$STR_MAR_Air_Shop";
                gpsMarker = "airshop_2";
                icon = "icons\ico_airfield.paa";
                conditions = "";
            };
			         class Airshop3 {
                displayName = "$STR_MAR_Air_Shop";
                gpsMarker = "airshop_3";
                icon = "icons\ico_airfield.paa";
                conditions = "";
            };
			         class Airshop4 {
                displayName = "$STR_MAR_Air_Shop";
                gpsMarker = "airshop_4";
                icon = "icons\ico_airfield.paa";
                conditions = "";
            };
			         class Copper {
                displayName = "$STR_MAR_Copper_Mine";
                gpsMarker = "copper_mine";
                icon = "icons\ico_copper.paa";
                conditions = "";
            };
			         class Copper2 {
                displayName = "$STR_Process_Copper";
                gpsMarker = "copper_mine_1";
                icon = "icons\ico_copper.paa";
                conditions = "";
            };
			         class CopperT {
                displayName = "$STR_MAR_Iron_Copper_Trader";
                gpsMarker = "iron_copper_trader";
                icon = "icons\ico_trader.paa";
                conditions = "";
            };
			         class Rock {
                displayName = "$STR_MAR_Rock_Quarry";
                gpsMarker = "rock_quarry";
                icon = "icons\ico_rock.paa";
                conditions = "";
            };
			         class RockP {
                displayName = "STR_MAR_Rock_Processing";
                gpsMarker = "rock_processing";
                icon = "icons\ico_process.paa";
                conditions = "";
            };
			         class Cement {
                displayName = "$STR_MAR_Cement_Trader";
                gpsMarker = "oil_trader_3_1";
                icon = "icons\ico_trader.paa";
                conditions = "";
            };
			         class Iron {
                displayName = "$STR_MAR_Iron_Mine";
                gpsMarker = "iron_mine";
                icon = "icons\ico_iron.paa";
                conditions = "";
            };
			         class IronP {
                displayName = "$STR_MAR_Iron_processing";
                gpsMarker = "iron_processing";
                icon = "icons\ico_process.paa";
                conditions = "";
            };
			         class IronT {
                displayName = "$STR_MAR_Iron_Copper_Trader";
                gpsMarker = "iron_copper_trader";
                icon = "icons\ico_trader.paa";
                conditions = "";
            };
			         class Salt {
                displayName = "$STR_MAR_Salt_Mine";
                gpsMarker = "salt_mine";
                icon = "icons\ico_saltProcessed.paa";
                conditions = "";
            };
			         class SaltP {
                displayName = "$STR_MAR_Salt_Processing";
                gpsMarker = "salt_processing";
                icon = "icons\ico_process.paa";
                conditions = "";
            };
			         class SaltT {
                displayName = "$STR_MAR_Salt_Trader";
                gpsMarker = "salt_trader";
                icon = "icons\ico_trader.paa";
                conditions = "";
            };
			         class Sand {
                displayName = "$STR_MAR_Sand_Mine";
                gpsMarker = "sand_mine";
                icon = "icons\ico_sand.paa";
                conditions = "";
            };
			         class SandP {
                displayName = "$STR_MAR_Sand_Processing";
                gpsMarker = "sand_processing";
                icon = "icons\ico_process.paa";
                conditions = "";
            };
			         class GlassT {
                displayName = "$STR_MAR_Glass_Trader";
                gpsMarker = "glass_trader";
                icon = "icons\ico_trader.paa";
                conditions = "";
            };
			         class Diamond {
                displayName = "$STR_MAR_Diamond_Mine";
                gpsMarker = "diamond_mine";
                icon = "icons\ico_diamondCut.paa";
                conditions = "";
            };
			         class DiamondP {
                displayName = "$STR_MAR_Diamond_Processing";
                gpsMarker = "diamond_processing";
                icon = "icons\ico_process.paa";
                conditions = "";
            };
			         class DiamondT {
                displayName = "$STR_MAR_Diamond_Trader";
                gpsMarker = "diamond_trader";
                icon = "icons\ico_trader.paa";
                conditions = "";
            };
			         class Oil1 {
                displayName = "$STR_MAR_Oil_Field";
                gpsMarker = "oil_field_1";
                icon = "";
                conditions = "";
            };
			         class Oil2 {
                displayName = "$STR_MAR_Oil_Field";
                gpsMarker = "oil_field_2";
                icon = "";
                conditions = "";
            };
			         class OilP1 {
                displayName = "$STR_MAR_FuelTank_Storage";
                gpsMarker = "fuel_storage_1";
                icon = "icons\ico_process.paa";
                conditions = "";
            };
			         class OilP2 {
                displayName = "$STR_MAR_FuelTank_Storage";
                gpsMarker = "fuel_storage_2";
                icon = "icons\ico_process.paa";
                conditions = "";
            };
			         class OilT {
                displayName = "$STR_MAR_Oil_Trader";
                gpsMarker = "oil_trader";
                icon = "icons\ico_trader.paa";
                conditions = "";
            };

			         class Heroin {
                displayName = "$STR_MAR_Heroin_Field";
                gpsMarker = "heroin_1";
                icon = "icons\ico_heroinProcessed.paa";
                conditions = "";
            };
			         class Cocaine {
                displayName = "$STR_MAR_Cocaine_Field";
                gpsMarker = "cocaine_1";
                icon = "icons\ico_cocaineProcessed.paa";
                conditions = "";
            };
			         class Marijuana {
                displayName = "$STR_MAR_Weed_Field";
                gpsMarker = "weed_1";
                icon = "icons\ico_marijuana.paa";
                conditions = "";
            };
			         class Dealer {
                displayName = "$STR_MAR_Drug_Dealer";
                gpsMarker = "Dealer_1";
                icon = "icons\ico_drug.paa";
                conditions = "";
            };
			         class Dealer1 {
                displayName = "$STR_MAR_Drug_Dealer";
                gpsMarker = "Dealer_1_3";
                icon = "icons\ico_drug.paa";
                conditions = "";
            };
			         class Dealer2 {
                displayName = "$STR_MAR_Drug_Dealer";
                gpsMarker = "Dealer_1_4";
                icon = "icons\ico_drug.paa";
                conditions = "";
            };
			         class DealerT {
                displayName = "$STR_MAR_Turtle_Dealer";
                gpsMarker = "turle_dealer";
                icon = "icons\ico_turtle.paa";
                conditions = "";
            };
			         class DealerT1 {
                displayName = "$STR_MAR_Turtle_Dealer";
                gpsMarker = "turle_dealer_1";
                icon = "icons\ico_turtle.paa";
                conditions = "";
            };
			         class DealerT2 {
                displayName = "$STR_MAR_Turtle_Dealer";
                gpsMarker = "turle_dealer_2";
                icon = "icons\ico_turtle.paa";
                conditions = "";
            };
 			        class GoldbarDealer {
                displayName = "$STR_MAR_Gold_Bars_Buyer";
                gpsMarker = "gold_bar_dealer";
                icon = "icons\ico_goldbar.paa";
                conditions = "";
            };
			         class Jail {
                displayName = "$STR_MAR_Tanoa_Corrections";
                gpsMarker = "jail_marker";
                icon = "icons\ico_jail.paa";
                conditions = "";
            };
        };

        class Psm {
            class Georgetown {
                displayName = "Georgetown";
                gpsMarker = "psm_spawn_1";
                icon = "\a3\ui_f\data\map\MapControl\watertower_ca.paa";
                conditions = "";
            };
            class Vulcan {
                displayName = "Vulcan";
                gpsMarker = "psm_spawn_2";
                icon = "\a3\ui_f\data\map\MapControl\watertower_ca.paa";
                conditions = "";
            };
        };

        class Medic {

            class Georgetown {
                displayName = "Georgetown";
                gpsMarker = "civ_spawn_1";
                icon = "\a3\ui_f\data\map\MapControl\watertower_ca.paa";
                conditions = "";
            };
			         class Balavu {
                displayName = "Balavu";
                gpsMarker = "civ_spawn_3";
                icon = "\a3\ui_f\data\map\MapControl\watertower_ca.paa";
                conditions = "";
            };
            class Tuvanaka {
                displayName = "Tuvanaka";
                gpsMarker = "civ_spawn_2";
                icon = "\a3\ui_f\data\map\MapControl\watertower_ca.paa";
                conditions = "";
            };
            class Lijnhaven {
                displayName = "Lijnhaven";
                gpsMarker = "civ_spawn_4";
                icon = "\a3\ui_f\data\map\MapControl\watertower_ca.paa";
                conditions = "";
            };
            class RebelNW {
                displayName = "North Western Rebel Base";
                gpsMarker = "Rebelop";
                icon = "\a3\ui_f\data\map\MapControl\bunker_ca.paa";
                conditions = "";
            };
            class RebelS {
                displayName = "Southern Rebel Base";
                gpsMarker = "Rebelop_1";
                icon = "\a3\ui_f\data\map\MapControl\bunker_ca.paa";
                conditions = "";
            };
            class RebelNE {
                displayName = "North Eastern Rebel Base";
                gpsMarker = "Rebelop_2";
                icon = "\a3\ui_f\data\map\MapControl\bunker_ca.paa";
                conditions = "";
            };
			         class SEHospital {
                displayName = "South East Hospital";
                gpsMarker = "medic_spawn_1";
                icon = "\a3\ui_f\data\map\MapControl\hospital_ca.paa";
                conditions = "";
            };
            class TanoukaHospital {
                displayName = "Tanouka Regional";
                gpsMarker = "medic_spawn_2";
                icon = "\a3\ui_f\data\map\MapControl\hospital_ca.paa";
                conditions = "";
            };
            class NEAirportHospital {
                displayName = "North East Airport Hospital";
                gpsMarker = "medic_spawn_3";
                icon = "\a3\ui_f\data\map\MapControl\hospital_ca.paa";
                conditions = "";
            };
			         class Airshop {
                displayName = "$STR_MAR_Air_Shop";
                gpsMarker = "airshop";
                icon = "icons\ico_airfield.paa";
                conditions = "";
            };
			         class Airshop1 {
                displayName = "$STR_MAR_Air_Shop";
                gpsMarker = "airshop_1";
                icon = "icons\ico_airfield.paa";
                conditions = "";
            };
			         class Airshop2 {
                displayName = "$STR_MAR_Air_Shop";
                gpsMarker = "airshop_2";
                icon = "icons\ico_airfield.paa";
                conditions = "";
            };
			         class Airshop3 {
                displayName = "$STR_MAR_Air_Shop";
                gpsMarker = "airshop_3";
                icon = "icons\ico_airfield.paa";
                conditions = "";
            };
			         class Airshop4 {
                displayName = "$STR_MAR_Air_Shop";
                gpsMarker = "airshop_4";
                icon = "icons\ico_airfield.paa";
                conditions = "";
            };
			         class Copper {
                displayName = "$STR_MAR_Copper_Mine";
                gpsMarker = "copper_mine";
                icon = "icons\ico_copper.paa";
                conditions = "";
            };
			         class Copper2 {
                displayName = "$STR_Process_Copper";
                gpsMarker = "copper_mine_1";
                icon = "icons\ico_copper.paa";
                conditions = "";
            };
			         class CopperT {
                displayName = "$STR_MAR_Iron_Copper_Trader";
                gpsMarker = "iron_copper_trader";
                icon = "icons\ico_trader.paa";
                conditions = "";
            };
			         class Banana {
                displayName = "$STR_MAR_Banana_Quarry";
                gpsMarker = "banana_zone";
                icon = "icons\ico_banane.paa";
                conditions = "";
            };
			         class BananaP {
                displayName = "$STR_MAR_Banane_Verpacken";
                gpsMarker = "banana_processing";
                icon = "icons\ico_process.paa";
                conditions = "";
            };
			         class BananaT {
                displayName = "$STR_MAR_Banana_Trader";
                gpsMarker = "banana_trader";
                icon = "icons\ico_trader.paa";
                conditions = "";
            };
			         class Iron {
                displayName = "$STR_MAR_Iron_Mine";
                gpsMarker = "iron_mine";
                icon = "icons\ico_iron.paa";
                conditions = "";
            };
			         class IronP {
                displayName = "$STR_MAR_Iron_processing";
                gpsMarker = "iron_processing";
                icon = "icons\ico_process.paa";
                conditions = "";
            };
			         class IronT {
                displayName = "$STR_MAR_Iron_Copper_Trader";
                gpsMarker = "iron_copper_trader";
                icon = "icons\ico_trader.paa";
                conditions = "";
            };
			         class Salt {
                displayName = "$STR_MAR_Salt_Mine";
                gpsMarker = "salt_mine";
                icon = "icons\ico_saltProcessed.paa";
                conditions = "";
            };
			         class SaltP {
                displayName = "$STR_MAR_Salt_Processing";
                gpsMarker = "salt_processing";
                icon = "icons\ico_process.paa";
                conditions = "";
            };
			         class SaltT {
                displayName = "$STR_MAR_Salt_Trader";
                gpsMarker = "salt_trader";
                icon = "icons\ico_trader.paa";
                conditions = "";
            };
			         class Sand {
                displayName = "$STR_MAR_Sand_Mine";
                gpsMarker = "sand_mine";
                icon = "icons\ico_sand.paa";
                conditions = "";
            };
			         class SandP {
                displayName = "$STR_MAR_Sand_Processing";
                gpsMarker = "sand_processing";
                icon = "icons\ico_process.paa";
                conditions = "";
            };
			         class GlassT {
                displayName = "$STR_MAR_Glass_Trader";
                gpsMarker = "glass_trader";
                icon = "icons\ico_trader.paa";
                conditions = "";
            };
			         class Diamond {
                displayName = "$STR_MAR_Diamond_Mine";
                gpsMarker = "diamond_mine";
                icon = "icons\ico_diamondCut.paa";
                conditions = "";
            };
			         class DiamondP {
                displayName = "$STR_MAR_Diamond_Processing";
                gpsMarker = "diamond_processing";
                icon = "icons\ico_process.paa";
                conditions = "";
            };
			         class DiamondT {
                displayName = "$STR_MAR_Diamond_Trader";
                gpsMarker = "diamond_trader";
                icon = "icons\ico_trader.paa";
                conditions = "";
            };
			         class Oil1 {
                displayName = "$STR_MAR_Oil_Field";
                gpsMarker = "oil_field_1";
                icon = "";
                conditions = "";
            };
			         class Oil2 {
                displayName = "$STR_MAR_Oil_Field";
                gpsMarker = "oil_field_2";
                icon = "";
                conditions = "";
            };
			         class OilP1 {
                displayName = "$STR_MAR_FuelTank_Storage";
                gpsMarker = "fuel_storage_1";
                icon = "icons\ico_process.paa";
                conditions = "";
            };
			         class OilP2 {
                displayName = "$STR_MAR_FuelTank_Storage";
                gpsMarker = "fuel_storage_2";
                icon = "icons\ico_process.paa";
                conditions = "";
            };
			         class OilT {
                displayName = "$STR_MAR_Oil_Trader";
                gpsMarker = "oil_trader";
                icon = "icons\ico_trader.paa";
                conditions = "";
            };

			         class Heroin {
                displayName = "$STR_MAR_Heroin_Field";
                gpsMarker = "heroin_1";
                icon = "icons\ico_heroinProcessed.paa";
                conditions = "";
            };
			         class Cocaine {
                displayName = "$STR_MAR_Cocaine_Field";
                gpsMarker = "cocaine_1";
                icon = "icons\ico_cocaineProcessed.paa";
                conditions = "";
            };
			         class Marijuana {
                displayName = "$STR_MAR_Weed_Field";
                gpsMarker = "weed_1";
                icon = "icons\ico_marijuana.paa";
                conditions = "";
            };
			         class Dealer {
                displayName = "$STR_MAR_Drug_Dealer";
                gpsMarker = "Dealer_1";
                icon = "icons\ico_drug.paa";
                conditions = "";
            };
			         class Dealer1 {
                displayName = "$STR_MAR_Drug_Dealer";
                gpsMarker = "Dealer_1_3";
                icon = "icons\ico_drug.paa";
                conditions = "";
            };
			         class Dealer2 {
                displayName = "$STR_MAR_Drug_Dealer";
                gpsMarker = "Dealer_1_4";
                icon = "icons\ico_drug.paa";
                conditions = "";
            };
			         class DealerT {
                displayName = "$STR_MAR_Turtle_Dealer";
                gpsMarker = "turle_dealer";
                icon = "icons\ico_turtle.paa";
                conditions = "";
            };
			         class DealerT1 {
                displayName = "$STR_MAR_Turtle_Dealer";
                gpsMarker = "turle_dealer_1";
                icon = "icons\ico_turtle.paa";
                conditions = "";
            };
			         class DealerT2 {
                displayName = "$STR_MAR_Turtle_Dealer";
                gpsMarker = "turle_dealer_2";
                icon = "icons\ico_turtle.paa";
                conditions = "";
            };
			         class GoldbarDealer {
                displayName = "$STR_MAR_Gold_Bars_Buyer";
                gpsMarker = "gold_bar_dealer";
                icon = "icons\ico_goldbar.paa";
                conditions = "";
            };
			         class Jail {
                displayName = "$STR_MAR_Tanoa_Corrections";
                gpsMarker = "jail_marker";
                icon = "icons\ico_jail.paa";
                conditions = "";
            };

        };

    };

};
