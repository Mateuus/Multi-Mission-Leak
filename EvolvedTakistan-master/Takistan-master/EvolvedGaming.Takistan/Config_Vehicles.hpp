class CarShops {
	/*
		Format:
		{ Classname, rental price, license required, { varname, >= value } }

		{ varname, >= value} this is a "level" requirement mainly used by cops and rebels, do not fill this in if you are not utilizing it.
	*/
	class civ_car {
		side = "civ";
		vehicles[] = {
			{ "B_Quadbike_01_F", 2500, "" }, 
			{ "C_Hatchback_01_F", 9500, "driver" }, 
			{ "C_Offroad_01_F", 12500, "driver" },
			{ "C_SUV_01_F", 15500, "driver" },
			{ "C_Hatchback_01_sport_F", 15000, "driver" },
			{ "C_Van_01_transport_F", 30000, "driver" },
			{ "LandRover_CZ_EP1", 20000, "driver" },
			{ "BAF_Offroad_W", 20000, "driver" },
			{ "LandRover_TK_CIV_EP1", 20000, "driver" },
			{ "Jonzie_30CSL", 8500, "driver" },
			{ "Jonzie_Corolla", 9000, "driver" },
			{ "Jonzie_Datsun_510", 8500, "driver" },
			{ "Jonzie_Datsun_Z432", 12500, "driver" },
			{ "Jonzie_Escalade", 22500, "driver" },
			{ "Jonzie_Mini_Cooper", 7500, "driver" },
			{ "Jonzie_Galant", 10000, "driver" }
		};
	};

	class kart_shop {
		side = "civ";
		vehicles[] = {
			{ "C_Kart_01_Blu_F", 15000 , "driver" },
			{ "C_Kart_01_Fuel_F", 15000, "driver" },
			{ "C_Kart_01_Red_F", 15000, "driver" },
			{ "C_Kart_01_Vrana_F", 15000, "driver" }
		};
	};

	class med_shop {
		side = "med";
		vehicles[] = {
			{ "C_Offroad_01_F", 1000, "" },
			{ "I_Truck_02_medical_F", 2500, "" },
			{ "O_Truck_03_medical_F", 4500, "" },
			{ "B_Truck_01_medical_F", 6000, "" },
			{ "EWK_HMMWV_Medevac", 5000, "" },
			{ "EWK_M997A2_Ambulance", 5000, "" },
			{ "EWK_M997A2_Ambulance_Tan", 5000, "" }
		};
	};

	class med_air_hs {
		side = "med";
		vehicles[] = {
			{ "MELB_MH6M", 5000, "mAir" },
			{ "MELB_H6M", 5000, "mAir" },
			{ "RHS_UH60M_MEV", 5000, "mAir" },
			{ "O_Heli_Light_02_unarmed_F", 5000, "mAir" }
		};
	};

	class civ_truck {
		side = "civ";
		vehicles[] = {
			{ "C_Van_01_box_F", 45000, "trucking" },
			{ "RHS_Ural_Open_Civ_01", 118000, "trucking" },
			{ "I_Truck_02_transport_F", 158000, "trucking" },
			{ "I_Truck_02_covered_F", 158000, "trucking" },
			{ "B_Truck_01_transport_F", 550000, "trucking" },
			{ "O_Truck_03_transport_F", 145000, "trucking" },
			{ "O_Truck_03_covered_F", 135500, "trucking" },
			{ "B_Truck_01_box_F", 400000, "trucking" },
			{ "O_Truck_03_device_F", 385000, "trucking" },
			{ "O_Truck_02_fuel_F", 150000, "trucking" },
			{ "O_Truck_03_fuel_F", 300000, "trucking" },
			{ "B_Truck_01_fuel_F", 550000, "trucking"}
		};
	};

	class reb_car {
		side = "civ";
		vehicles[] = {
			{ "O_MRAP_02_F", 150000, "rebel" },
			{ "B_Quadbike_01_F", 2500, "rebel" },
			{ "B_G_Offroad_01_F", 15000, "rebel" },
			{ "B_Heli_Light_01_F", 600000, "rebel" },
			{ "LandRover_ACR", 150500, "rebel" },
			{ "LandRover_CZ_EP1", 150500, "rebel" },
			{ "LandRover_MG_TK_EP1", 150000, "rebel" },
			{ "BAF_Offroad_W_HMG", 150000, "rebel" },
			{ "ACR_Offroad_HMG", 150000, "rebel" },
			{ "HMMWV", 85000, "rebel" },
			{ "Gurkha_f5", 350000, "rebel" },
			{ "rhsusf_rg33_d", 275000, "rebel" },
			{ "rhsusf_rg33_m2_d", 240000, "rebel" }
		};
	};
	
	class rdm_car {
		side = "civ";
		vehicles[] = {
			{ "B_Heli_Light_01_armed_F", 1500000, "rebel" },
			{ "B_G_Offroad_01_armed_F", 400000, "rebel" },
			{ "rhs_prp3_vdv", 950000, "rebel" },
			{ "rhs_btr80_msv", 1250000, "rebel" },
			{ "rhs_t80b", 3000000, "rebel" },
			{ "RHS_Mi24V_AT_vdv", 1905000, "rebel"},
			{ "RHS_Mi8mt_vvs", 500000, "rebel" }

		};
	};

	class TSF_armed {
		side = "cop";
		vehicles[] = {
			//{ "Gurkha_M60", 10000, "", { "life_coplevel", 2 } },
			{ "DAR_MaxxPro_M2", 2000, "",{ "life_coplevel", 3 } },
			{ "B_G_Offroad_01_armed_F", 4000, "", { "life_coplevel", 3 } },
			{ "rhsusf_M1083A1P2_B_M2_d_fmtv_usarmy", 5000, "", { "life_coplevel", 3 } },
		};
	};
  
	class TSF_unarmed {
		side = "cop";
		vehicles[] = {
			{ "C_Offroad_01_F", 5000, ""},
			{ "C_SUV_01_F", 2000, "" },
			{ "B_Quadbike_01_F", 2000, "" },
			{ "LandRover_TK_CIV_EP1", 3000, "" },
			{ "B_Truck_01_covered_F", 2000, "" },
			{ "B_Truck_01_Repair_F", 2000, "" },
			{ "rhsusf_m998_w_4d", 2500, "", { "life_coplevel", 2 } },
			{ "rhsusf_m998_w_2dr", 2500, "", { "life_coplevel", 2 } }
			//{ "O_MRAP_02_F", 2500, "Event Award", { "life_coplevel", 3 } },
			//{ "I_MRAP_03_F", 2500, "Event Award", { "life_coplevel", 3 } }
		};
	}; 
  
  class nato_unarmed {
		side = "cop";
		vehicles[] = {
			{ "LandRover_TK_CIV_EP1", 3000, "", { "life_coplevel", 3 } },
			{ "EWK_HMMWV_Light", 3000, "", { "life_coplevel", 4 } },
			{ "HMMWV_M1035", 3000, "", { "life_coplevel", 4 } },
			{ "B_Truck_01_ammo_F", 3000, "", { "life_coplevel", 4 } },
			{ "B_Truck_01_covered_F", 3000, "", { "life_coplevel", 4 } },
			{ "B_Truck_01_Repair_F", 3000, "", { "life_coplevel", 4 } },
			{ "B_Truck_01_fuel_F", 3000, "", { "life_coplevel", 4 } },  
			{ "EWK_HMMWV_Medevac", 3000, "", { "life_coplevel", 4 } },
			{ "B_MRAP_01_F", 10000, "", { "life_coplevel", 4 } }
		};
	};
  
  class nato_armed {
		side = "cop";
		vehicles[] = {
			{ "EWK_m1151_m240_deployment", 1000, "", { "life_coplevel", 4 } },
			{ "EWK_m1151_m2_deployment_Jtac", 2000, "", { "life_coplevel", 4 } },
			{ "EWK_m1151_m2_deployment_Bumper", 3000, "", { "life_coplevel", 4 } },
			{ "EWK_M998A2_sov_M2", 5000, "", { "life_coplevel", 4 } },
			{ "DAR_MaxxProDeploy", 6000, "", { "life_coplevel", 4 } },
			{ "DAR_MaxxProDXM", 10000, "", { "life_coplevel", 4 } },
			{ "rhsusf_M1083A1P2_B_M2_d_fmtv_usarmy", 5000, "", { "life_coplevel", 5 } },
			{ "B_APC_Wheeled_01_cannon_", 10000, "", { "life_coplevel", 5 } },
			{ "B_APC_Tracked_01_rcws_F", 11000, "", { "life_coplevel", 5 } },
			{ "B_APC_Tracked_01_CRV_F", 15000, "", { "life_coplevel", 5 } },
			{ "B_MRAP_01_hmg_F", 10000, "", { "life_coplevel", 6 } },
			{ "B_MRAP_01_gmg_F", 20000, "", { "life_coplevel", 6 } },
			{ "RHS_M2A3_BUSKIII", 20000, "", { "life_coplevel", 6 } },
			{ "rhsusf_m1a1aim_tuski_d", 30000, "", { "life_coplevel", 6 } }
		};
	};

	class civ_air {
		side = "civ";
		vehicles[] = {
			{ "B_Heli_Light_01_F", 253000, "pilot" },
			{ "O_Heli_Light_02_unarmed_F", 750000, "pilot" },
			{ "RHS_Mi8mt_vvs", 600000, "pilot"}
		};
	};

	class cop_air {
		side = "cop";
		vehicles[] = {
			{ "B_Heli_Light_01_F", 5000, "cAir", { "life_coplevel", 4 }} ,
			{ "B_Heli_Transport_03_F", 5000, "cAir", { "life_coplevel", 5 } },
			{ "B_Heli_Transport_01_F", 5000, "cAir", { "life_coplevel", 5 } },
			{ "B_UAV_02_F", 5000, "cAir", { "life_coplevel", 5} },
			{ "B_Heli_Light_01_armed_F", 5000, "cAir", { "life_coplevel", 6 } },
			{ "RHS_UH1Y_d", 15000, "cAir", { "life_coplevel", 6 } },
			{ "RHS_UH1Y_FFAR_d", 20000, "cAir", { "life_coplevel", 7 } },
			{ "RHS_AH64D_wd_AA", 50000, "cAir", { "life_coplevel", 7 } },
			{ "RHS_C130J", 50000, "cAir", { "life_coplevel", 7 } }
		};
	};

	class cop_airhq {
		side = "civ";
		vehicles[] = {
			{ "B_Heli_Light_01_F", 75000, "cAir" },
			{ "B_Heli_Transport_01_F", 200000, "cAir", { "life_coplevel", 3 } }
		};
	};

	class cop_ship {
		side = "cop";
		vehicles[] = {
			{ "B_Boat_Transport_01_F", 3000, "coastguard" },
			{ "C_Boat_Civil_01_police_F", 20000, "coastguard" },
			{ "B_Boat_Armed_01_minigun_F", 75000, "coastguard" },
			{ "B_SDV_01_F", 100000, "coastguard" }
		};
	};

	class civ_air_adv {
		side = "civ";
		vehicles[] = {
			{ "I_Heli_light_03_unarmed_F", 1000000, "pilotadv" },
			{ "O_Heli_Transport_04_F", 1000000, "pilotadv" },
			{ "O_Heli_Transport_04_bench_F", 1000000, "pilotadv"},
			{ "O_Heli_Transport_04_covered_F", 1000000, "pilotadv"},
			{ "O_Heli_Transport_04_box_F", 1000000, "pilotadv"},
			{ "I_Heli_Transport_02_F", 1250000, "pilotadv"}
			
			
		};
	};
	
	class civ_air_pro {
		side = "civ";
		vehicles[] = {
			{ "RHS_C130J", 2000000, "pilotpro" },
			{ "B_Heli_Transport_03_unarmed_F", 1750000, "pilotpro"},
			/*{ "Land_CargoBox_V1_F", 1000000, "pilotpro"}
			{ "I_Plane_Fighter_03_CAS_F", 2000000, "pilotpro" },
			{ "O_Plane_CAS_02_F",2000000, "pilotpro" },
			{ "B_Plane_CAS_01_F",2000000, "pilotpro" },
			{ "RHS_A10",2000000, "pilotpro" },
			{ "RHS_Su25SM_vvs",2000000, "pilotpro" }*/
		};
	};
	
	class civ_ship {
		side = "civ";
		vehicles[] = {
			{ "C_Rubberboat", 5000, "boat" },
			{ "C_Boat_Civil_01_F", 22000, "boat" },
			{ "B_SDV_01_F", 150000, "boat" }
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
		storageFee[] = { 0, 0, 0, 0 };
		garageSell[] = { 0, 0, 0, 0 };
		insurance = 2500;
		chopShop = 1200;
		textures[] = {};
	};

	class I_Truck_02_medical_F : Default {
		vItemSpace = 150;
		chopShop = 3000;
	};

	class O_Truck_03_medical_F : Default {
		vItemSpace = 200;
		chopShop = 7500;
	};

	class B_Truck_01_medical_F : Default {
		vItemSpace = 250;
		chopShop = 22500;
	};

	class C_Rubberboat {
		vItemSpace = 45;     	
		chopShop = 5000;
		textures[] = {};
    };

	class B_Heli_Transport_01_F {
		vItemSpace = 0;
		chopShop = 95000;
		textures[] = {};
	};

	class B_MRAP_01_hmg_F {
		vItemSpace = 100;
		chopShop = 95000;
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
		chopShop = 95000;
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
		chopShop = 120000;
		textures[] = {};
	};

	class rhsusf_m998_w_4d : Default {
		vItemSpace = 100;
		chopShop = 120000;
		textures[] = {};
	};
	
	class HMMWV_M1035 : Default {
		vItemSpace = 100;
		chopShop = 120000;
		textures[] = {};
	};

	class O_Boat_Armed_01_hmg_F {
        vItemSpace = 110;
        chopShop = 12000;
        textures[] = { };
    };


	class DAR_MaxxPro_M2 {
        vItemSpace = 110;
        chopShop = 12000;
        textures[] = { };
    };
    
    
	class DAR_MaxxProDXM {
        vItemSpace = 110;
        chopShop = 12000;
        textures[] = { };
    };
    

	class DAR_MaxxPro {
        vItemSpace = 175;
        chopShop = 12000;
        textures[] = { };
    };
    

	class DAR_MaxxProPlus {
        vItemSpace = 175;
        chopShop = 12000;
        textures[] = { };
    };

    
	class rhsusf_M1083A1P2_B_M2_d_fmtv_usarmy {
        vItemSpace = 175;
        chopShop = 5000;
        textures[] = { };
    };


	class I_Boat_Armed_01_minigun_F {
        vItemSpace = 15;
        chopShop = 5000;
        textures[] = { };
    };

	class B_G_Boat_Transport_01_F {
        vItemSpace = 45;
        chopShop = 5000;
        textures[] = { };
    };

	class B_Boat_Transport_01_F {
        vItemSpace = 45;
        chopShop = 5000;
        textures[] = { };
    };

	class O_Truck_03_transport_F {
        vItemSpace = 225;
        chopShop = 15000;
        textures[] = { };
    };

	class O_Truck_03_device_F {
        vItemSpace = 250;
        chopShop = 125000;
        textures[] = { };
    };
	
	class O_Truck_02_fuel_F {
        vItemSpace = 150;
        chopShop = 25000;
        textures[] = { };
    };
	
	class O_Truck_03_fuel_F {
		vItemSpace = 220;
        chopShop = 125000;
        textures[] = { };
	};
	
	class B_Truck_01_fuel_F {
		vItemSpace = 200;
        chopShop = 175000;
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
        chopShop = 12000;
        textures[] = { };
    };

	class C_Boat_Civil_01_police_F {
        vItemSpace = 85;
        chopShop = 5000;
        textures[] = { };
    };

	class C_Boat_Civil_01_rescue_F {
        vItemSpace = 85;
        chopShop = 5000;
        textures[] = { };
    };

	class B_Truck_01_box_F {
        vItemSpace = 250;
        chopShop = 12000;
        textures[] = { };
    };

	class B_Truck_01_transport_F {
        vItemSpace = 220;
        chopShop = 12000;
        textures[] = { };
    };

	class O_MRAP_02_F {
        vItemSpace = 60;
        chopShop = 25500;
        textures[] = {
			{ "Default", "reb", {
				"\A3\soft_f\MRAP_02\Data\mrap_02_ext_02_co.paa"
            } },
            { "Black", "reb", {
                "#(ai,64,64,1)Fresnel(0.3,3)"
            } },
			{ "Evant Award", "cop", {
                "textures\copcamo.jpg",
				"textures\copcamo2.jpg"
            } }
        };
    };

	class I_MRAP_03_F {
        vItemSpace = 58;
        chopShop = 25500;
        textures[] = { 
			{ "Default", "cop", {
				"\A3\soft_f_beta\MRAP_03\Data\mrap_03_ext_indp_co.paa"
            } },
            { "Black", "cop", {
                "#(ai,64,64,1)Fresnel(0.3,3)"
            } },
			{ "Evant Award", "cop", {
                "\eg_sndimg\textures\copcamo.jpg"
            } }
		};
    };
    
        class EWK_M1151 {
        vItemSpace = 65;
        chopShop = 25000;
        textures[] = {};
    };
    
    class EWK_m1151_m2_deployment {
        vItemSpace = 65;
        chopShop = 25000;
        textures[] = {};
    };
      
    class EWK_m1151_m2_deployment_Jtac {
        vItemSpace = 65;
        chopShop = 25000;
        textures[] = {};
    };
    
    class rhs_tigr_vdv {
        vItemSpace = 65;
        chopShop = 25000;
        textures[] = {};
    };
    
    	class rhsusf_m998_w_4 {
        vItemSpace = 325;
        chopShop = 25000;
        textures[] = { };
    };
	
	class rhsusf_m998_w_2dr {
        vItemSpace = 325;
        chopShop = 55000;
        textures[] = { };
    };
	
	class rhsusf_m1025_w_m2 {
        vItemSpace = 325;
        chopShop = 55000;
        textures[] = { };
    };
    
    class RHS_Mi8AMT_vvs {
        vItemSpace = 25;
        chopShop = 55000;
        textures[] = {};
    };
    
    class rhs_t80b {
        vItemSpace = 10;
        chopShop = 0;
        textures[] = {};
    };
    
    class rhs_prp3_vdv {
        vItemSpace = 100;
        chopShop = 0;
        textures[] = {};
	};
    
    class rhs_btr80_msv {
        vItemSpace = 100;
        chopShop = 0;
        textures[] = {};
    };
	
	 class B_Heli_Attack_01_F {
        vItemSpace = 0;
        chopShop = 0;
        textures[] = {};
    };
      
    class EWK_m1151_m2_deployment_Bumper {
        vItemSpace = 65;
        chopShop = 25500;
        textures[] = {};
    };
       
    class EWK_HMMWV_Light {
        vItemSpace = 65;
        chopShop = 25500;
        textures[] = {};
    };
       
    class EWK_HMMWV_Medevac {
        vItemSpace = 65;
        chopShop = 25500;
        textures[] = {};
    };
       
    class EWK_M997A2_Ambulance {
        vItemSpace = 65;
        chopShop = 25500;
        textures[] = {};
    };
       
    class EWK_M997A2_Ambulance_NoBackLights {
        vItemSpace = 65;
        chopShop = 25500;
        textures[] = {};
    };
        
    class EWK_M997A2_Ambulance_Tan {
        vItemSpace = 65;
        chopShop = 25500;
        textures[] = {};
    };
    
     class RHS_UH60M_MEV {
        vItemSpace = 100;
        chopShop = 25500;
        textures[] = {};
    };
    
    class B_APC_Tracked_01_rcws_F {
        vItemSpace = 10;
        chopShop = 55500;
        textures[] = {};
    };
    
    class rhsusf_m1a1aim_tuski_d {
        vItemSpace = 10;
        chopShop = 55500;
        textures[] = {};
    };
    
    class B_UAV_02_F {
        vItemSpace = 1;
        chopShop = 55500;
        textures[] = {};
    };
    
    class RHS_AH1Z {
        vItemSpace = 50;
        chopShop = 55000;
        textures[] = {};
    };
    
    class RHS_UH60M {
        vItemSpace = 50;
        chopShop = 55500;
        textures[] = {};
    };
    
    class RHS_CH_47F {
        vItemSpace = 50;
        chopShop = 50500;
        textures[] = {};
    };

    class EWK_M998_Terminal {
        vItemSpace = 65;
        chopShop = 25500;
        textures[] = {};
    };
        
    class EWK_M1114_Armored {
        vItemSpace = 65;
        chopShop = 25500;
        textures[] = {};
    };
         
    class EWK_M998A2_sov_M2 {
        vItemSpace = 65;
        chopShop = 25500;
        textures[] = {};
    };
         
    class EWK_m1151_TOW_deployment {
        vItemSpace = 65;
        chopShop = 25500;
        textures[] = {};
    };
          
    class EWK_m1151_m240_deployment {
        vItemSpace = 65;
        chopShop = 25500;
        textures[] = {};
    };
          
    class EWK_m1151_m2_deployment_AT4 {
        vItemSpace = 65;
        chopShop = 25500;
        textures[] = {};
    };
           
   
    class B_APC_Wheeled_01_cannon_F {
        vItemSpace = 15;
        chopShop = 0;
        textures[] = {};
    };
           
    class B_MBT_01_cannon_F {
        vItemSpace = 15;
        chopShop = 25500;
        textures[] = {};
        
    };
           
    class LandRover_ACR {
        vItemSpace = 40;
        chopShop = 5500;
        textures[] = {};
        
    };
           
    class B_APC_Tracked_01_CRV_F {
        vItemSpace = 10;
        chopShop = 5500;
        textures[] = {};
        
    };
           
    class B_Heli_Light_01_armed_F {
        vItemSpace = 0;
        chopShop = 4000;
        textures[] = {};
        
    };
            
    class LandRover_CZ_EP1 {
        vItemSpace = 65;
        chopShop = 5500;
        textures[] = {};
        
    };
         
    class LandRover_TK_CIV_EP1  {
        vItemSpace = 65;
        chopShop = 5500;
        textures[] = {};
        
    };
             
    class ACR_LandRover_AMB  {
        vItemSpace = 65;
        chopShop = 5500;
        textures[] = {};
        
    };
             
    class BAF_Offroad_W  {
        vItemSpace = 65;
        chopShop = 5500;
        textures[] = {};
        
    };
	
	class Jonzie_Escalade  {
        vItemSpace = 50;
        chopShop = 5500;
        textures[] = {};
        
    };
	
	class Jonzie_30CSL  {
        vItemSpace = 25;
        chopShop = 5000;
        textures[] = {};
        
    };
	
	class Jonzie_Corolla  {
        vItemSpace = 25;
        chopShop = 4500;
        textures[] = {};
        
    };
	
	class Jonzie_Datsun_510  {
        vItemSpace = 25;
        chopShop = 3500;
        textures[] = {};
        
    };
	
	class Jonzie_Datsun_Z432  {
        vItemSpace = 20;
        chopShop = 7500;
        textures[] = {};
        
    };
	
	class Jonzie_Mini_Cooper  {
        vItemSpace = 25;
        chopShop = 3500;
        textures[] = {};
        
    };
	
	class onzie_Galant  {
        vItemSpace = 25;
        chopShop = 5000;
        textures[] = {};
        
    };
    
    class rhsusf_rg33_d  {
        vItemSpace = 65;
        chopShop = 27400;
        textures[] = {};
        
    };			
	
	class rhsusf_rg33_m2_d  {
        vItemSpace = 65;
        chopShop = 0;
        textures[] = {};
        
    };	
    	
	class RHS_UH1Y_UNARMED  {
        vItemSpace = 65;
        chopShop = 0;
        textures[] = {};
        
    };	
    
    class BAF_Offroad_D  {
        vItemSpace = 65;
        chopShop = 55000;
        textures[] = {};
        
    };
             
    class ACR_Offroad_HMG {
        vItemSpace = 65;
        chopShop = 55000;
        textures[] = {};
        
    };
	
	class RHS_Mi24V_AT_vdv {
		vItemSpace = 0;
		chopShop = 0;
		textures[] = {};
		
    };
	
	class RHS_AH64D_wd_AA {
        vItemSpace = 0;
        chopShop = 0;
        textures[] = {};

    };
	
	class RHS_UH1Y_d {
        vItemSpace = 0;
        chopShop = 0;
        textures[] = {};

    };
	
	class RHS_UH1Y_FFAR_d {
        vItemSpace = 0;
        chopShop = 0;
        textures[] = {};

    };
	
    class BAF_Offroad_W_HMG {
        vItemSpace = 65;
        chopShop = 5000;
        textures[] = {};
        
    };
             
    class LandRover_MG_TK_EP1 {
        vItemSpace = 65;
        chopShop = 5100;
        textures[] = {};
        
    };
                 
    class Gurkha_f5 {
        vItemSpace = 100;
        chopShop = 12000;
        textures[] = {};
        
    };
                 
    class Gurkha_M60 {
        vItemSpace = 100;
        chopShop = 12000;
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
		chopShop = 3500;
		textures[] = {};
	};

	class C_Kart_01_Fuel_F : C_Kart_01_Blu_F {}; //Inherits everything from the above class
	class C_Kart_01_Red_F : C_Kart_01_Blu_F {}; //Inherits everything from the above class
	class C_Kart_01_Vrana_F : C_Kart_01_Blu_F {}; //Inherits everything from the above class

	class C_Hatchback_01_sport_F {
        vItemSpace = 45;
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
            { "Police", "cop", {
                "#(ai,64,64,1)Fresnel(1.3,7)"
            } }
        };
    };

	class B_Quadbike_01_F {
        vItemSpace = 5;
        chopShop = 5000;
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
        chopShop = 20000;
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
		chopShop = 5000;
		textures[] = {};
	};
	
	class RHS_Ural_Open_Civ_01 {
		vItemSpace = 175;
		chopShop = 5000;
		textures[] = {};
	};

	class C_Hatchback_01_F {
        vItemSpace = 40;
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
        chopShop = 5000;
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
	class B_MRAP_01_F {
        vItemSpace = 65;
        chopShop = 5000;
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
        chopShop = 5000;
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
            { "EMS White", "med", {
                "#(argb,8,8,3)color(1,1,1,0.8)"
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
        chopShop = 5000;
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
            { "EMS White", "med", {
                "#(argb,8,8,3)color(1,1,1,0.8)"
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
	
	class RHS_C130J {}; //c130??
	
	class I_Heli_light_03_unarmed_F {
		vItemSpace = 0;
		chopShop = 5000;
		textures[] = {};
	};
	
	class O_Heli_Transport_04_medevac_F {
		vItemSpace = 100;
		chopShop = 0;
		textures[] = {};
	}
	
	class O_Heli_Transport_04_F {
		vItemSpace = 0;
		chopShop = 5000;
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
		chopShop = 5000;
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
		chopShop = 5000;
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
		chopShop = 5000;
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
		chopShop = 5000;
	};
	
	class B_Heli_Transport_03_F {
		vItemSpace = 0;
		chopShop = 5000;
	};
	
	class RHS_Mi8mt_vvs {
		vItemSpace = 0;
		chopShop = 5000;
	};
	
	class NRPG_Taki_Police_Car_F {
		vItemSpace = 90;
		chopShop = 5000;
	};
	
	class I_Plane_Fighter_03_CAS_F {};
	class O_Plane_CAS_02_F {};
	class B_Plane_CAS_01_F {};
	class RHS_A10 {};
	class RHS_Su25SM_vvs {};
	class B_Truck_01_ammo_F {};
	class B_Truck_01_Repair_F {};
	class RHS_M2A3_BUSKIII {};
};
