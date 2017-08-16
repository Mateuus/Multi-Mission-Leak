/*
	File: fn_vehicleColorCfg.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Master configuration for vehicle colors.
*/
private["_vehicle","_ret","_path"];
_vehicle = [_this,0,"",[""]] call BIS_fnc_param;
if(_vehicle == "") exitWith {[]};
_ret = [];

switch (_vehicle) do
{
	case "I_Heli_Transport_02_F":
	{
		_path = "\a3\air_f_beta\Heli_Transport_02\Data\Skins\";
		_ret =
		[
			[_path + "heli_transport_02_1_ion_co.paa","civ",_path + "heli_transport_02_2_ion_co.paa",_path + "heli_transport_02_3_ion_co.paa"],
			[_path + "heli_transport_02_1_dahoman_co.paa","civ",_path + "heli_transport_02_2_dahoman_co.paa",_path + "heli_transport_02_3_dahoman_co.paa"],
			["CHROME","civ","CHROME","CHROME",5]
		];
	};
	
	case "bv_the_crowner_cop_patrol":
	{
		["images\patrol_co.jpg","cop"]
	};
	
	case "C_Hatchback_01_sport_F":
	{
		_path = "\a3\soft_f_gamma\Hatchback_01\data\";
		_ret set[8,["images\rustbucket.jpg","civ"]];
		_ret set[2,[_path + "hatchback_01_ext_sport03_co.paa","civ","","",1]];
		_ret set[4,[_path + "hatchback_01_ext_sport05_co.paa","civ","","",1]];
		_ret set[3,[_path + "hatchback_01_ext_sport04_co.paa","civ","","",2]];
		_ret set[5,[_path + "hatchback_01_ext_sport06_co.paa","civ","","",3]];
		_ret set[1,[_path + "hatchback_01_ext_sport02_co.paa","civ","","",4]];
		_ret set[0,[_path + "hatchback_01_ext_sport01_co.paa","civ","","",5]];
		_ret set[6,["images\police_hatchback.jpg","cop"]];
		_ret set[7,["images\hatchback_prestige.jpg","civ","","",2,17]];
		_ret set[9,["images\asylumhondahigh.paa","civ","","",3]];
	};

	case "C_Plane_Civil_01_F":
	{
		[
			["CONFIG","civ","Racer_1","",3],
			["CONFIG","civ","Racer_2","",3],
			["CONFIG","civ","RedLine_1","",1],
			["CONFIG","civ","RedLine_2","",1],
			["CONFIG","civ","Tribal_1","",2],
			["CONFIG","civ","Tribal_2","",2],
			["CONFIG","civ","Wave_1","",0],
			["CONFIG","civ","Wave_2","",0]
		]
	};

	case "C_Scooter_Transport_01_F":
	{
		_ret =
		[
			["CONFIG","civ","Black","",4],
			["CONFIG","civ","Lime","",3],
			["CONFIG","civ","Yellow","",2],
			["CONFIG","civ","Grey","",2],
			["CONFIG","civ","Red","",1],
			["CONFIG","civ","White","",0],
			["CONFIG","civ","Blue","",0]
		];
		
	};
	
	case "C_Offroad_02_unarmed_F":
	{
		_ret =
		[
			["CONFIG","civ","Orange","",5],
			["CONFIG","civ","Red","",4],
			["CONFIG","civ","Blue","",2],
			["CONFIG","civ","Green","",2],
			["CONFIG","civ","Olive","",1],
			["CONFIG","civ","Brown","",0],
			["CONFIG","civ","Black","",0],
			["CONFIG","civ","White","",0]
		];
	};
	
	case "B_T_LSV_01_unarmed_F":
	{
		_ret =
		[
			["CONFIG","civ","Dazzle","",5],
			["CONFIG","civ","Sand","",2],
			["CONFIG","civ","Black","",1],
			["CONFIG","civ","Olive","",0]
		];
	};
	
	case "O_T_LSV_02_unarmed_F":
	{
		_ret =
		[
			["CONFIG","civ","Arid","",3],
			["CONFIG","civ","GreenHex","",2],
			["CONFIG","civ","Black","",0]
		];
	};
	
	case "C_Boat_Transport_02_F":
	{
		_ret =
		[
			["CONFIG","civ","Civilian","",0],
			["CONFIG","civ","Black","",3]
		];
	};
		
	case "C_Offroad_01_F":
	{
		_ret = 
		[
			["\A3\soft_F\Offroad_01\Data\offroad_01_ext_co.paa", "civ"], 
			["\A3\soft_F\Offroad_01\Data\offroad_01_ext_BASE01_CO.paa", "civ"],
			["\A3\soft_F\Offroad_01\Data\offroad_01_ext_BASE02_CO.paa", "civ"],
			["\A3\soft_F\Offroad_01\Data\offroad_01_ext_BASE03_CO.paa","civ"],
			["\A3\soft_F\Offroad_01\Data\offroad_01_ext_BASE04_CO.paa","civ"],
			["\A3\soft_F\Offroad_01\Data\offroad_01_ext_BASE05_CO.paa","civ"],
			["#(ai,64,64,1)Fresnel(0.3,3)","fed"],
			["images\police_offroad.jpg","cop"], // ["#(ai,64,64,1)Fresnel(1.3,7)","cop"],
			["#(argb,8,8,3)color(0.6,0.3,0.01,1)","civ"]
		];
		_ret set[9,["#(argb,8,8,3)color(0.1,0,0.1,1)","civ","","",1]]; // purple
		_ret set[10,["#(argb,8,8,3)color(0.2,0,0.2,1)","civ","","",5]]; // pink
		_ret set[11,["#(argb,8,8,3)color(0,0.1,0.3,1)","civ","","",3]]; // sky
		_ret set[12,["#(argb,8,8,3)color(0.5,0,0,1)","civ","","",4]]; // red
		_ret set[13,["#(argb,8,8,3)color(0.3,0.3,0,1)","civ","","",4]]; // yellow
		_ret set[14,["#(argb,8,8,3)color(0,0.5,0,1)","civ","","",5]]; // lime
		_ret set[15,["images\offroad_01_ext_paramedic_co.jpg","med"]];
		_ret set[16,["CHROME","civ","","",5]];
	};
	
	case "bv_monster":
	{
		_ret = 
		[
			["bv_monster_2tone2","civ","","",1],
			["bv_monster_2tone3","civ","","",2],
			["bv_monster_2tone1","civ","","",3],
			["bv_monster_2tone4","civ","","",4],
			["bv_monster_2tone5","civ","","",5],
			["bv_monster_aqua","civ","","",0],
			["bv_monster_baby_blue","civ","","",0],
			["bv_monster_baby_pink","civ","","",0],
			["bv_monster_black2","civ","","",0],
			["bv_monster_burgundy","civ","","",0],
			["bv_monster_cardinal","civ","","",0],
			["bv_monster_dark_green","civ","","",0],
			["bv_monster_gold","civ","","",0],
			["bv_monster_green","civ","","",0],
			["bv_monster_grey","civ","","",0],
			["bv_monster_lavender","civ","","",0],
			["bv_monster_light_blue","civ","","",0],
			["bv_monster_light_yellow","civ","","",0],
			["bv_monster_lime","civ","","",0],
			["bv_monster_marina_blue","civ","","",0],
			["bv_monster_navy_blue","civ","","",0],
			["bv_monster_orange","civ","","",0],
			["bv_monster_pink","civ","","",0],
			["bv_monster_purple","civ","","",0],
			["bv_monster_red","civ","","",0],
			["bv_monster_sand","civ","","",0],
			["bv_monster_silver","civ","","",0],
			["bv_monster_skin_blue","civ","","",0],
			["bv_monster_skin_camo","civ","","",0],
			["bv_monster_skin_camo_urban","civ","","",0],
			["bv_monster_skin_darkgreen","civ","","",0],
			["bv_monster_skin_white","civ","","",0],
			["bv_monster_skin_yellow","civ","","",0]
		];
	};
	
	case "bv_gtr_spec_v":
	{
		_ret = 
		[
			["bv_gtr_spec_v_2tone2","civ","","",1],
			["bv_gtr_spec_v_2tone3","civ","","",2],
			["bv_gtr_spec_v_2tone1","civ","","",3],
			["bv_gtr_spec_v_2tone4","civ","","",4],
			["bv_gtr_spec_v_2tone5","civ","","",5],
			["bv_gtr_spec_v_aqua","civ","","",0],
			["bv_gtr_spec_v_baby_blue","civ","","",0],
			["bv_gtr_spec_v_baby_pink","civ","","",0],
			["bv_gtr_spec_v_black2","civ","","",0],
			["bv_gtr_spec_v_burgundy","civ","","",0],
			["bv_gtr_spec_v_cardinal","civ","","",0],
			["bv_gtr_spec_v_dark_green","civ","","",0],
			["bv_gtr_spec_v_gold","civ","","",0],
			["bv_gtr_spec_v_green","civ","","",0],
			["bv_gtr_spec_v_grey","civ","","",0],
			["bv_gtr_spec_v_lavender","civ","","",0],
			["bv_gtr_spec_v_light_blue","civ","","",0],
			["bv_gtr_spec_v_light_yellow","civ","","",0],
			["bv_gtr_spec_v_lime","civ","","",0],
			["bv_gtr_spec_v_marina_blue","civ","","",0],
			["bv_gtr_spec_v_navy_blue","civ","","",0],
			["bv_gtr_spec_v_orange","civ","","",0],
			["bv_gtr_spec_v_pink","civ","","",0],
			["bv_gtr_spec_v_purple","civ","","",0],
			["bv_gtr_spec_v_red","civ","","",0],
			["bv_gtr_spec_v_sand","civ","","",0],
			["bv_gtr_spec_v_silver","civ","","",0],
			["bv_gtr_spec_v_skin_blue","civ","","",0],
			["bv_gtr_spec_v_skin_camo","civ","","",0],
			["bv_gtr_spec_v_skin_camo_urban","civ","","",0],
			["bv_gtr_spec_v_skin_darkgreen","civ","","",0],
			["bv_gtr_spec_v_skin_white","civ","","",0],
			["bv_gtr_spec_v_skin_yellow","civ","","",0]
		];
	};
	
	case "bv_caressa":
	{
		_ret = 
		[
			["bv_caressa_2tone2","civ","","",1],
			["bv_caressa_2tone3","civ","","",2],
			["bv_caressa_2tone1","civ","","",3],
			["bv_caressa_2tone4","civ","","",4],
			["bv_caressa_2tone5","civ","","",5],
			["bv_caressa_aqua","civ","","",0],
			["bv_caressa_baby_blue","civ","","",0],
			["bv_caressa_baby_pink","civ","","",0],
			["bv_caressa_black2","civ","","",0],
			["bv_caressa_burgundy","civ","","",0],
			["bv_caressa_cardinal","civ","","",0],
			["bv_caressa_dark_green","civ","","",0],
			["bv_caressa_gold","civ","","",0],
			["bv_caressa_green","civ","","",0],
			["bv_caressa_grey","civ","","",0],
			["bv_caressa_lavender","civ","","",0],
			["bv_caressa_light_blue","civ","","",0],
			["bv_caressa_light_yellow","civ","","",0],
			["bv_caressa_lime","civ","","",0],
			["bv_caressa_marina_blue","civ","","",0],
			["bv_caressa_navy_blue","civ","","",0],
			["bv_caressa_orange","civ","","",0],
			["bv_caressa_pink","civ","","",0],
			["bv_caressa_purple","civ","","",0],
			["bv_caressa_red","civ","","",0],
			["bv_caressa_sand","civ","","",0],
			["bv_caressa_silver","civ","","",0],
			["bv_caressa_skin_blue","civ","","",0],
			["bv_caressa_skin_camo","civ","","",0],
			["bv_caressa_skin_camo_urban","civ","","",0],
			["bv_caressa_skin_darkgreen","civ","","",0],
			["bv_caressa_skin_white","civ","","",0],
			["bv_caressa_skin_yellow","civ","","",0]
		];
	};
	
	case "bv_e60_m5":
	{
		_ret = 
		[
			["bv_e60_m5_2tone2","civ","","",1],
			["bv_e60_m5_2tone3","civ","","",2],
			["bv_e60_m5_2tone1","civ","","",3],
			["bv_e60_m5_2tone4","civ","","",4],
			["bv_e60_m5_2tone5","civ","","",5],
			["bv_e60_m5_aqua","civ","","",0],
			["bv_e60_m5_baby_blue","civ","","",0],
			["bv_e60_m5_baby_pink","civ","","",0],
			["bv_e60_m5_black2","civ","","",0],
			["bv_e60_m5_burgundy","civ","","",0],
			["bv_e60_m5_cardinal","civ","","",0],
			["bv_e60_m5_dark_green","civ","","",0],
			["bv_e60_m5_gold","civ","","",0],
			["bv_e60_m5_green","civ","","",0],
			["bv_e60_m5_grey","civ","","",0],
			["bv_e60_m5_lavender","civ","","",0],
			["bv_e60_m5_light_blue","civ","","",0],
			["bv_e60_m5_light_yellow","civ","","",0],
			["bv_e60_m5_lime","civ","","",0],
			["bv_e60_m5_marina_blue","civ","","",0],
			["bv_e60_m5_navy_blue","civ","","",0],
			["bv_e60_m5_orange","civ","","",0],
			["bv_e60_m5_pink","civ","","",0],
			["bv_e60_m5_purple","civ","","",0],
			["bv_e60_m5_red","civ","","",0],
			["bv_e60_m5_sand","civ","","",0],
			["bv_e60_m5_silver","civ","","",0],
			["bv_e60_m5_skin_blue","civ","","",0],
			["bv_e60_m5_skin_camo","civ","","",0],
			["bv_e60_m5_skin_camo_urban","civ","","",0],
			["bv_e60_m5_skin_darkgreen","civ","","",0],
			["bv_e60_m5_skin_white","civ","","",0],
			["bv_e60_m5_skin_yellow","civ","","",0]
		];
	};
	
	case "bv_458":
	{
		_ret = 
		[
			["bv_458_2tone2","civ","","",1],
			["bv_458_2tone3","civ","","",2],
			["bv_458_2tone1","civ","","",3],
			["bv_458_2tone4","civ","","",4],
			["bv_458_2tone5","civ","","",5],
			["bv_458_aqua","civ","","",0],
			["bv_458_baby_blue","civ","","",0],
			["bv_458_baby_pink","civ","","",0],
			["bv_458_black2","civ","","",0],
			["bv_458_burgundy","civ","","",0],
			["bv_458_cardinal","civ","","",0],
			["bv_458_dark_green","civ","","",0],
			["bv_458_gold","civ","","",0],
			["bv_458_green","civ","","",0],
			["bv_458_grey","civ","","",0],
			["bv_458_lavender","civ","","",0],
			["bv_458_light_blue","civ","","",0],
			["bv_458_light_yellow","civ","","",0],
			["bv_458_lime","civ","","",0],
			["bv_458_marina_blue","civ","","",0],
			["bv_458_navy_blue","civ","","",0],
			["bv_458_orange","civ","","",0],
			["bv_458_pink","civ","","",0],
			["bv_458_purple","civ","","",0],
			["bv_458_red","civ","","",0],
			["bv_458_sand","civ","","",0],
			["bv_458_silver","civ","","",0],
			["bv_458_skin_blue","civ","","",0],
			["bv_458_skin_camo","civ","","",0],
			["bv_458_skin_camo_urban","civ","","",0],
			["bv_458_skin_darkgreen","civ","","",0],
			["bv_458_skin_white","civ","","",0],
			["bv_458_skin_yellow","civ","","",0]
		];
	};
	
	case "bv_caressa_gt":
	{
		_ret = 
		[
			["bv_caressa_gt_2tone2","civ","","",1],
			["bv_caressa_gt_2tone3","civ","","",2],
			["bv_caressa_gt_2tone1","civ","","",3],
			["bv_caressa_gt_2tone4","civ","","",4],
			["bv_caressa_gt_2tone5","civ","","",5],
			["bv_caressa_gt_aqua","civ","","",0],
			["bv_caressa_gt_baby_blue","civ","","",0],
			["bv_caressa_gt_baby_pink","civ","","",0],
			["bv_caressa_gt_black2","civ","","",0],
			["bv_caressa_gt_burgundy","civ","","",0],
			["bv_caressa_gt_cardinal","civ","","",0],
			["bv_caressa_gt_dark_green","civ","","",0],
			["bv_caressa_gt_gold","civ","","",0],
			["bv_caressa_gt_green","civ","","",0],
			["bv_caressa_gt_grey","civ","","",0],
			["bv_caressa_gt_lavender","civ","","",0],
			["bv_caressa_gt_light_blue","civ","","",0],
			["bv_caressa_gt_light_yellow","civ","","",0],
			["bv_caressa_gt_lime","civ","","",0],
			["bv_caressa_gt_marina_blue","civ","","",0],
			["bv_caressa_gt_navy_blue","civ","","",0],
			["bv_caressa_gt_orange","civ","","",0],
			["bv_caressa_gt_pink","civ","","",0],
			["bv_caressa_gt_purple","civ","","",0],
			["bv_caressa_gt_red","civ","","",0],
			["bv_caressa_gt_sand","civ","","",0],
			["bv_caressa_gt_silver","civ","","",0],
			["bv_caressa_gt_skin_blue","civ","","",0],
			["bv_caressa_gt_skin_camo","civ","","",0],
			["bv_caressa_gt_skin_camo_urban","civ","","",0],
			["bv_caressa_gt_skin_darkgreen","civ","","",0],
			["bv_caressa_gt_skin_white","civ","","",0],
			["bv_caressa_gt_skin_yellow","civ","","",0]
		];
	};
	
	case "Mrshounka_yamaha_p_base":
	{
		_ret = 
		[
			["Mrshounka_yamaha_p_bf","civ","","",0],
			["Mrshounka_yamaha_p_r","civ","","",0],
			["Mrshounka_yamaha_p_j","civ","","",0],
			["Mrshounka_yamaha_p_rose","civ","","",0],
			["Mrshounka_yamaha_p_g","civ","","",0],
			["Mrshounka_yamaha_p_v","civ","","",0],
			["Mrshounka_yamaha_p_o","civ","","",0]
		];
	};
	
	case "beetle":
	{
		_ret = 
		[
			["beetle_camo","civ","","",3],
			["beetle_psycha","civ","","",4],
			["beetle_psycha1","civ","","",5],
			["beetle_bleufonce","civ","","",0],
			["beetle_bleupetrole","civ","","",0],
			["beetle_red","civ","","",0],
			["beetle_vert","civ","","",0],
			["beetle_violet","civ","","",0],
			["beetle_white","civ","","",0],
			["beetle_coci","civ","","",0]
		];
	};
	
	case "B_G_Offroad_01_armed_F":
	{
		_ret = 
		[
			["\A3\soft_f_gamma\Offroad_01\Data\offroad_01_ext_ig01_co.paa", "civ"],
			["images\police_offroad.jpg","cop"]
		];
	};
	
	case "I_Plane_Fighter_03_CAS_F":
	{
		_ret = 
		[
			["images\jet_civ_01.jpg","civ","images\jet_civ_02.jpg"]
		];
	};
	
	case "C_Hatchback_01_F":
	{
		_ret =
		[
			["\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_base01_co.paa","civ"],
			["\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_base02_co.paa","civ"],
			["\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_base03_co.paa","civ"],
			["\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_base04_co.paa","civ"],
			["\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_base06_co.paa","civ"],
			["\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_base07_co.paa","civ"],
			["\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_base08_co.paa","civ"],
			["\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_base09_co.paa","civ"]
		];
	};
	
	case "C_SUV_01_F":
	{
		_ret =
		[
			["\a3\soft_f_gamma\SUV_01\Data\suv_01_ext_co.paa","civ"],
			["images\police_suv.jpg","cop"],
			["\a3\soft_f_gamma\SUV_01\Data\suv_01_ext_03_co.paa","civ"],
			["\a3\soft_f_gamma\SUV_01\Data\suv_01_ext_04_co.paa","civ"],
			["\a3\soft_f_gamma\SUV_01\Data\suv_01_ext_02_co.paa","civ"],
			["images\suv_01_ext_paramedic_co.jpg","med"]
		];
	};
	
	case "C_Van_01_box_F":
	{
		_ret = 
		[
			["\a3\soft_f_gamma\Van_01\Data\van_01_ext_co.paa","civ"],
			["\a3\soft_f_gamma\Van_01\Data\van_01_ext_red_co.paa","civ"]
		];
	};
	
	case "C_Van_01_transport_F":
	{
		_ret = 
		[
			["\a3\soft_f_gamma\Van_01\Data\van_01_ext_co.paa","civ"],
			["\a3\soft_f_gamma\Van_01\Data\van_01_ext_red_co.paa","civ"]
		];
	};
	
	case "B_Quadbike_01_F":
	{
		_ret = 
		[
			["\A3\Soft_F\Quadbike_01\Data\Quadbike_01_co.paa","cop"],
			["\A3\Soft_F\Quadbike_01\Data\quadbike_01_opfor_co.paa","reb"],
			["\A3\Soft_F_beta\Quadbike_01\Data\quadbike_01_civ_black_co.paa","civ"],
			["\A3\Soft_F_beta\Quadbike_01\Data\quadbike_01_civ_blue_co.paa","civ"],
			["\A3\Soft_F_beta\Quadbike_01\Data\quadbike_01_civ_red_co.paa","civ"],
			["\A3\Soft_F_beta\Quadbike_01\Data\quadbike_01_civ_white_co.paa","civ"],
			["\A3\Soft_F_beta\Quadbike_01\Data\quadbike_01_indp_co.paa","reb"],
			["\a3\soft_f_gamma\Quadbike_01\data\quadbike_01_indp_hunter_co.paa","civ","","",3],
			["\a3\soft_f_gamma\Quadbike_01\data\quadbike_01_indp_hunter_co.paa","reb"]
		];
	};
	
	case "B_Heli_Light_01_F";
	case "C_Heli_Light_01_civil_F":
	{
		_ret = 
		[
			["images\heli_light_01_ext_police_co.jpg","cop"],
			["images\heli_light_01_ext_police_co.jpg","fed"],
			["\a3\air_f\Heli_Light_01\Data\heli_light_01_ext_blue_co.paa","civ"],
			["\a3\air_f\Heli_Light_01\Data\heli_light_01_ext_co.paa","civ"],
			["\a3\air_f\Heli_Light_01\Data\heli_light_01_ext_indp_co.paa","reb"],
			["\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_blueline_co.paa","civ"],
			["\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_elliptical_co.paa","civ"],
			["\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_furious_co.paa","civ"],
			["\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_jeans_co.paa","civ"],
			["\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_speedy_co.paa","civ"],
			["\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_sunset_co.paa","civ"],
			["\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_vrana_co.paa","civ"],
			["\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_wave_co.paa","civ"],
			["\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_digital_co.paa","reb"],
			["images\heli_light_01_ext_paramedic_co.jpg","med"],
			["CHROME","civ","","",5],
			["\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_shadow_co.paa","civ"],
			["\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_graywatcher_co.paa","civ"],
			["\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_wasp_co.paa","civ"]
		];
	};
	
	case "O_Heli_Light_02_unarmed_F":
	{
		_ret = 
		[
			["\a3\air_f\Heli_Light_02\Data\heli_light_02_ext_co.paa","fed"],
			["\a3\air_f\Heli_Light_02\Data\heli_light_02_ext_civilian_co.paa","civ"],
			["\a3\air_f\Heli_Light_02\Data\heli_light_02_ext_indp_co.paa","reb"],
			["\a3\air_f\Heli_Light_02\Data\heli_light_02_ext_opfor_co.paa","reb"],
			["\a3\air_f_heli\heli_light_02\data\heli_light_02_ext_opfor_v2_co.paa","civ",nil,nil,5]
		];
	};
	
	case "B_MRAP_01_F":
	{
		_ret = 
		[
			["images\police_hunter_base.jpg","cop","images\police_hunter_add.jpg"],
			["#(argb,8,8,3)color(0.05,0.05,0.05,1)","fed"],
			["images\civilian_hunter_base.jpg","civ","images\civilian_hunter_adds.jpg"]
		];
	};
	
	case "I_MRAP_03_F":
	{
		_ret = 
		[
			["images\mrap_03_police_co.jpg","cop"],
			["#(argb,8,8,3)color(0.05,0.05,0.05,1)","fed"]
		];
	};
	
	case "I_Truck_02_covered_F":
	{
		_ret = 
		[
			["\A3\Soft_F_Beta\Truck_02\Data\truck_02_kab_co.paa","civ","\A3\Soft_F_Beta\Truck_02\data\truck_02_kuz_co.paa"],
			["#(argb,8,8,3)color(0.05,0.05,0.05,1)","fed"]
		];
	};
	
	case "I_Truck_02_transport_F":
	{
		_ret = 
		[
			["\A3\Soft_F_Beta\Truck_02\Data\truck_02_kab_co.paa","civ","\A3\Soft_F_Beta\Truck_02\data\truck_02_kuz_co.paa"],
			["#(argb,8,8,3)color(0.05,0.05,0.05,1)","fed"]
		];
	};
	
	case "B_APC_Wheeled_01_cannon_F":
	{
		_ret = 
		[
			["#(argb,8,8,3)color(0.05,0.05,0.05,1)","fed"]
		];
	};
	
	case "O_Heli_Attack_02_black_F":
	{
		_ret = 
		[
			["#(argb,8,8,3)color(0.05,0.05,0.05,1)","fed"]
		];
	};
	
	case "Jonzie_Datsun_510";	
	case "Jonzie_Corolla";
	case "Jonzie_Mini_Cooper";
	case "Jonzie_Ceed";
	case "Jonzie_30CSL";
	case "Jonzie_Raptor";
	case "Jonzie_Galant";
	case "Jonzie_Escalade";
	case "Jonzie_Datsun_Z432";
	case "Jonzie_Transit";
	case "Jonzie_XB";
	case "Jonzie_VE";
	case "Jonzie_Ute";
	case "Jonzie_Mini_Cooper_R_spec";
	case "Jonzie_STI";
	case "Jonzie_Quattroporte";
	case "Jonzie_Viper";
	case "Jonzie_Tow_Truck";
	case "Jonzie_Flat_Bed";
	case "Jonzie_Box_Truck";
	case "Jonzie_Western";
	case "Jonzie_Superliner":
	{
		_ret = 
		[
			[[0.95,9.95,0.95],"civ"],
			[[0.7,0,0],"civ"],
			[[0,0.7,0],"civ"],
			[[0,0,0.7],"civ"],
			[[0,0.8,0.7],"civ"],
			[[0,0,0],"civ"]
		];
	};
	
	case "Jonzie_Highway":
	{
		_ret = 
		[
			[[0,0,0],"cop"]
		];
	};
	
	case "I_Heli_light_03_unarmed_F":
	{
		_ret = 
		[
			["images\police_hellcat.jpg","cop"],
			["\A3\air_f_epb\Heli_Light_03\data\heli_light_03_base_co.paa","reb"],
			["\A3\air_f_epb\Heli_Light_03\data\heli_light_03_base_indp_co.paa","reb"],
			["#(argb,8,8,3)color(0.5,0.05,0.05,1)","reb"],
			["#(argb,8,8,3)color(0.5,0.5,0.5,1)","reb"],
			["#(argb,8,8,3)color(0,0.1,0.3,1)","reb"]
		];
	};
};

_ret;