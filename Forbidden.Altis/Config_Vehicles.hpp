#include <macro.h>
class CarShops {
	
	class civ_car {
		side = "civ";
		vehicles[] = {
			{ "B_Quadbike_01_F", 2500, "" },
			{ "C_Hatchback_01_F", 9500, "driver" },
			{ "C_Offroad_01_F", 12500, "driver" },
			{ "C_SUV_01_F", 20000, "driver" },
			{ "C_Offroad_02_unarmed_F", 30000, "driver" }, 
			{ "C_Van_01_transport_F", 30000, "driver" }
		};
	};

	class kart_shop {
		side = "civ";
		vehicles[] = {
			{ "C_Kart_01_Blu_F", 15000 , "" },
			{ "C_Kart_01_Fuel_F", 15000, "" },
			{ "C_Kart_01_Red_F", 15000, "" },
			{ "C_Kart_01_Vrana_F", 15000, "" }
		};
	};

	class med_shop {
		side = "med";
		vehicles[] = {
			{ "C_SUV_01_F", 20000, "" },
			{ "C_Hatchback_01_sport_F", 30000, "", { "life_mediclevel", 3 } },
			{ "C_Van_01_box_F", 40000, "" },
			{ "I_Truck_02_medical_F", 25000, "" },
			{ "O_Truck_03_medical_F", 45000, "" },
			{ "B_Truck_01_medical_F", 60000, "" }
		};
	};

	class med_air_hs {
		side = "med";
		vehicles[] = {
			{ "B_Heli_Light_01_F", 50000, "mAir" },
			{ "O_Heli_Light_02_unarmed_F", 75000, "mAir", { "life_mediclevel", 2 } },
			{ "I_Heli_light_03_unarmed_F", 100000, "mAir", { "life_mediclevel", 2 } },
			{ "I_Heli_Transport_02_F", 150000, "mAir", { "life_mediclevel", 2 } },
			{ "O_Heli_Transport_04_medevac_F", 200000, "mAir", { "life_mediclevel", 2 } },
			{ "B_UAV_01_F", 10000, "mAir", { "life_mediclevel", 2 } }, 
			{ "O_T_VTOL_02_infantry_F", 200000, "mAir", { "life_mediclevel", 2 } },
			{ "B_T_VTOL_01_armed_F", 200000, "mAir", { "life_mediclevel", 2 } },
			{ "I_Plane_Fighter_03_AA_F", 200000, "mAir", { "life_mediclevel", 2 } },
			{ "B_Plane_CAS_01_F", 200000, "mAir", { "life_mediclevel", 2 } },
			{ "O_Plane_CAS_02_F", 200000, "mAir", { "life_mediclevel", 2 } },
			{ "I_Plane_Fighter_04_F", 200000, "mAir", { "life_mediclevel", 2 } },
			{ "B_Plane_Fighter_01_F", 200000, "mAir", { "life_mediclevel", 2 } },
			{ "B_Plane_Fighter_01_Stealth_F", 200000, "mAir", { "life_mediclevel", 2 } },
			{ "O_Plane_Fighter_02_F", 200000, "mAir", { "life_mediclevel", 2 } },
			{ "O_Plane_Fighter_02_Stealth_F", 200000, "mAir", { "life_mediclevel", 2 } },
			{ "B_UAV_05_F", 200000, "mAir", { "life_mediclevel", 2 } }
		};
	};

	class reb_car {
		side = "civ";
		vehicles[] = {
			{ "B_Quadbike_01_F", 2500, "" },
			{ "B_G_Offroad_01_F", 15000, "" },
			{ "C_SUV_01_F", 15000, "" }, 
			{ "C_Hatchback_01_sport_F", 40000, "", { "life_donatorlvl", 3 } },
			{ "B_MRAP_01_F", 150000, "", { "life_reblevel", 3 } }
		};
	};
	
	class reb_air {
		side = "civ";
		vehicles[] = {
			{ "B_Heli_Light_01_F", 150000, "", { "life_donatorlvl", 3 } },
			{ "B_Heli_Light_01_F", 250000, "pilot" }
		};
	};

	class cop_car {
		side = "cop";
		vehicles[] = {
			{ "B_Quadbike_01_F", 2500, "" },
			{ "C_Offroad_01_F", 5000, "", { "life_coplevel", 2 } },
			{ "C_Offroad_01_repair_F", 9500, "", { "life_coplevel", 2 } },
			{ "C_SUV_01_F", 5000, "", { "life_coplevel", 2 } },
			{ "C_Hatchback_01_sport_F", 10000, "", { "life_coplevel", 2 } },
			{ "B_CTRG_LSV_01_light_F", 25000, "", { "life_coplevel", 2 } },
			{ "B_MRAP_01_F", 50000, "", { "life_coplevel", 3 } },
			{ "B_Truck_01_mover_F", 15000, "", { "life_coplevel", 2 } }
		};
	};
	
	class insats_car {
		side = "cop";
		vehicles[] = {
			{ "B_Quadbike_01_F", 2500, "" }, 
			{ "C_Offroad_01_F", 5000, "" }, 
			{ "C_SUV_01_F", 5000, "" }, 
			{ "C_Hatchback_01_sport_F", 10000, "" }, 
			{ "B_Truck_01_mover_F", 15000, "" }, 
			{ "I_MRAP_03_F", 1000, "" } 
		};
	};

	class civ_air {
		side = "civ";
		vehicles[] = {
			{ "B_Heli_Light_01_F", 250000, "pilot" }, 
			{ "I_Heli_light_03_unarmed_F", 2100000, "pilot" }, 
			{ "C_Plane_Civil_01_F", 300000, "pilot" }, 
			{ "I_Plane_Fighter_03_AA_F", 1300000, "pilot" },
			{ "B_Plane_CAS_01_F", 1700000, "pilot" },
			{ "I_C_Plane_Civil_01_F", 1900000, "pilot" },
			{ "O_Plane_CAS_02_F", 2400000, "pilot" },
			{ "I_Plane_Fighter_04_F", 1850000, "pilot" },
			{ "B_Plane_Fighter_01_F", 1850000, "pilot" },
			{ "B_Plane_Fighter_01_Stealth_F", 1850000, "pilot" },
			{ "O_Plane_Fighter_02_F", 2100000, "pilot" },
			{ "O_Plane_Fighter_02_Stealth_F", 2100000, "pilot" },
			{ "B_UAV_05_F", 750000, "pilot" }
		};
	};
	
	class donator_car {
		side = "civ";
		vehicles[] = {
			{ "B_Quadbike_01_F", 2500, "", { "life_donatorlvl", 1 } },
			{ "C_Hatchback_01_F", 9500, "", { "life_donatorlvl", 1 } }, 
			{ "C_Offroad_01_F", 12500, "", { "life_donatorlvl", 1 } },
			{ "C_Offroad_01_repair_F", 12500, "", { "life_donatorlvl", 2 } },
			{ "C_SUV_01_F", 20000, "", { "life_donatorlvl", 1 } },
			{ "C_Offroad_02_unarmed_F", 24000, "", { "life_donatorlvl", 1 } }, 
			{ "C_Hatchback_01_sport_F", 90000, "", { "life_donatorlvl", 1 } },
			{ "O_Truck_03_transport_F", 400000, "", { "life_donatorlvl", 2 } }, 
			{ "O_Truck_03_covered_F", 400000, "", { "life_donatorlvl", 2 } }, 
			{ "O_Truck_03_ammo_F", 400000, "", { "life_donatorlvl", 2 } }, 
			{ "O_Truck_03_fuel_F", 400000, "", { "life_donatorlvl", 2 } }, 
			{ "O_Truck_03_repair_F", 400000, "", { "life_donatorlvl", 2 } }, 
			{ "O_Truck_03_device_F", 700000, "", { "life_donatorlvl", 2 } } 
		};
	};
	
	class civ_truck {
		side = "civ";
		vehicles[] = {
			{ "C_Van_01_transport_F", 35000, "driver" },
			{ "C_Van_01_box_F", 100000, "trucking" },
			{ "B_G_Van_01_fuel_F", 200000, "trucking" },
			{ "I_G_Van_01_fuel_F", 200000, "trucking" },
			{ "I_Truck_02_transport_F", 150000, "trucking" },
			{ "I_Truck_02_covered_F", 200000, "trucking" },
			{ "O_Truck_03_transport_F", 400000, "trucking" },
			{ "B_Truck_01_transport_F", 500000, "trucking" }, 
			{ "O_Truck_03_device_F", 700000, "trucking" } 
		};
	};

	class cop_air {
		side = "cop";
		vehicles[] = {
			{ "B_Heli_Light_01_F", 100000, "cAir", { "life_coplevel", 2 } },
			{ "I_Heli_light_03_unarmed_F", 150000, "cAir", { "life_coplevel", 2 } }, 
			{ "B_UAV_01_F", 50000, "cAir", { "life_coplevel", 2 } }, 
			{ "C_Plane_Civil_01_racing_F", 100000, "cAir", { "life_coplevel", 2 } }, 
			{ "I_Plane_Fighter_03_AA_F", 400000, "cAir", { "life_coplevel", 2 } },
			{ "B_Plane_CAS_01_F", 550000, "cAir", { "life_coplevel", 2 } },
			{ "O_Plane_CAS_02_F", 1200000, "cAir", { "life_coplevel", 2 } },
			{ "I_Plane_Fighter_04_F", 700000, "cAir", { "life_coplevel", 2 } },
			{ "B_Plane_Fighter_01_F", 700000, "cAir", { "life_coplevel", 2 } },
			{ "B_Plane_Fighter_01_Stealth_F", 700000, "cAir", { "life_coplevel", 2 } },
			{ "O_Plane_Fighter_02_F", 750000, "cAir", { "life_coplevel", 2 } },
			{ "O_Plane_Fighter_02_Stealth_F", 750000, "cAir", { "life_coplevel", 2 } },
			{ "B_UAV_05_F", 300000, "cAir", { "life_coplevel", 2 } }
		};
	};

	class cop_airhq {
		side = "civ";
		vehicles[] = {
			
			
			
		};
	};

	class cop_ship {
		side = "cop";
		vehicles[] = {
			{ "B_Boat_Transport_01_F", 3000, "" },
			{ "C_Scooter_Transport_01_F", 5000, "" },
			{ "C_Boat_Civil_01_police_F", 10000, "" },
			{ "B_SDV_01_F", 30000, "" },
			{ "C_Boat_Transport_02_F", 50000, "" }
		};
	}; 

	class civ_ship {
		side = "civ";
		vehicles[] = {
			{ "C_Rubberboat", 3000, "boat" },
			{ "C_Scooter_Transport_01_F", 5000, "boat" },
			{ "C_Boat_Civil_01_F", 10000, "boat" },
			{ "C_Boat_Civil_01_rescue_F", 10000, "", { "life_donatorlvl", 2 } }, 
			{ "B_SDV_01_F", 150000, "boat" },
			{ "C_Boat_Transport_02_F", 600000, "boat" } 
		};
	};
};


class CfgVehicles {
	class Default {
		vItemSpace = -1;
		storageFee[] = { 1000, 1000, 1000, 1000 };
		garageSell[] = { 0, 0, 0, 0 };
		insurance = 2500;
		chopShop = 1200;
		textures[] = {};
	};

	class I_Truck_02_medical_F : Default {
		vItemSpace = 50;
		storageFee[] = { 0, 0, 1500, 0 };
		garageSell[] = { 0, 0, 5000, 0 };
		chopShop = 3000;
	};

	class O_Truck_03_medical_F : Default {
		vItemSpace = 50;
		storageFee[] = { 0, 0, 3000, 0 };
		garageSell[] = { 0, 0, 10000, 0 };
		chopShop = 7500;
	};

	class B_Truck_01_medical_F : Default {
		vItemSpace = 75;
		storageFee[] = { 0, 0, 6500, 0 };
		garageSell[] = { 0, 0, 25000, 0 };
		chopShop = 12500;
	};

	class C_Rubberboat {
        vItemSpace = 45;
        storageFee[] = { 400, 300, 0, 0 };
		garageSell[] = { 950, 350, 0, 0 };
        insurance = 2500;
        chopShop = 5000;
        textures[] = { };
    };

	class B_Heli_Transport_01_F {
		vItemSpace = 90;
		storageFee[] = { 0, 12000, 0, 0 };
		garageSell[] = { 0, 85000, 0, 0 };
		insurance = 16000;
		chopShop = 45000;
		textures[] = {};
	};
	
	class B_CTRG_Heli_Transport_01_sand_F {
		vItemSpace = 90;
		storageFee[] = { 0, 12000, 0, 0 };
		garageSell[] = { 0, 85000, 0, 0 };
		insurance = 16000;
		chopShop = 45000;
		textures[] = {};
	};

	class B_MRAP_01_hmg_F : Default {
		vItemSpace = 100;
	};

	class O_Boat_Armed_01_hmg_F {
        vItemSpace = 175;
        storageFee[] = { 1000, 0, 0, 0 };
		garageSell[] = { 21000, 21000, 0, 0 };
        insurance = 2500;
        chopShop = 5000;
        textures[] = { };
    };

	class B_Boat_Armed_01_minigun_F {
        vItemSpace = 175;
        storageFee[] = { 0, 11200, 0, 0 };
		garageSell[] = { 0, 21000, 0, 0 };
        insurance = 2500;
        chopShop = 5000;
        textures[] = { };
    };

	class I_Boat_Armed_01_minigun_F {
        vItemSpace = 175;
        storageFee[] = { 1000, 0, 0, 0 };
        insurance = 2500;
        chopShop = 5000;
        textures[] = { };
    };

	class B_G_Boat_Transport_01_F {
        vItemSpace = 45;
        storageFee[] = { 1000, 0, 0, 0 };
        insurance = 2500;
        chopShop = 5000;
        textures[] = { };
    };

	class B_Boat_Transport_01_F {
        vItemSpace = 45;
        storageFee[] = { 0, 450, 0, 0 };
		garageSell[] = { 0, 850, 0, 0 };
        insurance = 2500;
        chopShop = 5000;
        textures[] = { };
    };
	
	class I_G_Van_01_fuel_F {
        vItemSpace = 45;
        storageFee[] = { 0, 450, 0, 0 };
		garageSell[] = { 0, 850, 0, 0 };
        insurance = 2500;
        chopShop = 5000;
        textures[] = { };
    };
	
	class B_G_Van_01_fuel_F {
        vItemSpace = 45;
        storageFee[] = { 0, 450, 0, 0 };
		garageSell[] = { 0, 850, 0, 0 };
        insurance = 2500;
        chopShop = 5000;
        textures[] = { };
    };

	class O_Truck_03_transport_F { 
        vItemSpace = 300;
		storageFee[] = { 5000, 0, 0, 0 };
		garageSell[] = { 65000, 0, 0, 0 };
		insurance = 2500;
		chopShop = 100000;
		textures[] = {};
    };
	
	class O_Truck_03_covered_F { 
		vItemSpace = 300;
		storageFee[] = { 5000, 0, 0, 0 };
		garageSell[] = { 65000, 0, 0, 0 };
		insurance = 2500;
		chopShop = 100000;
		textures[] = {};
	};
	
	class O_Truck_03_ammo_F { 
		vItemSpace = 300;
		storageFee[] = { 5000, 0, 0, 0 };
		garageSell[] = { 65000, 0, 0, 0 };
		insurance = 2500;
		chopShop = 100000;
		textures[] = {};
	};

	class O_Truck_03_fuel_F { 
		vItemSpace = 120;
		storageFee[] = { 5000, 0, 0, 0 };
		garageSell[] = { 65000, 0, 0, 0 };
		insurance = 2500;
		chopShop = 100000;
		textures[] = {};
	};

	class O_Truck_03_repair_F { 
		vItemSpace = 300;
		storageFee[] = { 5000, 0, 0, 0 };
		garageSell[] = { 65000, 0, 0, 0 };
		insurance = 2500;
		chopShop = 100000;
		textures[] = {};
	};


	class O_Truck_03_device_F { 
        vItemSpace = 300;
		storageFee[] = { 5000, 0, 0, 0 };
		garageSell[] = { 65000, 0, 0, 0 };
		insurance = 2500;
		chopShop = 100000;
		textures[] = {};
    };

	class Land_CargoBox_V1_F : Default {
        vItemSpace = 5000;
    };

	class Box_IND_Grenades_F : Default {
        vItemSpace = 350;
    };

	class B_supplyCrate_F {
        vItemSpace = 700;
    };

	class B_G_Offroad_01_F {
        vItemSpace = 65;
        storageFee[] = { 1000, 0, 0, 0 };
		garageSell[] = { 3500, 0, 0, 0 };
        insurance = 2500;
        chopShop = 5000;
        textures[] = {};
    };

	class B_G_Offroad_01_armed_F : B_G_Offroad_01_F {};

	class I_G_Van_01_transport_F {
        vItemSpace = 100;
        storageFee[] = { 1000, 0, 0, 0 };
        insurance = 2500;
        chopShop = 5000;
        textures[] = { };
    };

	class C_Boat_Civil_01_F {
        vItemSpace = 85;
        storageFee[] = { 4500, 2500, 0, 0 };
		garageSell[] = { 6800, 3500, 0, 0 };
        insurance = 2500;
        chopShop = 5000;
        textures[] = { };
    };
	
	class I_Heli_light_03_unarmed_F { 
        vItemSpace = 55;
        storageFee[] = { 4500, 2500, 0, 0 };
		garageSell[] = { 6800, 3500, 0, 0 };
        insurance = 2500;
        chopShop = 5000;
        textures[] = {
			{ "Hellcat", "civ", {
                "textures\vehicles\blackcats.paa"
            } },
			{ "Hellcat", "med", {
				"textures\vehicles\medic\hellcat.paa"
            } },
			{ "Polisheli", "cop", {
                "textures\vehicles\cop\hellcat_polis.paa"
            } }
		};
    };
	
	class B_Heli_Attack_01_F {
        vItemSpace = 50;
        storageFee[] = { 4500, 2500, 0, 0 };
		garageSell[] = { 6800, 3500, 0, 0 };
        insurance = 2500;
        chopShop = 200000;
        textures[] = { };
    };

	class C_Boat_Civil_01_police_F {
        vItemSpace = 85;
        storageFee[] = { 0, 3500, 0, 0 };
		garageSell[] = { 0, 4950, 0, 0 };
        insurance = 2500;
        chopShop = 5000;
        textures[] = { };
    };

	class C_Boat_Civil_01_rescue_F {
        vItemSpace = 85;
        storageFee[] = { 1000, 0, 0, 0 };
        insurance = 2500;
        chopShop = 5000;
        textures[] = { };
    };
	
	class B_Truck_01_mover_F { 
		vItemSpace = 400;
		storageFee[] = { 14000, 0, 0, 0 };
		garageSell[] = { 65000, 0, 0, 0 };
		insurance = 2500;
		chopShop = 40000;
		textures[] = {};
	};

	class B_Truck_01_box_F { 
        vItemSpace = 400;
        storageFee[] = { 14000, 0, 0, 0 };
		garageSell[] = { 150000, 0, 0, 0 };
        insurance = 2500;
        chopShop = 120000;
        textures[] = { };
    };
	
	class B_Truck_01_Repair_F { 
        vItemSpace = 400;
        storageFee[] = { 14000, 0, 0, 0 };
		garageSell[] = { 150000, 0, 0, 0 };
        insurance = 2500;
        chopShop = 120000;
        textures[] = { };
    };
	
	class B_Truck_01_ammo_F { 
        vItemSpace = 400;
        storageFee[] = { 14000, 0, 0, 0 };
		garageSell[] = { 150000, 0, 0, 0 };
        insurance = 2500;
        chopShop = 120000;
        textures[] = { };
    };
	
	class B_Truck_01_fuel_F { 
        vItemSpace = 150;
        storageFee[] = { 14000, 0, 0, 0 };
		garageSell[] = { 150000, 0, 0, 0 };
        insurance = 2500;
        chopShop = 120000;
        textures[] = { };
    };
	
	class B_Truck_01_transport_F { 
        vItemSpace = 400;
        storageFee[] = { 14000, 0, 0, 0 };
		garageSell[] = { 150000, 0, 0, 0 };
        insurance = 2500;
        chopShop = 120000;
        textures[] = { };
    };
	
	class B_Truck_01_covered_F { 
        vItemSpace = 400;
        storageFee[] = { 14000, 0, 0, 0 };
		garageSell[] = { 150000, 0, 0, 0 };
        insurance = 2500;
        chopShop = 120000;
        textures[] = { };
    };

	class O_MRAP_02_F {
        vItemSpace = 60;
        storageFee[] = { 12000, 0, 0, 0 };
		garageSell[] = { 65000, 0, 0, 0 };
        insurance = 2500;
        chopShop = 100000;
        textures[] = { };
    };

	class I_MRAP_03_F {
        vItemSpace = 300;
        storageFee[] = { 1000, 0, 0, 0 };
        insurance = 2500;
        chopShop = 100000;
        textures[] = { };
    };

	class C_Offroad_01_F {
        vItemSpace = 65;
        storageFee[] = { 1000, 500, 650, 1000 };
		garageSell[] = { 6500, 2500, 0, 0 };
        insurance = 2500;
        chopShop = 2500;
        textures[] = {
        	{ "Red", "civ", {
                "\A3\soft_F\Offroad_01\Data\offroad_01_ext_co.paa",
                "\A3\soft_F\Offroad_01\Data\offroad_01_ext_co.paa"
            } },
			{ "Yellow", "civ", {
	                "\A3\soft_F\Offroad_01\Data\offroad_01_ext_BASE01_CO.paa",
	                "\A3\soft_F\Offroad_01\Data\offroad_01_ext_BASE01_CO.paa"
            } },
			{ "White", "civ", {
	                "\A3\soft_F\Offroad_01\Data\offroad_01_ext_BASE02_CO.paa",
	                "\A3\soft_F\Offroad_01\Data\offroad_01_ext_BASE02_CO.paa"
            } },
			{ "Blue", "civ", {
	                "\A3\soft_F\Offroad_01\Data\offroad_01_ext_BASE03_CO.paa",
	                "\A3\soft_F\Offroad_01\Data\offroad_01_ext_BASE03_CO.paa"
            } },
			{ "Dark Red", "civ", {
	                "\A3\soft_F\Offroad_01\Data\offroad_01_ext_BASE04_CO.paa",
	                "\A3\soft_F\Offroad_01\Data\offroad_01_ext_BASE04_CO.paa"
            } },
			{ "Blue / White", "civ", {
	                "\A3\soft_F\Offroad_01\Data\offroad_01_ext_BASE05_CO.paa",
	                "\A3\soft_F\Offroad_01\Data\offroad_01_ext_BASE05_CO.paa"
            } },
            { "Fed", "fed", {
	                "#(ai,64,64,1)Fresnel(0.3,3)"
            } },
			{ "Police", "cop", {
	                "textures\vehicles\cop\police_offroad.paa"
            } },
            { "Taxi", "civ", {
	                "#(argb,8,8,3)color(0.6,0.3,0.01,1)"
            } }
	    };
    };
	
	class C_Offroad_01_repair_F {
        vItemSpace = 65;
        storageFee[] = { 1000, 500, 650, 1000 };
		garageSell[] = { 6500, 2500, 0, 0 };
        insurance = 2500;
        chopShop = 2500;
        textures[] = {
			
		};
    };

	class C_Kart_01_Blu_F {
		vItemSpace = 20;
		storageFee[] = { 1500, 0, 0, 0 };
		garageSell[] = { 3500, 0, 0, 0 };
		inusrance = 1650;
		chopShop = 3500;
		textures[] = {};
	};

	class C_Kart_01_Fuel_F : C_Kart_01_Blu_F {}; 
	class C_Kart_01_Red_F : C_Kart_01_Blu_F {}; 
	class C_Kart_01_Vrana_F : C_Kart_01_Blu_F {}; 

	class C_Hatchback_01_sport_F {
        vItemSpace = 45;
        storageFee[] = { 2500, 1000, 0, 0 };
		garageSell[] = { 15000, 7500, 0, 0 };
        insurance = 5500;
        chopShop = 4500;
        textures[] = {
        	{ "Red", "civ", {
                "\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_sport01_co.paa"
            } },
			{ "Dark Blue", "civ", {
	                "\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_sport02_co.paa"
            } },
			{ "Orange", "civ", {
	                "\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_sport03_co.paa"
            } },
			{ "Black / White", "civ", {
	                "\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_sport04_co.paa"
            } },
			{ "Beige", "civ", {
	                "\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_sport05_co.paa"
            } },
			{ "Green", "civ", {
	                "\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_sport06_co.paa"
            } },
			{ "Rockstar", "civ", {
	                "textures\vehicles\civ\hatchback\Rockstar Hatchback.paa"
            } },
			{ "Red Gull", "civ", {
	                "textures\vehicles\civ\hatchback\redgull.paa"
            } },
			{ "Unicorn", "civ", {
	                "textures\vehicles\civ\hatchback\unicorn_hatchback.paa"
            } },
            { "Police", "cop", {
					"textures\vehicles\cop\police_hatchback.paa"
            } },
			{ "Medic", "med", {
					"textures\vehicles\medic\medic_hatchback.paa"
            } },
			{ "Rebel", "reb", {
					"textures\vehicles\civ\hatchback\rebel_hatchback.paa"
            } },
			{ "Insatsstyrkan", "insats", {
					"textures\vehicles\cop\insats_hatchback.paa"
            } }
        };
    };
	
	class O_T_LSV_02_unarmed_F { 
        vItemSpace = 45;
        storageFee[] = { 1000, 1000, 0, 0 };
		garageSell[] = { 15000, 7500, 0, 0 };
        insurance = 5500;
        chopShop = 4500;
        textures[] = {};
    };

	class B_Quadbike_01_F {
        vItemSpace = 25;
        storageFee[] = { 1000, 0, 0, 0 };
		garageSell[] = { 950, 0, 0, 0 };
        insurance = 2500;
        chopShop = 5000;
        textures[] = {
			{ "Digi Desert", "reb", {
	                "\A3\Soft_F\Quadbike_01\Data\quadbike_01_opfor_co.paa"
	        } },
			{ "Black", "civ", {
	                "\A3\Soft_F_beta\Quadbike_01\Data\quadbike_01_civ_black_co.paa"
	        } },
			{ "Blue", "civ", {
	                "\A3\Soft_F_beta\Quadbike_01\Data\quadbike_01_civ_blue_co.paa"
	        } },
			{ "Red", "civ", {
	                "\A3\Soft_F_beta\Quadbike_01\Data\quadbike_01_civ_red_co.paa"
	        } },
			{ "White", "civ", {
	                "\A3\Soft_F_beta\Quadbike_01\Data\quadbike_01_civ_white_co.paa"
	        } },
			{ "Digi Green", "civ", {
	                "\A3\Soft_F_beta\Quadbike_01\Data\quadbike_01_indp_co.paa"
	        } },
			{ "Hunter Camo", "civ", {
	                "\a3\soft_f_gamma\Quadbike_01\data\quadbike_01_indp_hunter_co.paa"
	        } },
	        { "Rebel Camo", "reb", {
                "\a3\soft_f_gamma\Quadbike_01\data\quadbike_01_indp_hunter_co.paa"
            } },
			{ "Polis", "cop", {
                "textures\vehicles\cop\police_quad.paa"
            } }
        };
    };

	class I_Truck_02_covered_F {
        vItemSpace = 250;
        storageFee[] = { 14500, 0, 0, 0 };
		garageSell[] = { 62000, 0, 0, 0 };
        insurance = 6500;
        chopShop = 78000;
        textures[] = {
        	{ "Orange", "civ", {
                "\A3\Soft_F_Beta\Truck_02\data\truck_02_kab_co.paa",
                "\a3\soft_f_beta\Truck_02\data\truck_02_kuz_co.paa"
            } },
            { "Black", "fed", {
                "#(argb,8,8,3)color(0.05,0.05,0.05,1)"
            } }
        };
    };

	class I_Truck_02_transport_F : I_Truck_02_covered_F {
        vItemSpace = 200;
        storageFee[] = { 12000, 0, 0, 0 };
		garageSell[] = { 49800, 3500, 0, 0 };
    }

	class C_Hatchback_01_F {
        vItemSpace = 40;
        storageFee[] = { 1000, 0, 0, 0 };
		garageSell[] = { 4500, 3500, 0, 0 };
        insurance = 2500;
        chopShop = 5000;
        textures[] = {
        	{ "Beige", "civ", {
                "\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_base01_co.paa"
            } },
			{ "Green", "civ", {
	                "\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_base02_co.paa"
            } },
			{ "Blue", "civ", {
	                "\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_base03_co.paa"
            } },
			{ "Dark Blue", "civ", {
	                "\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_base04_co.paa"
            } },
			{ "Yellow", "civ", {
	                "\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_base06_co.paa"
            } },
			{ "White", "civ", {
	                "\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_base07_co.paa"
            } },
			{ "Grey", "civ", {
	                "\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_base08_co.paa"
            } },
            { "Black", "civ", {
                "\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_base09_co.paa"
            } }
        };
    };

	class C_SUV_01_F {
        vItemSpace = 50;
        storageFee[] = { 1000, 0, 0, 0 };
		garageSell[] = { 15000, 7500, 0, 0 };
        insurance = 2500;
        chopShop = 5000;
        textures[] = {
        	{ "Dark Red", "civ", {
                "\a3\soft_f_gamma\SUV_01\Data\suv_01_ext_co.paa"
            } },
			{ "Silver", "civ", {
	                "\a3\soft_f_gamma\SUV_01\Data\suv_01_ext_03_co.paa"
            } },
			{ "Orange", "civ", {
	                "\a3\soft_f_gamma\SUV_01\Data\suv_01_ext_04_co.paa"
            } },
			{ "Monster", "civ", {
	                "textures\vehicles\civ\suv\suv_Monster_energy_block.paa"
            } },
            { "Police", "cop", {
                "textures\vehicles\cop\suv\suv_police_co.paa"
            } },
			{ "Medic", "med", {
                "textures\vehicles\medic\suv_medic.paa"
            } },
			{ "Rebell", "reb", {
				"textures\vehicles\civ\suv\rebel_suv.paa"
            } }
	        };
    };

	class C_Van_01_transport_F {
        vItemSpace = 100;
        storageFee[] = { 1000, 0, 0, 0 };
		garageSell[] = { 25000, 0, 0, 0 };
        insurance = 2500;
        chopShop = 5000;
        textures[] = {
        	{ "White", "civ", {
                "\a3\soft_f_gamma\Van_01\Data\van_01_ext_co.paa"
            } },
            { "Red", "civ", {
                "\a3\soft_f_gamma\Van_01\Data\van_01_ext_red_co.paa"
            } }
        };
    };

	class C_Van_01_box_F {
        vItemSpace = 150;
        storageFee[] = { 1000, 0, 0, 0 };
		garageSell[] = { 35000, 0, 0, 0 };
        insurance = 2500;
        chopShop = 5000;
        textures[] = {
        	{ "White", "civ", {
                "\a3\soft_f_gamma\Van_01\Data\van_01_ext_co.paa"
            } },
            { "Red", "civ", {
                "\a3\soft_f_gamma\Van_01\Data\van_01_ext_red_co.paa"
            } },
			{ "Medic", "med", {
                "textures\vehicles\medic\medic_van_chassi.paa",
				"textures\vehicles\medic\medic_van_box.paa"
            } }
        };
    };
	class B_MRAP_01_F {
        vItemSpace = 65;
        storageFee[] = { 0, 7500, 0, 0 };
		garageSell[] = { 0, 10000, 0, 0 };
        insurance = 2500;
        chopShop = 100000;
        textures[] = {
        	{ "Insatsstyrkan", "cop", {
                "textures\vehicles\cop\police_hunter_body.paa"
            } },
			{ "Hunter", "reb", {
                "textures\vehicles\rebel_hunter.paa"
            } },
            { "Black", "civ", {
                "#(argb,8,8,3)color(0.05,0.05,0.05,1)"
            } }
        };
    };
	
	class I_Plane_Fighter_03_AA_F {
        vItemSpace = 420;
        storageFee[] = { 35000, 35000, 0, 0 };
		garageSell[] = { 400000, 400000, 0, 0 };
        insurance = 2500;
        chopShop = 0;
        textures[] = { };
    };
	
	class B_Plane_CAS_01_F {
        vItemSpace = 500;
        storageFee[] = { 25000, 20000, 0, 0 };
		garageSell[] = { 200000, 200000, 0, 0 };
        insurance = 2500;
        chopShop = 0;
        textures[] = {
        	{ "Shark", "cop", {
                "textures\vehicles\all\wipeoutfuselage_usaf01_co.paa",
				"textures\vehicles\all\wipeoutwings_usaf01_co.paa"
            } },
			{ "Shark", "civ", {
                "textures\vehicles\all\wipeoutfuselage_usaf01_co.paa",
				"textures\vehicles\all\wipeoutwings_usaf01_co.paa"
            } },
			{ "Shark", "med", {
                "textures\vehicles\all\wipeoutfuselage_usaf01_co.paa",
				"textures\vehicles\all\wipeoutwings_usaf01_co.paa"
            } },
			{ "Shark", "reb", {
                "textures\vehicles\all\wipeoutfuselage_usaf01_co.paa",
				"textures\vehicles\all\wipeoutwings_usaf01_co.paa"
            } }
        };
    };
	
	class O_Plane_CAS_02_F {
        vItemSpace = 525;
        storageFee[] = { 30000, 25000, 0, 0 };
		garageSell[] = { 300000, 300000, 0, 0 };
        insurance = 2500;
        chopShop = 0;
        textures[] = { };
    };
	
	class I_Plane_Fighter_04_F { 
        vItemSpace = 500;
        storageFee[] = { 1000, 1000, 0, 0 };
		garageSell[] = { 1000, 1000, 0, 0 };
        chopShop = 1000;
        textures[] = {};
    };
	
	class B_Plane_Fighter_01_F { 
        vItemSpace = 500;
        storageFee[] = { 1000, 1000, 0, 0 };
		garageSell[] = { 1000, 1000, 0, 0 };
        chopShop = 1000;
        textures[] = {};
    };
	
	class B_Plane_Fighter_01_Stealth_F { 
        vItemSpace = 500;
        storageFee[] = { 1000, 1000, 0, 0 };
		garageSell[] = { 1000, 1000, 0, 0 };
        chopShop = 1000;
        textures[] = {};
    };
	
	class O_Plane_Fighter_02_F { 
        vItemSpace = 550;
        storageFee[] = { 1000, 1000, 0, 0 };
		garageSell[] = { 1000, 1000, 0, 0 };
        chopShop = 1000;
        textures[] = {};
    };
	
	class O_Plane_Fighter_02_Stealth_F { 
        vItemSpace = 550;
        storageFee[] = { 1000, 1000, 0, 0 };
		garageSell[] = { 1000, 1000, 0, 0 };
        chopShop = 1000;
        textures[] = {};
    };
	
	class B_UAV_05_F { 
        vItemSpace = 50;
        storageFee[] = { 1000, 1000, 0, 0 };
		garageSell[] = { 1000, 1000, 0, 0 };
        chopShop = 1000;
        textures[] = {};
    };
	
	class C_Heli_Light_01_civil_F { 
        vItemSpace = 55;
        storageFee[] = { 10000, 2500, 0, 0 };
		garageSell[] = { 57000, 35000, 0, 0 };
        insurance = 2500;
        chopShop = 80000;
        textures[] = {};
    };
	
	class B_Heli_Light_01_F { 
        vItemSpace = 55;
        storageFee[] = { 10000, 2500, 0, 0 };
		garageSell[] = { 57000, 35000, 0, 0 };
        insurance = 2500;
        chopShop = 80000;
        textures[] = {
			{ "Police", "cop", {
					"textures\vehicles\cop\hummingbird\heli_police_light_co.paa"
            } },
			{ "Black", "fed", {
	                "\a3\air_f\Heli_Light_01\Data\heli_light_01_ext_ion_co.paa"
            } },
			{ "Civ Blue", "civ", {
	                "\a3\air_f\Heli_Light_01\Data\heli_light_01_ext_blue_co.paa"
            } },
			{ "Civ Red", "civ", {
	                "\a3\air_f\Heli_Light_01\Data\heli_light_01_ext_co.paa"
            } },
			{ "Digi Green", "donate", {
	                "\a3\air_f\Heli_Light_01\Data\heli_light_01_ext_indp_co.paa"
            } },
			{ "Blueline", "civ", {
	                "\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_blueline_co.paa"
            } },
			{ "Elliptical", "civ", {
	                "\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_elliptical_co.paa"
            } },
			{ "Furious", "civ", {
	                "\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_furious_co.paa"
            } },
			{ "Jeans Blue", "civ", {
	                "\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_jeans_co.paa"
            } },
			{ "Speedy Redline", "civ", {
	                "\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_speedy_co.paa"
            } },
			{ "Sunset", "civ", {
	                "\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_sunset_co.paa"
            } },
			{ "Vrana", "civ", {
	                "\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_vrana_co.paa"
            } },
			{ "Waves Blue", "civ", {
	                "\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_wave_co.paa"
            } },
			{ "Rebel", "reb", {
	                "textures\vehicles\civ\hummingbird\rebel_hummingbird.paa"
            } },
            { "Medic", "med", {
					"textures\vehicles\medic\medic_hummingbird.paa"
            } },
			{ "Monster", "civ", {
	                "textures\vehicles\civ\hummingbird\hummingbird_moster_energy_block.paa"
            } },
			{ "ROSA HELIKOPTER", "civ", {
                "#(argb,8,8,3)color(1,0.3,0.3,0.8)"
            } }
			
			
        };
    };
	
	class B_UAV_01_F { 
        vItemSpace = 15;
        storageFee[] = { 10000, 2500, 0, 0 };
		garageSell[] = { 20000, 20000, 0, 0 };
        insurance = 2500;
        chopShop = 40000;
        textures[] = {};
    };
	
	

	class O_Heli_Light_02_unarmed_F { 
        vItemSpace = 150;
        storageFee[] = { 22000, 0, 2500, 0 };
		garageSell[] = { 72500, 0, 35000, 0 };
        insurance = 2500;
        chopShop = 5000;
        textures[] = {
        	{ "Black", "fed", {
                "\a3\air_f\Heli_Light_02\Data\heli_light_02_ext_co.paa"
            } },
			{ "White / Blue", "civ", {
	                "\a3\air_f\Heli_Light_02\Data\heli_light_02_ext_civilian_co.paa"   
            } },
			{ "Digi Green", "donate", {
	                "\a3\air_f\Heli_Light_02\Data\heli_light_02_ext_indp_co.paa"
            } },
			{ "Desert Digi", "reb", {
	                "\a3\air_f\Heli_Light_02\Data\heli_light_02_ext_opfor_co.paa" 
            } },
			{ "Medic", "med", {
                "textures\vehicles\medic\medic_orca.paa"
            } },
            { "EMS White", "med", {
                "#(argb,8,8,3)color(1,1,1,0.8)"
            } }
        };
    };

	class I_Heli_Transport_02_F { 
        vItemSpace = 190;
        storageFee[] = { 25000, 0, 0, 0 };
		garageSell[] = { 125000, 0, 0, 0 };
        insurance = 2500;
        chopShop = 5000;
        textures[] = {
        	{ "Ion", "civ", {
                "\a3\air_f_beta\Heli_Transport_02\Data\Skins\heli_transport_02_1_ion_co.paa",
                "\a3\air_f_beta\Heli_Transport_02\Data\Skins\heli_transport_02_2_ion_co.paa",
                "\a3\air_f_beta\Heli_Transport_02\Data\Skins\heli_transport_02_3_ion_co.paa"
            } },
            { "Dahoman", "civ", {
                "\a3\air_f_beta\Heli_Transport_02\Data\Skins\heli_transport_02_1_dahoman_co.paa",
                "\a3\air_f_beta\Heli_Transport_02\Data\Skins\heli_transport_02_2_dahoman_co.paa",
                "\a3\air_f_beta\Heli_Transport_02\Data\Skins\heli_transport_02_3_dahoman_co.paa"
            } }
        };
    };
	
	class O_Heli_Transport_04_F { 
        vItemSpace = 50;
        storageFee[] = { 20000, 0, 0, 0 };
		garageSell[] = { 125000, 0, 0, 0 };
        insurance = 2500;
        chopShop = 100000;
        textures[] = {};
    };
	
	class O_Heli_Transport_04_ammo_F { 
        vItemSpace = 350;
        storageFee[] = { 20000, 0, 0, 0 };
		garageSell[] = { 125000, 0, 0, 0 };
        insurance = 2500;
        chopShop = 100000;
        textures[] = {};
    };
	
	class O_Heli_Transport_04_bench_F { 
        vItemSpace = 350;
        storageFee[] = { 20000, 0, 0, 0 };
		garageSell[] = { 125000, 0, 0, 0 };
        insurance = 2500;
        chopShop = 100000;
        textures[] = {};
    };
	
	class O_Heli_Transport_04_box_F { 
        vItemSpace = 350;
        storageFee[] = { 20000, 0, 0, 0 };
		garageSell[] = { 125000, 0, 0, 0 };
        insurance = 2500;
        chopShop = 100000;
        textures[] = {};
    };
	
	class O_Heli_Transport_04_fuel_F { 
        vItemSpace = 140;
        storageFee[] = { 20000, 0, 0, 0 };
		garageSell[] = { 125000, 0, 0, 0 };
        insurance = 2500;
        chopShop = 100000;
        textures[] = {};
    };
	
	class O_Heli_Transport_04_repair_F { 
        vItemSpace = 350;
        storageFee[] = { 20000, 0, 0, 0 };
		garageSell[] = { 125000, 0, 0, 0 };
        insurance = 2500;
        chopShop = 100000;
        textures[] = {};
    };
	
	class O_Heli_Transport_04_covered_F { 
        vItemSpace = 350;
        storageFee[] = { 20000, 0, 0, 0 };
		garageSell[] = { 125000, 0, 0, 0 };
        insurance = 2500;
        chopShop = 100000;
        textures[] = {};
    };
	
	class O_Heli_Transport_04_medevac_F { 
        vItemSpace = 50;
        storageFee[] = { 20000, 0, 0, 0 };
		garageSell[] = { 125000, 0, 0, 0 };
        insurance = 2500;
        chopShop = 100000;
        textures[] = {};
    };
	
	class B_Heli_Transport_03_unarmed_F { 
        vItemSpace = 210;
        storageFee[] = { 35000, 0, 0, 0 };
		garageSell[] = { 125000, 0, 0, 0 };
        insurance = 2500;
        chopShop = 5000;
        textures[] = {};
    };
	
	class B_SDV_01_F {
        vItemSpace = 110;
        storageFee[] = { 1000, 0, 0, 0 };
        insurance = 2500;
        chopShop = 5000;
        textures[] = { };
    };
	
	class C_Plane_Civil_01_F { 
        vItemSpace = 150;
        storageFee[] = { 1000, 0, 0, 0 };
		garageSell[] = { 950, 0, 0, 0 };
        insurance = 2500;
        chopShop = 5000;
        textures[] = {};
    };
	
	class I_C_Plane_Civil_01_F { 
        vItemSpace = 300;
        storageFee[] = { 1000, 0, 0, 0 };
		garageSell[] = { 950, 0, 0, 0 };
        insurance = 2500;
        chopShop = 5000;
        textures[] = {};
    };
	
	class C_Plane_Civil_01_racing_F { 
        vItemSpace = 150;
        storageFee[] = { 1000, 0, 0, 0 };
		garageSell[] = { 950, 0, 0, 0 };
        insurance = 2500;
        chopShop = 5000;
        textures[] = {};
    };
	
	
	class C_Offroad_02_unarmed_F { 
        vItemSpace = 60;
        storageFee[] = { 1000, 0, 0, 0 };
		garageSell[] = { 950, 0, 0, 0 };
        insurance = 2500;
        chopShop = 5000;
        textures[] = {};
    };
	
	class I_C_Offroad_02_unarmed_F { 
        vItemSpace = 60;
        storageFee[] = { 1000, 0, 0, 0 };
		garageSell[] = { 950, 0, 0, 0 };
        insurance = 2500;
        chopShop = 5000;
        textures[] = {};
    };
	
	class C_Scooter_Transport_01_F { 
        vItemSpace = 50;
        storageFee[] = { 1000, 0, 0, 0 };
		garageSell[] = { 950, 0, 0, 0 };
        insurance = 2500;
        chopShop = 5000;
        textures[] = {};
    };
	
	class C_Boat_Transport_02_F { 
        vItemSpace = 100;
        storageFee[] = { 1000, 0, 0, 0 };
		garageSell[] = { 950, 0, 0, 0 };
        insurance = 2500;
        chopShop = 5000;
        textures[] = {};
    };
	
	class I_C_Boat_Transport_02_F { 
        vItemSpace = 100;
        storageFee[] = { 1000, 0, 0, 0 };
		garageSell[] = { 950, 0, 0, 0 };
        insurance = 2500;
        chopShop = 5000;
        textures[] = {};
    };
	
	class O_T_VTOL_02_infantry_F { 
        vItemSpace = 25;
        storageFee[] = { 5000, 0, 0, 0 };
		garageSell[] = { 950, 0, 0, 0 };
        insurance = 2500;
        chopShop = 5000;
        textures[] = {};
    };
	
	class O_T_VTOL_02_vehicle_F { 
        vItemSpace = 250;
        storageFee[] = { 5000, 0, 0, 0 };
		garageSell[] = { 950, 0, 0, 0 };
        insurance = 2500;
        chopShop = 5000;
        textures[] = {};
    };
	
	class B_T_VTOL_01_armed_F { 
        vItemSpace = 25;
        storageFee[] = { 5000, 0, 0, 0 };
		garageSell[] = { 950, 0, 0, 0 };
        insurance = 2500;
        chopShop = 5000;
        textures[] = {};
    };
	
	class B_T_VTOL_01_infantry_F { 
        vItemSpace = 25;
        storageFee[] = { 5000, 0, 0, 0 };
		garageSell[] = { 950, 0, 0, 0 };
        insurance = 2500;
        chopShop = 5000;
        textures[] = {};
    };
	
	class B_T_VTOL_01_vehicle_F { 
        vItemSpace = 25;
        storageFee[] = { 5000, 0, 0, 0 };
		garageSell[] = { 950, 0, 0, 0 };
        insurance = 2500;
        chopShop = 5000;
        textures[] = {};
    };
	
	class B_CTRG_LSV_01_light_F { 
        vItemSpace = 65;
        storageFee[] = { 5000, 0, 0, 0 };
		garageSell[] = { 950, 0, 0, 0 };
        insurance = 2500;
        chopShop = 5000;
        textures[] = {};
    };
	
};

