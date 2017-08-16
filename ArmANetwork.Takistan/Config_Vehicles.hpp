class CarShops {
	/*
		Format:
		{ Classname, rental price, license required, { varname, >= value } }

		{ varname, >= value} this is a "level" requirement mainly used by cops and rebels, do not fill this in if you are not utilizing it.
	*/
	class civ_car {
		side = "civ";
		vehicles[] = {
			{ "B_Quadbike_01_F", 250, "" }, 
			{ "C_Hatchback_01_F", 950, "driver" }, 
			{ "C_Offroad_01_F", 1250, "driver" },
			{ "C_SUV_01_F", 1550, "driver" },
			{ "C_Van_01_transport_F", 4000, "driver" },
			{ "LandRover_CZ_EP1", 2000, "driver" },
			{ "BAF_Offroad_W", 2000, "driver" },
			{ "LandRover_TK_CIV_EP1", 2000, "driver" },
			{ "Jonzie_30CSL", 850, "driver" },
			{ "Jonzie_Corolla", 900, "driver" },
			{ "Jonzie_Datsun_510", 850, "driver" },
			{ "Jonzie_Datsun_Z432", 1250, "driver" },
			{ "Jonzie_Escalade", 2250, "driver" },
			{ "Jonzie_Mini_Cooper", 750, "driver" },
			{ "Jonzie_Galant", 1000, "driver" }
		};
	};

	class sports_car {
		side = "civ";
		vehicles[] = {
			{ "Jonzie_STI", 5250, "driver" },
			{ "Jonzie_Raptor", 5500, "driver" },
			{ "C_Hatchback_01_sport_F", 6500, "driver" },
			{ "Jonzie_Viper", 7500, "driver" },
			{ "Jonzie_Quattroporte", 10000, "driver" }
		};
	};
	class kart_shop {
		side = "civ";
		vehicles[] = {
			{ "C_Kart_01_Blu_F", 1500 , "driver" },
			{ "C_Kart_01_Fuel_F", 1500, "driver" },
			{ "C_Kart_01_Red_F", 1500, "driver" },
			{ "C_Kart_01_Vrana_F", 1500, "driver" }
		};
	};

	class med_shop {
		side = "med";
		vehicles[] = {
			{ "C_Offroad_01_F", 100, "" },
			{ "I_Truck_02_medical_F", 250, "" },
			{ "O_Truck_03_medical_F", 450, "" },
			{ "B_Truck_01_medical_F", 600, "" },
			{ "EWK_HMMWV_Medevac", 500, "" },
			{ "EWK_M997A2_Ambulance", 500, "" },
			{ "EWK_M997A2_Ambulance_Tan", 500, "" }
		};
	};

	class med_air_hs {
		side = "med";
		vehicles[] = {
			{ "B_Heli_Light_01_F", 500, "mAir" },
			{ "O_Heli_Light_02_unarmed_F", 500, "mAir" }
		};
	};

	class civ_truck {
		side = "civ";
		vehicles[] = {
			{ "Jonzie_Transit", 20500, "trucking" },
			{ "C_Van_01_box_F", 30500, "trucking" },
			{ "I_Truck_02_transport_F", 15800, "trucking" },
			{ "I_Truck_02_covered_F", 15800, "trucking" },
			{ "B_Truck_01_transport_F", 55000, "trucking" },
			{ "O_Truck_03_transport_F", 14500, "trucking" },
			{ "O_Truck_03_covered_F", 13550, "trucking" },
			{ "B_Truck_01_box_F", 40000, "trucking" },
			{ "O_Truck_03_device_F", 58500, "trucking" },
			{ "O_Truck_02_fuel_F", 55000, "trucking" },
			{ "O_Truck_03_fuel_F", 50000, "trucking" },
			{ "B_Truck_01_fuel_F", 55000, "trucking"}
		};
	};

	class reb_car {
		side = "civ";
		vehicles[] = {
			{ "B_Quadbike_01_F", 1500, "rebel" },
			{ "B_G_Offroad_01_F", 15000, "rebel" },
			{ "B_Heli_Light_01_F", 25300, "rebel" },
			{ "LandRover_ACR", 15000, "rebel" },
			{ "LandRover_CZ_EP1", 15000, "rebel" },
			{ "LandRover_MG_TK_EP1", 15000, "rebel" },
			{ "BAF_Offroad_W_HMG", 15000, "rebel" },
			{ "ACR_Offroad_HMG", 15000, "rebel" }
		};
	};
	
	class rdm_car {
		side = "civ";
		vehicles[] = {
			{ "B_Heli_Light_01_armed_F", 150000, "rebel" },
			{ "O_MRAP_02_F", 250000, "rebel" },
			{ "B_G_Offroad_01_armed_F", 40000, "rebel" },
			{ "Cha_Mi24_D", 625000, "rebel" },
			{ "O_APC_Wheeled_02_rcws_F", 425000, "rebel" },
			{ "O_MBT_02_cannon_F", 500000, "rebel" }

		};
	};

	class TSF_armed {
		side = "cop";
		vehicles[] = {
			{ "B_G_Offroad_01_armed_F", 300, "", { "life_coplevel", 3 } },
			{ "Gurkha_M60", 500, "", { "life_coplevel", 3 } },
			{ "EWK_M1151_m2_deployment", 700, "", { "life_coplevel", 4 } },
			{ "DAR_MaxxProDeploy", 1500, "",{ "life_coplevel", 5 } }
		};
	};
  
	class TSF_unarmed {
		side = "cop";
		vehicles[] = {
			{ "C_Offroad_01_F", 500, ""},
			{ "AM_10Fusion_P_P", 300, ""},
			{ "AM_09Tahoe_P_P", 500, ""},
			{ "C_SUV_01_F", 200, "" },
			{ "LandRover_TK_CIV_EP1", 300, "" },
			{ "B_Truck_01_covered_F", 200, "" },
			{ "B_Truck_01_Repair_F", 200, "" },
			{ "AM_09Tahoe_U_T", 300, "", { "life_coplevel", 3 } }, 	
			{ "Gurkha_f5", 300, "", { "life_coplevel", 3 } }, 	
			{ "AM_13GC_P_P", 450, "", { "life_coplevel", 4 } },
			{ "EWK_HMMWV_Light", 450, "", { "life_coplevel", 4 } }		
			//{ "O_MRAP_02_F", 2500, "Event Award", { "life_coplevel", 3 } },
			//{ "I_MRAP_03_F", 2500, "Event Award", { "life_coplevel", 3 } }
		};
	}; 
  
  class nato_unarmed {
		side = "cop";
		vehicles[] = {
			{ "AM_09Tahoe_U_T", 130, "", { "life_coplevel", 6 } },
			{ "LandRover_ACR", 130, "", { "life_coplevel", 6 } },
			{ "sab_UN_Offroad", 130, "", { "life_coplevel", 6 } },
			{ "sab_UN_SUV", 130, "", { "life_coplevel", 6 } },
			{ "sab_UN_Hunter", 130, "", { "life_coplevel", 6 } },
			{ "sab_UN_Strider", 300, "", { "life_coplevel", 10 } }, 
			{ "sab_UN_Truck_O", 100, "", { "life_coplevel", 7 } },
			{ "sab_UN_Truck_C", 130, "", { "life_coplevel", 7 } },
			{ "sab_UN_Truck_Medi", 130, "", { "life_coplevel", 7 } },
			{ "sab_UN_Truck_Ammo", 130, "", { "life_coplevel", 7 } },
			{ "sab_UN_Truck_Rep", 130, "", { "life_coplevel", 7 } },
			{ "sab_UN_Truck_Fuel", 130, "", { "life_coplevel", 7 } },
			{ "sab_UN_UGV", 300, "", { "life_coplevel", 9 } }
		};
	};
  
  class nato_armed {
		side = "cop";
		vehicles[] = {
			{ "sab_UN_UGV_armed", 100, "", { "life_coplevel", 7 } },
			{ "DAR_MaxxProDeploy", 100, "", { "life_coplevel", 7 } },
			{ "sab_UN_Offroad_gun", 100, "", { "life_coplevel", 8 } },
			{ "sab_UN_CRV", 100, "", { "life_coplevel", 9 } },
			{ "sab_UN_Panther", 100, "", { "life_coplevel", 9 } },
			{ "sab_UN_Kuma", 110, "", { "life_coplevel", 9 } },
			{ "sab_UN_APC", 150, "", { "life_coplevel", 10 } },
			{ "sab_UN_Hunter_hmg", 100, "", { "life_coplevel", 7 } },
			{ "sab_UN_Hunter_gmg", 200, "", { "life_coplevel", 9 } },
			{ "sab_UN_Strider_gmg", 200, "", { "life_coplevel", 10 } },
			{ "sab_UN_Strider_hmg", 200, "", { "life_coplevel", 10 } }
		};
	};

	class civ_air {
		side = "civ";
		vehicles[] = {
			{ "B_Heli_Light_01_F", 25300, "pilot" },
			{ "O_Heli_Light_02_unarmed_F", 75000, "pilot" }
		};
	};

	class cop_air {
		side = "cop";
		vehicles[] = {
			{ "sab_UN_Heli", 600, "cAir", { "life_coplevel", 6 }} ,
			{ "sab_UN_Large_Heli", 500, "cAir", { "life_coplevel", 6 } },
			{ "sab_UN_bird_civil", 600, "cAir", { "life_coplevel", 6 }} ,
			{ "sab_UN_bird", 500, "cAir", { "life_coplevel", 6 } },
			{ "sab_UN_Taru", 600, "cAir", { "life_coplevel", 6 }} ,
			{ "sab_UN_TaruX", 500, "cAir", { "life_coplevel", 6 } },
			{ "sab_UN_TaruB", 600, "cAir", { "life_coplevel", 6 }} ,
			{ "sab_UN_TaruM", 500, "cAir", { "life_coplevel", 6 } },
			{ "sab_UN_UGV", 500, "cAir", { "life_coplevel", 6} },
			{ "sab_UN_UGV_armed", 500, "cAir", { "life_coplevel", 10 } },
			{ "sab_UN_Heli_armed", 500, "cAir", { "life_coplevel", 10 } },
			{ "sab_UN_pawnee", 500, "cAir", { "life_coplevel", 9 } },
			{ "sab_UN_attackHeli", 500, "cAir", { "life_coplevel", 10 } }
		};
	};
	
	class cop_air2 {
		side = "cop";
		vehicles[] = {
			{ "B_Heli_Light_01_F", 400, "cAir", { "life_coplevel", 2 } },
			{ "B_Heli_Transport_03_F", 700, "cAir", { "life_coplevel", 3 } } 
		};
	};

	class cop_airhq {
		side = "civ";
		vehicles[] = {
			{ "B_Heli_Light_01_F", 750, "cAir" },
			{ "B_Heli_Transport_01_F", 200, "cAir", { "life_coplevel", 3 } }
		};
	};

	class cop_ship {
		side = "cop";
		vehicles[] = {
			{ "sab_UN_Boat", 300, "coastguard" },
			{ "C_Boat_Civil_01_police_F", 200, "coastguard" },
			{ "sab_UN_Boat_armed", 750, "coastguard" },
			{ "B_SDV_01_F", 100, "coastguard" }
		};
	};

	class civ_air_adv {
		side = "civ";
		vehicles[] = {
			{ "I_Heli_light_03_unarmed_F", 40000, "pilotadv" },
			{ "O_Heli_Transport_04_F", 40000, "pilotadv" },
			{ "O_Heli_Transport_04_bench_F", 40000, "pilotadv"},
			{ "O_Heli_Transport_04_covered_F", 40000, "pilotadv"},
			{ "O_Heli_Transport_04_box_F", 40000, "pilotadv"},
			{ "I_Heli_Transport_02_F", 42500, "pilotadv"}
			
			
		};
	};
	
	class civ_air_pro {
		side = "civ";
		vehicles[] = {
			{ "B_Heli_Transport_03_unarmed_F", 47500, "pilotpro"}
			/*{ "Land_CargoBox_V1_F", 1000000, "pilotpro"}
			{ "I_Plane_Fighter_03_CAS_F", 2000000, "pilotpro" },
			{ "O_Plane_CAS_02_F",2000000, "pilotpro" },
			{ "B_Plane_CAS_01_F",2000000, "pilotpro" },*/
		};
	};
	
	class civ_ship {
		side = "civ";
		vehicles[] = {
			{ "C_Rubberboat", 5000, "boat" },
			{ "C_Boat_Civil_01_F", 22000, "boat" },
			{ "B_SDV_01_F", 15000, "boat" }
		};
	};
};

/*
	Vehicle Configs (Contains textures and other stuff)

	storageFee (Getting vehicles out of garage) format:
		INDEX 0: Civilian Price
		INDEX 1: Cop Price
		INDEX 3: EMS Price
		INDEX 4: OPFOR Price (Not implemented in vanilla but still leaving support

	Textures config follows { Texture Name, side, {texture(s)path}}
	Texture(s)path follows this format:
		INDEX 0: Texture Layer 0
		INDEX 1: Texture Layer 1
		INDEX 2: Texture Layer 2
		etc etc etc
*/
class CfgVehicles {
	class Default {
		vItemSpace = -1;
		storageFee[] = { 100, 0, 0, 0 };
		garageSell[] = { 1, 1, 1, 1 };
		insurance = 2500;
		chopShop = 10;
		textures[] = {};
	};

	class I_Truck_02_medical_F : Default {
		vItemSpace = 150;
		chopShop = 300;
		textures[] = { 
			{ "EMS RED", "med", {
                "#(argb,8,8,3)color(0.984314,0.929412,0.27451,1)"
            } }
		};
	};

	class O_Truck_03_medical_F : Default {
		vItemSpace = 200;
		chopShop = 700;
		textures[] = { { "EMS RED", "med", {
                "#(argb,8,8,3)color(0.984314,0.929412,0.27451,1)"
            } }
		};
	};

	class B_Truck_01_medical_F : Default {
		vItemSpace = 250;
		chopShop = 220;
		textures[] = { { "EMS RED", "med", {
                "#(argb,8,8,3)color(0.984314,0.929412,0.27451,1)"
            } }
		};
	};

	class C_Rubberboat {
		vItemSpace = 45;     	
		chopShop = 500;
		textures[] = {};
    };

	class B_Heli_Transport_01_F {
		vItemSpace = 0;
		chopShop = 900;
		textures[] = { { "EMS RED", "med", {
                "#(argb,8,8,3)color(0.984314,0.929412,0.27451,1)"
            } }
		};
	};

	class B_MRAP_01_hmg_F {
		vItemSpace = 100;
		chopShop = 950;
        textures[] = {
        	{ "Regular", "cop", {
                "\A3\Soft_F\MRAP_01\Data\mrap_01_base_co.paa"
            } },
            { "Black", "cop", {
                "#(argb,8,8,3)color(0.05,0.05,0.05,1)"
            } }
        };
    };
	class B_MRAP_01_gmg_F {
		vItemSpace = 100;
		chopShop = 900;
        textures[] = {
        	{ "Regular", "cop", {
                "\A3\Soft_F\MRAP_01\Data\mrap_01_base_co.paa"
            } },
            { "Black", "cop", {
                "#(argb,8,8,3)color(0.05,0.05,0.05,1)"
            } }
        };
    };
	class HMMWV : Default {
		vItemSpace = 100;
		chopShop = 1200;
		textures[] = {};
	};
	class HMMWV_M1035 : Default {
		vItemSpace = 100;
		chopShop = 1200;
		textures[] = {};
	};

	class O_Boat_Armed_01_hmg_F {
        vItemSpace = 110;
        chopShop = 1200;
        textures[] = { };
    };


	class DAR_MaxxPro_M2 {
        vItemSpace = 110;
        chopShop = 1200;
        textures[] = { };
    };
    
    
	class DAR_MaxxProDXM {
        vItemSpace = 110;
        chopShop = 1200;
        textures[] = { };
    };
    

	class DAR_MaxxPro {
        vItemSpace = 175;
        chopShop = 1200;
        textures[] = { };
    };
    

	class DAR_MaxxProPlus {
        vItemSpace = 175;
        chopShop = 1200;
        textures[] = { };
    };


	class I_Boat_Armed_01_minigun_F {
        vItemSpace = 15;
        chopShop = 500;
        textures[] = { };
    };

	class B_G_Boat_Transport_01_F {
        vItemSpace = 45;
        chopShop = 500;
        textures[] = { };
    };

	class B_Boat_Transport_01_F {
        vItemSpace = 45;
        chopShop = 500;
        textures[] = { };
    };

	class O_Truck_03_transport_F {
        vItemSpace = 225;
        chopShop = 100;
        textures[] = { };
    };

	class O_Truck_03_device_F {
        vItemSpace = 250;
        chopShop = 1000;
        textures[] = { };
    };
	
	class O_Truck_02_fuel_F {
        vItemSpace = 150;
        chopShop = 2000;
        textures[] = { };
    };
	
	class O_Truck_03_fuel_F {
		vItemSpace = 220;
        chopShop = 1000;
        textures[] = { };
	};
	
	class B_Truck_01_fuel_F {
		vItemSpace = 200;
        chopShop = 1700;
        textures[] = { };
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
        chopShop = 8000;
        textures[] = { };
    };

	class B_G_Offroad_01_armed_F : B_G_Offroad_01_F {};

	class I_G_Van_01_transport_F {
        vItemSpace = 100;
        chopShop = 0;
        textures[] = { };
    };

	class C_Boat_Civil_01_F {
        vItemSpace = 85;
        chopShop = 1200;
        textures[] = { };
    };

	class C_Boat_Civil_01_police_F {
        vItemSpace = 85;
        chopShop = 500;
        textures[] = { };
    };

	class C_Boat_Civil_01_rescue_F {
        vItemSpace = 85;
        chopShop = 500;
        textures[] = { };
    };

	class B_Truck_01_box_F {
        vItemSpace = 250;
        chopShop = 120;
        textures[] = { };
    };

	class B_Truck_01_transport_F {
        vItemSpace = 220;
        chopShop = 1200;
        textures[] = { };
    };

	class O_MRAP_02_F {
        vItemSpace = 60;
        chopShop = 2500;
        textures[] = {
			{ "Default", "reb", {
				"\A3\soft_f\MRAP_02\Data\mrap_02_ext_02_co.paa"
            } },
           { "Black", "civ", {
                "#(argb,8,8,3)color(0.05,0.05,0.05,1)"
            } },
			{ "Evant Award", "cop", {
                "textures\copcamo.jpg",
				"textures\copcamo2.jpg"
            } }
        };
    };

	class I_MRAP_03_F {
        vItemSpace = 58;
        chopShop = 2500;
        textures[] = { 
			{ "Default", "cop", {
				"\A3\soft_f_beta\MRAP_03\Data\mrap_03_ext_indp_co.paa"
            } },
            { "Black", "cop", {
                "#(ai,64,64,1)Fresnel(0.3,3)"
            } }
		};
    };
    
        class EWK_M1151 {
        vItemSpace = 65;
        chopShop = 2500;
        textures[] = {};
    };
    
    class EWK_m1151_m2_deployment {
        vItemSpace = 65;
        chopShop = 2500;
        textures[] = {};
    };
      
    class EWK_m1151_m2_deployment_Jtac {
        vItemSpace = 65;
        chopShop = 2500;
        textures[] = {};
    };
    
	 class B_Heli_Attack_01_F {
        vItemSpace = 100;
        chopShop = 0;
        textures[] = {
        { "Black", "cop", {
                "#(argb,8,8,3)color(0.05,0.05,0.05,1)"
            } },
        { "UN Placeholder", "cop", {
                "#(argb,8,8,3)color(0.05,0.05,0.05,1)"
          } }
        };
    };

     class O_Heli_Attack_02_black_F {
        vItemSpace = 100;
        chopShop = 0;
        textures[] = {
        { "UN Placeholder", "cop", {
                "#(argb,8,8,3)color(0.05,0.05,0.05,1)"
            } },
        { "UN Placeholder", "cop", {
                "#(argb,8,8,3)color(0.05,0.05,0.05,1)"
          } }
        };
    };
      
    class EWK_m1151_m2_deployment_Bumper {
        vItemSpace = 65;
        chopShop = 2500;
        textures[] = {};
    };
       
    class EWK_HMMWV_Light {
        vItemSpace = 65;
        chopShop = 2500;
        textures[] = {};
    };
       
    class EWK_HMMWV_Medevac {
        vItemSpace = 65;
        chopShop = 0;
        textures[] = {{ "EMS RED", "med", {
                "#(argb,8,8,3)color(0.984314,0.929412,0.27451,1)"
            } }};
    };
       
    class EWK_M997A2_Ambulance {
        vItemSpace = 65;
        chopShop = 0;
        textures[] = {{ "EMS RED", "med", {
                "#(argb,8,8,3)color(0.984314,0.929412,0.27451,1)"
            } }};
    };
       
    class EWK_M997A2_Ambulance_NoBackLights {
        vItemSpace = 65;
        chopShop = 0;
        textures[] = {{ "EMS RED", "med", {
                "#(argb,8,8,3)color(0.984314,0.929412,0.27451,1)"
            } }};
    };
        
    class EWK_M997A2_Ambulance_Tan {
        vItemSpace = 65;
        chopShop = 0;
        textures[] = {};
    };
    
 
    class B_APC_Tracked_01_rcws_F {
        vItemSpace = 10;
        chopShop = 500;
        textures[] = {};
    };
    
 
    class B_UAV_02_F {
        vItemSpace = 1;
        chopShop = 500;
        textures[] = {};
    };
    
    class EWK_M998_Terminal {
        vItemSpace = 65;
        chopShop = 200;
        textures[] = {};
    };
        
    class EWK_M1114_Armored {
        vItemSpace = 65;
        chopShop = 250;
        textures[] = {};
    };
         
    class EWK_M998A2_sov_M2 {
        vItemSpace = 65;
        chopShop = 200;
        textures[] = {};
    };
         
    class EWK_m1151_TOW_deployment {
        vItemSpace = 65;
        chopShop = 200;
        textures[] = {};
    };
          
    class EWK_m1151_m240_deployment {
        vItemSpace = 65;
        chopShop = 255;
        textures[] = {};
    };
          
    class EWK_m1151_m2_deployment_AT4 {
        vItemSpace = 65;
        chopShop = 200;
        textures[] = {};
    };
           
   
    class B_APC_Wheeled_01_cannon_F {
        vItemSpace = 15;
        chopShop = 0;
        textures[] = {};
    };
           
    class B_MBT_01_cannon_F {
        vItemSpace = 15;
        chopShop = 200;
        textures[] = {};
        
    };
           
	
	class AM_09Tahoe_U_T {
        vItemSpace = 40;
        chopShop = 50;
        textures[] = {{ 
			{ "United Nations", "cop", {
				"#(argb,8,8,3)color(0.356863,0.976471,0.956863,1)"
            } },
            { "Blacked out", "cop", {
                "#(ai,64,64,1)Fresnel(0.3,3)"
            } }
		};};
        
    };
	
	class AM_10Fusion_P_P {
        vItemSpace = 40;
        chopShop = 50;
        textures[] = {};
        
    };
	
    class LandRover_ACR {
        vItemSpace = 40;
        chopShop = 550;
        textures[] = {};
        
    };
           
    class B_APC_Tracked_01_CRV_F {
        vItemSpace = 10;
        chopShop = 550;
        textures[] = {};
        
    };
           
    class B_Heli_Light_01_armed_F {
        vItemSpace = 0;
        chopShop = 400;
        textures[] = {};
        
    };
            
    class LandRover_CZ_EP1 {
        vItemSpace = 65;
        chopShop = 500;
        textures[] = {};
        
    };
         
    class LandRover_TK_CIV_EP1  {
        vItemSpace = 65;
        chopShop = 500;
        textures[] = {};
        
    };
             
    class ACR_LandRover_AMB  {
        vItemSpace = 65;
        chopShop = 500;
        textures[] = {};
        
    };
             
    class BAF_Offroad_W  {
        vItemSpace = 65;
        chopShop = 500;
        textures[] = {};
        
    };
	
	class Jonzie_Transit  {
        vItemSpace = 135;
        chopShop = 500;
        textures[] = {
        	{ "Yellow", "civ", {
	                "#(argb,8,8,3)color(0.6,0.3,0.01,1)"
            } },
			{ "Aqua", "civ", {
	                "#(argb,8,8,3)color(0.215686,0.94902,0.933333,1)"
            } },
			{ "Black", "civ", {
	                "#(argb,8,8,3)color(0,0,0,1)"
            } },
			{ "Pink", "civ", {
	                "#(argb,8,8,3)color(0.945098,0.494118,0.996078,1)"
            } },
			{ "Purple", "civ", {
	                "#(argb,8,8,3)color(0.556863,0.00392157,0.619608,1)"
            } },
			{ "Green", "civ", {
	                "#(argb,8,8,3)color(0,1,0.25098,1)"
            } },
			{ "Light Green", "civ", {
	                "#(argb,8,8,3)color(0,0.54902,0.137255,1)"
            } },
			{ "Navy Blue", "civ", {
	                "#(argb,8,8,3)color(0,0,1,1)"
            } }
        };
        
    };

	class Jonzie_Escalade  {
        vItemSpace = 50;
        chopShop = 500;
        textures[] = {
        	{ "Yellow", "civ", {
	                "#(argb,8,8,3)color(0.6,0.3,0.01,1)"
            } },
			{ "Aqua", "civ", {
	                "#(argb,8,8,3)color(0.215686,0.94902,0.933333,1)"
            } },
			{ "Black", "civ", {
	                "#(argb,8,8,3)color(0,0,0,1)"
            } },
			{ "Pink", "civ", {
	                "#(argb,8,8,3)color(0.945098,0.494118,0.996078,1)"
            } },
			{ "Purple", "civ", {
	                "#(argb,8,8,3)color(0.556863,0.00392157,0.619608,1)"
            } },
			{ "Green", "civ", {
	                "#(argb,8,8,3)color(0,1,0.25098,1)"
            } },
			{ "Light Green", "civ", {
	                "#(argb,8,8,3)color(0,0.54902,0.137255,1)"
            } },
			{ "Navy Blue", "civ", {
	                "#(argb,8,8,3)color(0,0,1,1)"
            } }
        };
        
    };

    class Jonzie_Quattroporte  {
        vItemSpace = 30;
        chopShop = 500;
        textures[] = {
        	{ "Yellow", "civ", {
	                "#(argb,8,8,3)color(0.6,0.3,0.01,1)"
            } },
			{ "Aqua", "civ", {
	                "#(argb,8,8,3)color(0.215686,0.94902,0.933333,1)"
            } },
			{ "Black", "civ", {
	                "#(argb,8,8,3)color(0,0,0,1)"
            } },
			{ "Pink", "civ", {
	                "#(argb,8,8,3)color(0.945098,0.494118,0.996078,1)"
            } },
			{ "Purple", "civ", {
	                "#(argb,8,8,3)color(0.556863,0.00392157,0.619608,1)"
            } },
			{ "Green", "civ", {
	                "#(argb,8,8,3)color(0,1,0.25098,1)"
            } },
			{ "Light Green", "civ", {
	                "#(argb,8,8,3)color(0,0.54902,0.137255,1)"
            } },
			{ "Navy Blue", "civ", {
	                "#(argb,8,8,3)color(0,0,1,1)"
            } }
        };
        
    };

    class Jonzie_Viper  {
        vItemSpace = 50;
        chopShop = 500;
        textures[] = {
        	{ "Yellow", "civ", {
	                "#(argb,8,8,3)color(0.6,0.3,0.01,1)"
            } },
			{ "Aqua", "civ", {
	                "#(argb,8,8,3)color(0.215686,0.94902,0.933333,1)"
            } },
			{ "Black", "civ", {
	                "#(argb,8,8,3)color(0,0,0,1)"
            } },
			{ "Pink", "civ", {
	                "#(argb,8,8,3)color(0.945098,0.494118,0.996078,1)"
            } },
			{ "Purple", "civ", {
	                "#(argb,8,8,3)color(0.556863,0.00392157,0.619608,1)"
            } },
			{ "Green", "civ", {
	                "#(argb,8,8,3)color(0,1,0.25098,1)"
            } },
			{ "Light Green", "civ", {
	                "#(argb,8,8,3)color(0,0.54902,0.137255,1)"
            } },
			{ "Navy Blue", "civ", {
	                "#(argb,8,8,3)color(0,0,1,1)"
            } }
        };
        
    };
	
	class Jonzie_VE  {
        vItemSpace = 50;
        chopShop = 500;
        textures[] = {
        	{ "Yellow", "civ", {
	                "#(argb,8,8,3)color(0.6,0.3,0.01,1)"
            } },
			{ "Aqua", "civ", {
	                "#(argb,8,8,3)color(0.215686,0.94902,0.933333,1)"
            } },
			{ "Black", "civ", {
	                "#(argb,8,8,3)color(0,0,0,1)"
            } },
			{ "Pink", "civ", {
	                "#(argb,8,8,3)color(0.945098,0.494118,0.996078,1)"
            } },
			{ "Purple", "civ", {
	                "#(argb,8,8,3)color(0.556863,0.00392157,0.619608,1)"
            } },
			{ "Green", "civ", {
	                "#(argb,8,8,3)color(0,1,0.25098,1)"
            } },
			{ "Light Green", "civ", {
	                "#(argb,8,8,3)color(0,0.54902,0.137255,1)"
            } },
			{ "Navy Blue", "civ", {
	                "#(argb,8,8,3)color(0,0,1,1)"
            } }
        };
        
    };
	class Jonzie_30CSL  {
        vItemSpace = 25;
        chopShop = 500;
        textures[] = {
				{ "Yellow", "civ", {
	                "#(argb,8,8,3)color(0.6,0.3,0.01,1)"
            } },
			{ "Aqua", "civ", {
	                "#(argb,8,8,3)color(0.215686,0.94902,0.933333,1)"
            } },
			{ "Black", "civ", {
	                "#(argb,8,8,3)color(0,0,0,1)"
            } },
			{ "Pink", "civ", {
	                "#(argb,8,8,3)color(0.945098,0.494118,0.996078,1)"
            } },
			{ "Purple", "civ", {
	                "#(argb,8,8,3)color(0.556863,0.00392157,0.619608,1)"
            } },
			{ "Green", "civ", {
	                "#(argb,8,8,3)color(0,1,0.25098,1)"
            } },
			{ "Light Green", "civ", {
	                "#(argb,8,8,3)color(0,0.54902,0.137255,1)"
            } },
			{ "Navy Blue", "civ", {
	                "#(argb,8,8,3)color(0,0,1,1)"
            } }
		};
        
    };
	
	class Jonzie_Corolla  {
        vItemSpace = 25;
        chopShop = 450;
        textures[] = {
				{ "Yellow", "civ", {
	                "#(argb,8,8,3)color(0.6,0.3,0.01,1)"
            } },
			{ "Aqua", "civ", {
	                "#(argb,8,8,3)color(0.215686,0.94902,0.933333,1)"
            } },
			{ "Black", "civ", {
	                "#(argb,8,8,3)color(0,0,0,1)"
            } },
			{ "Pink", "civ", {
	                "#(argb,8,8,3)color(0.945098,0.494118,0.996078,1)"
            } },
			{ "Purple", "civ", {
	                "#(argb,8,8,3)color(0.556863,0.00392157,0.619608,1)"
            } },
			{ "Green", "civ", {
	                "#(argb,8,8,3)color(0,1,0.25098,1)"
            } },
			{ "Light Green", "civ", {
	                "#(argb,8,8,3)color(0,0.54902,0.137255,1)"
            } },
			{ "Navy Blue", "civ", {
	                "#(argb,8,8,3)color(0,0,1,1)"
            } }
		};
        
    };
	
	class Jonzie_Datsun_510  {
        vItemSpace = 25;
        chopShop = 350;
        textures[] = {
				{ "Yellow", "civ", {
	                "#(argb,8,8,3)color(0.6,0.3,0.01,1)"
            } },
			{ "Aqua", "civ", {
	                "#(argb,8,8,3)color(0.215686,0.94902,0.933333,1)"
            } },
			{ "Black", "civ", {
	                "#(argb,8,8,3)color(0,0,0,1)"
            } },
			{ "Pink", "civ", {
	                "#(argb,8,8,3)color(0.945098,0.494118,0.996078,1)"
            } },
			{ "Purple", "civ", {
	                "#(argb,8,8,3)color(0.556863,0.00392157,0.619608,1)"
            } },
			{ "Green", "civ", {
	                "#(argb,8,8,3)color(0,1,0.25098,1)"
            } },
			{ "Light Green", "civ", {
	                "#(argb,8,8,3)color(0,0.54902,0.137255,1)"
            } },
			{ "Navy Blue", "civ", {
	                "#(argb,8,8,3)color(0,0,1,1)"
            } }
		};
        
    };
	
	class Jonzie_Datsun_Z432  {
        vItemSpace = 20;
        chopShop = 750;
        textures[] = {
				{ "Yellow", "civ", {
	                "#(argb,8,8,3)color(0.6,0.3,0.01,1)"
            } },
			{ "Aqua", "civ", {
	                "#(argb,8,8,3)color(0.215686,0.94902,0.933333,1)"
            } },
			{ "Black", "civ", {
	                "#(argb,8,8,3)color(0,0,0,1)"
            } },
			{ "Pink", "civ", {
	                "#(argb,8,8,3)color(0.945098,0.494118,0.996078,1)"
            } },
			{ "Purple", "civ", {
	                "#(argb,8,8,3)color(0.556863,0.00392157,0.619608,1)"
            } },
			{ "Green", "civ", {
	                "#(argb,8,8,3)color(0,1,0.25098,1)"
            } },
			{ "Light Green", "civ", {
	                "#(argb,8,8,3)color(0,0.54902,0.137255,1)"
            } },
			{ "Navy Blue", "civ", {
	                "#(argb,8,8,3)color(0,0,1,1)"
            } }
		};
        
    };
	
	class Jonzie_Mini_Cooper  {
        vItemSpace = 25;
        chopShop = 350;
        textures[] = {
				{ "Yellow", "civ", {
	                "#(argb,8,8,3)color(0.6,0.3,0.01,1)"
            } },
			{ "Aqua", "civ", {
	                "#(argb,8,8,3)color(0.215686,0.94902,0.933333,1)"
            } },
			{ "Black", "civ", {
	                "#(argb,8,8,3)color(0,0,0,1)"
            } },
			{ "Pink", "civ", {
	                "#(argb,8,8,3)color(0.945098,0.494118,0.996078,1)"
            } },
			{ "Purple", "civ", {
	                "#(argb,8,8,3)color(0.556863,0.00392157,0.619608,1)"
            } },
			{ "Green", "civ", {
	                "#(argb,8,8,3)color(0,1,0.25098,1)"
            } },
			{ "Light Green", "civ", {
	                "#(argb,8,8,3)color(0,0.54902,0.137255,1)"
            } },
			{ "Navy Blue", "civ", {
	                "#(argb,8,8,3)color(0,0,1,1)"
            } }
		};
        
    };
    
    
    class BAF_Offroad_D  {
        vItemSpace = 65;
        chopShop = 500;
        textures[] = {};
        
    };
             
    class ACR_Offroad_HMG {
        vItemSpace = 65;
        chopShop = 550;
        textures[] = {};
        
    };
	
	
    class BAF_Offroad_W_HMG {
        vItemSpace = 65;
        chopShop = 500;
        textures[] = {};
        
    };
             
    class LandRover_MG_TK_EP1 {
        vItemSpace = 65;
        chopShop = 510;
        textures[] = {};
        
    };
                 
    class Gurkha_f5 {
        vItemSpace = 100;
        chopShop = 100;
        textures[] = {
			{ "Black", "cop", {
                "#(argb,8,8,3)color(0.05,0.05,0.05,1)"
            } }
		};
        
    };
                 
    class Gurkha_M60 {
        vItemSpace = 100;
        chopShop = 120;
        textures[] = {};
        
    };

	class C_Offroad_01_F {
        vItemSpace = 40;
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
            { "Fed", "cop", {
	                "#(ai,64,64,1)Fresnel(0.3,3)"
            } },
			{ "Police", "cop", {
	                "#(ai,64,64,1)Fresnel(1.3,7)"
            } },
            { "Taxi", "civ", {
	                "#(argb,8,8,3)color(0.6,0.3,0.01,1)"
            } }
	    };
    };

	class C_Kart_01_Blu_F {
		vItemSpace = 20;
		chopShop = 30;
		textures[] = {};
	};

	class C_Kart_01_Fuel_F : C_Kart_01_Blu_F {}; //Inherits everything from the above class
	class C_Kart_01_Red_F : C_Kart_01_Blu_F {}; //Inherits everything from the above class
	class C_Kart_01_Vrana_F : C_Kart_01_Blu_F {}; //Inherits everything from the above class

	class C_Hatchback_01_sport_F {
        vItemSpace = 45;
        chopShop = 40;
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
            { "Police", "cop", {
                "#(ai,64,64,1)Fresnel(1.3,7)"
            } }
        };
    };

	class B_Quadbike_01_F {
        vItemSpace = 5;
        chopShop = 50;
        textures[] = {
        	{ "Brown", "cop", {
                "\A3\Soft_F\Quadbike_01\Data\Quadbike_01_co.paa"
            } },
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
            } }
        };
    };

	class I_Truck_02_covered_F {
        vItemSpace = 220;
        chopShop = 200;
        textures[] = {
        	{ "Orange", "civ", {
                "\A3\Soft_F_Beta\Truck_02\data\truck_02_kab_co.paa",
                "\a3\soft_f_beta\Truck_02\data\truck_02_kuz_co.paa"
            } },
            { "Black", "cop", {
                "#(argb,8,8,3)color(0.05,0.05,0.05,1)"
            } }
        };
    };

	class I_Truck_02_transport_F : I_Truck_02_covered_F {
        vItemSpace = 200;
    };

	class O_Truck_03_covered_F {
		vItemSpace = 210;
		chopShop = 500;
		textures[] = {};
	};
	

	class C_Hatchback_01_F {
        vItemSpace = 40;
        chopShop = 500;
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
        chopShop = 500;
        textures[] = {
        	{ "Dark Red", "civ", {
                "\a3\soft_f_gamma\SUV_01\Data\suv_01_ext_co.paa"
            } },
			{ "Black", "cop", {
	                "\a3\soft_f_gamma\SUV_01\Data\suv_01_ext_02_co.paa"
            } },
			{ "Silver", "civ", {
	                "\a3\soft_f_gamma\SUV_01\Data\suv_01_ext_03_co.paa"
            } },
			{ "Orange", "civ", {
	                "\a3\soft_f_gamma\SUV_01\Data\suv_01_ext_04_co.paa"
            } },
            { "Cop", "cop", {
                "#(ai,64,64,1)Fresnel(1.3,7)"
            } },
			{ "Earth", "civ", {
	                "\eg_sndimg\textures\earth.jpg"
            } },
			{ "Fire", "civ", {
	                "\eg_sndimg\textures\fire.jpg"
            } },
			{ "Water", "civ", {
	                "\eg_sndimg\textures\water.jpg"
            } },
			{ "Wind", "civ", {
	                "\eg_sndimg\textures\wind.jpg"
            } },
			{ "Pimp", "civ", {
	                "\eg_sndimg\textures\pimp.jpg"
            } }
	        };
    };

	class C_Van_01_transport_F {
        vItemSpace = 100;
        chopShop = 500;
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
        chopShop = 500;
        textures[] = {
        	{ "White", "civ", {
                "\a3\soft_f_gamma\Van_01\Data\van_01_ext_co.paa"
            } },
            { "Red", "civ", {
                "\a3\soft_f_gamma\Van_01\Data\van_01_ext_red_co.paa"
            } }
        };
    };
	class B_MRAP_01_F {
        vItemSpace = 65;
        chopShop = 500;
        textures[] = {
        	{ "Regular", "cop", {
                "\A3\Soft_F\MRAP_01\Data\mrap_01_base_co.paa"
            } },
            { "Black", "cop", {
                "#(argb,8,8,3)color(0.05,0.05,0.05,1)"
            } }
        };
    };

	class B_Heli_Light_01_F {
        vItemSpace = 0;
        chopShop = 500;
        textures[] = {
	        { "Black", "cop", {
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
			{ "Rebel Digital", "reb", {
	                "\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_digital_co.paa"
            } },
            { "EMS RED", "med", {
                "#(argb,8,8,3)color(0.984314,0.929412,0.27451,1)"
            } },
			{ "Pink Digital", "reb", {
	            "\eg_sndimg\textures\lb_pinkdigi.jpg"
            } },
			{ "Taxi", "civ", {
	            "\eg_sndimg\textures\lb_taxi.jpg"
            } }
        };
    };

	class O_Heli_Light_02_unarmed_F {
        vItemSpace = 0;
        chopShop = 500;
        textures[] = {
        	{ "Black", "cop", {
                "\a3\air_f\Heli_Light_02\Data\heli_light_02_ext_co.paa"
            } },
			{ "White / Blue", "civ", {
	                "\a3\air_f\Heli_Light_02\Data\heli_light_02_ext_civilian_co.paa"   
            } },
			{ "Digi Green", "reb", {
	                "\a3\air_f\Heli_Light_02\Data\heli_light_02_ext_indp_co.paa"
            } },
			{ "Desert Digi", "reb", {
	                "\a3\air_f\Heli_Light_02\Data\heli_light_02_ext_opfor_co.paa" 
            } },
          	 { "EMS RED", "med", {
                "#(argb,8,8,3)color(0.984314,0.929412,0.27451,1)"
            } },
			{ "Mitnight", "cop", {
                "#(ai,64,64,1)Fresnel(0.3,3)"
            } },
			{ "Orca", "civ", {
                "\A3\Air_F_Heli\Heli_Light_02\Data\Heli_Light_02_ext_OPFOR_V2_CO.paa"
            } },
			{ "White / Green", "civ", {
                "\eg_sndimg\textures\orca_greenwhite.jpg"
            } },
			{ "Black / Pink", "civ", {
                "\eg_sndimg\textures\orca_pinkblack.jpg"
            } },
			{ "White / Red", "civ", {
                "\eg_sndimg\textures\orca_redwhite.jpg"
            } }
        };
    };

	class I_Heli_Transport_02_F {
        vItemSpace = 0;
        chopShop = 500;
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
	
	class I_Heli_light_03_unarmed_F {
		vItemSpace = 0;
		chopShop = 500;
		textures[] = {};
	};
	
	class O_Heli_Transport_04_medevac_F {
		vItemSpace = 100;
		chopShop = 0;
		textures[] = {};
	}
	
	class O_Heli_Transport_04_F {
		vItemSpace = 0;
		chopShop = 500;
		textures[] = {
			{ "Black", "civ", {
                "\a3\air_f_heli\Heli_Transport_04\Data\heli_transport_04_base_01_black_co.paa",
				"\a3\air_f_heli\Heli_Transport_04\Data\heli_transport_04_base_02_black_co.paa"
            } },
        	{ "Hexagon", "civ", {
                "\a3\air_f_heli\Heli_Transport_04\Data\heli_transport_04_base_01_co.paa",
				"\a3\air_f_heli\Heli_Transport_04\Data\heli_transport_04_base_02_co.paa"
            } }
		};
	};
	
	class O_Heli_Transport_04_bench_F {
		vItemSpace = 0;
		chopShop = 500;
		textures[] = {
			{ "Black", "civ", {
                "\a3\air_f_heli\Heli_Transport_04\Data\heli_transport_04_base_01_black_co.paa",
				"\a3\air_f_heli\Heli_Transport_04\Data\heli_transport_04_base_02_black_co.paa",
				"\a3\air_f_heli\Heli_Transport_04\Data\heli_transport_04_bench_black_co.paa"
            } },
        	{ "Hexagon", "civ", {
                "\a3\air_f_heli\Heli_Transport_04\Data\heli_transport_04_base_01_co.paa",
				"\a3\air_f_heli\Heli_Transport_04\Data\heli_transport_04_base_02_co.paa",
				"\a3\air_f_heli\Heli_Transport_04\Data\heli_transport_04_bench_co.paa"
            } }
		};
	};
	
	class O_Heli_Transport_04_covered_F {
		vItemSpace = 0;
		chopShop = 500;
		textures[] = {
			{ "Black", "civ", {
                "\a3\air_f_heli\Heli_Transport_04\Data\heli_transport_04_base_01_black_co.paa",
				"\a3\air_f_heli\Heli_Transport_04\Data\heli_transport_04_base_02_black_co.paa",
				"\a3\air_f_heli\Heli_Transport_04\Data\heli_transport_04_pod_ext01_black_co.paa",
				"\a3\air_f_heli\Heli_Transport_04\Data\heli_transport_04_pod_ext02_black_co.paa"
            } },
        	{ "Hexagon", "civ", {
                "\a3\air_f_heli\Heli_Transport_04\Data\heli_transport_04_base_01_co.paa",
				"\a3\air_f_heli\Heli_Transport_04\Data\heli_transport_04_base_02_co.paa",
				"\a3\air_f_heli\Heli_Transport_04\Data\heli_transport_04_pod_ext01_co.paa",
				"\a3\air_f_heli\Heli_Transport_04\Data\heli_transport_04_pod_ext02_co.paa"
            } }
		};
	};
	
	class O_Heli_Transport_04_box_F {
		vItemSpace = 0;
		chopShop = 500;
		textures[] = {
			{ "Black", "civ", {
                "\a3\air_f_heli\Heli_Transport_04\Data\heli_transport_04_base_01_black_co.paa",
				"\a3\air_f_heli\Heli_Transport_04\Data\heli_transport_04_base_02_black_co.paa",
				"\a3\air_f_heli\Heli_Transport_04\Data\heli_transport_04_pod_ext01_black_co.paa",
				"\a3\air_f_heli\Heli_Transport_04\Data\heli_transport_04_pod_ext02_black_co.paa"
            } },
        	{ "Hexagon", "civ", {
                "\a3\air_f_heli\Heli_Transport_04\Data\heli_transport_04_base_01_co.paa",
				"\a3\air_f_heli\Heli_Transport_04\Data\heli_transport_04_base_02_co.paa",
				"\a3\air_f_heli\Heli_Transport_04\Data\heli_transport_04_pod_ext01_co.paa",
				"\a3\air_f_heli\Heli_Transport_04\Data\heli_transport_04_pod_ext02_co.paa"
            } }
		};
	};
	
	class B_Heli_Transport_03_unarmed_F {
		vItemSpace = 0;
		chopShop = 500;
	};
	
	class B_Heli_Transport_03_F {
		vItemSpace = 0;
		chopShop = 500;
	};
	
	class NRPG_Taki_Police_Car_F {
		vItemSpace = 90;
		chopShop = 500;
	};
	
	class I_Plane_Fighter_03_CAS_F {};
	class O_Plane_CAS_02_F {};
	class B_Plane_CAS_01_F {};
};