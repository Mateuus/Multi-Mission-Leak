class CarShops {
    /*
    *    ARRAY FORMAT:
    *        0: STRING (Classname)
    *        1: STRING (Condition)
    *    FORMAT:
    *        STRING (Conditions) - Must return boolean :
    *            String can contain any amount of conditions, aslong as the entire
    *            string returns a boolean. This allows you to check any levels, licenses etc,
    *            in any combination. For example:
    *                "call DWEV_coplevel && lc_someLicense"
    *            This will also let you call any other function.
    *
    *   BLUFOR Vehicle classnames can be found here: https://community.bistudio.com/wiki/Arma_3_CfgVehicles_WEST
    *   OPFOR Vehicle classnames can be found here: https://community.bistudio.com/wiki/Arma_3_CfgVehicles_EAST
    *   Independent Vehicle classnames can be found here: https://community.bistudio.com/wiki/Arma_3_CfgVehicles_GUER
    *   Civilian Vehicle classnames can be found here: https://community.bistudio.com/wiki/Arma_3_CfgVehicles_CIV
    */
    class civ_car
	{
        side = "civ";
        conditions = "lc_driver";
        vehicles[] =
		{
            { "B_Quadbike_01_F", "" },
			{ "C_Offroad_01_F", "" },
            { "C_Hatchback_01_F", "" },
            { "C_SUV_01_F", "" },
            { "C_Van_01_transport_F", "" },
			{ "C_Offroad_02_unarmed_F", "" }, // APEX MB 4WD
			{ "O_G_Van_01_fuel_F", "" },
			{ "C_Van_01_box_F", "" },
            { "C_Hatchback_01_sport_F", "" },
			{ "O_Truck_02_box_F", "call DWEV_adminlevel >= 1" },
			{ "B_MRAP_01_F", "call DWEV_adminlevel == 4" },
			{ "dbo_CIV_new_bike", "DWEV_var_addonVehicles" }, //Tanoa Addon
			{ "dbo_CIV_ol_bike", "DWEV_var_addonVehicles" }, //Tanoa Addon
			{ "MMT_USMC", "DWEV_var_addonVehicles" }, //Tanoa Addon
			{ "MMT_Civ", "DWEV_var_addonVehicles" }, //Tanoa Addon
			{ "BRP_1960_Black", "DWEV_var_addonVehicles" } //Tanoa Addon
        };
    };

    class civ_truck
	{
        side = "civ";
        conditions = "lc_truck";
        vehicles[] =
		{
            { "O_Truck_02_fuel_F", "" },
            { "I_Truck_02_transport_F", "" },
            { "I_Truck_02_covered_F", "" },
            { "B_Truck_01_transport_F", "" },
            { "B_Truck_01_mover_F", "" },
            { "B_Truck_01_fuel_F", "" },
            { "B_Truck_01_box_F", "" },
            { "O_Truck_03_ammo_F", "" },
            { "O_Truck_02_Ammo_F", "" }, // Zamack ammo teurer aber platz
            { "B_Truck_01_ammo_F", "" }, // HEMTT Ammo
            { "B_Truck_01_covered_F", "" }, // HEMTT Transport (Covered)
			{ "O_Truck_03_transport_F", "" }, // Tempest transport
			{ "O_Truck_03_covered_F", "" }, // Temepst abgedeck
			{ "O_Truck_03_fuel_F", "" }, // Tempest Tank
			{ "O_Truck_03_device_F", "" }
        };
    };
	
    class civ_air
	{
        side = "civ";
        conditions = "lc_air || lc_airgewerbe";
        vehicles[] =
		{
            { "B_Heli_Light_01_F", "lc_air" },
            { "C_Heli_Light_01_civil_F", "lc_air" },
            { "C_Plane_Civil_01_F", "lc_air" }, // APEX Cessna
            { "O_Heli_Light_02_unarmed_F", "lc_airgewerbe" },//Orca
			{ "B_Heli_Transport_03_unarmed_F", "lc_airgewerbe" }, // DLC Huron
			{ "O_Heli_Transport_04_F", "lc_airgewerbe" }, // DLC Taru
			{ "O_Heli_Transport_04_medevac_F", "lc_airgewerbe" }, // DLC Taru medic
			{ "I_Heli_Transport_02_F", "lc_airgewerbe" } // Mohawk
        };
    };
	
	class civ_jet
	{
        side = "civ";
        conditions = "lc_airjet";
        vehicles[] =
		{
            { "I_Plane_Fighter_03_CAS_F", "lc_airjet" }, // A-143 Buzzard
            { "B_Plane_CAS_01_F", "lc_airjet" }, //A-164 Wipeout
            { "O_Plane_CAS_02_F", "lc_airjet" }, //To-199 Neophron
            { "O_T_VTOL_02_infantry_F", "lc_airjet" } //APEX Y-32 Xi'an (Infantry Transport)
        };
    };

     class civ_ship
	 {
        side = "civ";
        conditions = "lc_boat";
        vehicles[] =
		{
            { "C_Rubberboat", "lc_boat" },
            { "C_Boat_Civil_01_F", "lc_boat" },
            { "C_Boat_Transport_02_F", "lc_boat" }, // APEX RHIB
            { "C_Scooter_Transport_01_F", "lc_boat" }, // APEX Jetski
			{ "B_CBS_WaterShadow730_F", "DWEV_var_addonVehicles" } // Tanoa Addon Unterwasserscooter
        };
    };
	
	class civ_shipBig
	{
        side = "civ";
        conditions = "lc_shipBig";
        vehicles[] =
		{
            { "D41_Trawler", "lc_shipBig && DWEV_var_addonVehicles" }, // Tanoa Addon Trawler
            { "Burnes_LCAC_1", "lc_shipBig && DWEV_var_addonVehicles" } // Tanoa Addon 
        };
    };
	
	class WSC
	{
        side = "WSC";
        conditions = "call DWEV_opforlevel >= 1";
        vehicles[] =
		{
            { "C_Offroad_01_F", "" }, // offroad
            { "C_Hatchback_01_F", "" }, // hatchback
            { "C_Hatchback_01_sport_F", "" }, // hatchback sport
            { "B_MRAP_01_F", "" }, //hunter
            { "I_MRAP_03_F", "" }, // strider
            { "B_Heli_Light_01_F", "" },// Hummingbird
            { "I_Heli_light_03_unarmed_F", "" },// hellcat
            { "B_Heli_Transport_03_unarmed_F", "" },// DLC Huron
            { "B_Heli_Transport_01_F", "" } // Ghosthawk
        };
    };

    class reb_v
	{
        side = "civ";
        conditions = "lc_rebel";
        vehicles[] =
		{
            { "B_Quadbike_01_F", "lc_rebel && lc_driver" },
            { "B_G_Offroad_01_F", "lc_rebel && lc_driver" },
            { "B_MRAP_01_F", "lc_rebel && lc_driver" },
            { "O_MRAP_02_F", "lc_rebel && lc_driver" },
            { "I_MRAP_03_F", "lc_rebel && lc_driver" },
            { "B_T_LSV_01_unarmed_F", "lc_rebel && lc_driver" },// APEX Prowler (Unarmed)
			{ "O_T_LSV_02_unarmed_F", "lc_rebel && lc_driver" },// APEX Qilin (Unarmed)
			{ "B_Heli_Light_01_F", "lc_rebel && lc_airkampf" },
			{ "I_Heli_light_03_unarmed_F", "lc_rebel && lc_airkampf" },
			{ "B_Heli_Transport_01_F", "lc_rebel && lc_airkampf" },
			{ "B_Heli_Attack_01_F", "lc_rebel && lc_airkampf" },
			{ "O_Heli_Attack_02_F", "lc_rebel && lc_airkampf" },
			{ "O_Heli_Attack_02_black_F", "lc_rebel && lc_airkampf" },
			{ "B_T_VTOL_01_infantry_F", "lc_rebel && lc_airkampf" } // APEX V-44 X Blackfish (Infantry Transport)
        };
    };
	
	class kart_shop
	{
        side = "civ";
        conditions = "lc_driver";
        vehicles[] =
		{
            { "C_Kart_01_Blu_F", "" },
            { "C_Kart_01_Fuel_F", "" },
            { "C_Kart_01_Red_F", "" },
            { "C_Kart_01_Vrana_F", "" },
			{ "C_Kart_01_F", "" },
			{ "C_Kart_01_green_F", "" },
			{ "C_Kart_01_orange_F", "" },
			{ "C_Kart_01_white_F", "" },
			{ "C_Kart_01_yellow_F", "" },
			{ "C_Kart_01_black_F", "" }
        };
    };

    class med_shop
	{
        side = "med";
        conditions = "call DWEV_mediclevel >= 1";
        vehicles[] =
		{
            { "C_Offroad_01_F", "call DWEV_mediclevel >= 2" },
            { "C_Van_01_box_F", "call DWEV_mediclevel >= 3" },
            { "C_SUV_01_F", "call DWEV_mediclevel >= 4" },
            { "I_Truck_02_covered_F", "call DWEV_mediclevel >= 5" },
			{ "B_Truck_01_fuel_F", "call DWEV_mediclevel >= 5" },
			{ "C_Hatchback_01_F", "call DWEV_mediclevel >= 6" },
			{ "B_MRAP_01_F", "call DWEV_mediclevel >= 6" },
			{ "C_Hatchback_01_sport_F", "call DWEV_mediclevel >= 7" }
        };
    };

    class med_air_shop
	{
        side = "med";
        conditions = "call DWEV_mediclevel >= 3 && lm_mair";
        vehicles[] =
		{
            { "B_Heli_Light_01_F", "call DWEV_mediclevel >= 3" },
            { "O_Heli_Light_02_unarmed_F", "call DWEV_mediclevel >= 4" },
			{ "I_Heli_light_03_unarmed_F", "call DWEV_mediclevel >= 5" },
			{ "O_Heli_Transport_04_medevac_F", "call DWEV_mediclevel >= 6" },
			{ "O_Heli_Transport_04_F", "call DWEV_mediclevel >= 7" },
			{ "B_Heli_Transport_03_unarmed_F", "call DWEV_mediclevel >= 8" }
        };
    };
	
	class medic_ship
	{
        side = "med";
        conditions = "call DWEV_mediclevel >= 3";
        vehicles[] =
		{
            { "B_Boat_Armed_01_minigun_F", "call DWEV_mediclevel >= 3" }
        };
    };
	
	class donator
	{
        side = "civ";
        conditions = "call DWEV_donator >= 1 && lc_driver || lc_truck";
        vehicles[] =
		{
            { "B_Quadbike_01_F", "" },
            { "C_Offroad_01_F", "" },
            { "C_Hatchback_01_F", "" },
            { "C_Hatchback_01_sport_F", "" },
            { "C_SUV_01_F", "" },
            { "C_Van_01_transport_F", "" },
			{ "O_G_Van_01_fuel_F", "" },
			{ "C_Van_01_box_F", "" },
			{ "O_Truck_02_fuel_F", "" },
			{ "I_Truck_02_transport_F", "" },
			{ "I_Truck_02_covered_F", "" },
			{ "O_Truck_02_Ammo_F", "" }, // Zamack ammo
			{ "B_Truck_01_transport_F", "" },
			{ "B_Truck_01_mover_F", "" },
			{ "B_Truck_01_fuel_F", "" },
			{ "B_Truck_01_ammo_F", "" }, // HEMTT Ammo	
			{ "B_Truck_01_box_F", "" },
			{ "B_Truck_01_covered_F", "" }, // HEMTT Transport (Covered)
			{ "O_Truck_03_ammo_F", "" },
			{ "O_Truck_03_transport_F", "" }, // Tempest transport
			{ "O_Truck_03_fuel_F", "" },// Tempest Tank
			{ "O_Truck_03_device_F", "" }, //Tempest Gerät
			{ "O_Truck_03_covered_F", "" },// Temepst abgedeck
			{ "B_Heli_Light_01_F", "" },
			{ "C_Heli_Light_01_civil_F", "" }, //M900
			{ "O_Heli_Light_02_unarmed_F", "" },
			{ "I_Heli_Transport_02_F", "" }, // Mohawk
			{ "B_Heli_Transport_03_unarmed_F", "" }, // DLC Huron
			{ "O_Heli_Transport_04_F", "" }, // DLC Taru
			{ "O_Heli_Transport_04_medevac_F", "" } // DLC Taru medic
        };
    };

    class cop_car
	{
        side = "cop";
        conditions = "call DWEV_coplevel >= 1";
        vehicles[] =
		{
            { "C_Offroad_01_F", "call DWEV_coplevel >= 1" },
            { "C_Hatchback_01_F", "call DWEV_coplevel >= 2" },
            { "C_SUV_01_F", "call DWEV_coplevel >= 3" },
            { "C_Hatchback_01_sport_F", "call DWEV_coplevel >= 4" },
			{ "B_MRAP_01_F", "(lp_swat || lp_beg && call DWEV_coplevel >= 3) || call DWEV_coplevel >= 5" },
			{ "I_Truck_02_covered_F", "call DWEV_coplevel >= 3" },
			{ "O_MRAP_02_F", "(lp_swat && call DWEV_coplevel >= 3) || call DWEV_coplevel >= 6" },
			{ "I_MRAP_03_F", "(lp_swat && call DWEV_coplevel >= 3) || call DWEV_coplevel >= 7" }
        };
    };

    class cop_air
	{
        side = "cop";
        conditions = "call DWEV_coplevel >= 3 && lp_cair";
        vehicles[] =
		{
            { "B_Heli_Light_01_F", "call DWEV_coplevel >= 3" }, //Hummingbird
            { "I_Heli_light_03_unarmed_F", "(lp_swat && call DWEV_coplevel >= 3) || call DWEV_coplevel >= 4"}, //hellcat
			{ "B_Heli_Attack_01_F", "lp_swat && call DWEV_coplevel >= 3" }, // Blackfoot
			{ "B_Heli_Transport_03_unarmed_F", "(lp_swat && call DWEV_coplevel >= 5) || call DWEV_coplevel >= 5"}, // DLC Huron
			{ "O_Heli_Transport_04_F", "(lp_swat && call DWEV_coplevel >= 6) || call DWEV_coplevel >= 6"} // DLC Taru
        };
    };

    class cop_ship {
        side = "cop";
        conditions = "call DWEV_coplevel >= 1";
        vehicles[] = {
            { "B_Lifeboat", "" },
            { "C_Boat_Civil_01_police_F", "" },
            { "B_SDV_01_F", "" },
            { "B_Boat_Armed_01_minigun_F", "call DWEV_coplevel >= 3" }
        };
    };
};

class LifeCfgVehicles {
    /*
    *    Vehicle Configs (Contains textures and other stuff)
    *
    *    "price" is the price before any multipliers set in Master_Config are applied.
    *
    *    Default Multiplier Values & Calculations:
    *       Civilian [Purchase, Sell]: [1.0, 0.5]
    *       Cop [Purchase, Sell]: [0.5, 0.5]
    *       Medic [Purchase, Sell]: [0.75, 0.5]
    *       ChopShop: Payout = price * 0.25
    *       GarageSell: Payout = price * [0.5, 0.5, 0.5, -1]
    *       Cop Impound: Payout = price * 0.1
    *       Pull Vehicle from Garage: Cost = price * [1, 0.5, 0.75, -1] * [0.5, 0.5, 0.5, -1]
    *           -- Pull Vehicle & GarageSell Array Explanation = [civ,cop,medic,east]
    *
    *       1: STRING (Condition)
    *    Textures config follows { Texture Name, side, {texture(s)path}, Condition}
    *    Texture(s)path follows this format:
    *    INDEX 0: Texture Layer 0
    *    INDEX 1: Texture Layer 1
    *    INDEX 2: Texture Layer 2
    *    etc etc etc
    *
    */

    class Default {
        vItemSpace = -1;
        conditions = "";
        price = -1;
        textures[] = {};
    };

    class C_Boat_Transport_02_F{ // APEX RHIB Boat
        vItemSpace = 110;
        conditions = "";
        price = 50000;
		fee = 5000; 
        textures[] = {
            { "Schwarz", "civ", {
                "\A3\Boat_F_Exp\Boat_Transport_02\Data\Boat_Transport_02_exterior_CO.paa",
				"\A3\Boat_F_Exp\Boat_Transport_02\Data\Boat_Transport_02_interior_2_CO.paa"
            }, "" },
            { "Zivil", "civ", {
                "\A3\Boat_F_Exp\Boat_Transport_02\Data\Boat_Transport_02_exterior_civilian_CO.paa",
				"\A3\Boat_F_Exp\Boat_Transport_02\Data\Boat_Transport_02_interior_2_civilian_CO.paa"
            }, "" },
			{ "VIP-Blau-Camo", "vip_1", {
                "textures\vehicles\vip\camo_blau.paa",
				"textures\vehicles\vip\camo_blau.paa"
            }, "" },
			{ "VIP-Gelb-Camo", "vip_2", {
                "textures\vehicles\vip\camo_gelb.paa",
				"textures\vehicles\vip\camo_gelb.paa"
            }, "" },
			{ "VIP-Grau-Camo", "vip_3", {
                "textures\vehicles\vip\camo_grau.paa",
				"textures\vehicles\vip\camo_grau.paa"
            }, "" },
			{ "VIP-Hellgrün-Camo", "vip_2", {
                "textures\vehicles\vip\camo_gruen.paa",
				"textures\vehicles\vip\camo_gruen.paa"
            }, "" },
			{ "VIP-Pink-Camo", "vip_2", {
                "textures\vehicles\vip\camo_pink.paa",
				"textures\vehicles\vip\camo_pink.paa"
            }, "" },
			{ "VIP-Rot-Camo", "vip_1", {
                "textures\vehicles\vip\camo_rot.paa",
				"textures\vehicles\vip\camo_rot.paa"
            }, "" },
			{ "VIP-Dungelgrün-Camo", "vip_3", {
                "textures\vehicles\vip\camo_dunkelgruen.paa",
				"textures\vehicles\vip\camo_dunkelgruen.paa"
            }, "" },
			{ "VIP-Turquoise-Camo", "vip_3", {
                "textures\vehicles\vip\camo_hellblau.paa",
				"textures\vehicles\vip\camo_hellblau.paa"
            }, "" },
			{ "VIP-Lila-Camo", "vip_3", {
                "textures\vehicles\vip\camo_lila.paa",
				"textures\vehicles\vip\camo_lila.paa"
            }, "" },
			{ "VIP-Orange-Camo", "vip_3", {
                "textures\vehicles\vip\camo_orange.paa",
				"textures\vehicles\vip\camo_orange.paa"
            }, "" },
        };
    };
	
	class C_Offroad_02_unarmed_F {  // APEX MB 4WD
        vItemSpace = 55;
        conditions = "";
        price = 48000;
		fee = 3500;
        textures[] = {
            { "Schwarz", "civ", {
                "\A3\Soft_F_Exp\Offroad_02\Data\offroad_02_ext_black_co.paa"
            }, "" },
            { "Blau", "civ", {
                "\A3\Soft_F_Exp\Offroad_02\Data\offroad_02_ext_blue_co.paa"
            }, "" },
			{ "Braun", "civ", {
                "\A3\Soft_F_Exp\Offroad_02\Data\offroad_02_ext_brown_co.paa"
            }, "" },
            { "Grün", "civ", {
                "\A3\Soft_F_Exp\Offroad_02\Data\offroad_02_ext_green_co.paa"
            }, "" },
			{ "Olive", "civ", {
                "\A3\Soft_F_Exp\Offroad_02\Data\offroad_02_ext_olive_co.paa"
            }, "" },
            { "Orange", "civ", {
                "\A3\Soft_F_Exp\Offroad_02\Data\offroad_02_ext_orange_co.paa"
            }, "" },
            { "Rot", "civ", {
                "\A3\Soft_F_Exp\Offroad_02\Data\offroad_02_ext_red_co.paa"
            }, "" },
            { "Weis", "civ", {
                "\A3\Soft_F_Exp\Offroad_02\Data\offroad_02_ext_white_co.paa"
            }, "" },
			{ "VIP-Blau-Camo", "vip_1", {
                "textures\vehicles\vip\camo_blau.paa"
            }, "" },
			{ "VIP-Gelb-Camo", "vip_2", {
                "textures\vehicles\vip\camo_gelb.paa"
            }, "" },
			{ "VIP-Grau-Camo", "vip_3", {
                "textures\vehicles\vip\camo_grau.paa"
            }, "" },
			{ "VIP-Hellgrün-Camo", "vip_2", {
                "textures\vehicles\vip\camo_gruen.paa"
            }, "" },
			{ "VIP-Pink-Camo", "vip_2", {
                "textures\vehicles\vip\camo_pink.paa"
            }, "" },
			{ "VIP-Rot-Camo", "vip_1", {
                "textures\vehicles\vip\camo_rot.paa"
            }, "" },
			{ "VIP-Dungelgrün-Camo", "vip_3", {
                "textures\vehicles\vip\camo_dunkelgruen.paa"
            }, "" },
			{ "VIP-Turquoise-Camo", "vip_3", {
                "textures\vehicles\vip\camo_hellblau.paa"
            }, "" },
			{ "VIP-Lila-Camo", "vip_3", {
                "textures\vehicles\vip\camo_lila.paa"
            }, "" },
			{ "VIP-Orange-Camo", "vip_3", {
                "textures\vehicles\vip\camo_orange.paa"
            }, "" },
			{ "VIP-Blau-Camo-Blau", "vip_4", {
                "textures\vehicles\vip\camo_blau.paa",
				"textures\vehicles\vip\camo_blau.paa",
				"textures\vehicles\vip\camo_blau.paa"
            }, "" },
			{ "VIP-Blau-Camo-Gelb", "vip_4", {
                "textures\vehicles\vip\camo_blau.paa",
				"textures\vehicles\vip\camo_blau.paa",
				"textures\vehicles\vip\camo_gelb.paa"
            }, "" },
			{ "VIP-Blau-Camo-Grau", "vip_4", {
                "textures\vehicles\vip\camo_blau.paa",
				"textures\vehicles\vip\camo_blau.paa",
				"textures\vehicles\vip\camo_grau.paa"
            }, "" },
			{ "VIP-Blau-Camo-Hellgrün", "vip_4", {
                "textures\vehicles\vip\camo_blau.paa",
				"textures\vehicles\vip\camo_blau.paa",
				"textures\vehicles\vip\camo_gruen.paa"
            }, "" },
			{ "VIP-Blau-Camo-Pink", "vip_4", {
                "textures\vehicles\vip\camo_blau.paa",
				"textures\vehicles\vip\camo_blau.paa",
				"textures\vehicles\vip\camo_pink.paa"
            }, "" },
			{ "VIP-Blau-Camo-Rot", "vip_4", {
                "textures\vehicles\vip\camo_blau.paa",
				"textures\vehicles\vip\camo_blau.paa",
				"textures\vehicles\vip\camo_rot.paa"
            }, "" },
			{ "VIP-Blau-Camo-Dunkelgrün", "vip_4", {
                "textures\vehicles\vip\camo_blau.paa",
				"textures\vehicles\vip\camo_blau.paa",
				"textures\vehicles\vip\camo_dunkelgruen.paa"
            }, "" },
			{ "VIP-Blau-Camo-Turquoise", "vip_4", {
                "textures\vehicles\vip\camo_blau.paa",
				"textures\vehicles\vip\camo_blau.paa",
				"textures\vehicles\vip\camo_hellblau.paa"
            }, "" },
			{ "VIP-Blau-Camo-Lila", "vip_4", {
                "textures\vehicles\vip\camo_blau.paa",
				"textures\vehicles\vip\camo_blau.paa",
				"textures\vehicles\vip\camo_lila.paa"
            }, "" },
			{ "VIP-Blau-Camo-Orange", "vip_4", {
                "textures\vehicles\vip\camo_blau.paa",
				"textures\vehicles\vip\camo_blau.paa",
				"textures\vehicles\vip\camo_orange.paa"
            }, "" },
			{ "VIP-Blau-Camo-Schwarz", "vip_4", {
                "textures\vehicles\vip\camo_blau.paa",
				"textures\vehicles\vip\camo_blau.paa",
				"#(ai,64,64,1)Fresnel(1.3,7)"
            }, "" },
			{ "VIP-Gelb-Camo-Blau", "vip_4", {
                "textures\vehicles\vip\camo_gelb.paa",
				"textures\vehicles\vip\camo_gelb.paa",
				"textures\vehicles\vip\camo_blau.paa"
            }, "" },
			{ "VIP-Gelb-Camo-Gelb", "vip_4", {
                "textures\vehicles\vip\camo_gelb.paa",
				"textures\vehicles\vip\camo_gelb.paa",
				"textures\vehicles\vip\camo_gelb.paa"
            }, "" },
			{ "VIP-Gelb-Camo-Grau", "vip_4", {
                "textures\vehicles\vip\camo_gelb.paa",
				"textures\vehicles\vip\camo_gelb.paa",
				"textures\vehicles\vip\camo_grau.paa"
            }, "" },
			{ "VIP-Gelb-Camo-Hellgrün", "vip_4", {
                "textures\vehicles\vip\camo_gelb.paa",
				"textures\vehicles\vip\camo_gelb.paa",
				"textures\vehicles\vip\camo_gruen.paa"
            }, "" },
			{ "VIP-Gelb-Camo-Pink", "vip_4", {
                "textures\vehicles\vip\camo_gelb.paa",
				"textures\vehicles\vip\camo_gelb.paa",
				"textures\vehicles\vip\camo_pink.paa"
            }, "" },
			{ "VIP-Gelb-Camo-Rot", "vip_4", {
                "textures\vehicles\vip\camo_gelb.paa",
				"textures\vehicles\vip\camo_gelb.paa",
				"textures\vehicles\vip\camo_rot.paa"
            }, "" },
			{ "VIP-Gelb-Camo-Dunkelgrün", "vip_4", {
                "textures\vehicles\vip\camo_gelb.paa",
				"textures\vehicles\vip\camo_gelb.paa",
				"textures\vehicles\vip\camo_dunkelgruen.paa"
            }, "" },
			{ "VIP-Gelb-Camo-Turquoise", "vip_4", {
                "textures\vehicles\vip\camo_gelb.paa",
				"textures\vehicles\vip\camo_gelb.paa",
				"textures\vehicles\vip\camo_hellblau.paa"
            }, "" },
			{ "VIP-Gelb-Camo-Lila", "vip_4", {
                "textures\vehicles\vip\camo_gelb.paa",
				"textures\vehicles\vip\camo_gelb.paa",
				"textures\vehicles\vip\camo_lila.paa"
            }, "" },
			{ "VIP-Gelb-Camo-Orange", "vip_4", {
                "textures\vehicles\vip\camo_gelb.paa",
				"textures\vehicles\vip\camo_gelb.paa",
				"textures\vehicles\vip\camo_orange.paa"
            }, "" },
			{ "VIP-Gelb-Camo-Schwarz", "vip_4", {
                "textures\vehicles\vip\camo_gelb.paa",
				"textures\vehicles\vip\camo_gelb.paa",
				"#(ai,64,64,1)Fresnel(1.3,7)"
            }, "" },
			{ "VIP-Grau-Camo-Blau", "vip_4", {
                "textures\vehicles\vip\camo_grau.paa",
				"textures\vehicles\vip\camo_grau.paa",
				"textures\vehicles\vip\camo_grau.paa"
            }, "" },
			{ "VIP-Grau-Camo-Gelb", "vip_4", {
                "textures\vehicles\vip\camo_grau.paa",
				"textures\vehicles\vip\camo_grau.paa",
				"textures\vehicles\vip\camo_gelb.paa"
            }, "" },
			{ "VIP-Grau-Camo-Grau", "vip_4", {
                "textures\vehicles\vip\camo_grau.paa",
				"textures\vehicles\vip\camo_grau.paa",
				"textures\vehicles\vip\camo_grau.paa"
            }, "" },
			{ "VIP-Grau-Camo-Hellgrün", "vip_4", {
                "textures\vehicles\vip\camo_grau.paa",
				"textures\vehicles\vip\camo_grau.paa",
				"textures\vehicles\vip\camo_gruen.paa"
            }, "" },
			{ "VIP-Grau-Camo-Pink", "vip_4", {
                "textures\vehicles\vip\camo_grau.paa",
				"textures\vehicles\vip\camo_grau.paa",
				"textures\vehicles\vip\camo_pink.paa"
            }, "" },
			{ "VIP-Grau-Camo-Rot", "vip_4", {
                "textures\vehicles\vip\camo_grau.paa",
				"textures\vehicles\vip\camo_grau.paa",
				"textures\vehicles\vip\camo_rot.paa"
            }, "" },
			{ "VIP-Grau-Camo-Dunkelgrün", "vip_4", {
                "textures\vehicles\vip\camo_grau.paa",
				"textures\vehicles\vip\camo_grau.paa",
				"textures\vehicles\vip\camo_dunkelgruen.paa"
            }, "" },
			{ "VIP-Grau-Camo-Turquoise", "vip_4", {
                "textures\vehicles\vip\camo_grau.paa",
				"textures\vehicles\vip\camo_grau.paa",
				"textures\vehicles\vip\camo_hellblau.paa"
            }, "" },
			{ "VIP-Grau-Camo-Lila", "vip_4", {
                "textures\vehicles\vip\camo_grau.paa",
				"textures\vehicles\vip\camo_grau.paa",
				"textures\vehicles\vip\camo_lila.paa"
            }, "" },
			{ "VIP-Grau-Camo-Orange", "vip_4", {
                "textures\vehicles\vip\camo_grau.paa",
				"textures\vehicles\vip\camo_grau.paa",
				"textures\vehicles\vip\camo_orange.paa"
            }, "" },
			{ "VIP-Grau-Camo-Schwarz", "vip_4", {
                "textures\vehicles\vip\camo_grau.paa",
				"textures\vehicles\vip\camo_grau.paa",
				"#(ai,64,64,1)Fresnel(1.3,7)"
            }, "" },
			{ "VIP-Hellgrün-Camo-Blau", "vip_4", {
                "textures\vehicles\vip\camo_gruen.paa",
				"textures\vehicles\vip\camo_gruen.paa",
				"textures\vehicles\vip\camo_blau.paa"
            }, "" },
			{ "VIP-Hellgrün-Camo-Gelb", "vip_4", {
                "textures\vehicles\vip\camo_gruen.paa",
				"textures\vehicles\vip\camo_gruen.paa",
				"textures\vehicles\vip\camo_gelb.paa"
            }, "" },
			{ "VIP-Hellgrün-Camo-Grau", "vip_4", {
                "textures\vehicles\vip\camo_gruen.paa",
				"textures\vehicles\vip\camo_gruen.paa",
				"textures\vehicles\vip\camo_grau.paa"
            }, "" },
			{ "VIP-Hellgrün-Camo-Hellgrün", "vip_4", {
                "textures\vehicles\vip\camo_gruen.paa",
				"textures\vehicles\vip\camo_gruen.paa",
				"textures\vehicles\vip\camo_gruen.paa"
            }, "" },
			{ "VIP-Hellgrün-Camo-Pink", "vip_4", {
                "textures\vehicles\vip\camo_gruen.paa",
				"textures\vehicles\vip\camo_gruen.paa",
				"textures\vehicles\vip\camo_pink.paa"
            }, "" },
			{ "VIP-Hellgrün-Camo-Rot", "vip_4", {
                "textures\vehicles\vip\camo_gruen.paa",
				"textures\vehicles\vip\camo_gruen.paa",
				"textures\vehicles\vip\camo_rot.paa"
            }, "" },
			{ "VIP-Hellgrün-Camo-Dunkelgrün", "vip_4", {
                "textures\vehicles\vip\camo_gruen.paa",
				"textures\vehicles\vip\camo_gruen.paa",
				"textures\vehicles\vip\camo_dunkelgruen.paa"
            }, "" },
			{ "VIP-Hellgrün-Camo-Turquoise", "vip_4", {
                "textures\vehicles\vip\camo_gruen.paa",
				"textures\vehicles\vip\camo_gruen.paa",
				"textures\vehicles\vip\camo_hellblau.paa"
            }, "" },
			{ "VIP-Hellgrün-Camo-Lila", "vip_4", {
                "textures\vehicles\vip\camo_gruen.paa",
				"textures\vehicles\vip\camo_gruen.paa",
				"textures\vehicles\vip\camo_lila.paa"
            }, "" },
			{ "VIP-Hellgrün-Camo-Orange", "vip_4", {
                "textures\vehicles\vip\camo_gruen.paa",
				"textures\vehicles\vip\camo_gruen.paa",
				"textures\vehicles\vip\camo_orange.paa"
            }, "" },
			{ "VIP-Hellgrün-Camo-Schwarz", "vip_4", {
                "textures\vehicles\vip\camo_gruen.paa",
				"textures\vehicles\vip\camo_gruen.paa",
				"#(ai,64,64,1)Fresnel(1.3,7)"
            }, "" },
			{ "VIP-Pink-Camo-Blau", "vip_4", {
                "textures\vehicles\vip\camo_pink.paa",
				"textures\vehicles\vip\camo_pink.paa",
				"textures\vehicles\vip\camo_blau.paa"
            }, "" },
			{ "VIP-Pink-Camo-Gelb", "vip_4", {
                "textures\vehicles\vip\camo_pink.paa",
				"textures\vehicles\vip\camo_pink.paa",
				"textures\vehicles\vip\camo_gelb.paa"
            }, "" },
			{ "VIP-Pink-Camo-Grau", "vip_4", {
                "textures\vehicles\vip\camo_pink.paa",
				"textures\vehicles\vip\camo_pink.paa",
				"textures\vehicles\vip\camo_grau.paa"
            }, "" },
			{ "VIP-Pink-Camo-Hellgrün", "vip_4", {
                "textures\vehicles\vip\camo_pink.paa",
				"textures\vehicles\vip\camo_pink.paa",
				"textures\vehicles\vip\camo_gruen.paa"
            }, "" },
			{ "VIP-Pink-Camo-Pink", "vip_4", {
                "textures\vehicles\vip\camo_pink.paa",
				"textures\vehicles\vip\camo_pink.paa",
				"textures\vehicles\vip\camo_pink.paa"
            }, "" },
			{ "VIP-Pink-Camo-Rot", "vip_4", {
                "textures\vehicles\vip\camo_pink.paa",
				"textures\vehicles\vip\camo_pink.paa",
				"textures\vehicles\vip\camo_rot.paa"
            }, "" },
			{ "VIP-Pink-Camo-Dunkelgrün", "vip_4", {
                "textures\vehicles\vip\camo_pink.paa",
				"textures\vehicles\vip\camo_pink.paa",
				"textures\vehicles\vip\camo_dunkelgruen.paa"
            }, "" },
			{ "VIP-Pink-Camo-Turquoise", "vip_4", {
                "textures\vehicles\vip\camo_pink.paa",
				"textures\vehicles\vip\camo_pink.paa",
				"textures\vehicles\vip\camo_hellblau.paa"
            }, "" },
			{ "VIP-Pink-Camo-Lila", "vip_4", {
                "textures\vehicles\vip\camo_pink.paa",
				"textures\vehicles\vip\camo_pink.paa",
				"textures\vehicles\vip\camo_lila.paa"
            }, "" },
			{ "VIP-Pink-Camo-Orange", "vip_4", {
                "textures\vehicles\vip\camo_pink.paa",
				"textures\vehicles\vip\camo_pink.paa",
				"textures\vehicles\vip\camo_orange.paa"
            }, "" },
			{ "VIP-Pink-Camo-Schwarz", "vip_4", {
                "textures\vehicles\vip\camo_pink.paa",
				"textures\vehicles\vip\camo_pink.paa",
				"#(ai,64,64,1)Fresnel(1.3,7)"
            }, "" },
			{ "VIP-Rot-Camo-Blau", "vip_4", {
                "textures\vehicles\vip\camo_rot.paa",
				"textures\vehicles\vip\camo_rot.paa",
				"textures\vehicles\vip\camo_blau.paa"
            }, "" },
			{ "VIP-Rot-Camo-Gelb", "vip_4", {
                "textures\vehicles\vip\camo_rot.paa",
				"textures\vehicles\vip\camo_rot.paa",
				"textures\vehicles\vip\camo_gelb.paa"
            }, "" },
			{ "VIP-Rot-Camo-Grau", "vip_4", {
                "textures\vehicles\vip\camo_rot.paa",
				"textures\vehicles\vip\camo_rot.paa",
				"textures\vehicles\vip\camo_grau.paa"
            }, "" },
			{ "VIP-Rot-Camo-Hellgrün", "vip_4", {
                "textures\vehicles\vip\camo_rot.paa",
				"textures\vehicles\vip\camo_rot.paa",
				"textures\vehicles\vip\camo_gruen.paa"
            }, "" },
			{ "VIP-Rot-Camo-Pink", "vip_4", {
                "textures\vehicles\vip\camo_rot.paa",
				"textures\vehicles\vip\camo_rot.paa",
				"textures\vehicles\vip\camo_pink.paa"
            }, "" },
			{ "VIP-Rot-Camo-Rot", "vip_4", {
                "textures\vehicles\vip\camo_rot.paa",
				"textures\vehicles\vip\camo_rot.paa",
				"textures\vehicles\vip\camo_rot.paa"
            }, "" },
			{ "VIP-Rot-Camo-Dunkelgrün", "vip_4", {
                "textures\vehicles\vip\camo_rot.paa",
				"textures\vehicles\vip\camo_rot.paa",
				"textures\vehicles\vip\camo_dunkelgruen.paa"
            }, "" },
			{ "VIP-Rot-Camo-Turquoise", "vip_4", {
                "textures\vehicles\vip\camo_rot.paa",
				"textures\vehicles\vip\camo_rot.paa",
				"textures\vehicles\vip\camo_hellblau.paa"
            }, "" },
			{ "VIP-Rot-Camo-Lila", "vip_4", {
                "textures\vehicles\vip\camo_rot.paa",
				"textures\vehicles\vip\camo_rot.paa",
				"textures\vehicles\vip\camo_lila.paa"
            }, "" },
			{ "VIP-Rot-Camo-Orange", "vip_4", {
                "textures\vehicles\vip\camo_rot.paa",
				"textures\vehicles\vip\camo_rot.paa",
				"textures\vehicles\vip\camo_orange.paa"
            }, "" },
			{ "VIP-Rot-Camo-Schwarz", "vip_4", {
                "textures\vehicles\vip\camo_rot.paa",
				"textures\vehicles\vip\camo_rot.paa",
				"#(ai,64,64,1)Fresnel(1.3,7)"
            }, "" },
			{ "VIP-Dunkelgrün-Camo-Blau", "vip_4", {
                "textures\vehicles\vip\camo_dunkelgruen.paa",
				"textures\vehicles\vip\camo_dunkelgruen.paa",
				"textures\vehicles\vip\camo_blau.paa"
            }, "" },
			{ "VIP-Dunkelgrün-Camo-Gelb", "vip_4", {
                "textures\vehicles\vip\camo_dunkelgruen.paa",
				"textures\vehicles\vip\camo_dunkelgruen.paa",
				"textures\vehicles\vip\camo_gelb.paa"
            }, "" },
			{ "VIP-Dunkelgrün-Camo-Grau", "vip_4", {
                "textures\vehicles\vip\camo_dunkelgruen.paa",
				"textures\vehicles\vip\camo_dunkelgruen.paa",
				"textures\vehicles\vip\camo_grau.paa"
            }, "" },
			{ "VIP-Dunkelgrün-Camo-Hellgrün", "vip_4", {
                "textures\vehicles\vip\camo_dunkelgruen.paa",
				"textures\vehicles\vip\camo_dunkelgruen.paa",
				"textures\vehicles\vip\camo_gruen.paa"
            }, "" },
			{ "VIP-Dunkelgrün-Camo-Pink", "vip_4", {
                "textures\vehicles\vip\camo_dunkelgruen.paa",
				"textures\vehicles\vip\camo_dunkelgruen.paa",
				"textures\vehicles\vip\camo_pink.paa"
            }, "" },
			{ "VIP-Dunkelgrün-Camo-Rot", "vip_4", {
                "textures\vehicles\vip\camo_dunkelgruen.paa",
				"textures\vehicles\vip\camo_dunkelgruen.paa",
				"textures\vehicles\vip\camo_rot.paa"
            }, "" },
			{ "VIP-Dunkelgrün-Camo-Dunkelgrün", "vip_4", {
                "textures\vehicles\vip\camo_dunkelgruen.paa",
				"textures\vehicles\vip\camo_dunkelgruen.paa",
				"textures\vehicles\vip\camo_dunkelgruen.paa"
            }, "" },
			{ "VIP-Dunkelgrün-Camo-Turquoise", "vip_4", {
                "textures\vehicles\vip\camo_dunkelgruen.paa",
				"textures\vehicles\vip\camo_dunkelgruen.paa",
				"textures\vehicles\vip\camo_hellblau.paa"
            }, "" },
			{ "VIP-Dunkelgrün-Camo-Lila", "vip_4", {
                "textures\vehicles\vip\camo_dunkelgruen.paa",
				"textures\vehicles\vip\camo_dunkelgruen.paa",
				"textures\vehicles\vip\camo_lila.paa"
            }, "" },
			{ "VIP-Dunkelgrün-Camo-Orange", "vip_4", {
                "textures\vehicles\vip\camo_dunkelgruen.paa",
				"textures\vehicles\vip\camo_dunkelgruen.paa",
				"textures\vehicles\vip\camo_orange.paa"
            }, "" },
			{ "VIP-Dunkelgrün-Camo-Schwarz", "vip_4", {
                "textures\vehicles\vip\camo_dunkelgruen.paa",
				"textures\vehicles\vip\camo_dunkelgruen.paa",
				"#(ai,64,64,1)Fresnel(1.3,7)"
            }, "" },
			{ "VIP-Turquoise-Camo-Blau", "vip_4", {
                "textures\vehicles\vip\camo_hellblau.paa",
				"textures\vehicles\vip\camo_hellblau.paa",
				"textures\vehicles\vip\camo_blau.paa"
            }, "" },
			{ "VIP-Turquoise-Camo-Gelb", "vip_4", {
                "textures\vehicles\vip\camo_hellblau.paa",
				"textures\vehicles\vip\camo_hellblau.paa",
				"textures\vehicles\vip\camo_gelb.paa"
            }, "" },
			{ "VIP-Turquoise-Camo-Grau", "vip_4", {
                "textures\vehicles\vip\camo_hellblau.paa",
				"textures\vehicles\vip\camo_hellblau.paa",
				"textures\vehicles\vip\camo_grau.paa"
            }, "" },
			{ "VIP-Turquoise-Camo-Hellgrün", "vip_4", {
                "textures\vehicles\vip\camo_hellblau.paa",
				"textures\vehicles\vip\camo_hellblau.paa",
				"textures\vehicles\vip\camo_gruen.paa"
            }, "" },
			{ "VIP-Turquoise-Camo-Pink", "vip_4", {
                "textures\vehicles\vip\camo_hellblau.paa",
				"textures\vehicles\vip\camo_hellblau.paa",
				"textures\vehicles\vip\camo_pink.paa"
            }, "" },
			{ "VIP-Turquoise-Camo-Rot", "vip_4", {
                "textures\vehicles\vip\camo_hellblau.paa",
				"textures\vehicles\vip\camo_hellblau.paa",
				"textures\vehicles\vip\camo_rot.paa"
            }, "" },
			{ "VIP-Turquoise-Camo-Dunkelgrün", "vip_4", {
                "textures\vehicles\vip\camo_hellblau.paa",
				"textures\vehicles\vip\camo_hellblau.paa",
				"textures\vehicles\vip\camo_dunkelgruen.paa"
            }, "" },
			{ "VIP-Turquoise-Camo-Turquoise", "vip_4", {
                "textures\vehicles\vip\camo_hellblau.paa",
				"textures\vehicles\vip\camo_hellblau.paa",
				"textures\vehicles\vip\camo_hellblau.paa"
            }, "" },
			{ "VIP-Turquoise-Camo-Lila", "vip_4", {
                "textures\vehicles\vip\camo_hellblau.paa",
				"textures\vehicles\vip\camo_hellblau.paa",
				"textures\vehicles\vip\camo_lila.paa"
            }, "" },
			{ "VIP-Turquoise-Camo-Orange", "vip_4", {
                "textures\vehicles\vip\camo_hellblau.paa",
				"textures\vehicles\vip\camo_hellblau.paa",
				"textures\vehicles\vip\camo_orange.paa"
            }, "" },
			{ "VIP-Turquoise-Camo-Schwarz", "vip_4", {
                "textures\vehicles\vip\camo_hellblau.paa",
				"textures\vehicles\vip\camo_hellblau.paa",
				"#(ai,64,64,1)Fresnel(1.3,7)"
            }, "" },
			{ "VIP-Lila-Camo-Blau", "vip_4", {
                "textures\vehicles\vip\camo_lila.paa",
				"textures\vehicles\vip\camo_lila.paa",
				"textures\vehicles\vip\camo_blau.paa"
            }, "" },
			{ "VIP-Lila-Camo-Gelb", "vip_4", {
                "textures\vehicles\vip\camo_lila.paa",
				"textures\vehicles\vip\camo_lila.paa",
				"textures\vehicles\vip\camo_gelb.paa"
            }, "" },
			{ "VIP-Lila-Camo-Grau", "vip_4", {
                "textures\vehicles\vip\camo_lila.paa",
				"textures\vehicles\vip\camo_lila.paa",
				"textures\vehicles\vip\camo_grau.paa"
            }, "" },
			{ "VIP-Lila-Camo-Hellgrün", "vip_4", {
                "textures\vehicles\vip\camo_lila.paa",
				"textures\vehicles\vip\camo_lila.paa",
				"textures\vehicles\vip\camo_gruen.paa"
            }, "" },
			{ "VIP-Lila-Camo-Pink", "vip_4", {
                "textures\vehicles\vip\camo_lila.paa",
				"textures\vehicles\vip\camo_lila.paa",
				"textures\vehicles\vip\camo_pink.paa"
            }, "" },
			{ "VIP-Lila-Camo-Rot", "vip_4", {
                "textures\vehicles\vip\camo_lila.paa",
				"textures\vehicles\vip\camo_lila.paa",
				"textures\vehicles\vip\camo_rot.paa"
            }, "" },
			{ "VIP-Lila-Camo-Dunkelgrün", "vip_4", {
                "textures\vehicles\vip\camo_lila.paa",
				"textures\vehicles\vip\camo_lila.paa",
				"textures\vehicles\vip\camo_dunkelgruen.paa"
            }, "" },
			{ "VIP-Lila-Camo-Turquoise", "vip_4", {
                "textures\vehicles\vip\camo_lila.paa",
				"textures\vehicles\vip\camo_lila.paa",
				"textures\vehicles\vip\camo_hellblau.paa"
            }, "" },
			{ "VIP-Lila-Camo-Lila", "vip_4", {
                "textures\vehicles\vip\camo_lila.paa",
				"textures\vehicles\vip\camo_lila.paa",
				"textures\vehicles\vip\camo_lila.paa"
            }, "" },
			{ "VIP-Lila-Camo-Orange", "vip_4", {
                "textures\vehicles\vip\camo_lila.paa",
				"textures\vehicles\vip\camo_lila.paa",
				"textures\vehicles\vip\camo_orange.paa"
            }, "" },
			{ "VIP-Lila-Camo-Schwarz", "vip_4", {
                "textures\vehicles\vip\camo_lila.paa",
				"textures\vehicles\vip\camo_lila.paa",
				"#(ai,64,64,1)Fresnel(1.3,7)"
            }, "" },
			{ "VIP-Orange-Camo-Blau", "vip_4", {
                "textures\vehicles\vip\camo_orange.paa",
				"textures\vehicles\vip\camo_orange.paa",
				"textures\vehicles\vip\camo_orange.paa"
            }, "" },
			{ "VIP-Orange-Camo-Gelb", "vip_4", {
                "textures\vehicles\vip\camo_orange.paa",
				"textures\vehicles\vip\camo_orange.paa",
				"textures\vehicles\vip\camo_gelb.paa"
            }, "" },
			{ "VIP-Orange-Camo-Grau", "vip_4", {
                "textures\vehicles\vip\camo_orange.paa",
				"textures\vehicles\vip\camo_orange.paa",
				"textures\vehicles\vip\camo_grau.paa"
            }, "" },
			{ "VIP-Orange-Camo-Hellgrün", "vip_4", {
                "textures\vehicles\vip\camo_orange.paa",
				"textures\vehicles\vip\camo_orange.paa",
				"textures\vehicles\vip\camo_gruen.paa"
            }, "" },
			{ "VIP-Orange-Camo-Pink", "vip_4", {
                "textures\vehicles\vip\camo_orange.paa",
				"textures\vehicles\vip\camo_orange.paa",
				"textures\vehicles\vip\camo_pink.paa"
            }, "" },
			{ "VIP-Orange-Camo-Rot", "vip_4", {
                "textures\vehicles\vip\camo_orange.paa",
				"textures\vehicles\vip\camo_orange.paa",
				"textures\vehicles\vip\camo_rot.paa"
            }, "" },
			{ "VIP-Orange-Camo-Dunkelgrün", "vip_4", {
                "textures\vehicles\vip\camo_orange.paa",
				"textures\vehicles\vip\camo_orange.paa",
				"textures\vehicles\vip\camo_dunkelgruen.paa"
            }, "" },
			{ "VIP-Orange-Camo-Turquoise", "vip_4", {
				"textures\vehicles\vip\camo_orange.paa",
				"textures\vehicles\vip\camo_orange.paa",
				"textures\vehicles\vip\camo_hellblau.paa"
            }, "" },
			{ "VIP-Orange-Camo-Lila", "vip_4", {
                "textures\vehicles\vip\camo_orange.paa",
				"textures\vehicles\vip\camo_orange.paa",
				"textures\vehicles\vip\camo_lila.paa"
            }, "" },
			{ "VIP-Orange-Camo-Orange", "vip_4", {
                "textures\vehicles\vip\camo_orange.paa",
				"textures\vehicles\vip\camo_orange.paa",
				"textures\vehicles\vip\camo_orange.paa"
            }, "" },
			{ "VIP-Orange-Camo-Schwarz", "vip_4", {
                "textures\vehicles\vip\camo_orange.paa",
				"textures\vehicles\vip\camo_orange.paa",
				"#(ai,64,64,1)Fresnel(1.3,7)"
            }, "" },
        };
    };
	
    class C_Plane_Civil_01_F { // APEX Cessna
        vItemSpace = 10;
        conditions = "";
        price = 750000;
		fee = 20000;
        textures[] = {
            { "Racing (Tan Interior)", "VIP_2", {
                "A3\Air_F_Exp\Plane_Civil_01\Data\btt_ext_01_Racer_co.paa",
                "A3\Air_F_Exp\Plane_Civil_01\Data\btt_ext_02_Racer_co.paa",
                "A3\Air_F_Exp\Plane_Civil_01\Data\btt_int_01_tan_co.paa",
                "A3\Air_F_Exp\Plane_Civil_01\Data\btt_int_02_tan_co.paa"
            }, "" },
            { "Racing", "VIP_1", {
                "A3\Air_F_Exp\Plane_Civil_01\Data\btt_ext_01_Racer_co.paa",
                "A3\Air_F_Exp\Plane_Civil_01\Data\btt_ext_02_Racer_co.paa",
                "A3\Air_F_Exp\Plane_Civil_01\Data\btt_int_01_co.paa",
                "A3\Air_F_Exp\Plane_Civil_01\Data\btt_int_02_co.paa"
            }, "" },
            { "Red Line (Tan Interior)", "VIP_1", {
                "A3\Air_F_Exp\Plane_Civil_01\Data\btt_ext_01_RedLine_co.paa",
                "A3\Air_F_Exp\Plane_Civil_01\Data\btt_ext_02_RedLine_co.paa",
                "A3\Air_F_Exp\Plane_Civil_01\Data\btt_int_01_tan_co.paa",
                "A3\Air_F_Exp\Plane_Civil_01\Data\btt_int_02_tan_co.paa"
            }, "" },
            { "Red Line", "civ", {
                "A3\Air_F_Exp\Plane_Civil_01\Data\btt_ext_01_RedLine_co.paa",
                "A3\Air_F_Exp\Plane_Civil_01\Data\btt_ext_02_RedLine_co.paa",
                "A3\Air_F_Exp\Plane_Civil_01\Data\btt_int_01_co.paa",
                "A3\Air_F_Exp\Plane_Civil_01\Data\btt_int_02_co.paa"
            }, "" },
            { "Tribal (Tan Interior)", "VIP_2", {
                "A3\Air_F_Exp\Plane_Civil_01\Data\btt_ext_01_Tribal_co.paa",
                "A3\Air_F_Exp\Plane_Civil_01\Data\btt_ext_02_Tribal_co.paa",
                "A3\Air_F_Exp\Plane_Civil_01\Data\btt_int_01_tan_co.paa",
                "A3\Air_F_Exp\Plane_Civil_01\Data\btt_int_02_tan_co.paa"
            }, "" },
            { "Tribal", "VIP_1", {
                "A3\Air_F_Exp\Plane_Civil_01\Data\btt_ext_01_Tribal_co.paa",
                "A3\Air_F_Exp\Plane_Civil_01\Data\btt_ext_02_Tribal_co.paa",
                "A3\Air_F_Exp\Plane_Civil_01\Data\btt_int_01_co.paa",
                "A3\Air_F_Exp\Plane_Civil_01\Data\btt_int_02_co.paa"
            }, "" },
            { "Blue Wave (Tan Interior)", "VIP_2", {
                "A3\Air_F_Exp\Plane_Civil_01\Data\btt_ext_01_Wave_co.paa",
                "A3\Air_F_Exp\Plane_Civil_01\Data\btt_ext_02_Wave_co.paa",
                "A3\Air_F_Exp\Plane_Civil_01\Data\btt_int_01_tan_co.paa",
                "A3\Air_F_Exp\Plane_Civil_01\Data\btt_int_02_tan_co.paa"
            }, "" },
            { "Blue Wave", "civ", {
                "A3\Air_F_Exp\Plane_Civil_01\Data\btt_ext_01_Wave_co.paa",
                "A3\Air_F_Exp\Plane_Civil_01\Data\btt_ext_02_Wave_co.paa",
                "A3\Air_F_Exp\Plane_Civil_01\Data\btt_int_01_co.paa",
                "A3\Air_F_Exp\Plane_Civil_01\Data\btt_int_02_co.paa"
            }, "" },
			{ "VIP-Blau-Camo", "vip_1", {
                "textures\vehicles\vip\camo_blau.paa",
				"textures\vehicles\vip\camo_blau.paa",
				"textures\vehicles\vip\camo_blau.paa"
            }, "" },
			{ "VIP-Gelb-Camo", "vip_2", {
                "textures\vehicles\vip\camo_gelb.paa",
				"textures\vehicles\vip\camo_gelb.paa",
				"textures\vehicles\vip\camo_gelb.paa"
            }, "" },
			{ "VIP-Grau-Camo", "vip_3", {
                "textures\vehicles\vip\camo_grau.paa",
				"textures\vehicles\vip\camo_grau.paa",
				"textures\vehicles\vip\camo_grau.paa"
            }, "" },
			{ "VIP-Hellgrün-Camo", "vip_2", {
                "textures\vehicles\vip\camo_gruen.paa",
				"textures\vehicles\vip\camo_gruen.paa",
				"textures\vehicles\vip\camo_gruen.paa"
            }, "" },
			{ "VIP-Pink-Camo", "vip_2", {
                "textures\vehicles\vip\camo_pink.paa",
				"textures\vehicles\vip\camo_pink.paa",
				"textures\vehicles\vip\camo_pink.paa"
            }, "" },
			{ "VIP-Rot-Camo", "vip_1", {
                "textures\vehicles\vip\camo_rot.paa",
				"textures\vehicles\vip\camo_rot.paa",
				"textures\vehicles\vip\camo_rot.paa"
            }, "" },
			{ "VIP-Dungelgrün-Camo", "vip_3", {
                "textures\vehicles\vip\camo_dunkelgruen.paa",
				"textures\vehicles\vip\camo_dunkelgruen.paa",
				"textures\vehicles\vip\camo_dunkelgruen.paa"
            }, "" },
			{ "VIP-Turquoise-Camo", "vip_3", {
                "textures\vehicles\vip\camo_hellblau.paa",
				"textures\vehicles\vip\camo_hellblau.paa",
				"textures\vehicles\vip\camo_hellblau.paa"
            }, "" },
			{ "VIP-Lila-Camo", "vip_3", {
                "textures\vehicles\vip\camo_lila.paa",
				"textures\vehicles\vip\camo_lila.paa",
				"textures\vehicles\vip\camo_lila.paa"
            }, "" },
			{ "VIP-Orange-Camo", "vip_3", {
                "textures\vehicles\vip\camo_orange.paa",
				"textures\vehicles\vip\camo_orange.paa",
				"textures\vehicles\vip\camo_orange.paa"
            }, "" },
        };
    };

    class C_Scooter_Transport_01_F { // APEX JetSki
        vItemSpace = 10;
        conditions = "";
        price = 12000;
		fee = 1500;
        textures[] = {
            { "Schwarz", "civ", {
                "\A3\Boat_F_Exp\Scooter_Transport_01\Data\Scooter_Transport_01_Black_CO.paa",
                "\A3\Boat_F_Exp\Scooter_Transport_01\Data\Scooter_Transport_01_VP_Black_CO.paa"
            }, "" },
            { "Blau", "civ", {
                "\A3\Boat_F_Exp\Scooter_Transport_01\Data\Scooter_Transport_01_Blue_co.paa",
                "\A3\Boat_F_Exp\Scooter_Transport_01\Data\Scooter_Transport_01_VP_Blue_co.paa"
            }, "" },
            { "Grau", "civ", {
                "\A3\Boat_F_Exp\Scooter_Transport_01\Data\Scooter_Transport_01_Grey_co.paa",
                "\A3\Boat_F_Exp\Scooter_Transport_01\Data\Scooter_Transport_01_VP_Grey_co.paa"
            }, "" },
            { "Grün", "VIP_1", {
                "\A3\Boat_F_Exp\Scooter_Transport_01\Data\Scooter_Transport_01_Lime_co.paa",
                "\A3\Boat_F_Exp\Scooter_Transport_01\Data\Scooter_Transport_01_VP_Lime_co.paa"
            }, "" },
            { "Rot", "civ", {
                "\A3\Boat_F_Exp\Scooter_Transport_01\Data\Scooter_Transport_01_Red_CO.paa",
                "\A3\Boat_F_Exp\Scooter_Transport_01\Data\Scooter_Transport_01_VP_CO.paa"
            }, "" },
            { "Weis", "VIP_1", {
                "\A3\Boat_F_Exp\Scooter_Transport_01\Data\Scooter_Transport_01_CO.paa",
                "\A3\Boat_F_Exp\Scooter_Transport_01\Data\Scooter_Transport_01_VP_CO.paa"
            }, "" },
            { "Gelb", "civ", {
                "\A3\Boat_F_Exp\Scooter_Transport_01\Data\Scooter_Transport_01_Yellow_CO.paa",
                "\A3\Boat_F_Exp\Scooter_Transport_01\Data\Scooter_Transport_01_VP_Yellow_CO.paa"
            }, "" },
			{ "VIP-Blau-Camo", "vip_1", {
                "textures\vehicles\vip\camo_blau.paa"
            }, "" },
			{ "VIP-Gelb-Camo", "vip_2", {
                "textures\vehicles\vip\camo_gelb.paa"
            }, "" },
			{ "VIP-Grau-Camo", "vip_3", {
                "textures\vehicles\vip\camo_grau.paa"
            }, "" },
			{ "VIP-Hellgrün-Camo", "vip_2", {
                "textures\vehicles\vip\camo_gruen.paa"
            }, "" },
			{ "VIP-Pink-Camo", "vip_2", {
                "textures\vehicles\vip\camo_pink.paa"
            }, "" },
			{ "VIP-Rot-Camo", "vip_1", {
                "textures\vehicles\vip\camo_rot.paa"
            }, "" },
			{ "VIP-Dungelgrün-Camo", "vip_3", {
                "textures\vehicles\vip\camo_dunkelgruen.paa"
            }, "" },
			{ "VIP-Turquoise-Camo", "vip_3", {
                "textures\vehicles\vip\camo_hellblau.paa"
            }, "" },
			{ "VIP-Lila-Camo", "vip_3", {
                "textures\vehicles\vip\camo_lila.paa"
            }, "" },
			{ "VIP-Orange-Camo", "vip_3", {
                "textures\vehicles\vip\camo_orange.paa"
            }, "" },
        };
    };

    class C_Rubberboat { //schlauchboot
        vItemSpace = 40;
        conditions = "";
        price = 10000;
		fee = 5000;
        textures[] = {
			{ "Orange", "civ", {
                "\A3\boat_f\Boat_Transport_01\Data\boat_transport_01_rescue_co.paa"
            }, "" },
			{ "VIP-Blau-Camo", "vip_1", {
                "textures\vehicles\vip\camo_blau.paa"
            }, "" },
			{ "VIP-Gelb-Camo", "vip_2", {
                "textures\vehicles\vip\camo_gelb.paa"
            }, "" },
			{ "VIP-Grau-Camo", "vip_3", {
                "textures\vehicles\vip\camo_grau.paa"
            }, "" },
			{ "VIP-Hellgrün-Camo", "vip_2", {
                "textures\vehicles\vip\camo_gruen.paa"
            }, "" },
			{ "VIP-Pink-Camo", "vip_2", {
                "textures\vehicles\vip\camo_pink.paa"
            }, "" },
			{ "VIP-Rot-Camo", "vip_1", {
                "textures\vehicles\vip\camo_rot.paa"
            }, "" },
			{ "VIP-Dungelgrün-Camo", "vip_3", {
                "textures\vehicles\vip\camo_dunkelgruen.paa"
            }, "" },
			{ "VIP-Turquoise-Camo", "vip_3", {
                "textures\vehicles\vip\camo_hellblau.paa"
            }, "" },
			{ "VIP-Lila-Camo", "vip_3", {
                "textures\vehicles\vip\camo_lila.paa"
            }, "" },
			{ "VIP-Orange-Camo", "vip_3", {
                "textures\vehicles\vip\camo_orange.paa"
            }, "" },
			{ "VIP-Schwarz", "vip_2", {
                "\A3\boat_f\Boat_Transport_01\Data\boat_transport_01_co.paa"
            }, "" },
			{ "VIP-Dessert Tarn", "vip_2", {
                "\A3\boat_f\Boat_Transport_01\Data\boat_transport_01_indp_co.paa"
            }, "" },
            { "VIP-Digi Tarn", "vip_2", {
                "\A3\boat_f\Boat_Transport_01\Data\boat_transport_01_opfor_co.paa"
            }, "" },
            { "VIP-Blau", "vip_2", {
                "\A3\boat_f\Boat_Transport_01\Data\boat_transport_01_civilian_co.paa"
            }, "" },
        };
    };

    class B_Heli_Transport_01_F { //ghosthawk
        vItemSpace = 20;
        conditions = "";
        price = 20000000;
		fee = 50000;
		textures[] = {
			{ "Leer-Polizei", "cop_6", {
               "textures\vehicles\reb\gh_reb1.paa",
			   "textures\vehicles\reb\gh_reb2.paa"
            }, "" },
			{ "Leer-SEK", "cop_sek", {
                "textures\vehicles\reb\gh_reb1.paa",
				"textures\vehicles\reb\gh_reb2.paa"
            }, "" },
			{ "VIP-Rebell Schwarz/Grün", "vip_2", {
                "textures\vehicles\reb\gh_reb1g.paa",
				"textures\vehicles\reb\gh_reb2g.paa"
            }, "" },
			{ "Rebell Schwarz/Rot", "reb", {
                "textures\vehicles\reb\gh_reb1.paa",
				"textures\vehicles\reb\gh_reb2.paa"
            }, "" },
			{ "Sicherheitsdienst", "WSC", {
                "textures\vehicles\sicher\gh_sicher1.paa",
				"textures\vehicles\sicher\gh_sicher2.paa"
            }, "" },
			{ "VIP-Blau-Camo", "vip_1", {
                "textures\vehicles\vip\camo_blau.paa",
				"textures\vehicles\vip\camo_blau.paa"
            }, "" },
			{ "VIP-Gelb-Camo", "vip_2", {
                "textures\vehicles\vip\camo_gelb.paa",
				"textures\vehicles\vip\camo_gelb.paa"
            }, "" },
			{ "VIP-Grau-Camo", "vip_3", {
                "textures\vehicles\vip\camo_grau.paa",
				"textures\vehicles\vip\camo_grau.paa"
            }, "" },
			{ "VIP-Hellgrün-Camo", "vip_2", {
                "textures\vehicles\vip\camo_gruen.paa",
				"textures\vehicles\vip\camo_gruen.paa"
            }, "" },
			{ "VIP-Pink-Camo", "vip_2", {
                "textures\vehicles\vip\camo_pink.paa",
				"textures\vehicles\vip\camo_pink.paa"
            }, "" },
			{ "VIP-Rot-Camo", "vip_1", {
               "textures\vehicles\vip\camo_rot.paa",
			   "textures\vehicles\vip\camo_rot.paa"
            }, "" },
			{ "VIP-Dungelgrün-Camo", "vip_3", {
               "textures\vehicles\vip\camo_dunkelgruen.paa",
			   "textures\vehicles\vip\camo_dunkelgruen.paa"
            }, "" },
			{ "VIP-Turquoise-Camo", "vip_3", {
               "textures\vehicles\vip\camo_hellblau.paa",
			   "textures\vehicles\vip\camo_hellblau.paa"
            }, "" },
			{ "VIP-Lila-Camo", "vip_3", {
                "textures\vehicles\vip\camo_lila.paa",
				"textures\vehicles\vip\camo_lila.paa"
            }, "" },
			{ "VIP-Orange-Camo", "vip_3", {
                "textures\vehicles\vip\camo_orange.paa",
				"textures\vehicles\vip\camo_orange.paa"
            }, "" },
        };
    };

    class B_Boat_Armed_01_minigun_F {
        vItemSpace = 20;
        conditions = "";
        price = 120000;
		fee = 20000;
        textures[] = {
			 { "Polizei", "cop", {
                "textures\vehicles\cop\gunboot.paa",
				"#(argb,8,8,3)color(1,1,1,1)",
				"#(argb,8,8,3)color(1,1,1,1)"
            }, "" },
            { "Feuerwehr", "med", {
                "textures\vehicles\medic\gunboot.paa",
				"#(argb,8,8,3)color(1,1,1,1)",
				"#(argb,8,8,3)color(1,1,1,1)"
            }, "" },
        };
    };

    class O_Truck_03_transport_F {
        vItemSpace = 485;
        conditions = "";
        price = 6000000;
		fee = 30000;
        textures[] = { };
    };

    class O_Truck_03_device_F {
        vItemSpace = 350;
        conditions = "";
        price = 7200000;
		fee = 100000;
        textures[] = { };
    };

    class Land_CargoBox_V1_F {
        vItemSpace = 5000;
        conditions = "";
        price = -1;
		fee = -1;
        textures[] = {};
    };
	
	class B_CBS_WaterShadow730_F {
        vItemSpace = 0;
        conditions = "";
        price = 150000;
		fee = 10000;
        textures[] = {};
    };
	
	class dbo_CIV_new_bike {
        vItemSpace = 0;
        conditions = "";
        price = 1000;
		fee = 50;
        textures[] = {};
    };
	
	class dbo_CIV_ol_bike {
        vItemSpace = 0;
        conditions = "";
        price = 1000;
		fee = 50;
        textures[] = {};
    };
	
	class MMT_USMC {
        vItemSpace = 0;
        conditions = "";
        price = 1000;
		fee = 50;
        textures[] = {};
    };
	
	class MMT_Civ {
        vItemSpace = 0;
        conditions = "";
        price = 1000;
		fee = 50;
        textures[] = {};
    };
	
	class BRP_1960_Black {
        vItemSpace = 0;
        conditions = "";
        price = 150000;
		fee = 15000;
        textures[] = {};
    };
	
	class Burnes_LCAC_1 {
        vItemSpace = 0;
        conditions = "";
        price = 7000000;
		fee = 70000;
        textures[] = {};
    };
	
	class D41_Trawler {
        vItemSpace = 0;
        conditions = "";
        price = 2000000;
		fee = 45000;
        textures[] = {};
    };

    class Box_IND_Grenades_F {
        vItemSpace = 350;
        conditions = "";
        price = -1;
		fee = -1;
        textures[] = {};
    };

    class B_supplyCrate_F {
        vItemSpace = 700;
        conditions = "";
        price = -1;
		fee = -1;
        textures[] = {};
    };

    class B_G_Offroad_01_F {
        vItemSpace = 55;
        conditions = "";
        price = 30000;
		fee = 2500;
        textures[] = {
			{ "Rebell Digi Camo", "reb", {
                "\A3\soft_f_gamma\Offroad_01\Data\offroad_01_ext_ig01_co.paa"
            }, "" },
            { "Rebell Schwarz/Rot", "reb", {
                "textures\vehicles\reb\offroad_reb_rot.paa"
            }, "" },
            { "VIP-Rebell Schwarz/Grün", "vip_2", {
                "textures\vehicles\reb\offroad_reb_gruen.paa"
            }, "" },
			{ "VIP-Blau-Camo", "vip_1", {
                "textures\vehicles\vip\camo_blau.paa"
            }, "" },
			{ "VIP-Gelb-Camo", "vip_2", {
                "textures\vehicles\vip\camo_gelb.paa"
            }, "" },
			{ "VIP-Grau-Camo", "vip_3", {
                "textures\vehicles\vip\camo_grau.paa"
            }, "" },
			{ "VIP-Hellgrün-Camo", "vip_2", {
                "textures\vehicles\vip\camo_gruen.paa"
            }, "" },
			{ "VIP-Pink-Camo", "vip_2", {
                "textures\vehicles\vip\camo_pink.paa"
            }, "" },
			{ "VIP-Rot-Camo", "vip_1", {
                "textures\vehicles\vip\camo_rot.paa"
            }, "" },
			{ "VIP-Dungelgrün-Camo", "vip_3", {
                "textures\vehicles\vip\camo_dunkelgruen.paa"
            }, "" },
			{ "VIP-Turquoise-Camo", "vip_3", {
                "textures\vehicles\vip\camo_hellblau.paa"
            }, "" },
			{ "VIP-Lila-Camo", "vip_3", {
                "textures\vehicles\vip\camo_lila.paa"
            }, "" },
			{ "VIP-Orange-Camo", "vip_3", {
                "textures\vehicles\vip\camo_orange.paa"
            }, "" },
			{ "VIP-Repair Gelb", "vip_2", {
                "\a3\soft_f_bootcamp\Offroad_01\Data\offroad_01_ext_repair_civ_co.paa"
            }, "" },
			{ "VIP-Zebra Grün 1", "vip_2", {
                "\a3\soft_f_bootcamp\Offroad_01\Data\offroad_01_ext_ig_01_co.paa"
            }, "" },
			{ "VIP-Zebra Grün 2", "vip_2", {
                "\a3\soft_f_bootcamp\Offroad_01\Data\offroad_01_ext_ig_02_co.paa"
            }, "" },
			{ "VIP-Zebra Braun", "vip_2", {
                "\a3\soft_f_bootcamp\Offroad_01\Data\offroad_01_ext_ig_03_co.paa"
            }, "" },
			{ "VIP-Zebra Camo 1", "vip_2", {
                "\a3\soft_f_bootcamp\Offroad_01\Data\offroad_01_ext_ig_04_co.paa"
            }, "" },
			{ "VIP-Zebra Camo 2", "vip_2", {
                "\a3\soft_f_bootcamp\Offroad_01\Data\offroad_01_ext_ig_05_co.paa"
            }, "" },
			{ "VIP-Zebra Camo 3", "vip_2", {
                "\a3\soft_f_bootcamp\Offroad_01\Data\offroad_01_ext_ig_06_co.paa"
            }, "" },
			{ "VIP-Zebra Camo 4", "vip_2", {
                "\a3\soft_f_bootcamp\Offroad_01\Data\offroad_01_ext_ig_07_co.paa"
            }, "" },
			{ "VIP-Zebra Camo 5", "vip_2", {
                "\a3\soft_f_bootcamp\Offroad_01\Data\offroad_01_ext_ig_08_co.paa"
            }, "" },
			{ "VIP-Zebra Camo 6", "vip_2", {
                "\a3\soft_f_bootcamp\Offroad_01\Data\offroad_01_ext_ig_09_co.paa"
            }, "" },
			{ "VIP-Zebra Camo 7", "vip_2", {
                "\a3\soft_f_bootcamp\Offroad_01\Data\offroad_01_ext_ig_10_co.paa"
            }, "" },
			{ "VIP-Zebra Camo 8", "vip_2", {
                "\a3\soft_f_bootcamp\Offroad_01\Data\offroad_01_ext_ig_11_co.paa"
            }, "" },
			{ "VIP-Zebra Camo 9", "vip_2", {
                "\a3\soft_f_bootcamp\Offroad_01\Data\offroad_01_ext_ig_12_co.paa"
            }, "" },
			{ "Hello Kitty", "girl", {
                "textures\vehicles\civ\offroad\hellokitty_offroad.paa",
				"textures\vehicles\civ\offroad\hellokitty_offroad.paa"
            }, "" },
        };
    };

    class C_Boat_Civil_01_F {
        vItemSpace = 80;
        conditions = "";
        price = 40000;
		fee = 5000;
        textures[] = {
			{ "Orange", "civ", {
                "\A3\boat_f_gamma\Boat_Civil_01\Data\boat_civil_01_ext_rescue_co.paa"
            }, "" },
            { "VIP-Blau-Camo", "vip_1", {
                "textures\vehicles\vip\camo_blau.paa",
                "textures\vehicles\vip\camo_blau.paa"
            }, "" },
			{ "VIP-Gelb-Camo", "vip_2", {
                "textures\vehicles\vip\camo_gelb.paa",
                "textures\vehicles\vip\camo_gelb.paa"
            }, "" },
			{ "VIP-Grau-Camo", "vip_3", {
                "textures\vehicles\vip\camo_grau.paa",
                "textures\vehicles\vip\camo_grau.paa"
            }, "" },
			{ "VIP-Hellgrün-Camo", "vip_2", {
                "textures\vehicles\vip\camo_gruen.paa",
                "textures\vehicles\vip\camo_gruen.paa"
            }, "" },
			{ "VIP-Pink-Camo", "vip_2", {
                "textures\vehicles\vip\camo_pink.paa",
                "textures\vehicles\vip\camo_pink.paa"
            }, "" },
			{ "VIP-Rot-Camo", "vip_1", {
                "textures\vehicles\vip\camo_rot.paa",
                "textures\vehicles\vip\camo_rot.paa"
            }, "" },
			{ "VIP-Dungelgrün-Camo", "vip_3", {
                "textures\vehicles\vip\camo_dunkelgruen.paa",
                "textures\vehicles\vip\camo_dunkelgruen.paa"
            }, "" },
			{ "VIP-Turquoise-Camo", "vip_3", {
                "textures\vehicles\vip\camo_hellblau.paa",
                "textures\vehicles\vip\camo_hellblau.paa"
            }, "" },
			{ "VIP-Lila-Camo", "vip_3", {
                "textures\vehicles\vip\camo_lila.paa",
                "textures\vehicles\vip\camo_lila.paa"
            }, "" },
			{ "VIP-Orange-Camo", "vip_3", {
                "textures\vehicles\vip\camo_orange.paa",
                "textures\vehicles\vip\camo_orange.paa"
            }, "" },
            { "VIP-Weiß", "vip_1", {
                "\A3\boat_f_gamma\Boat_Civil_01\Data\boat_civil_01_ext_co.paa"
            }, "" },
        };
    };

    class C_Boat_Civil_01_police_F {
        vItemSpace = 20;
        conditions = "";
        price = 40000;
		fee = 10000;
        textures[] = {
			 { "Polizei", "cop", {
                "textures\vehicles\cop\speedboot.paa"
            }, "" },
        };
    };

    class B_Truck_01_box_F { //Hemmt box
        vItemSpace = 550;
        conditions = "";
        price = 3300000;
		fee = 25000;
        textures[] = {
			{ "Original", "civ", {
                "\A3\soft_f_beta\Truck_01\Data\truck_01_ext_01_co.paa"
            }, "" },
			{ "VIP-Blau-Camo", "vip_1", {
                "textures\vehicles\vip\hemmt_camo_blau.paa",
				"textures\vehicles\vip\camo_blau.paa"
            }, "" },
			{ "VIP-Gelb-Camo", "vip_2", {
                "textures\vehicles\vip\hemmt_camo_gelb.paa",
				"textures\vehicles\vip\camo_gelb.paa"
            }, "" },
			{ "VIP-Grau-Camo", "vip_3", {
                "textures\vehicles\vip\hemmt_camo_grau.paa",
				"textures\vehicles\vip\camo_grau.paa"
            }, "" },
			{ "VIP-Hellgrün-Camo", "vip_2", {
                "textures\vehicles\vip\hemmt_camo_gruen.paa",
				"textures\vehicles\vip\camo_gruen.paa"
            }, "" },
			{ "VIP-Pink-Camo", "vip_2", {
                "textures\vehicles\vip\hemmt_camo_pink.paa",
				"textures\vehicles\vip\camo_pink.paa"
            }, "" },
			{ "VIP-Rot-Camo", "vip_1", {
                "textures\vehicles\vip\hemmt_camo_rot.paa",
				"textures\vehicles\vip\camo_rot.paa"
            }, "" },
        };
    };

    class B_Truck_01_transport_F { //Hemmt transport
        vItemSpace = 275;
        conditions = "";
        price = 550000;
		fee = 15000;
        textures[] = {
			{ "Original", "civ", {
                "\A3\soft_f_beta\Truck_01\Data\truck_01_ext_01_co.paa"
            }, "" },
			{ "VIP-Blau-Camo", "vip_1", {
                "textures\vehicles\vip\hemmt_camo_blau.paa",
				"textures\vehicles\vip\camo_blau.paa"
            }, "" },
			{ "VIP-Gelb-Camo", "vip_2", {
                "textures\vehicles\vip\hemmt_camo_gelb.paa",
				"textures\vehicles\vip\camo_gelb.paa"
            }, "" },
			{ "VIP-Grau-Camo", "vip_3", {
                "textures\vehicles\vip\hemmt_camo_grau.paa",
				"textures\vehicles\vip\camo_grau.paa"
            }, "" },
			{ "VIP-Hellgrün-Camo", "vip_2", {
                "textures\vehicles\vip\hemmt_camo_gruen.paa",
				"textures\vehicles\vip\camo_gruen.paa"
            }, "" },
			{ "VIP-Pink-Camo", "vip_2", {
                "textures\vehicles\vip\hemmt_camo_pink.paa",
				"textures\vehicles\vip\camo_pink.paa"
            }, "" },
			{ "VIP-Rot-Camo", "vip_1", {
                "textures\vehicles\vip\hemmt_camo_rot.paa",
				"textures\vehicles\vip\camo_rot.paa"
            }, "" },
        };
    };
	
	class B_Truck_01_covered_F { //Hemmt covered
        vItemSpace = 600;
        conditions = "";
        price = 4500000;
		fee = 40000;
        textures[] = {
			{ "Original", "civ", {
                "\A3\soft_f_beta\Truck_01\Data\truck_01_ext_01_co.paa"
            }, "" },
			{ "VIP-Blau-Camo", "vip_1", {
                "textures\vehicles\vip\hemmt_camo_blau.paa",
				"textures\vehicles\vip\camo_blau.paa"
            }, "" },
			{ "VIP-Gelb-Camo", "vip_2", {
                "textures\vehicles\vip\hemmt_camo_gelb.paa",
				"textures\vehicles\vip\camo_gelb.paa"
            }, "" },
			{ "VIP-Grau-Camo", "vip_3", {
                "textures\vehicles\vip\hemmt_camo_grau.paa",
				"textures\vehicles\vip\camo_grau.paa"
            }, "" },
			{ "VIP-Hellgrün-Camo", "vip_2", {
                "textures\vehicles\vip\hemmt_camo_gruen.paa",
				"textures\vehicles\vip\camo_gruen.paa"
            }, "" },
			{ "VIP-Pink-Camo", "vip_2", {
                "textures\vehicles\vip\hemmt_camo_pink.paa",
				"textures\vehicles\vip\camo_pink.paa"
            }, "" },
			{ "VIP-Rot-Camo", "vip_1", {
                "textures\vehicles\vip\hemmt_camo_rot.paa",
				"textures\vehicles\vip\camo_rot.paa"
            }, "" },
        };
    };
	
	class B_Truck_01_mover_F { //Hemmt Mover
        vItemSpace = 300;
        conditions = "";
        price = 1200000;
		fee = 40000;
        textures[] = {
			{ "Original", "civ", {
                "\A3\soft_f_beta\Truck_01\Data\truck_01_ext_01_co.paa"
            }, "" },
			{ "VIP-Blau-Camo", "vip_1", {
                "textures\vehicles\vip\hemmt_camo_blau.paa",
				"textures\vehicles\vip\camo_blau.paa"
            }, "" },
			{ "VIP-Gelb-Camo", "vip_2", {
                "textures\vehicles\vip\hemmt_camo_gelb.paa",
				"textures\vehicles\vip\camo_gelb.paa"
            }, "" },
			{ "VIP-Grau-Camo", "vip_3", {
                "textures\vehicles\vip\hemmt_camo_grau.paa",
				"textures\vehicles\vip\camo_grau.paa"
            }, "" },
			{ "VIP-Hellgrün-Camo", "vip_2", {
                "textures\vehicles\vip\hemmt_camo_gruen.paa",
				"textures\vehicles\vip\camo_gruen.paa"
            }, "" },
			{ "VIP-Pink-Camo", "vip_2", {
                "textures\vehicles\vip\hemmt_camo_pink.paa",
				"textures\vehicles\vip\camo_pink.paa"
            }, "" },
			{ "VIP-Rot-Camo", "vip_1", {
                "textures\vehicles\vip\hemmt_camo_rot.paa",
				"textures\vehicles\vip\camo_rot.paa"
            }, "" },
        };
    };
	
	class B_Truck_01_fuel_F {
        vItemSpace = 350;
        vFuelSpace = 5000;
        conditions = "";
        price = 1800000;
		fee = 20000;
        textures[] = {
			{ "Original", "civ", {
                "\A3\soft_f_beta\Truck_01\Data\truck_01_ext_01_co.paa"
            }, "" },
			{ "VIP-Blau-Camo", "vip_1", {
                "textures\vehicles\vip\hemmt_camo_blau.paa",
				"textures\vehicles\vip\camo_blau.paa"
            }, "" },
			{ "VIP-Gelb-Camo", "vip_2", {
                "textures\vehicles\vip\hemmt_camo_gelb.paa",
				"textures\vehicles\vip\camo_gelb.paa"
            }, "" },
			{ "VIP-Grau-Camo", "vip_3", {
                "textures\vehicles\vip\hemmt_camo_grau.paa",
				"textures\vehicles\vip\camo_grau.paa"
            }, "" },
			{ "VIP-Hellgrün-Camo", "vip_2", {
                "textures\vehicles\vip\hemmt_camo_gruen.paa",
				"textures\vehicles\vip\camo_gruen.paa"
            }, "" },
			{ "VIP-Pink-Camo", "vip_2", {
                "textures\vehicles\vip\hemmt_camo_pink.paa",
				"textures\vehicles\vip\camo_pink.paa"
            }, "" },
			{ "VIP-Rot-Camo", "vip_1", {
                "textures\vehicles\vip\hemmt_camo_rot.paa",
				"textures\vehicles\vip\camo_rot.paa"
            }, "" },
			{ "Feuerwehr", "med", {
                "textures\vehicles\medic\tanker0.paa",
				"textures\vehicles\medic\tanker1.paa",
				"textures\vehicles\medic\tanker2.paa"
            }, "" },
        };
    };

    class O_MRAP_02_F {
        vItemSpace = 60;
        conditions = "";
        price = 15000000;
		fee = 100000;
        textures[] = {
			{ "Polizei", "cop_6", {
                "textures\vehicles\cop\Ifrit_cop_1.paa",
				"textures\vehicles\cop\Ifrit_cop_2.paa"
            }, "" },
			{ "VIP-Rebell Schwarz/Grün", "vip_2", {
                "textures\vehicles\reb\Ifrit_reb_gruen_1.paa",
				"textures\vehicles\reb\Ifrit_reb_gruen_2.paa"
            }, "" },
			{ "Rebell Schwarz/Rot", "reb", {
                "textures\vehicles\reb\Ifrit_reb_rot_1.paa",
				"textures\vehicles\reb\Ifrit_reb_rot_2.paa"
            }, "" },
			{ "SEK", "cop_sek", {
                "textures\vehicles\cop\Ifrit_sek_1.paa",
				"textures\vehicles\cop\Ifrit_sek_2.paa"
            }, "" },
			{ "VIP-Blau-Camo", "vip_1", {
                "textures\vehicles\vip\camo_blau.paa",
				"textures\vehicles\vip\ifrit_camo_blau_2.paa"
            }, "" },
			{ "VIP-Gelb-Camo", "vip_2", {
                "textures\vehicles\vip\camo_gelb.paa",
				"textures\vehicles\vip\ifrit_camo_gelb_2.paa"
            }, "" },
			{ "VIP-Grau-Camo", "vip_3", {
                "textures\vehicles\vip\camo_grau.paa",
				"textures\vehicles\vip\ifrit_camo_grau_2.paa"
            }, "" },
			{ "VIP-Hellgrün-Camo", "vip_2", {
                "textures\vehicles\vip\camo_gruen.paa",
				"textures\vehicles\vip\ifrit_camo_gruen_2.paa"
            }, "" },
			{ "VIP-Pink-Camo", "vip_2", {
                "textures\vehicles\vip\camo_pink.paa",
				"textures\vehicles\vip\ifrit_camo_pink_2.paa"
            }, "" },
			{ "VIP-Rot-Camo", "vip_1", {
                "textures\vehicles\vip\camo_rot.paa",
				"textures\vehicles\vip\ifrit_camo_rot_2.paa"
            }, "" },
        };
    };

    class C_Offroad_01_F {
        vItemSpace = 55;
        conditions = "";
        price = 23000;
		fee = 2500;
        textures[] = {
            { "Rot", "civ", {
                "\A3\soft_F\Offroad_01\Data\offroad_01_ext_co.paa"
            }, "" },
            { "Gelb", "civ", {
                "\A3\soft_F\Offroad_01\Data\offroad_01_ext_BASE01_CO.paa"
            }, "" },
			{ "Weiss", "civ", {
                "\A3\soft_F\Offroad_01\Data\offroad_01_ext_BASE02_CO.paa"
            }, "" },
			{ "Blau", "civ", {
                "\A3\soft_F\Offroad_01\Data\offroad_01_ext_BASE03_CO.paa"
            }, "" },
			{ "Dunkel Rot", "civ", {
                "\A3\soft_F\Offroad_01\Data\offroad_01_ext_BASE04_CO.paa"
            }, "" },
			{ "Blau / Weiss", "civ", {
                "\A3\soft_F\Offroad_01\Data\offroad_01_ext_BASE05_CO.paa"
            }, "" },
			{ "Taxi-Gelb", "civ", {
                "#(argb,8,8,3)color(0.6,0.3,0.01,1)"
            }, "" },			
			{ "Polizei", "cop", {
                "textures\vehicles\cop\police_offroad.paa"
            }, "" },
			{ "Feuerwehr", "med", {
                "textures\vehicles\medic\offroad.paa"
            }, "" },
			{ "Turquoise", "civ", {
                "#(argb,8,8,3)color(0.05,0.6,0.4,1)"
            }, "" },
			{ "Hellbraun", "civ", {
                "#(argb,8,8,3)color(0.8,0.7,0.5,0.2)"
            }, "" },
			{ "Lady Pink", "civ", {
                "#(argb,8,8,3)color(1,0.75,0.84,0.2)"
            }, "" },
			{ "Bimbo Gurl", "civ", {
                "#(argb,8,8,3)color(0.1,0.01,0.8,1)"
            }, "" },
			{ "Shiny Maid", "civ", {
                "#(argb,8,8,3)color(0.9,0.25,0.1,1)"
            }, "" },
			{ "Orange", "civ", {
                "#(argb,8,8,3)color(0.9,0.25,0.0,1)"
            }, "" },
			{ "Rebell", "reb", {
                "\A3\soft_f_gamma\Offroad_01\Data\offroad_01_ext_ig01_co.paa"
            }, "" },			
			{ "Rebell Schwarz/Rot", "reb", {
                "textures\vehicles\reb\offroad_reb_rot.paa"
            }, "" },
			{ "VIP-Rebell Schwarz/Grün", "vip_2", {
                "textures\vehicles\reb\offroad_reb_gruen.paa"
            }, "" },
			{ "Sicherheitsdienst", "WSC", {
                "textures\vehicles\sicher\offroad_sicher.paa"
            }, "" },
			{ "VIP-Blau-Camo", "vip_1", {
                "textures\vehicles\vip\camo_blau.paa"
            }, "" },
			{ "VIP-Gelb-Camo", "vip_2", {
                "textures\vehicles\vip\camo_gelb.paa"
            }, "" },
			{ "VIP-Grau-Camo", "vip_3", {
                "textures\vehicles\vip\camo_grau.paa"
            }, "" },			
			{ "VIP-Hellgrün-Camo", "vip_2", {
                "textures\vehicles\vip\camo_gruen.paa"
            }, "" },
			{ "VIP-Pink-Camo", "vip_2", {
                "textures\vehicles\vip\camo_pink.paa"
            }, "" },			
			{ "VIP-Rot-Camo", "vip_1", {
                "textures\vehicles\vip\camo_rot.paa"
            }, "" },
			{ "VIP-Dungelgrün-Camo", "vip_3", {
                "textures\vehicles\vip\camo_dunkelgruen.paa"
            }, "" },
			{ "VIP-Turquoise-Camo", "vip_3", {
                "textures\vehicles\vip\camo_hellblau.paa"
            }, "" },			
			{ "VIP-Lila-Camo", "vip_3", {
                "textures\vehicles\vip\camo_lila.paa"
            }, "" },
			{ "VIP-Orange-Camo", "vip_3", {
                "textures\vehicles\vip\camo_orange.paa"
            }, "" },			
			{ "VIP-Repair Gelb", "vip_2", {
                "\a3\soft_f_bootcamp\Offroad_01\Data\offroad_01_ext_repair_civ_co.paa"
            }, "" },
			{ "VIP-Zebra Grün 1", "vip_2", {
                "\a3\soft_f_bootcamp\Offroad_01\Data\offroad_01_ext_ig_01_co.paa"
            }, "" },
			{ "VIP-Zebra Grün 2", "vip_2", {
                "\a3\soft_f_bootcamp\Offroad_01\Data\offroad_01_ext_ig_02_co.paa"
            }, "" },
			{ "VIP-Zebra Braun", "vip_2", {
                "\a3\soft_f_bootcamp\Offroad_01\Data\offroad_01_ext_ig_03_co.paa"
            }, "" },
			{ "VIP-Zebra Camo 1", "vip_2", {
                "\a3\soft_f_bootcamp\Offroad_01\Data\offroad_01_ext_ig_04_co.paa"
            }, "" },
			{ "VIP-Zebra Camo 2", "vip_2", {
                "\a3\soft_f_bootcamp\Offroad_01\Data\offroad_01_ext_ig_05_co.paa"
            }, "" },
			{ "VIP-Zebra Camo 3", "vip_2", {
                "\a3\soft_f_bootcamp\Offroad_01\Data\offroad_01_ext_ig_06_co.paa"
            }, "" },
			{ "VIP-Zebra Camo 4", "vip_2", {
                "\a3\soft_f_bootcamp\Offroad_01\Data\offroad_01_ext_ig_07_co.paa"
            }, "" },
			{ "VIP-Zebra Camo 5", "vip_2", {
                "\a3\soft_f_bootcamp\Offroad_01\Data\offroad_01_ext_ig_08_co.paa"
            }, "" },
			{ "VIP-Zebra Camo 6", "vip_2", {
                "\a3\soft_f_bootcamp\Offroad_01\Data\offroad_01_ext_ig_09_co.paa"
            }, "" },
			{ "VIP-Zebra Camo 7", "vip_2", {
                "\a3\soft_f_bootcamp\Offroad_01\Data\offroad_01_ext_ig_10_co.paa"
            }, "" },
			{ "VIP-Zebra Camo 8", "vip_2", {
                "\a3\soft_f_bootcamp\Offroad_01\Data\offroad_01_ext_ig_11_co.paa"
            }, "" },
			{ "VIP-Zebra Camo 9", "vip_2", {
                "\a3\soft_f_bootcamp\Offroad_01\Data\offroad_01_ext_ig_12_co.paa"
            }, "" },
			{ "Hello Kitty", "girl", {
                "textures\vehicles\civ\offroad\hellokitty_offroad.paa"
            }, "" },
        };
    };

    class C_Kart_01_Blu_F {
        vItemSpace = 0;
        conditions = "";
        price = 30000;
		fee = 10000;
        textures[] = {};
    };
/*
To edit another information in this classes you can use this exemple.
class C_Kart_01_Fuel_F : C_Kart_01_Blu_F{
    vItemSpace = 40;
    price = ;
};

will modify the virtual space and the price of the vehicle, but other information such as license and textures will pick up the vehicle declare at : Vehicle {};
*/
    class C_Kart_01_Fuel_F : C_Kart_01_Blu_F{}; // Get all information of C_Kart_01_Blu_F
    class C_Kart_01_Red_F : C_Kart_01_Blu_F{};
    class C_Kart_01_Vrana_F : C_Kart_01_Blu_F{};
	class C_Kart_01_F : C_Kart_01_Blu_F{};
	class C_Kart_01_green_F : C_Kart_01_Blu_F{};
	class C_Kart_01_orange_F : C_Kart_01_Blu_F{};
	class C_Kart_01_white_F : C_Kart_01_Blu_F{};
	class C_Kart_01_yellow_F : C_Kart_01_Blu_F{};
	class C_Kart_01_black_F : C_Kart_01_Blu_F{};		
			
    class C_Hatchback_01_sport_F {
        vItemSpace = 40;
        conditions = "";
        price = 220000;
		fee = 15000;
        textures[] = {
            { "Rot", "civ", {
                "\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_sport01_co.paa"
            }, "" },
            { "Dunkel Blau", "civ", {
                "\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_sport02_co.paa"
            }, "" },
            { "Orange", "civ", {
                "\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_sport03_co.paa"
            }, "" },
            { "Schwarz / Weiss", "civ", {
                "\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_sport04_co.paa"
            }, "" },
            { "Tan", "civ", {
                "\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_sport05_co.paa"
            }, "" },
            { "Grün", "civ", {
                "\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_sport06_co.paa"
            }, "" },
            { "Polizei", "cop", {
                "textures\vehicles\cop\hatchbackpol.paa"
            }, "" },
			{ "Schwarz - Zivi", "cop_zivi", {
                "#(ai,64,64,1)Fresnel(1.3,7)"
            }, "" },
			{ "Blue Smile", "civ", {
                "textures\vehicles\civ\hb\bluesmile.paa"
            }, "" },
			{ "Grandpa", "civ", {
                "textures\vehicles\civ\hb\grandpa.paa"
            }, "" },
			{ "Sunset", "civ", {
                "textures\vehicles\civ\hb\sunset.paa"
            }, "" },
			{ "Wave", "civ", {
                "textures\vehicles\civ\hb\wave.paa"
            }, "" },
			{ "Schwarz", "civ", {
                "#(ai,64,64,1)Fresnel(1.3,7)"
            }, "" },
			{ "Feuerwehr", "med", {
                "textures\vehicles\medic\hatchback.paa"
            }, "" },
			{ "Rebell Schwarz/Rot", "reb", {
                "textures\vehicles\reb\hatchback_reb_rot.paa"
            }, "" },
			{ "VIP-Rebell Schwarz/Grün", "vip_2", {
                "textures\vehicles\reb\hatchback_reb_gruen.paa"
            }, "" },
			{ "Rot - Zivi", "cop_zivi", {
                "\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_sport01_co.paa"
            }, "" },
			{ "Dunkel Blau - Zivi", "cop_zivi", {
                "\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_sport02_co.paa"
            }, "" },
			{ "Orange - Zivi", "cop_zivi", {
                "\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_sport03_co.paa"
            }, "" },
			{ "Schwarz / Weiss - Zivi", "cop_zivi", {
                "\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_sport04_co.paa"
            }, "" },
			{ "Tan - Zivi", "cop_zivi", {
                "\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_sport05_co.paa"
            }, "" },
			{ "Grün - Zivi", "cop_zivi", {
                "\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_sport06_co.paa"
            }, "" },			
			{ "Blue Smile - Zivi", "cop_zivi", {
                "textures\vehicles\civ\hb\bluesmile.paa"
            }, "" },
			{ "Grandpa - Zivi", "cop_zivi", {
                "textures\vehicles\civ\hb\grandpa.paa"
            }, "" },
			{ "Sunset - Zivi", "cop_zivi", {
                "textures\vehicles\civ\hb\sunset.paa"
            }, "" },
			{ "Wave - Zivi", "cop_zivi", {
                "textures\vehicles\civ\hb\wave.paa"
            }, "" },
			{ "Sicherheitsdienst", "WSC", {
                "textures\vehicles\sicher\hatchback_sicher.paa"
            }, "" },
			{ "VIP-Blau-Camo", "vip_1", {
                "textures\vehicles\vip\hatchback_camo_blau.paa"
            }, "" },
			{ "VIP-Gelb-Camo", "vip_2", {
                "textures\vehicles\vip\hatchback_camo_gelb.paa"
            }, "" },
			{ "VIP-Grau-Camo", "vip_3", {
                "textures\vehicles\vip\hatchback_camo_grau.paa"
            }, "" },
			{ "VIP-Hellgrün-Camo", "vip_2", {
                "textures\vehicles\vip\hatchback_camo_gruen.paa"
            }, "" },
			{ "VIP-Pink-Camo", "vip_2", {
                "textures\vehicles\vip\hatchback_camo_pink.paa"
            }, "" },
			{ "VIP-Rot-Camo", "vip_1", {
                "textures\vehicles\vip\hatchback_camo_rot.paa"
            }, "" },
			{ "VIP-Weed", "vip_5", {
                "textures\vehicles\vip\hatchback_weed.paa"
            }, "" },
			{ "VIP-Division Wolf", "vip_5", {
                "textures\vehicles\vip\hatchback_wolf.paa"
            }, "" },
			{ "VIP-Spiderman", "vip_5", {
                "textures\vehicles\vip\Hatchback_spider.paa"
            }, "" },
        };
    };

    class B_Quadbike_01_F {
        vItemSpace = 25;
        conditions = "";
        price = 4500;
		fee = 500;
        textures[] = {
            { "Braun", "civ", {
                "\A3\Soft_F\Quadbike_01\Data\Quadbike_01_co.paa"
            }, "" },
            { "Digi Desert", "reb", {
                "\A3\Soft_F\Quadbike_01\Data\quadbike_01_opfor_co.paa"
            }, "" },
            { "Schwarz", "civ", {
                "\A3\Soft_F_beta\Quadbike_01\Data\quadbike_01_civ_black_co.paa"
            }, "" },
            { "Blau", "civ", {
                "\A3\Soft_F_beta\Quadbike_01\Data\quadbike_01_civ_blue_co.paa"
            }, "" },
            { "Rot", "civ", {
                "\A3\Soft_F_beta\Quadbike_01\Data\quadbike_01_civ_red_co.paa"
            }, "" },
            { "Weiss", "civ", {
                "\A3\Soft_F_beta\Quadbike_01\Data\quadbike_01_civ_white_co.paa"
            }, "" },
            { "Digi Grün", "civ", {
                "\A3\Soft_F_beta\Quadbike_01\Data\quadbike_01_indp_co.paa"
            }, "" },
            { "Hunter Camo", "civ", {
                "\a3\soft_f_gamma\Quadbike_01\data\quadbike_01_indp_hunter_co.paa"
            }, "" },
            { "Rebel Camo", "reb", {
                "\a3\soft_f_gamma\Quadbike_01\data\quadbike_01_indp_hunter_co.paa"
            }, "" },
			{ "VIP-Blau-Camo", "vip_1", {
                "textures\vehicles\vip\camo_blau.paa"
            }, "" },
			{ "VIP-Gelb-Camo", "vip_2", {
                "textures\vehicles\vip\camo_gelb.paa"
            }, "" },
			{ "VIP-Grau-Camo", "vip_3", {
                "textures\vehicles\vip\camo_grau.paa"
            }, "" },
			{ "VIP-Hellgrün-Camo", "vip_2", {
                "textures\vehicles\vip\camo_gruen.paa"
            }, "" },
			{ "VIP-Pink-Camo", "vip_2", {
                "textures\vehicles\vip\camo_pink.paa"
            }, "" },
			{ "VIP-Rot-Camo", "vip_1", {
                "textures\vehicles\vip\camo_rot.paa"
            }, "" },
			{ "VIP-Dungelgrün-Camo", "vip_3", {
                "textures\vehicles\vip\camo_dunkelgruen.paa"
            }, "" },
			{ "VIP-Turquoise-Camo", "vip_3", {
                "textures\vehicles\vip\camo_hellblau.paa"
            }, "" },
			{ "VIP-Lila-Camo", "vip_3", {
                "textures\vehicles\vip\camo_lila.paa"
            }, "" },
			{ "VIP-Orange-Camo", "vip_3", {
                "textures\vehicles\vip\camo_orange.paa"
            }, "" },
			{ "VIP-IG Camo", "vip_2", {
                "\a3\soft_f_bootcamp\Quadbike_01\Data\quadbike_01_ig_co.paa"
            }, "" },
			{ "VIP-Wald", "vip_2", {
                "\a3\soft_f_bootcamp\Quadbike_01\Data\quadbike_01_indp_hunter_co.paa"
            }, "" },
        };
    };

    class I_Truck_02_covered_F {
        vItemSpace = 225;
        conditions = "";
        price = 360000;
		fee = 10000;
        textures[] = {
            { "Orange", "civ", {
                "\A3\Soft_F_Beta\Truck_02\data\truck_02_kab_co.paa",
                "\a3\soft_f_beta\Truck_02\data\truck_02_kuz_co.paa"
            }, "" },
            { "Digi Tarn", "civ", {
                "\A3\Soft_F_Beta\Truck_02\data\truck_02_kab_indp_co.paa",
                "\a3\soft_f_beta\Truck_02\data\truck_02_kuz_indp_co.paa"
            }, "" },
			{ "Dessert Tarn", "civ", {
                "\A3\Soft_F_Beta\Truck_02\data\truck_02_kab_opfor_co.paa",
                "\a3\soft_f_beta\Truck_02\data\truck_02_kuz_opfor_co.paa"
            }, "" },
			{ "Polizei", "cop_3", {
                "textures\vehicles\cop\zamak1.paa",
                "textures\vehicles\cop\zamak2.paa"
            }, "" },
			{ "Feuerwehr", "med", {
                "textures\vehicles\medic\zamak1.paa",
                "textures\vehicles\medic\zamak2.paa"
            }, "" },
			{ "VIP-Blau-Camo", "vip_1", {
                "textures\vehicles\vip\camo_blau.paa",
                "textures\vehicles\vip\camo_blau.paa"
            }, "" },
			{ "VIP-Gelb-Camo", "vip_2", {
                "textures\vehicles\vip\camo_gelb.paa",
                "textures\vehicles\vip\camo_gelb.paa"
            }, "" },
			{ "VIP-Grau-Camo", "vip_3", {
                "textures\vehicles\vip\camo_grau.paa",
                "textures\vehicles\vip\camo_grau.paa"
            }, "" },
			{ "VIP-Hellgrün-Camo", "vip_2", {
                "textures\vehicles\vip\camo_gruen.paa",
                "textures\vehicles\vip\camo_gruen.paa"
            }, "" },
			{ "VIP-Pink-Camo", "vip_2", {
                "textures\vehicles\vip\camo_pink.paa",
                "textures\vehicles\vip\camo_pink.paa"
            }, "" },
			{ "VIP-Rot-Camo", "vip_1", {
                "textures\vehicles\vip\camo_rot.paa",
                "textures\vehicles\vip\camo_rot.paa"
            }, "" },
			{ "VIP-Dungelgrün-Camo", "vip_3", {
                "textures\vehicles\vip\camo_dunkelgruen.paa",
                "textures\vehicles\vip\camo_dunkelgruen.paa"
            }, "" },
			{ "VIP-Turquoise-Camo", "vip_3", {
                "textures\vehicles\vip\camo_hellblau.paa",
                "textures\vehicles\vip\camo_hellblau.paa"
            }, "" },
			{ "VIP-Lila-Camo", "vip_3", {
                "textures\vehicles\vip\camo_lila.paa",
                "textures\vehicles\vip\camo_lila.paa"
            }, "" },
			{ "", "vip_3", {
                "textures\vehicles\vip\camo_orange.paa",
                "textures\vehicles\vip\camo_orange.paa"
            }, "" },
        };
    };	

    class I_Truck_02_transport_F {
        vItemSpace = 175;
        conditions = "";
        price = 225000;
		fee = 8000;
        textures[] = {
            { "Orange", "civ", {
                "\A3\Soft_F_Beta\Truck_02\data\truck_02_kab_co.paa",
                "\a3\soft_f_beta\Truck_02\data\truck_02_kuz_co.paa"
            }, "" },
            { "Digi Tarn", "civ", {
                "\A3\Soft_F_Beta\Truck_02\data\truck_02_kab_indp_co.paa",
                "\a3\soft_f_beta\Truck_02\data\truck_02_kuz_indp_co.paa"
            }, "" },
			{ "Dessert Tarn", "civ", {
                "\A3\Soft_F_Beta\Truck_02\data\truck_02_kab_opfor_co.paa",
                "\a3\soft_f_beta\Truck_02\data\truck_02_kuz_opfor_co.paa"
            }, "" },
			{ "VIP-Blau-Camo", "vip_1", {
                "textures\vehicles\vip\camo_blau.paa",
                "textures\vehicles\vip\camo_blau.paa"
            }, "" },
			{ "VIP-Gelb-Camo", "vip_2", {
                "textures\vehicles\vip\camo_gelb.paa",
                "textures\vehicles\vip\camo_gelb.paa"
            }, "" },
			{ "VIP-Grau-Camo", "vip_3", {
                "textures\vehicles\vip\camo_grau.paa",
                "textures\vehicles\vip\camo_grau.paa"
            }, "" },
			{ "VIP-Hellgrün-Camo", "vip_2", {
                "textures\vehicles\vip\camo_gruen.paa",
                "textures\vehicles\vip\camo_gruen.paa"
            }, "" },
			{ "VIP-Pink-Camo", "vip_2", {
                "textures\vehicles\vip\camo_pink.paa",
                "textures\vehicles\vip\camo_pink.paa"
            }, "" },
			{ "VIP-Rot-Camo", "vip_1", {
                "textures\vehicles\vip\camo_rot.paa",
                "textures\vehicles\vip\camo_rot.paa"
            }, "" },
			{ "VIP-Dungelgrün-Camo", "vip_3", {
                "textures\vehicles\vip\camo_dunkelgruen.paa",
                "textures\vehicles\vip\camo_dunkelgruen.paa"
            }, "" },
			{ "VIP-Turquoise-Camo", "vip_3", {
                "textures\vehicles\vip\camo_hellblau.paa",
                "textures\vehicles\vip\camo_hellblau.paa"
            }, "" },
			{ "VIP-Lila-Camo", "vip_3", {
                "textures\vehicles\vip\camo_lila.paa",
                "textures\vehicles\vip\camo_lila.paa"
            }, "" },
			{ "", "vip_3", {
                "textures\vehicles\vip\camo_orange.paa",
                "textures\vehicles\vip\camo_orange.paa"
            }, "" },
        };
    };
	
	class O_Truck_02_Ammo_F {
        vItemSpace = 250;
        conditions = "";
        price = 450000;
		fee = 10500;
        textures[] = {
            { "Dessert Tarn", "civ", {
                "\A3\Soft_F_Beta\Truck_02\data\truck_02_kab_opfor_co.paa",
                "\a3\soft_f_beta\Truck_02\data\truck_02_repair_opfor_co.paa"
            }, "" },
            { "VIP-Digi Tarn", "vip_2", {
                "\A3\Soft_F_Beta\Truck_02\data\truck_02_kab_indp_co.paa",
                "\a3\soft_f_beta\Truck_02\data\truck_02_repair_indp_co.paa"
            }, "" },
			{ "VIP-Orange", "vip_2", {
                "\A3\Soft_F_Beta\Truck_02\data\truck_02_kab_co.paa",
                "\a3\soft_f_beta\Truck_02\data\truck_02_repair_co.paa"
            }, "" },
			{ "VIP-Blau-Camo", "vip_1", {
                "textures\vehicles\vip\camo_blau.paa",
                "textures\vehicles\vip\camo_blau.paa"
            }, "" },
			{ "VIP-Gelb-Camo", "vip_2", {
                "textures\vehicles\vip\camo_gelb.paa",
                "textures\vehicles\vip\camo_gelb.paa"
            }, "" },
			{ "VIP-Grau-Camo", "vip_3", {
                "textures\vehicles\vip\camo_grau.paa",
                "textures\vehicles\vip\camo_grau.paa"
            }, "" },
			{ "VIP-Hellgrün-Camo", "vip_2", {
                "textures\vehicles\vip\camo_gruen.paa",
                "textures\vehicles\vip\camo_gruen.paa"
            }, "" },
			{ "VIP-Pink-Camo", "vip_2", {
                "textures\vehicles\vip\camo_pink.paa",
                "textures\vehicles\vip\camo_pink.paa"
            }, "" },
			{ "VIP-Rot-Camo", "vip_1", {
                "textures\vehicles\vip\camo_rot.paa",
                "textures\vehicles\vip\camo_rot.paa"
            }, "" },
			{ "VIP-Dungelgrün-Camo", "vip_3", {
                "textures\vehicles\vip\camo_dunkelgruen.paa",
                "textures\vehicles\vip\camo_dunkelgruen.paa"
            }, "" },
			{ "VIP-Turquoise-Camo", "vip_3", {
                "textures\vehicles\vip\camo_hellblau.paa",
                "textures\vehicles\vip\camo_hellblau.paa"
            }, "" },
			{ "VIP-Lila-Camo", "vip_3", {
                "textures\vehicles\vip\camo_lila.paa",
                "textures\vehicles\vip\camo_lila.paa"
            }, "" },
			{ "", "vip_3", {
                "textures\vehicles\vip\camo_orange.paa",
                "textures\vehicles\vip\camo_orange.paa"
            }, "" },
        };
    };
	
	class O_Truck_02_fuel_F {
        vItemSpace = 150;
		vFuelSpace = 2000;
        conditions = "";
        price = 180000;
		fee = 5000;
        textures[] = {
            { "Orange", "civ", {
                "\A3\Soft_F_Beta\Truck_02\data\truck_02_fuel_co.paa",
                "\A3\Soft_F_Beta\Truck_02\data\truck_02_fuel_co.paa"
            }, "" },
            { "VIP-Digi Tarn", "vip_2", {
                "\A3\Soft_F_Beta\Truck_02\data\truck_02_fuel_indp_co.paa",
                "\A3\Soft_F_Beta\Truck_02\data\truck_02_fuel_indp_co.paa"
            }, "" },
			{ "VIP-Digi Tarn", "vip_2", {
                "\A3\Soft_F_Beta\Truck_02\data\truck_02_fuel_opfor_co.paa"
            }, "" },			
			{ "VIP-Blau-Camo", "vip_1", {
                "textures\vehicles\vip\camo_blau.paa",
                "textures\vehicles\vip\camo_blau.paa"
            }, "" },
			{ "VIP-Gelb-Camo", "vip_2", {
                "textures\vehicles\vip\camo_gelb.paa",
                "textures\vehicles\vip\camo_gelb.paa"
            }, "" },
			{ "VIP-Grau-Camo", "vip_3", {
                "textures\vehicles\vip\camo_grau.paa",
                "textures\vehicles\vip\camo_grau.paa"
            }, "" },
			{ "VIP-Hellgrün-Camo", "vip_2", {
                "textures\vehicles\vip\camo_gruen.paa",
                "textures\vehicles\vip\camo_gruen.paa"
            }, "" },
			{ "VIP-Pink-Camo", "vip_2", {
                "textures\vehicles\vip\camo_pink.paa",
                "textures\vehicles\vip\camo_pink.paa"
            }, "" },
			{ "VIP-Rot-Camo", "vip_1", {
                "textures\vehicles\vip\camo_rot.paa",
                "textures\vehicles\vip\camo_rot.paa"
            }, "" },
			{ "VIP-Dungelgrün-Camo", "vip_3", {
                "textures\vehicles\vip\camo_dunkelgruen.paa",
                "textures\vehicles\vip\camo_dunkelgruen.paa"
            }, "" },
			{ "VIP-Turquoise-Camo", "vip_3", {
                "textures\vehicles\vip\camo_hellblau.paa",
                "textures\vehicles\vip\camo_hellblau.paa"
            }, "" },
			{ "VIP-Lila-Camo", "vip_3", {
                "textures\vehicles\vip\camo_lila.paa",
                "textures\vehicles\vip\camo_lila.paa"
            }, "" },
			{ "", "vip_3", {
                "textures\vehicles\vip\camo_orange.paa",
                "textures\vehicles\vip\camo_orange.paa"
            }, "" },
        };
    };

    class O_Truck_03_covered_F {
        vItemSpace = 585;
        conditions = "";
        price = 7600000;
		fee = 40000;
        textures[] = {};
    };
	
	class O_Truck_03_ammo_F { 
        vItemSpace = 435;
        conditions = "";
        price = 5000000;
		fee = 25000;
        textures[] = {};
    };
	
	class O_Heli_Attack_02_black_F { 
        vItemSpace = 40;
        conditions = "";
        price = 25000000;
		fee = 100000;
        textures[] = {};
    };
	
	class O_Truck_03_fuel_F {
        vItemSpace = 535;
		vFuelSpace = 6000;
        conditions = "";
        price = 6800000;
		fee = 35000;
        textures[] = {};
    };
	
	class B_Truck_01_ammo_F {
        vItemSpace = 450;
        conditions = "";
        price = 2700000;
		fee = 20000;
        textures[] = {};
    };

    class C_Hatchback_01_F {
        vItemSpace = 40;
        conditions = "";
        price = 45000;
		fee = 6000;
        textures[] = {
            { "Beige", "civ", {
                "\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_base01_co.paa"
            }, "" },
            { "Grün", "civ", {
                "\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_base02_co.paa"
            }, "" },
            { "Blau", "civ", {
                "\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_base03_co.paa"
            }, "" },
            { "Dunkel Blau", "civ", {
                "\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_base04_co.paa"
            }, "" },
            { "Gelb", "civ", {
                "\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_base06_co.paa"
            }, "" },
            { "Weiss", "civ", {
                "\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_base07_co.paa"
            }, "" },
            { "Grau", "civ", {
                "\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_base08_co.paa"
            }, "" },
            { "Schwarz", "civ", {
                "\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_base09_co.paa"
            }, "" },
			{ "Polizei", "cop", {
                "textures\vehicles\cop\hatchbackpol.paa"
            }, "" },
			{ "Blue Smile", "civ", {
                "textures\vehicles\civ\hb\bluesmile.paa"
            }, "" },
			{ "Grandpa", "civ", {
                "textures\vehicles\civ\hb\grandpa.paa"
            }, "" },
			{ "Sunset", "civ", {
                "textures\vehicles\civ\hb\sunset.paa"
            }, "" },
			{ "Wave", "civ", {
                "textures\vehicles\civ\hb\wave.paa"
            }, "" },
			{ "Feuerwehr", "med", {
                "textures\vehicles\medic\hatchback.paa"
            }, "" },
			{ "Rebell Schwarz/Rot", "reb", {
                "textures\vehicles\reb\hatchback_reb_rot.paa"
            }, "" },
			{ "VIP-Rebell Schwarz/Grün", "vip_2", {
                "textures\vehicles\reb\hatchback_reb_gruen.paa"
            }, "" },
			{ "Sicherheitsdienst", "WSC", {
                "textures\vehicles\sicher\hatchback_sicher.paa"
            }, "" },
			{ "VIP-Blau-Camo", "vip_1", {
                "textures\vehicles\vip\hatchback_camo_blau.paa"
            }, "" },
			{ "VIP-Gelb-Camo", "vip_2", {
                "textures\vehicles\vip\hatchback_camo_gelb.paa"
            }, "" },
			{ "VIP-Grau-Camo", "vip_3", {
                "textures\vehicles\vip\hatchback_camo_grau.paa"
            }, "" },
			{ "VIP-Hellgrün-Camo", "vip_2", {
                "textures\vehicles\vip\hatchback_camo_gruen.paa"
            }, "" },
			{ "VIP-Pink-Camo", "vip_2", {
                "textures\vehicles\vip\hatchback_camo_pink.paa"
            }, "" },
			{ "VIP-Rot-Camo", "vip_1", {
                "textures\vehicles\vip\hatchback_camo_rot.paa"
            }, "" },
			{ "VIP-Weed", "vip_5", {
                "textures\vehicles\vip\hatchback_weed.paa"
            }, "" },
			{ "VIP-Division Wolf", "vip_5", {
                "textures\vehicles\vip\hatchback_wolf.paa"
            }, "" },
			{ "VIP-Spiderman", "vip_5", {
                "textures\vehicles\vip\Hatchback_spider.paa"
            }, "" },
        };
    };
	
    class C_SUV_01_F {
        vItemSpace = 40;
        conditions = "";
        price = 65000;
		fee = 4000;
        textures[] = {
            { "Dunkel Rot", "civ", {
                "\a3\soft_f_gamma\SUV_01\Data\suv_01_ext_co.paa"
            }, "" },
            { "Polizei", "cop", {
                "textures\vehicles\cop\police_suv.paa"
            }, "" },
			{ "Silber", "civ", {
                "\a3\soft_f_gamma\SUV_01\Data\suv_01_ext_03_co.paa"
            }, "" },
			{ "Orange", "civ", {
                "\a3\soft_f_gamma\SUV_01\Data\suv_01_ext_04_co.paa"
            }, "" },
			{ "Schwarz - Zivi", "cop_zivi", {
                "\a3\soft_f_gamma\SUV_01\Data\suv_01_ext_02_co.paa"
            }, "" },
			{ "Feuerwehr", "med", {
                "textures\vehicles\medic\suv.paa"
            }, "" },			
			{ "Schwarz", "civ", {
                "\a3\soft_f_gamma\SUV_01\Data\suv_01_ext_02_co.paa"
            }, "" },
			{ "Bimbo Gurl", "civ", {
                "textures\vehicles\civ\suv\bimbo.paa"
            }, "" },			
			{ "Grandpa", "civ", {
                "textures\vehicles\civ\suv\grandpa.paa"
            }, "" },
			{ "Poison Green", "civ", {
                "textures\vehicles\civ\suv\green.paa"
            }, "" },
			{ "Oxygen", "civ", {
                "textures\vehicles\civ\suv\oxygen.paa"
            }, "" },
			{ "Sunset", "civ", {
                "textures\vehicles\civ\suv\sunset.paa"
            }, "" },
			{ "Taxi", "server", {
                "textures\vehicles\taxi\suv.paa"
            }, "" },
			{ "Rebell Schwarz/Rot", "reb", {
                "textures\vehicles\reb\suv_reb_rot.paa"
            }, "" },
			{ "VIP-Rebell Schwarz/Grün", "vip_2", {
                "textures\vehicles\reb\suv_reb_gruen.paa"
            }, "" },
			{ "Dunkel Rot - Zivi", "cop_zivi", {
                "\a3\soft_f_gamma\SUV_01\Data\suv_01_ext_co.paa"
            }, "" },
			{ "Silber - Zivi", "cop_zivi", {
                "\a3\soft_f_gamma\SUV_01\Data\suv_01_ext_03_co.paa"
            }, "" },
			{ "Orange - Zivi", "cop_zivi", {
                "\a3\soft_f_gamma\SUV_01\Data\suv_01_ext_04_co.paa"
            }, "" },
			{ "Bimbo Gurl - Zivi", "cop_zivi", {
                "textures\vehicles\civ\suv\bimbo.paa"
            }, "" },
			{ "Grandpa - Zivi", "cop_zivi", {
                "textures\vehicles\civ\suv\grandpa.paa"
            }, "" },
			{ "Poison Green - Zivi", "cop_zivi", {
                "textures\vehicles\civ\suv\green.paa"
            }, "" },
			{ "Oxygen - Zivi", "cop_zivi", {
                "textures\vehicles\civ\suv\oxygen.paa"
            }, "" },
			{ "Sunset - Zivi", "cop_zivi", {
                "textures\vehicles\civ\suv\sunset.paa"
            }, "" },
			{ "VIP-Blau-Camo", "vip_1", {
                "textures\vehicles\vip\suv_camo_blau.paa"
            }, "" },
			{ "VIP-Gelb-Camo", "vip_2", {
                "textures\vehicles\vip\suv_camo_gelb.paa"
            }, "" },
			{ "VIP-Grau-Camo", "vip_3", {
                "textures\vehicles\vip\suv_camo_grau.paa"
            }, "" },
			{ "VIP-Hellgrün-Camo", "vip_2", {
                "textures\vehicles\vip\suv_camo_gruen.paa"
            }, "" },
			{ "VIP-Pink-Camo", "vip_2", {
                "textures\vehicles\vip\suv_camo_pink.paa"
            }, "" },
			{ "VIP-Rot-Camo", "vip_1", {
                "textures\vehicles\vip\suv_camo_rot.paa"
            }, "" },
			{ "VIP-Division Wolf", "vip_5", {
                "textures\vehicles\vip\Suv_wolf.paa"
            }, "" },
			{ "VIP-Batman", "vip_5", {
                "textures\vehicles\vip\suv_batman.paa"
            }, "" },
			{ "VIP-Superman", "vip_5", {
                "textures\vehicles\vip\suv_superman.paa"
            }, "" },
			{ "VIP-Cannabis", "vip_5", {
                "textures\vehicles\vip\suv_weed.paa"
            }, "" },
			{ "VIP-Die Simpsons", "vip_5", {
                "textures\vehicles\vip\suv_simpsons.paa"
            }, "" },
			{ "Verhandlungsführer", "cop_zivi", {
                "textures\vehicles\cop\verhandlung.paa"
            }, "" },
			{ "Admin", "admin_3", {
                "textures\vehicles\civ\suv\ADMIN_SUV.paa"
            }, "" },
			{ "Schneemann", "admin_4", {
                "textures\vehicles\civ\suv\schneemann.paa"
            }, "" },
        };
    };
	
	class C_Van_01_transport_F {
        vItemSpace = 100;
        conditions = "";
        price = 72000;
		fee = 3000;
        textures[] = {
            { "Weiss", "civ", {
                "\a3\soft_f_gamma\Van_01\Data\van_01_ext_co.paa"
            }, "" },
            { "Rot", "civ", {
                "\a3\soft_f_gamma\Van_01\Data\van_01_ext_red_co.paa"
            }, "" },
			{ "VIP-Grün Zebra 1", "vip_2", {
                "\a3\soft_f_gamma\Van_01\Data\van_01_ext_ig_co.paa"
            }, "" },
			{ "VIP-Grün Zebra 2", "vip_2", {
                "\a3\soft_f_bootcamp\Van_01\Data\van_01_ext_ig_01_co.paa"
            }, "" },
			{ "VIP-Braun Zebra 1", "vip_2", {
                "\a3\soft_f_bootcamp\Van_01\Data\van_01_ext_ig_02_co.paa"
            }, "" },
			{ "VIP-Braun Zebra 2", "vip_2", {
                "\a3\soft_f_bootcamp\Van_01\Data\van_01_ext_ig_03_co.paa"
            }, "" },
			{ "VIP-Braun/Grün Zebra 1", "vip_2", {
                "\a3\soft_f_bootcamp\Van_01\Data\van_01_ext_ig_04_co.paa"
            }, "" },
			{ "VIP-Braun/Grün Zebra 2", "vip_2", {
                "\a3\soft_f_bootcamp\Van_01\Data\van_01_ext_ig_05_co.paa"
            }, "" },
			{ "VIP-Camo Zebra 1", "vip_2", {
                "\a3\soft_f_bootcamp\Van_01\Data\van_01_ext_ig_06_co.paa"
            }, "" },
			{ "VIP-Camo Zebra 2", "vip_2", {
                "\a3\soft_f_bootcamp\Van_01\Data\van_01_ext_ig_07_co.paa"
            }, "" },
			{ "VIP-Weiß Zebra", "vip_2", {
                "\a3\soft_f_bootcamp\Van_01\Data\van_01_ext_ig_08_co.paa"
            }, "" },
			{ "VIP-Schwarz", "vip_2", {
                "\a3\soft_f_gamma\Van_01\Data\van_01_ext_black_co.paa"
            }, "" },
        };
    };

    class C_Van_01_box_F {
        vItemSpace = 125;
        conditions = "";
        price = 108000;
		fee = 5000;
        textures[] = {
            { "Weiss", "civ", {
                "\a3\soft_f_gamma\Van_01\Data\van_01_ext_co.paa"
            }, "" },
            { "Rot", "civ", {
                "\a3\soft_f_gamma\Van_01\Data\van_01_ext_red_co.paa"
            }, "" },
			{ "VIP-Grün Zebra 1", "vip_2", {
                "\a3\soft_f_gamma\Van_01\Data\van_01_ext_ig_co.paa",
				"\a3\soft_f_gamma\Van_01\Data\van_01_adds_ig_co.paa"
            }, "" },
			{ "Feuerwehr", "med", {
                "textures\vehicles\medic\vanbox0.paa",
				"textures\vehicles\medic\vanbox.paa"
            }, "" },
			{ "VIP-Schwarz", "vip_2", {
                "\a3\soft_f_gamma\Van_01\Data\van_01_ext_black_co.paa"
            }, "" },
			{ "VIP-Grün Zebra 2", "vip_2", {
                "\a3\soft_f_bootcamp\Van_01\Data\van_01_ext_ig_01_co.paa",
				"\a3\soft_f_bootcamp\Van_01\Data\van_01_adds_ig_01_co.paa"
            }, "" },
			{ "VIP-Braun Zebra 1", "vip_2", {
                "\a3\soft_f_bootcamp\Van_01\Data\van_01_ext_ig_02_co.paa",
				"\a3\soft_f_bootcamp\Van_01\Data\van_01_adds_ig_02_co.paa"
            }, "" },
			{ "VIP-Braun Zebra 2", "vip_2", {
                "\a3\soft_f_bootcamp\Van_01\Data\van_01_ext_ig_03_co.paa",
				"\a3\soft_f_bootcamp\Van_01\Data\van_01_adds_ig_03_co.paa"
            }, "" },
			{ "VIP-Braun/Grün Zebra 1", "vip_2", {
                "\a3\soft_f_bootcamp\Van_01\Data\van_01_ext_ig_04_co.paa",
				"\a3\soft_f_bootcamp\Van_01\Data\van_01_adds_ig_04_co.paa"
            }, "" },
			{ "VIP-Braun/Grün Zebra 2", "vip_2", {
               "\a3\soft_f_bootcamp\Van_01\Data\van_01_ext_ig_05_co.paa",
			   "\a3\soft_f_bootcamp\Van_01\Data\van_01_adds_ig_05_co.paa"
            }, "" },
			{ "VIP-Camo Zebra 1", "vip_2", {
                "\a3\soft_f_bootcamp\Van_01\Data\van_01_ext_ig_06_co.paa",
				"\a3\soft_f_bootcamp\Van_01\Data\van_01_adds_ig_06_co.paa"
            }, "" },
			{ "VIP-Camo Zebra 2", "vip_2", {
                "\a3\soft_f_bootcamp\Van_01\Data\van_01_ext_ig_07_co.paa",
				"\a3\soft_f_bootcamp\Van_01\Data\van_01_adds_ig_07_co.paa"
            }, "" },
			{ "VIP-Weiß Zebra ", "vip_2", {
                "\a3\soft_f_bootcamp\Van_01\Data\van_01_ext_ig_08_co.paa",
				"\a3\soft_f_bootcamp\Van_01\Data\van_01_adds_ig_08_co.paa"
            }, "" },
        };
    };
			
    class B_MRAP_01_F {
        vItemSpace = 60;
        conditions = "";
        price = 8500000;
		fee = 80000;
        textures[] = {
            { "Polizei", "cop_5", {
                "textures\vehicles\cop\hunterpol.paa",
                "textures\vehicles\cop\hunterpol2.paa"
            }, "" },
			{ "SEK", "cop_sek", {
                "textures\vehicles\cop\huntersek.paa",
                "textures\vehicles\cop\huntersek2.paa"
            }, "" },
			{ "Sandmann", "admin_4", {
                "textures\vehicles\civ\hunter\huntersandmann.paa",
                "textures\vehicles\civ\hunter\huntersandmann2.paa"
            }, "" },
			{ "Rebell Schwarz/Rot", "reb", {
                "textures\vehicles\reb\hunterreb.paa",
                "textures\vehicles\reb\hunterreb2.paa"
            }, "" },
			{ "Feuerwehr", "med", {
                "textures\vehicles\medic\huntermed.paa",
                "textures\vehicles\medic\huntermed2.paa"
            }, "" },
			{ "ADAC", "adac", {
                "textures\vehicles\medic\huntermed.paa",
                "textures\vehicles\medic\huntermed2.paa"
            }, "" },
			{ "Wolfsmobil", "admin_4", {
                "textures\vehicles\civ\hunter\katze.paa",
                "textures\vehicles\civ\hunter\katze2.paa"
            }, "" },
			{ "VIP-Rebell Schwarz/Grün", "vip_2", {
                "textures\vehicles\reb\hunterrebg.paa",
                "textures\vehicles\reb\hunterreb2.paa"
            }, "" },
			{ "Sicherheitsdienst", "WSC", {
                "textures\vehicles\sicher\sicher_hunter1.paa",
                "textures\vehicles\sicher\sicher_hunter2.paa"
            }, "" },
			{ "VIP-Blau-Camo", "vip_1", {
                "textures\vehicles\vip\camo_blau.paa",
                "textures\vehicles\vip\hunter_camo_blau_2.paa"
            }, "" },
			{ "VIP-Gelb-Camo", "vip_2", {
                "textures\vehicles\vip\camo_gelb.paa",
                "textures\vehicles\vip\hunter_camo_gelb_2.paa"
            }, "" },
			{ "VIP-Grau-Camo", "vip_3", {
                "textures\vehicles\vip\camo_grau.paa",
                "textures\vehicles\vip\hunter_camo_grau_2.paa"
            }, "" },
			{ "VIP-Hellgrün-Camo", "vip_2", {
                "textures\vehicles\vip\camo_gruen.paa",
                "textures\vehicles\vip\hunter_camo_gruen_2.paa"
            }, "" },
			{ "VIP-Pink-Camo", "vip_2", {
                "textures\vehicles\vip\camo_pink.paa",
                "textures\vehicles\vip\hunter_camo_pink_2.paa"
            }, "" },
			{ "VIP-Rot-Camo", "vip_1", {
                "textures\vehicles\vip\camo_rot.paa",
                "textures\vehicles\vip\hunter_camo_rot_2.paa"
            }, "" },
			{ "Begleitschutz", "beg", {
                "textures\vehicles\cop\hunterbeg.paa",
                "textures\vehicles\cop\hunterbeg2.paa"
            }, "" },
        };
    };

    class B_Heli_Light_01_F { //littlebird
        vItemSpace = 10;
        conditions = "";
        price = 450000;
		fee = 20000;
        textures[] = {
            { "Blue", "civ", {
                "\a3\air_f\Heli_Light_01\Data\heli_light_01_ext_blue_co.paa"
            }, "" },
            { "Rot", "civ", {
                "\a3\air_f\Heli_Light_01\Data\heli_light_01_ext_co.paa"
            }, "" },
			{ "VIP Digi Green", "vip_2", {
                "\a3\air_f\Heli_Light_01\Data\heli_light_01_ext_indp_co.paa"
            }, "" },
			{ "Blueline", "civ", {
                "\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_blueline_co.paa"
            }, "" },
			{ "Elliptical", "civ", {
                "\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_elliptical_co.paa"
            }, "" },
			{ "Furious", "civ", {
                "\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_furious_co.paa"
            }, "" },
			{ "Jeans Blau", "civ", {
                "\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_jeans_co.paa"
            }, "" },
			{ "Speedy Redline", "civ", {
                "\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_speedy_co.paa"
            }, "" },
			{ "Sunset", "civ", {
                "\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_sunset_co.paa"
            }, "" },
			{ "Vrana", "civ", {
                "\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_vrana_co.paa"
            }, "" },
			{ "Waves Blau", "civ", {
                "\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_wave_co.paa"
            }, "" },
			{ "Rebel Digital", "reb", {
                "\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_digital_co.paa"
            }, "" },
			{ "Polizei", "cop_3", {
                "textures\vehicles\cop\littlebird_cop.paa"
            }, "" },
			{ "Feuerwehr", "med", {
                "textures\vehicles\medic\littlemed.paa"
            }, "" },
			{ "ADAC", "adac", {
                "textures\vehicles\medic\littlemed.paa"
            }, "" },
			{ "SEK", "cop_sek", {
                "textures\vehicles\cop\littlebird_sek.paa"
            }, "" },
			{ "Rebell Schwarz/Rot", "reb", {
                "textures\vehicles\reb\littlebird_reb_rot.paa"
            }, "" },
			{ "VIP-Rebell Schwarz/Grün", "vip_2", {
                "textures\vehicles\reb\littlebird_reb_gruen.paa"
            }, "" },
			{ "Sicherheitsdienst", "WSC", {
                "textures\vehicles\sicher\sicher_littlebird.paa"
            }, "" },
			{ "VIP-Blau-Camo", "vip_1", {
                "textures\vehicles\vip\camo_blau.paa"
            }, "" },
			{ "VIP-Gelb-Camo", "vip_2", {
                "textures\vehicles\vip\camo_gelb.paa"
            }, "" },
			{ "VIP-Grau-Camo", "vip_3", {
                "textures\vehicles\vip\camo_grau.paa"
            }, "" },
			{ "VIP-Hellgrün-Camo", "vip_2", {
                "textures\vehicles\vip\camo_gruen.paa"
            }, "" },
			{ "VIP-Pink-Camo", "vip_2", {
                "textures\vehicles\vip\camo_pink.paa"
            }, "" },
			{ "VIP-Rot-Camo", "vip_1", {
                "textures\vehicles\vip\camo_rot.paa"
            }, "" },
			{ "VIP-Dungelgrün-Camo", "vip_3", {
                "textures\vehicles\vip\camo_dunkelgruen.paa"
            }, "" },
			{ "VIP-Turquoise-Camo", "vip_3", {
                "textures\vehicles\vip\camo_hellblau.paa"
            }, "" },
			{ "VIP-Lila-Camo", "vip_3", {
                "textures\vehicles\vip\camo_lila.paa"
            }, "" },
			{ "VIP-Orange-Camo", "vip_3", {
                "textures\vehicles\vip\camo_orange.paa"
            }, "" },
			{ "Verhandlungsführer", "cop_zivi", {
                "textures\vehicles\cop\littlebird-VF.paa"
            }, "" },
        };
    };
	
	class C_Heli_Light_01_civil_F { //m-900
        vItemSpace = 15;
        conditions = "";
        price = 540000;
		fee = 20000;
		textures[] = {
            { "Blue", "civ", {
                "\a3\air_f\Heli_Light_01\Data\heli_light_01_ext_blue_co.paa"
            }, "" },
            { "Rot", "civ", {
                "\a3\air_f\Heli_Light_01\Data\heli_light_01_ext_co.paa"
            }, "" },
			{ "VIP Digi Green", "vip_2", {
                "\a3\air_f\Heli_Light_01\Data\heli_light_01_ext_indp_co.paa"
            }, "" },
			{ "Blueline", "civ", {
                "\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_blueline_co.paa"
            }, "" },
			{ "Elliptical", "civ", {
                "\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_elliptical_co.paa"
            }, "" },
			{ "Furious", "civ", {
                "\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_furious_co.paa"
            }, "" },
			{ "Jeans Blau", "civ", {
                "\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_jeans_co.paa"
            }, "" },
			{ "Speedy Redline", "civ", {
                "\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_speedy_co.paa"
            }, "" },
			{ "Sunset", "civ", {
                "\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_sunset_co.paa"
            }, "" },
			{ "Vrana", "civ", {
                "\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_vrana_co.paa"
            }, "" },
			{ "Waves Blau", "civ", {
                "\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_wave_co.paa"
            }, "" },
			{ "VIP Camo Digital", "vip_2", {
                "\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_digital_co.paa"
            }, "" },
			{ "Rebell Schwarz/Rot", "reb", {
                "textures\vehicles\reb\littlebird_reb_rot.paa"
            }, "" },
			{ "VIP-Rebell Schwarz/Grün", "vip_2", {
                "textures\vehicles\reb\littlebird_reb_gruen.paa"
            }, "" },
			{ "VIP-Blau-Camo", "vip_1", {
                "textures\vehicles\vip\camo_blau.paa"
            }, "" },
			{ "VIP-Gelb-Camo", "vip_2", {
                "textures\vehicles\vip\camo_gelb.paa"
            }, "" },
			{ "VIP-Grau-Camo", "vip_3", {
                "textures\vehicles\vip\camo_grau.paa"
            }, "" },
			{ "VIP-Hellgrün-Camo", "vip_2", {
                "textures\vehicles\vip\camo_gruen.paa"
            }, "" },
			{ "VIP-Pink-Camo", "vip_2", {
                "textures\vehicles\vip\camo_pink.paa"
            }, "" },
			{ "VIP-Rot-Camo", "vip_1", {
                "textures\vehicles\vip\camo_rot.paa"
            }, "" },
			{ "VIP-Dungelgrün-Camo", "vip_3", {
                "textures\vehicles\vip\camo_dunkelgruen.paa"
            }, "" },
			{ "VIP-Turquoise-Camo", "vip_3", {
                "textures\vehicles\vip\camo_hellblau.paa"
            }, "" },
			{ "VIP-Lila-Camo", "vip_3", {
                "textures\vehicles\vip\camo_lila.paa"
            }, "" },
			{ "VIP-Orange-Camo", "vip_3", {
                "textures\vehicles\vip\camo_orange.paa"
            }, "" },
        };
    };
	
    class O_Heli_Light_02_unarmed_F {
        vItemSpace = 40;
        conditions = "";
        price = 2250000;
		fee = 30000;
        textures[] = {
            { "Schwarz", "civ", {
                "\a3\air_f\Heli_Light_02\Data\heli_light_02_ext_co.paa"
            }, "" },
			{ "Weiss / Blau", "civ", {
                "\a3\air_f\Heli_Light_02\Data\heli_light_02_ext_civilian_co.paa"
            }, "" },
			{ "Digi Green", "civ", {
                "\a3\air_f\Heli_Light_02\Data\heli_light_02_ext_indp_co.paa"
            }, "" },
			{ "Desert Digi", "civ", {
                "\a3\air_f\Heli_Light_02\Data\heli_light_02_ext_opfor_co.paa"
            }, "" },
			{ "VIP-Blau-Camo", "vip_1", {
                "textures\vehicles\vip\camo_blau.paa"
            }, "" },
			{ "VIP-Gelb-Camo", "vip_2", {
                "textures\vehicles\vip\camo_gelb.paa"
            }, "" },
			{ "VIP-Grau-Camo", "vip_3", {
                "textures\vehicles\vip\camo_grau.paa"
            }, "" },
			{ "VIP-Hellgrün-Camo", "vip_2", {
                "textures\vehicles\vip\camo_gruen.paa"
            }, "" },
			{ "VIP-Pink-Camo", "vip_2", {
                "textures\vehicles\vip\camo_pink.paa"
            }, "" },
			{ "VIP-Rot-Camo", "vip_1", {
                "textures\vehicles\vip\camo_rot.paa"
            }, "" },
			{ "Feuerwehr", "med", {
                "textures\vehicles\medic\orca.paa"
            }, "" },
			{ "VIP-Dungelgrün-Camo", "vip_3", {
                "textures\vehicles\vip\camo_dunkelgruen.paa"
            }, "" },
			{ "VIP-Turquoise-Camo", "vip_3", {
                "textures\vehicles\vip\camo_hellblau.paa"
            }, "" },
			{ "VIP-Lila-Camo", "vip_3", {
                "textures\vehicles\vip\camo_lila.paa"
            }, "" },
			{ "VIP-Orange-Camo", "vip_3", {
                "textures\vehicles\vip\camo_orange.paa"
            }, "" },
        };
    };
			
    class B_SDV_01_F { //U-boot
        vItemSpace = 10;
        conditions = "";
        price = 240000;
		fee = 5000;
        textures[] = {
            { "Polizei", "cop", {
                "textures\vehicles\cop\uboot.paa"
            }, "" },
        };
    };
	
	class B_Lifeboat { //Schlauchboot
        vItemSpace = 20;
        conditions = "";
        price = 8000;
		fee = 3000;
        textures[] = {
            { "Polizei", "cop", {
                "textures\vehicles\cop\schlauch.paa"
            }, "" },
        };
    };
	
	class O_Truck_02_box_F { //Farming Auto Admin für Event
        vItemSpace = 300;
        conditions = "";
        price = 50000;
		fee = 1000;
        textures[] = {
            { "Farming Event", "admin_1", {
                "textures\vehicles\civ\zamak_farm.paa",
				"textures\vehicles\civ\zamak_farm.paa"
            }, "" },
        };
    };
	
	class I_Heli_Transport_02_F { //mohawk
        vItemSpace = 80;
        conditions = "";
        price = 11500000;
		fee = 50000;
        textures[] = {
            { "Ion", "civ", {
                "\a3\air_f_beta\Heli_Transport_02\Data\Skins\heli_transport_02_1_ion_co.paa",
				"\a3\air_f_beta\Heli_Transport_02\Data\Skins\heli_transport_02_2_ion_co.paa",
				"\a3\air_f_beta\Heli_Transport_02\Data\Skins\heli_transport_02_3_ion_co.paa"
            }, "" },
			{ "Dahoman", "civ", {
                "\a3\air_f_beta\Heli_Transport_02\Data\Skins\heli_transport_02_1_dahoman_co.paa",
				"\a3\air_f_beta\Heli_Transport_02\Data\Skins\heli_transport_02_2_dahoman_co.paa",
				"\a3\air_f_beta\Heli_Transport_02\Data\Skins\heli_transport_02_3_dahoman_co.paa"
            }, "" },
			{ "Digi Tarn", "civ", {
                "\a3\air_f_beta\Heli_Transport_02\Data\Skins\heli_transport_02_3_dahoman_co.paa"
            }, "" },
			{ "VIP-Blau-Camo", "vip_1", {
                "textures\vehicles\vip\camo_blau.paa",
				"textures\vehicles\vip\camo_blau.paa",
				"textures\vehicles\vip\camo_blau.paa"
            }, "" },
			{ "VIP-Gelb-Camo", "vip_2", {
                "textures\vehicles\vip\camo_gelb.paa",
				"textures\vehicles\vip\camo_gelb.paa",
				"textures\vehicles\vip\camo_gelb.paa"
            }, "" },
			{ "VIP-Grau-Camo", "vip_3", {
                "textures\vehicles\vip\camo_grau.paa",
				"textures\vehicles\vip\camo_grau.paa",
				"textures\vehicles\vip\camo_grau.paa"
            }, "" },
			{ "VIP-Hellgrün-Camo", "vip_2", {
                "textures\vehicles\vip\camo_gruen.paa",
				"textures\vehicles\vip\camo_gruen.paa",
				"textures\vehicles\vip\camo_gruen.paa"
            }, "" },
			{ "VIP-Pink-Camo", "vip_2", {
                "textures\vehicles\vip\camo_pink.paa",
				"textures\vehicles\vip\camo_pink.paa",
				"textures\vehicles\vip\camo_pink.paa"
            }, "" },
			{ "VIP-Rot-Camo", "vip_1", {
                "textures\vehicles\vip\camo_rot.paa",
				"textures\vehicles\vip\camo_rot.paa",
				"textures\vehicles\vip\camo_rot.paa"
            }, "" },
			{ "VIP-Dungelgrün-Camo", "vip_3", {
                "textures\vehicles\vip\camo_dunkelgruen.paa",
				"textures\vehicles\vip\camo_dunkelgruen.paa",
				"textures\vehicles\vip\camo_dunkelgruen.paa"
            }, "" },
			{ "VIP-turquoise-Camo", "vip_3", {
                "textures\vehicles\vip\camo_hellblau.paa",
				"textures\vehicles\vip\camo_hellblau.paa",
				"textures\vehicles\vip\camo_hellblau.paa"
            }, "" },
			{ "VIP-Lila-Camo", "vip_3", {
                "textures\vehicles\vip\camo_lila.paa",
				"textures\vehicles\vip\camo_lila.paa",
				"textures\vehicles\vip\camo_lila.paa"
            }, "" },
			{ "VIP-Orange-Camo", "vip_3", {
                "textures\vehicles\vip\camo_orange.paa",
				"textures\vehicles\vip\camo_orange.paa",
				"textures\vehicles\vip\camo_orange.paa"
            }, "" },
        };
    };
	
	class B_Heli_Transport_03_unarmed_F { //Huron
        vItemSpace = 90;
        conditions = "";
        price = 13500000;
		fee = 60000;
        textures[] = {
            { "Zivilist", "civ", {
                "\a3\air_f_heli\Heli_Transport_03\Data\heli_transport_03_ext01_co.paa",
				"\a3\air_f_heli\Heli_Transport_03\Data\heli_transport_03_ext02_co.paa"
            }, "" },
			{ "Feuerwehr", "med", {
                "textures\vehicles\medic\huron1_med.paa",
				"textures\vehicles\medic\huron2_med.paa"
            }, "" },
			{ "Polizei", "cop", {
                "textures\vehicles\cop\huron1_pol.paa",
				"textures\vehicles\cop\huron2_pol.paa"
            }, "" },
			{ "Rebell Schwarz/Rot", "reb", {
                "textures\vehicles\reb\huron1_reb_rot.paa",
				"textures\vehicles\reb\huron2_reb_rot.paa"
            }, "" },
			{ "VIP-Rebell Schwarz/Grün", "vip_2", {
                "textures\vehicles\reb\huron1_reb_gruen.paa",
				"textures\vehicles\reb\huron2_reb_gruen.paa"
            }, "" },
			{ "VIP-Blau-Camo", "vip_1", {
                "textures\vehicles\vip\camo_blau.paa",
				"textures\vehicles\vip\camo_blau.paa"
            }, "" },
			{ "VIP-Gelb-Camo", "vip_2", {
                "textures\vehicles\vip\camo_gelb.paa",
				"textures\vehicles\vip\camo_gelb.paa"
            }, "" },
			{ "VIP-Grau-Camo", "vip_3", {
                "textures\vehicles\vip\camo_grau.paa",
				"textures\vehicles\vip\camo_grau.paa"
            }, "" },
			{ "VIP-Hellgrün-Camo", "vip_2", {
                "textures\vehicles\vip\camo_gruen.paa",
				"textures\vehicles\vip\camo_gruen.paa"
            }, "" },
			{ "VIP-Pink-Camo", "vip_2", {
                "textures\vehicles\vip\camo_pink.paa",
				"textures\vehicles\vip\camo_pink.paa"
            }, "" },
			{ "VIP-Rot-Camo", "vip_1", {
                "textures\vehicles\vip\camo_rot.paa",
				"textures\vehicles\vip\camo_rot.paa"
            }, "" },
			{ "VIP-Schwarz", "vip_2", {
                "\a3\air_f_heli\Heli_Transport_03\Data\heli_transport_03_ext01_black_co.paa",
				"\a3\air_f_heli\Heli_Transport_03\Data\heli_transport_03_ext02_black_co.paa"
            }, "" },
			{ "Sicherheitsdienst", "WSC", {
                "textures\vehicles\sicher\huron1_sicher.paa",
				"textures\vehicles\sicher\huron2_sicher.paa"
            }, "" },
			{ "VIP-Dungelgrün-Camo", "vip_3", {
                "textures\vehicles\vip\camo_dunkelgruen.paa",
				"textures\vehicles\vip\camo_dunkelgruen.paa"
            }, "" },
			{ "VIP-Turquoise-Camo", "vip_3", {
                "textures\vehicles\vip\camo_hellblau.paa",
				"textures\vehicles\vip\camo_hellblau.paa"
            }, "" },
			{ "VIP-Lila-Camo", "vip_3", {
                "textures\vehicles\vip\camo_lila.paa",
				"textures\vehicles\vip\camo_lila.paa"
            }, "" },
			{ "VIP-Orange-Camo", "vip_3", {
                "textures\vehicles\vip\camo_orange.paa",
				"textures\vehicles\vip\camo_orange.paa"
            }, "" },
        };
    };
	
	class O_Heli_Transport_04_F { // Taru
        vItemSpace = 90;
        conditions = "";
        price = 13500000;
		fee = 60000;
        textures[] = {
            { "Zivilist", "civ", {
                "\a3\air_f_heli\Heli_Transport_04\Data\heli_transport_04_base_01_co.paa",
				"\a3\air_f_heli\Heli_Transport_04\Data\heli_transport_04_base_02_co.paa"
            }, "" },
			{ "VIP-Schwarz", "vip_2", {
                "\a3\air_f_heli\Heli_Transport_04\Data\heli_transport_04_base_01_black_co.paa",
				"\a3\air_f_heli\Heli_Transport_04\Data\heli_transport_04_base_02_black_co.paa"
            }, "" },
			{ "VIP-Blau-Camo", "vip_1", {
                "textures\vehicles\vip\camo_blau.paa",
				"textures\vehicles\vip\camo_blau.paa"
            }, "" },
			{ "VIP-Gelb-Camo", "vip_2", {
                "textures\vehicles\vip\camo_gelb.paa",
				"textures\vehicles\vip\camo_gelb.paa"
            }, "" },
			{ "VIP-Grau-Camo", "vip_3", {
                "textures\vehicles\vip\camo_grau.paa",
				"textures\vehicles\vip\camo_grau.paa"
            }, "" },
			{ "VIP-Hellgrün-Camo", "vip_2", {
                "textures\vehicles\vip\camo_gruen.paa",
				"textures\vehicles\vip\camo_gruen.paa"
            }, "" },
			{ "VIP-Pink-Camo", "vip_2", {
                "textures\vehicles\vip\camo_pink.paa",
				"textures\vehicles\vip\camo_pink.paa"
            }, "" },
			{ "VIP-Rot-Camo", "vip_1", {
                "textures\vehicles\vip\camo_rot.paa",
				"textures\vehicles\vip\camo_rot.paa"
            }, "" },
			{ "VIP-Dungelgrün-Camo", "vip_3", {
                "textures\vehicles\vip\camo_dunkelgruen.paa",
				"textures\vehicles\vip\camo_dunkelgruen.paa"
            }, "" },
			{ "VIP-Turquoise-Camo", "vip_3", {
                "textures\vehicles\vip\camo_hellblau.paa",
				"textures\vehicles\vip\camo_hellblau.paa"
            }, "" },
			{ "VIP-Lila-Camo", "vip_3", {
                "textures\vehicles\vip\camo_lila.paa",
				"textures\vehicles\vip\camo_lila.paa"
            }, "" },
			{ "VIP-Orange-Camo", "vip_3", {
                "textures\vehicles\vip\camo_orange.paa",
				"textures\vehicles\vip\camo_orange.paa"
            }, "" },
			{ "Feuerwehr", "med", {
                "textures\vehicles\medic\taru1.paa",
				"textures\vehicles\medic\taru2.paa"
            }, "" },
			{ "Polizei", "cop", {
                "textures\vehicles\cop\taru1.paa",
				"textures\vehicles\cop\taru2.paa"
            }, "" },
        };
    };
	
	class O_Heli_Transport_04_medevac_F { //taru Medic
        vItemSpace = 90;
        conditions = "";
        price = 13500000;
		fee = 60000;
        textures[] = {
            { "Schwarz", "civ", {
                "#(argb,8,8,3)color(0,0,0,1)",
				"#(argb,8,8,3)color(0,0,0,1)",
				"#(argb,8,8,3)color(0,0,0,1)",
				"#(argb,8,8,3)color(0,0,0,1)"
            }, "" },
			{ "Feuerwehr", "med", {
                "textures\vehicles\medic\taru1.paa",
				"textures\vehicles\medic\taru2.paa",
				"textures\vehicles\medic\taru3.paa",
				"textures\vehicles\medic\taru4.paa"
            }, "" },
			{ "VIP-Blau-Camo", "vip_1", {
                "textures\vehicles\vip\camo_blau.paa",
				"textures\vehicles\vip\camo_blau.paa",
				"textures\vehicles\vip\camo_blau.paa",
				"textures\vehicles\vip\camo_blau.paa"
            }, "" },
			{ "VIP-Gelb-Camo", "vip_2", {
                "textures\vehicles\vip\camo_gelb.paa",
				"textures\vehicles\vip\camo_gelb.paa",
				"textures\vehicles\vip\camo_gelb.paa",
				"textures\vehicles\vip\camo_gelb.paa"
            }, "" },
			{ "VIP-Grau-Camo", "vip_3", {
                "textures\vehicles\vip\camo_grau.paa",
				"textures\vehicles\vip\camo_grau.paa",
				"textures\vehicles\vip\camo_grau.paa",
				"textures\vehicles\vip\camo_grau.paa"
            }, "" },
			{ "VIP-Hellgrün-Camo", "vip_2", {
                "textures\vehicles\vip\camo_gruen.paa",
				"textures\vehicles\vip\camo_gruen.paa",
				"textures\vehicles\vip\camo_gruen.paa",
				"textures\vehicles\vip\camo_gruen.paa"
            }, "" },
			{ "VIP-Pink-Camo", "vip_2", {
                "textures\vehicles\vip\camo_pink.paa",
				"textures\vehicles\vip\camo_pink.paa",
				"textures\vehicles\vip\camo_pink.paa",
				"textures\vehicles\vip\camo_pink.paa"
            }, "" },
			{ "VIP-Rot-Camo", "vip_1", {
                "textures\vehicles\vip\camo_rot.paa",
				"textures\vehicles\vip\camo_rot.paa",
				"textures\vehicles\vip\camo_rot.paa",
				"textures\vehicles\vip\camo_rot.paa"
            }, "" },
			{ "VIP-Dungelgrün-Camo", "vip_3", {
                "textures\vehicles\vip\camo_dunkelgruen.paa",
				"textures\vehicles\vip\camo_dunkelgruen.paa",
				"textures\vehicles\vip\camo_dunkelgruen.paa",
				"textures\vehicles\vip\camo_dunkelgruen.paa"
            }, "" },
			{ "VIP-Turquoise-Camo", "vip_3", {
                "textures\vehicles\vip\camo_hellblau.paa",
				"textures\vehicles\vip\camo_hellblau.paa",
				"textures\vehicles\vip\camo_hellblau.paa",
				"textures\vehicles\vip\camo_hellblau.paa"
            }, "" },
			{ "VIP-Lila-Camo", "vip_3", {
                "textures\vehicles\vip\camo_lila.paa",
				"textures\vehicles\vip\camo_lila.paa",
				"textures\vehicles\vip\camo_lila.paa",
				"textures\vehicles\vip\camo_lila.paa"
            }, "" },
			{ "VIP-Orange-Camo", "vip_3", {
                "textures\vehicles\vip\camo_orange.paa",
				"textures\vehicles\vip\camo_orange.paa",
				"textures\vehicles\vip\camo_orange.paa",
				"textures\vehicles\vip\camo_orange.paa"
            }, "" },
        };
    };
	
	class O_G_Van_01_fuel_F {
        vItemSpace = 115;
		vFuelSpace = 1000;
        conditions = "";
        price = 90000;
		fee = 5000;
        textures[] = {
            { "Weiss", "civ", {
                "\a3\soft_f_gamma\Van_01\Data\van_01_ext_co.paa",
				"\a3\soft_f_gamma\Van_01\Data\van_01_tank_co.paa"
            }, "" },
			{ "VIP-Rot", "vip_2", {
                "\a3\soft_f_gamma\Van_01\Data\van_01_ext_red_co.paa",
				"\a3\soft_f_gamma\Van_01\Data\van_01_tank_red_co.paa"
            }, "" },
			{ "VIP-Grün Zebra 1", "vip_2", {
                "\a3\soft_f_gamma\Van_01\Data\van_01_ext_ig_co.paa",
				"\a3\soft_f_gamma\Van_01\Data\van_01_tank_ig_co.paa"
            }, "" },
			{ "VIP-Schwarz/Weiß", "vip_2", {
                "\a3\soft_f_gamma\Van_01\Data\van_01_ext_black_co.paa",
				"\a3\soft_f_gamma\Van_01\Data\van_01_tank_co.paa"
            }, "" },
			{ "VIP-Rot/Weiß", "vip_2", {
                "\a3\soft_f_gamma\Van_01\Data\van_01_ext_red_co.paa",
				"\a3\soft_f_gamma\Van_01\Data\van_01_tank_co.paa"
            }, "" },
			{ "VIP-Grün/Weiß", "vip_2", {
                "\a3\soft_f_gamma\Van_01\Data\van_01_ext_ig_co.paa",
				"\a3\soft_f_gamma\Van_01\Data\van_01_tank_co.paa"
            }, "" },
			{ "VIP-Grün Zebra 2", "vip_2", {
                "\a3\soft_f_bootcamp\Van_01\Data\van_01_ext_ig_01_co.paa",
				"\a3\soft_f_bootcamp\Van_01\Data\van_01_tank_ig_01_co.paa"
            }, "" },
			{ "VIP-Weiß Zebra", "vip_2", {
                "\a3\soft_f_bootcamp\Van_01\Data\van_01_ext_ig_02_co.paa",
				"\a3\soft_f_bootcamp\Van_01\Data\van_01_tank_ig_02_co.paa"
            }, "" },
			{ "VIP-Braun Zebra", "vip_2", {
                "\a3\soft_f_bootcamp\Van_01\Data\van_01_ext_ig_03_co.paa",
				"\a3\soft_f_bootcamp\Van_01\Data\van_01_tank_ig_03_co.paa"
            }, "" },
        };
    };
	
	class I_Plane_Fighter_03_CAS_F { // A-143 Buzzard
        vItemSpace = 40;
        conditions = "";
        price = 25000000;
		fee = 100000;
        textures[] = {
            { "Original", "civ", {
                "\a3\air_f_gamma\Plane_Fighter_03\Data\plane_fighter_03_body_1_indp_co.paa",
				"\a3\air_f_gamma\Plane_Fighter_03\Data\plane_fighter_03_body_2_indp_co.paa"
            }, "" },
			{ "VIP-Blau-Camo", "vip_1", {
                "textures\vehicles\vip\camo_blau.paa",
				"textures\vehicles\vip\camo_blau.paa"
            }, "" },
			{ "VIP-Gelb-Camo", "vip_2", {
                "textures\vehicles\vip\camo_gelb.paa",
				"textures\vehicles\vip\camo_gelb.paa"
            }, "" },
			{ "VIP-Grau-Camo", "vip_3", {
                "textures\vehicles\vip\camo_grau.paa",
				"textures\vehicles\vip\camo_grau.paa"
            }, "" },
			{ "VIP-Hellgrün-Camo", "vip_2", {
                "textures\vehicles\vip\camo_gruen.paa",
				"textures\vehicles\vip\camo_gruen.paa"
            }, "" },
			{ "VIP-Pink-Camo", "vip_2", {
                "textures\vehicles\vip\camo_pink.paa",
				"textures\vehicles\vip\camo_pink.paa"
            }, "" },
			{ "VIP-Rot-Camo", "vip_1", {
                "textures\vehicles\vip\camo_rot.paa",
				"textures\vehicles\vip\camo_rot.paa"
            }, "" },
			{ "VIP-Dungelgrün-Camo", "vip_3", {
                "textures\vehicles\vip\camo_dunkelgruen.paa",
				"textures\vehicles\vip\camo_dunkelgruen.paa"
            }, "" },
			{ "VIP-Turquoise-Camo", "vip_3", {
                "textures\vehicles\vip\camo_hellblau.paa",
				"textures\vehicles\vip\camo_hellblau.paa"
            }, "" },
			{ "VIP-Lila-Camo", "vip_3", {
                "textures\vehicles\vip\camo_lila.paa",
				"textures\vehicles\vip\camo_lila.paa"
            }, "" },
			{ "VIP-Orange-Camo", "vip_3", {
                "textures\vehicles\vip\camo_orange.paa",
				"textures\vehicles\vip\camo_orange.paa"
            }, "" },
        };
    };
	
	class B_Plane_CAS_01_F { //A-164 Wipeout
        vItemSpace = 40;
        conditions = "";
        price = 25000000;
		fee = 100000;
        textures[] = {
            { "Original", "civ", {
                "\a3\air_f_epc\Plane_CAS_01\Data\plane_cas_01_ext01_co.paa",
				"\a3\air_f_epc\Plane_CAS_01\Data\plane_cas_01_ext02_co.paa"
            }, "" },
			{ "VIP-Blau-Camo", "vip_1", {
                "textures\vehicles\vip\camo_blau.paa",
				"textures\vehicles\vip\camo_blau.paa"
            }, "" },
			{ "VIP-Gelb-Camo", "vip_2", {
                "textures\vehicles\vip\camo_gelb.paa",
				"textures\vehicles\vip\camo_gelb.paa"
            }, "" },
			{ "VIP-Grau-Camo", "vip_3", {
                "textures\vehicles\vip\camo_grau.paa",
				"textures\vehicles\vip\camo_grau.paa"
            }, "" },
			{ "VIP-Hellgrün-Camo", "vip_2", {
                "textures\vehicles\vip\camo_gruen.paa",
				"textures\vehicles\vip\camo_gruen.paa"
            }, "" },
			{ "VIP-Pink-Camo", "vip_2", {
                "textures\vehicles\vip\camo_pink.paa",
				"textures\vehicles\vip\camo_pink.paa"
            }, "" },
			{ "VIP-Rot-Camo", "vip_1", {
                "textures\vehicles\vip\camo_rot.paa",
				"textures\vehicles\vip\camo_rot.paa"
            }, "" },
			{ "VIP-Dungelgrün-Camo", "vip_3", {
                "textures\vehicles\vip\camo_dunkelgruen.paa",
				"textures\vehicles\vip\camo_dunkelgruen.paa"
            }, "" },
			{ "VIP-Turquoise-Camo", "vip_3", {
                "textures\vehicles\vip\camo_hellblau.paa",
				"textures\vehicles\vip\camo_hellblau.paa"
            }, "" },
			{ "VIP-Lila-Camo", "vip_3", {
                "textures\vehicles\vip\camo_lila.paa",
				"textures\vehicles\vip\camo_lila.paa"
            }, "" },
			{ "VIP-Orange-Camo", "vip_3", {
                "textures\vehicles\vip\camo_orange.paa",
				"textures\vehicles\vip\camo_orange.paa"
            }, "" },
        };
    };

	class O_Plane_CAS_02_F { //To-199 Neophron
        vItemSpace = 40;
        conditions = "";
        price = 25000000;
		fee = 100000;
        textures[] = {
            { "Original", "civ", {
                "\a3\air_f_epc\Plane_CAS_02\Data\fighter02_ext01_co.paa",
				"\a3\air_f_epc\Plane_CAS_02\Data\fighter02_ext02_co.paa"
            }, "" },
			{ "VIP-Blau-Camo", "vip_1", {
                "textures\vehicles\vip\camo_blau.paa",
				"textures\vehicles\vip\camo_blau.paa"
            }, "" },
			{ "VIP-Gelb-Camo", "vip_2", {
                "textures\vehicles\vip\camo_gelb.paa",
				"textures\vehicles\vip\camo_gelb.paa"
            }, "" },
			{ "VIP-Grau-Camo", "vip_3", {
                "textures\vehicles\vip\camo_grau.paa",
				"textures\vehicles\vip\camo_grau.paa"
            }, "" },
			{ "VIP-Hellgrün-Camo", "vip_2", {
                "textures\vehicles\vip\camo_gruen.paa",
				"textures\vehicles\vip\camo_gruen.paa"
            }, "" },
			{ "VIP-Pink-Camo", "vip_2", {
                "textures\vehicles\vip\camo_pink.paa",
				"textures\vehicles\vip\camo_pink.paa"
            }, "" },
			{ "VIP-Rot-Camo", "vip_1", {
                "textures\vehicles\vip\camo_rot.paa",
				"textures\vehicles\vip\camo_rot.paa"
            }, "" },
			{ "VIP-Dungelgrün-Camo", "vip_3", {
                "textures\vehicles\vip\camo_dunkelgruen.paa",
				"textures\vehicles\vip\camo_dunkelgruen.paa"
            }, "" },
			{ "VIP-Turquoise-Camo", "vip_3", {
                "textures\vehicles\vip\camo_hellblau.paa",
				"textures\vehicles\vip\camo_hellblau.paa"
            }, "" },
			{ "VIP-Lila-Camo", "vip_3", {
                "textures\vehicles\vip\camo_lila.paa",
				"textures\vehicles\vip\camo_lila.paa"
            }, "" },
			{ "VIP-Orange-Camo", "vip_3", {
                "textures\vehicles\vip\camo_orange.paa",
				"textures\vehicles\vip\camo_orange.paa"
            }, "" },
        };
    };
	
	class B_Heli_Attack_01_F { //Blackfoot
        vItemSpace = 40;
        conditions = "";
        price = 15000000;
		fee = 100000;
        textures[] = {
            { "Rebell", "reb", {
                "\A3\air_f_beta\heli_attack_01\data\heli_attack_01_co.paa"
            }, "" },
			{ "SEK", "cop_sek", {
                "textures\vehicles\cop\blackfoot_sek.paa"
            }, "" },
			{ "VIP-Blau-Camo", "vip_1", {
                "textures\vehicles\vip\camo_blau.paa"
            }, "" },
			{ "VIP-Gelb-Camo", "vip_2", {
                "textures\vehicles\vip\camo_gelb.paa"
            }, "" },
			{ "VIP-Grau-Camo", "vip_3", {
                "textures\vehicles\vip\camo_grau.paa"
            }, "" },
			{ "VIP-Hellgrün-Camo", "vip_2", {
                "textures\vehicles\vip\camo_gruen.paa"
            }, "" },
			{ "VIP-Pink-Camo", "vip_2", {
                "textures\vehicles\vip\camo_pink.paa"
            }, "" },
			{ "VIP-Rot-Camo", "vip_1", {
                "textures\vehicles\vip\camo_rot.paa"
            }, "" },
			{ "VIP-Dungelgrün-Camo", "vip_3", {
                "textures\vehicles\vip\camo_dunkelgruen.paa"
            }, "" },
			{ "VIP-Turquoise-Camo", "vip_3", {
                "textures\vehicles\vip\camo_hellblau.paa"
            }, "" },
			{ "VIP-Lila-Camo", "vip_3", {
                "textures\vehicles\vip\camo_lila.paa"
            }, "" },
			{ "VIP-Orange-Camo", "vip_3", {
                "textures\vehicles\vip\camo_orange.paa"
            }, "" },
        };
    };
	
	class O_Heli_Attack_02_F { //Mi-48 Kajman
        vItemSpace = 40;
        conditions = "";
        price = 25000000;
		fee = 100000;
        textures[] = {
            { "Rebell", "reb", {
                "\A3\air_f_beta\Heli_Attack_02\data\heli_attack_02_body1_co.paa",
				"\A3\air_f_beta\Heli_Attack_02\data\heli_attack_02_body2_co.paa"
            }, "" },
			{ "VIP-Blau-Camo", "vip_1", {
                "textures\vehicles\vip\camo_blau.paa",
				"textures\vehicles\vip\camo_blau.paa"
            }, "" },
			{ "VIP-Gelb-Camo", "vip_2", {
                "textures\vehicles\vip\camo_gelb.paa",
				"textures\vehicles\vip\camo_gelb.paa"
            }, "" },
			{ "VIP-Grau-Camo", "vip_3", {
                "textures\vehicles\vip\camo_grau.paa",
				"textures\vehicles\vip\camo_grau.paa"
            }, "" },
			{ "VIP-Hellgrün-Camo", "vip_2", {
                "textures\vehicles\vip\camo_gruen.paa",
				"textures\vehicles\vip\camo_gruen.paa"
            }, "" },
			{ "VIP-Pink-Camo", "vip_2", {
                "textures\vehicles\vip\camo_pink.paa",
				"textures\vehicles\vip\camo_pink.paa"
            }, "" },
			{ "VIP-Rot-Camo", "vip_1", {
                "textures\vehicles\vip\camo_rot.paa",
				"textures\vehicles\vip\camo_rot.paa"
            }, "" },
			{ "VIP-Dungelgrün-Camo", "vip_3", {
                "textures\vehicles\vip\camo_dunkelgruen.paa",
				"textures\vehicles\vip\camo_dunkelgruen.paa"
            }, "" },
			{ "VIP-Turquoise-Camo", "vip_3", {
                "textures\vehicles\vip\camo_hellblau.paa",
				"textures\vehicles\vip\camo_hellblau.paa"
            }, "" },
			{ "VIP-Lila-Camo", "vip_3", {
                "textures\vehicles\vip\camo_lila.paa",
				"textures\vehicles\vip\camo_lila.paa"
            }, "" },
			{ "VIP-Orange-Camo", "vip_3", {
                "textures\vehicles\vip\camo_orange.paa",
				"textures\vehicles\vip\camo_orange.paa"
            }, "" },
        };
    };
	
	class I_Heli_light_03_unarmed_F {
        vItemSpace = 20;
        conditions = "";
        price = 13000000;
		fee = 20000;
        textures[] = {
            { "Polizei", "cop_4", {
                "textures\vehicles\cop\hellcatpol.paa"
            }, "" },
			{ "Feuerwehr", "med", {
                "textures\vehicles\medic\hellcatmed.paa"
            }, "" },
			{ "Rebell", "reb", {
                "\a3\air_f_epb\Heli_Light_03\Data\heli_light_03_base_co.paa"
            }, "" },
			{ "SEK", "cop_sek", {
                "textures\vehicles\cop\hellcatsek.paa"
            }, "" },
			{ "Rebell Schwarz/Rot", "reb", {
                "textures\vehicles\reb\hellcat_reb_rot.paa"
            }, "" },
			{ "VIP-Rebell Schwarz/Grün", "vip_2", {
                "textures\vehicles\reb\hellcat_reb_gruen.paa"
            }, "" },
			{ "Sicherheitsdienst", "WSC", {
                "textures\vehicles\sicher\hellcat_sicher.paa"
            }, "" },
			{ "VIP-Blau-Camo", "vip_1", {
                "textures\vehicles\vip\camo_blau.paa"
            }, "" },
			{ "VIP-Gelb-Camo", "vip_2", {
                "textures\vehicles\vip\camo_gelb.paa"
            }, "" },
			{ "VIP-Grau-Camo", "vip_3", {
                "textures\vehicles\vip\camo_grau.paa"
            }, "" },
			{ "VIP-Hellgrün-Camo", "vip_2", {
                "textures\vehicles\vip\camo_gruen.paa"
            }, "" },
			{ "VIP-Pink-Camo", "vip_2", {
                "textures\vehicles\vip\camo_pink.paa"
            }, "" },
			{ "VIP-Rot-Camo", "vip_1", {
                "textures\vehicles\vip\camo_rot.paa"
            }, "" },
			{ "VIP-Dungelgrün-Camo", "vip_3", {
                "textures\vehicles\vip\camo_dunkelgruen.paa"
            }, "" },
			{ "VIP-Turquoise-Camo", "vip_3", {
                "textures\vehicles\vip\camo_hellblau.paa"
            }, "" },
			{ "VIP-Lila-Camo", "vip_3", {
                "textures\vehicles\vip\camo_lila.paa"
            }, "" },
			{ "VIP-Orange-Camo", "vip_3", {
                "textures\vehicles\vip\camo_orange.paa"
            }, "" },
        };
    };
	
	class I_MRAP_03_F { //strider
        vItemSpace = 60;
        conditions = "";
        price = 20000000;
		fee = 100000;
        textures[] = {
            { "SEK", "cop_sek", {
                "textures\vehicles\cop\strider_sek.paa"
            }, "" },
			{ "VIP-Rebell Schwarz/Grün", "vip_2", {
                "textures\vehicles\reb\Stridergruen.paa"
            }, "" },
			{ "Rebell Schwarz/Rot", "reb", {
                "textures\vehicles\reb\Strider.paa"
            }, "" },
			{ "Sicherheitsdienst", "WSC", {
                "textures\vehicles\sicher\strider_sicher.paa"
            }, "" },
			{ "VIP-Blau-Camo", "vip_1", {
                "textures\vehicles\vip\camo_blau.paa",
				"textures\vehicles\vip\camo_blau.paa"
            }, "" },
			{ "VIP-Gelb-Camo", "vip_2", {
                "textures\vehicles\vip\camo_gelb.paa",
				"textures\vehicles\vip\camo_gelb.paa"
            }, "" },
			{ "VIP-Grau-Camo", "vip_3", {
                "textures\vehicles\vip\camo_grau.paa",
				"textures\vehicles\vip\camo_grau.paa"
            }, "" },
			{ "VIP-Hellgrün-Camo", "vip_2", {
                "textures\vehicles\vip\camo_gruen.paa",
				"textures\vehicles\vip\camo_gruen.paa"
            }, "" },
			{ "VIP-Pink-Camo", "vip_2", {
                "textures\vehicles\vip\camo_pink.paa",
				"textures\vehicles\vip\camo_pink.paa"
            }, "" },
			{ "VIP-Rot-Camo", "vip_1", {
                "textures\vehicles\vip\camo_rot.paa",
				"textures\vehicles\vip\camo_rot.paa"
            }, "" },
			{ "Polizei", "cop_7", {
                "textures\vehicles\cop\strider_cop.paa"
            }, "" },
			{ "VIP-Dungelgrün-Camo", "vip_3", {
                "textures\vehicles\vip\camo_dunkelgruen.paa",
				"textures\vehicles\vip\camo_dunkelgruen.paa"
            }, "" },
			{ "VIP-Turquoise-Camo", "vip_3", {
                "textures\vehicles\vip\camo_hellblau.paa",
				"textures\vehicles\vip\camo_hellblau.paa"
            }, "" },
			{ "VIP-Lila-Camo", "vip_3", {
                "textures\vehicles\vip\camo_lila.paa",
				"textures\vehicles\vip\camo_lila.paa"
            }, "" },
			{ "VIP-Orange-Camo", "vip_3", {
                "textures\vehicles\vip\camo_orange.paa",
				"textures\vehicles\vip\camo_orange.paa"
            }, "" },
        };
    };
	
	class B_T_LSV_01_unarmed_F { // APEX Prowler (Unarmed)
        vItemSpace = 55;
        conditions = "";
        price = 15000000;
		fee = 100000;
        textures[] = {
            { "Schwarz", "reb", {
                "\A3\Soft_F_Exp\LSV_01\Data\NATO_LSV_01_black_CO.paa",
				"\A3\Soft_F_Exp\LSV_01\Data\NATO_LSV_02_black_CO.paa",
				"\A3\Soft_F_Exp\LSV_01\Data\NATO_LSV_03_black_CO.paa",
				"\A3\Soft_F_Exp\LSV_01\Data\NATO_LSV_Adds_black_CO.paa"
            }, "" },
			{ "Dazzle", "reb", {
                "\A3\Soft_F_Exp\LSV_01\Data\NATO_LSV_01_dazzle_CO.paa",
				"\A3\Soft_F_Exp\LSV_01\Data\NATO_LSV_02_olive_CO.paa",
				"\A3\Soft_F_Exp\LSV_01\Data\NATO_LSV_03_olive_CO.paa",
				"\A3\Soft_F_Exp\LSV_01\Data\NATO_LSV_Adds_olive_CO.paa"
            }, "" },
			{ "Olive", "reb", {
                "\A3\Soft_F_Exp\LSV_01\Data\NATO_LSV_01_olive_CO.paa",
				"\A3\Soft_F_Exp\LSV_01\Data\NATO_LSV_02_olive_CO.paa",
				"\A3\Soft_F_Exp\LSV_01\Data\NATO_LSV_03_olive_CO.paa",
				"\A3\Soft_F_Exp\LSV_01\Data\NATO_LSV_Adds_olive_CO.paa"
            }, "" },
			{ "Sand", "reb", {
                "\A3\Soft_F_Exp\LSV_01\Data\NATO_LSV_01_sand_CO.paa",
				"\A3\Soft_F_Exp\LSV_01\Data\NATO_LSV_02_sand_CO.paa",
				"\A3\Soft_F_Exp\LSV_01\Data\NATO_LSV_03_sand_CO.paa",
				"\A3\Soft_F_Exp\LSV_01\Data\NATO_LSV_Adds_sand_CO.paa"
            }, "" },
			{ "VIP-Blau-Camo", "vip_1", {
                "textures\vehicles\vip\camo_blau.paa"
            }, "" },
			{ "VIP-Gelb-Camo", "vip_2", {
                "textures\vehicles\vip\camo_gelb.paa"
            }, "" },
			{ "VIP-Grau-Camo", "vip_3", {
                "textures\vehicles\vip\camo_grau.paa"
            }, "" },
			{ "VIP-Hellgrün-Camo", "vip_2", {
                "textures\vehicles\vip\camo_gruen.paa"
            }, "" },
			{ "VIP-Pink-Camo", "vip_2", {
                "textures\vehicles\vip\camo_pink.paa"
            }, "" },
			{ "VIP-Rot-Camo", "vip_1", {
                "textures\vehicles\vip\camo_rot.paa"
            }, "" },
			{ "VIP-Dungelgrün-Camo", "vip_3", {
                "textures\vehicles\vip\camo_dunkelgruen.paa"
            }, "" },
			{ "VIP-Turquoise-Camo", "vip_3", {
                "textures\vehicles\vip\camo_hellblau.paa"
            }, "" },
			{ "VIP-Lila-Camo", "vip_3", {
                "textures\vehicles\vip\camo_lila.paa"
            }, "" },
			{ "VIP-Orange-Camo", "vip_3", {
                "textures\vehicles\vip\camo_orange.paa"
            }, "" },
        };
    };
	
	class O_T_LSV_02_unarmed_F { // APEX Qilin (Unarmed)
        vItemSpace = 55;
        conditions = "";
        price = 15000000;
		fee = 100000;
        textures[] = {
            { "Schwarz", "reb", {
                "\A3\Soft_F_Exp\LSV_02\Data\CSAT_LSV_01_black_CO.paa",
				"\A3\Soft_F_Exp\LSV_02\Data\CSAT_LSV_02_black_CO.paa",
				"\A3\Soft_F_Exp\LSV_02\Data\CSAT_LSV_03_black_CO.paa"
            }, "" },
			{ "Arid", "reb", {
                "\A3\Soft_F_Exp\LSV_02\Data\CSAT_LSV_01_arid_CO.paa",
				"\A3\Soft_F_Exp\LSV_02\Data\CSAT_LSV_02_arid_CO.paa",
				"\A3\Soft_F_Exp\LSV_02\Data\CSAT_LSV_03_arid_CO.paa"
            }, "" },
			{ "Green Hex", "reb", {
                "\A3\Soft_F_Exp\LSV_02\Data\CSAT_LSV_01_ghex_CO.paa",
				"\A3\Soft_F_Exp\LSV_02\Data\CSAT_LSV_02_ghex_CO.paa",
				"\A3\Soft_F_Exp\LSV_02\Data\CSAT_LSV_03_ghex_CO.paa"
            }, "" },
			{ "VIP-Blau-Camo", "vip_1", {
                "textures\vehicles\vip\camo_blau.paa"
            }, "" },
			{ "VIP-Gelb-Camo", "vip_2", {
                "textures\vehicles\vip\camo_gelb.paa"
            }, "" },
			{ "VIP-Grau-Camo", "vip_3", {
                "textures\vehicles\vip\camo_grau.paa"
            }, "" },
			{ "VIP-Hellgrün-Camo", "vip_2", {
                "textures\vehicles\vip\camo_gruen.paa"
            }, "" },
			{ "VIP-Pink-Camo", "vip_2", {
                "textures\vehicles\vip\camo_pink.paa"
            }, "" },
			{ "VIP-Rot-Camo", "vip_1", {
                "textures\vehicles\vip\camo_rot.paa"
            }, "" },
			{ "VIP-Dungelgrün-Camo", "vip_3", {
                "textures\vehicles\vip\camo_dunkelgruen.paa"
            }, "" },
			{ "VIP-Turquoise-Camo", "vip_3", {
                "textures\vehicles\vip\camo_hellblau.paa"
            }, "" },
			{ "VIP-Lila-Camo", "vip_3", {
                "textures\vehicles\vip\camo_lila.paa"
            }, "" },
			{ "VIP-Orange-Camo", "vip_3", {
                "textures\vehicles\vip\camo_orange.paa"
            }, "" },
        };
    };
	
	class B_T_VTOL_01_infantry_F { // APEX V-44 X Blackfish (Infantry Transport)
        vItemSpace = 100;
        conditions = "";
        price = 25000000;
		fee = 100000;
        textures[] = {
            { "Blau", "reb", {
                "\A3\Air_F_Exp\VTOL_01\Data\VTOL_01_EXT01_blue_CO.paa",
				"\A3\Air_F_Exp\VTOL_01\Data\VTOL_01_EXT02_blue_CO.paa",
				"\A3\Air_F_Exp\VTOL_01\Data\VTOL_01_EXT03_blue_CO.paa",
				"\A3\Air_F_Exp\VTOL_01\Data\VTOL_01_EXT04_blue_CO.paa"
            }, "" },
			{ "Olive", "reb", {
                "\A3\Air_F_Exp\VTOL_01\Data\VTOL_01_EXT01_olive_CO.paa",
				"\A3\Air_F_Exp\VTOL_01\Data\VTOL_01_EXT02_olive_CO.paa",
				"\A3\Air_F_Exp\VTOL_01\Data\VTOL_01_EXT03_olive_CO.paa",
				"\A3\Air_F_Exp\VTOL_01\Data\VTOL_01_EXT04_olive_CO.paa"
            }, "" },
			{ "VIP-Blau-Camo", "vip_1", {
                "textures\vehicles\vip\camo_blau.paa",
				"textures\vehicles\vip\camo_blau.paa",
				"textures\vehicles\vip\camo_blau.paa",
				"textures\vehicles\vip\camo_blau.paa"
            }, "" },
			{ "VIP-Gelb-Camo", "vip_2", {
                "textures\vehicles\vip\camo_gelb.paa",
				"textures\vehicles\vip\camo_gelb.paa",
				"textures\vehicles\vip\camo_gelb.paa",
				"textures\vehicles\vip\camo_gelb.paa"
            }, "" },
			{ "VIP-Grau-Camo", "vip_3", {
                "textures\vehicles\vip\camo_grau.paa",
				"textures\vehicles\vip\camo_grau.paa",
				"textures\vehicles\vip\camo_grau.paa",
				"textures\vehicles\vip\camo_grau.paa"
            }, "" },
			{ "VIP-Hellgrün-Camo", "vip_2", {
                "textures\vehicles\vip\camo_gruen.paa",
				"textures\vehicles\vip\camo_gruen.paa",
				"textures\vehicles\vip\camo_gruen.paa",
				"textures\vehicles\vip\camo_gruen.paa"
            }, "" },
			{ "VIP-Pink-Camo", "vip_2", {
                "textures\vehicles\vip\camo_pink.paa",
				"textures\vehicles\vip\camo_pink.paa",
				"textures\vehicles\vip\camo_pink.paa",
				"textures\vehicles\vip\camo_pink.paa"
            }, "" },
			{ "VIP-Rot-Camo", "vip_1", {
                "textures\vehicles\vip\camo_rot.paa",
				"textures\vehicles\vip\camo_rot.paa",
				"textures\vehicles\vip\camo_rot.paa",
				"textures\vehicles\vip\camo_rot.paa"
            }, "" },
			{ "VIP-Dungelgrün-Camo", "vip_3", {
                "textures\vehicles\vip\camo_dunkelgruen.paa",
				"textures\vehicles\vip\camo_dunkelgruen.paa",
				"textures\vehicles\vip\camo_dunkelgruen.paa",
				"textures\vehicles\vip\camo_dunkelgruen.paa"
            }, "" },
			{ "VIP-Turquoise-Camo", "vip_3", {
                "textures\vehicles\vip\camo_hellblau.paa",
				"textures\vehicles\vip\camo_hellblau.paa",
				"textures\vehicles\vip\camo_hellblau.paa",
				"textures\vehicles\vip\camo_hellblau.paa"
            }, "" },
			{ "VIP-Lila-Camo", "vip_3", {
                "textures\vehicles\vip\camo_lila.paa",
				"textures\vehicles\vip\camo_lila.paa",
				"textures\vehicles\vip\camo_lila.paa",
				"textures\vehicles\vip\camo_lila.paa"
            }, "" },
			{ "VIP-Orange-Camo", "vip_3", {
                "textures\vehicles\vip\camo_orange.paa",
				"textures\vehicles\vip\camo_orange.paa",
				"textures\vehicles\vip\camo_orange.paa",
				"textures\vehicles\vip\camo_orange.paa"
            }, "" },
        };
    };
	
	class O_T_VTOL_02_infantry_F { // APEX Y-32 Xi'an (Infantry Transport)
        vItemSpace = 100;
        conditions = "";
        price = 25000000;
		fee = 100000;
        textures[] = {
            { "Green Hex", "civ", {
                "\A3\Air_F_Exp\VTOL_02\Data\VTOL_02_EXT01_ghex_CO.paa",
				"\A3\Air_F_Exp\VTOL_02\Data\VTOL_02_EXT02_ghex_CO.paa",
				"\A3\Air_F_Exp\VTOL_02\Data\VTOL_02_EXT03_L_ghex_CO.paa",
				"\A3\Air_F_Exp\VTOL_02\Data\VTOL_02_EXT03_R_ghex_CO.paa"
            }, "" },
			{ "Grau", "civ", {
                "\A3\Air_F_Exp\VTOL_02\Data\VTOL_02_EXT01_CO.paa",
				"\A3\Air_F_Exp\VTOL_02\Data\VTOL_02_EXT02_CO.paa",
				"\A3\Air_F_Exp\VTOL_02\Data\VTOL_02_EXT03_L_CO.paa",
				"\A3\Air_F_Exp\VTOL_02\Data\VTOL_02_EXT03_R_CO.paa"
            }, "" },
			{ "Hex", "civ", {
                "\A3\Air_F_Exp\VTOL_02\Data\VTOL_02_EXT01_bhex_CO.paa",
				"\A3\Air_F_Exp\VTOL_02\Data\VTOL_02_EXT02_bhex_CO.paa",
				"\A3\Air_F_Exp\VTOL_02\Data\VTOL_02_EXT03_L_bhex_CO.paa",
				"\A3\Air_F_Exp\VTOL_02\Data\VTOL_02_EXT03_R_bhex_CO.paa"
            }, "" },
			{ "VIP-Blau-Camo", "vip_1", {
                "textures\vehicles\vip\camo_blau.paa",
				"textures\vehicles\vip\camo_blau.paa",
				"textures\vehicles\vip\camo_blau.paa",
				"textures\vehicles\vip\camo_blau.paa"
            }, "" },
			{ "VIP-Gelb-Camo", "vip_2", {
                "textures\vehicles\vip\camo_gelb.paa",
				"textures\vehicles\vip\camo_gelb.paa",
				"textures\vehicles\vip\camo_gelb.paa",
				"textures\vehicles\vip\camo_gelb.paa"
            }, "" },
			{ "VIP-Grau-Camo", "vip_3", {
                "textures\vehicles\vip\camo_grau.paa",
				"textures\vehicles\vip\camo_grau.paa",
				"textures\vehicles\vip\camo_grau.paa",
				"textures\vehicles\vip\camo_grau.paa"
            }, "" },
			{ "VIP-Hellgrün-Camo", "vip_2", {
                "textures\vehicles\vip\camo_gruen.paa",
				"textures\vehicles\vip\camo_gruen.paa",
				"textures\vehicles\vip\camo_gruen.paa",
				"textures\vehicles\vip\camo_gruen.paa"
            }, "" },
			{ "VIP-Pink-Camo", "vip_2", {
                "textures\vehicles\vip\camo_pink.paa",
				"textures\vehicles\vip\camo_pink.paa",
				"textures\vehicles\vip\camo_pink.paa",
				"textures\vehicles\vip\camo_pink.paa"
            }, "" },
			{ "VIP-Rot-Camo", "vip_1", {
                "textures\vehicles\vip\camo_rot.paa",
				"textures\vehicles\vip\camo_rot.paa",
				"textures\vehicles\vip\camo_rot.paa",
				"textures\vehicles\vip\camo_rot.paa"
            }, "" },
			{ "VIP-Dungelgrün-Camo", "vip_3", {
                "textures\vehicles\vip\camo_dunkelgruen.paa",
				"textures\vehicles\vip\camo_dunkelgruen.paa",
				"textures\vehicles\vip\camo_dunkelgruen.paa",
				"textures\vehicles\vip\camo_dunkelgruen.paa"
            }, "" },
			{ "VIP-Turquoise-Camo", "vip_3", {
                "textures\vehicles\vip\camo_hellblau.paa",
				"textures\vehicles\vip\camo_hellblau.paa",
				"textures\vehicles\vip\camo_hellblau.paa",
				"textures\vehicles\vip\camo_hellblau.paa"
            }, "" },
			{ "VIP-Lila-Camo", "vip_3", {
                "textures\vehicles\vip\camo_lila.paa",
				"textures\vehicles\vip\camo_lila.paa",
				"textures\vehicles\vip\camo_lila.paa",
				"textures\vehicles\vip\camo_lila.paa"
            }, "" },
			{ "VIP-Orange-Camo", "vip_3", {
                "textures\vehicles\vip\camo_orange.paa",
				"textures\vehicles\vip\camo_orange.paa",
				"textures\vehicles\vip\camo_orange.paa",
				"textures\vehicles\vip\camo_orange.paa"
            }, "" },
        };
    };
};