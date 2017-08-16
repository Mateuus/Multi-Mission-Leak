#define CONST(var1,var2) var1 = compileFinal (if(typeName var2 == "STRING") then {var2} else {str(var2)})
#define SVAR_MNS missionNamespace setVariable
#define M_CONFIG(TYPE,CFG,CLASS,ENTRY) TYPE(missionConfigFile >> CFG >> CLASS >> ENTRY)
#define ITEM_VARNAME(varName) format["life_inv_%1",M_CONFIG(getText,"ANL_VItems",varName,"variable")]
#define LICENSE_VARNAME(varName,flag) format["li%1_%2",flag,M_CONFIG(getText,"ANL_Licenses",varName,"variable")]
life_action_delay = time;
life_redgull_effect = time;
life_nottoofast = time;
life_action_time = 0;
life_sex_ill = 0;
life_checked = 0;
life_session_tries = 0;
life_clothing_filter = 0;
life_clothing_uniform = -1;
life_wanted = 0;
life_last_wanted = 0;
life_respawn_timer = 2;
life_fatigue = 0.3;
life_maxWeight = 64;
life_maxWeightT = 64;
life_carryWeight = 0;
life_thirst = 100;
life_hunger = 100;
life_battery = 100;
life_pain = 0;
life_drink = 0;
life_drug = 0;
argent_liquide = 0;
life_action_index = [];
life_actions = [];
life_vehicles = [];
bank_robber = [];
life_trunk_vehicle = Objnull;
life_spikestrip = ObjNull;
life_cursorTarget = objNull;
life_pose = objNull;
life_my_gang = ObjNull;
life_channel_send = true;
life_use_atm = true;
life_session_completed = false;
life_garage_store = false;
life_net_dropped = false;
life_hit_explosive = false;
life_siren_active = false;
life_siren2_active = false;
life_is_processing = false;
life_bank_fail = false;
life_is_arrested = false;
life_is_alive = false;
life_action_in_use = false;
life_bail_paid = false;
life_impound_inuse = false;
life_action_inUse = false;
life_has_insurance = false;
life_knockout = false;
life_interrupted = false;
life_respawned = false;
life_removeWanted = false;
life_action_gathering = false;
life_god = false;
life_frozen = false;
life_markers = false;
life_sitting = false;
life_slaver = false;
life_enslaved = false;
life_fou = false;
life_fps = false;
life_looting = false;
life_request_timer = false;
life_show_actions = false;
life_istazed = false;
nn_last_vehicles = [];
nn_empInUse = false;
brinks_inMission = false;
brinks_moneyStart = 0;
actualProofs = [];
life_companyID = [];
life_charged =false;
life_clothing_purchase = [-1,-1,-1,-1,-1];
switch (playerSide) do {
case west: { compte_banque = 5000; life_paycheck = 300;};
case civilian: { compte_banque = 4000; life_paycheck = 200;};
case independent: { compte_banque = 5000; life_paycheck = 600;};
case east: { compte_banque = 5000; life_paycheck = 400; };
};
{
	SVAR_MNS [ITEM_VARNAME(configName _x),0];
} foreach ("true" configClasses (missionConfigFile >> "ANL_VItems"));
{
	_varName = getText(_x >> "variable");
	_sideFlag = getText(_x >> "side");
	SVAR_MNS [LICENSE_VARNAME(_varName,_sideFlag),false];
} foreach ("true" configClasses (missionConfigFile >> "ANL_Licenses"));

ANL_containers = [
"Land_dp_smallFactory_F",
"Land_PaperBox_open_empty_F"
];
ANL_objet = [
["mur","Land_CncBarrier_stripes_F","un mur",0,4, false],
["sac","Land_BagFence_Short_F","un sac de sable",0,4, true],
["cone","RoadCone_F","un cone routier",0,4, true],
["barre","RoadBarrier_F","une barriere de securité",0,4, false],
["lightr","Land_Flush_Light_red_F","une lumiere rouge",0,4, true],
["lightg","Land_Flush_Light_green_F","une lumiere verte",0,4, true],
["lighty","Land_Flush_Light_yellow_F","une lumiere jaune",0,4, true],
["flecheg","ArrowDesk_L_F","une fleche a gauche",0,4, true],
["fleched","ArrowDesk_R_F","une fleche a droite",0,4, true],
["projecteur","Land_PortableLight_single_F","projecteur",0,4, true],
["projecteur2","Land_PortableLight_double_F","projecteur double",0,4, true]
];
ANL_taxi = [
["taxi_spawn_kavala","Kavala",civilian],
["taxi_spawn_athira","Athira",civilian],
["taxi_spawn_rodo","Rodopoli",civilian],
["taxi_spawn_pyrgos","Pyrgos",civilian],
["taxi_spawn_sofia","Sofia",civilian],
["taxi_spawn_neo","Neochori",civilian],
["taxi_spawn_casino","Casino",civilian],
["taxi_spawn_camp","Camp d'entrainement",civilian],
["taxi_spawn_camp","Camp d'entrainement",west],
["taxi_spawn_kavalap","Gendarmerie Kavala",west],
["taxi_spawn_athirap","Gendarmerie Athira",west],
["taxi_spawn_gardecote","Garde Cotes",west],
["taxi_spawn_kavalamed","Hopital Kavala",independent],
["taxi_spawn_frontmed","Hopital Frontière",independent],
["taxi_spawn_pyrgosmed","Hopital de Pyrgos",independent]
];
ANL_uniforme = [
["U_Rangemaster","images\flic\gendarme.paa",west,0,""],
["U_B_CombatUniform_mcam_worn","images\flic\polaire.paa",west,0,""],
["U_B_SpecopsUniform_sgg","images\flic\grandfroid.paa",west,0,""],
["U_B_CombatUniform_mcam","images\flic\encadrement.paa",west,3,""],
["U_O_OfficerUniform_ocamo","images\flic\motard.paa",west,0,""],
["U_O_OfficerUniform_ocamo","images\flic\douane.paa",west,4,""],
["U_B_CTRG_3","images\flic\gign.paa",west,1,""],
["U_B_CTRG_1","images\flic\commandement.paa",west,6,""],
["U_B_CombatUniform_mcam_vest","images\flic\commandement.paa",west,6,""],
["U_O_OfficerUniform_ocamo","images\flic\ceremonie.paa",west,8,""],
["U_Rangemaster","images\med\samu.paa",independent,0,""],
["U_C_WorkerCoveralls","images\med\medic.paa",independent,0,""],
["U_I_CombatUniform","images\taff\bh.jpg",civilian,3,""],
["U_C_WorkerCoveralls","images\taff\depanneur.jpg",civilian,2,""],
["U_C_Scientist","images\taff\nuke.jpg",civilian,1,""],
["U_B_CombatUniform_mcam_vest","images\taff\merc.jpg",civilian,0,""],
["U_B_CombatUniform_mcam","images\taff\merc_reb.jpg",civilian,0,""],
["U_MillerBody","images\civ\prisonnier.jpg",civilian,0,""],
["U_Rangemaster","images\civ\cravate.jpg",civilian,0,""],
["U_C_Poloshirt_redwhite","images\civ\civil1.jpg",civilian,0,""],
["U_C_Poloshirt_burgundy","images\civ\civil2.jpg",civilian,0,""],
["U_C_Poloshirt_blue","images\civ\civil3.jpg",civilian,0,""],
["U_C_Poloshirt_stripped","images\civ\civil4.jpg",civilian,0,""],
["U_C_Poloshirt_salmon","images\civ\civil5.jpg",civilian,0,""],
["U_C_Poloshirt_tricolour","images\civ\civil6.jpg",civilian,0,""],
["U_B_CTRG_1","images\taff\brinks.jpg",civilian,8,""],
["U_Rangemaster","images\event\bruce.jpg",east,0,""],
["U_B_CTRG_1","images\event\kitty.jpg",east,0,""],
["U_C_WorkerCoveralls","images\event\macdo.jpg",east,0,""],
["U_I_CombatUniform","images\event\staff.jpg",east,0,""],
["U_B_Wetsuit","images\event\batman.jpg",east,0,""]
];
ANL_vehicules = [
//Classname,frais garage, revente, assurance, reparation, ...
["C_Kart_01_Blu_F",50,1000,500,500,1],
["C_Kart_01_Fuel_F",50,1000,500,500,1],
["C_Kart_01_Red_F",50,1000,500,500,1],
["C_Kart_01_Vrana_F",50,1000,500,500,1],
["B_Quadbike_01_F",50,400,500,500,1],
["C_Hatchback_01_F",50,500,500,500,1],
["C_Offroad_01_F",50,1000,1000,500,1],
["O_G_Offroad_01_F",50,1500,1000,500,1],
["C_SUV_01_F",50,3000,3000,500,1],
["C_Hatchback_01_sport_F",50,4000,5000,500,1],
//CAMION
["C_Van_01_transport_F",200,6000,7000,500,1],
["C_Van_01_box_F",200,7000,8000,500,1],
["B_Truck_01_transport_F",0,10000,20000,500,1],
["I_Truck_02_transport_F",500,10000,15000,500,1],
["I_Truck_02_covered_F",500,10000,15000,500,1],
["B_Truck_01_covered_F",500,30000,30000,500,1],
["B_Truck_01_box_F",500,40000,40000,500,1],
["O_Truck_03_transport_F",1000,50000,50000,500,1],
["O_Truck_03_covered_F",1000,80000,60000,500,1],
["O_Truck_03_ammo_F",1000,150000,70000,500,1],
["O_Truck_03_device_F",1000,200000,100000,500,1],
["B_G_Offroad_01_repair_F",0,2000,2000,500,1],
["B_Truck_01_mover_F",0,20000,10000,500,1],
["B_Truck_01_fuel_F",0,60000,10000,500,1],
["O_Truck_02_fuel_F",0,100000,20000,500,1],
["O_Truck_03_fuel_F",0,150000,20000,500,1],
["B_Truck_01_ammo_F",0,40000,10000,500,1],
["I_Truck_02_ammo_F",0,80000,20000,500,1],
//HELI
["B_Heli_Light_01_F",500,20000,15000,500,1],
["O_Heli_Light_02_unarmed_F",500,40000,30000,500,1],
["O_Heli_Transport_04_medevac_F",0,15000,5000,500,1],
["C_Heli_Light_01_civil_F",500,40000,20000,500,1],
["I_Heli_Transport_02_F",1000,40000,50000,500,1],
["I_Heli_light_03_unarmed_F",1000,40000,50000,500,1],
["O_Heli_Transport_04_bench_F",1000,80000,60000,500,1],
["O_Heli_Transport_04_covered_F",1000,150000,70000,500,1],
["O_Heli_Transport_04_box_F",1000,150000,70000,500,1],
["B_Heli_Transport_01_F",1000,100000,50000,500,1],
["I_Heli_light_03_F",1000,100000,50000,500,1],
["O_Heli_Transport_04_repair_F",0,90000,40000,500,1],
["B_Heli_Transport_01_camo_F",20000,2000000,500000,500,1],
["B_Heli_Transport_03_unarmed_F",1000,50000,50000,500,1],
["B_Heli_Transport_03_unarmed_green_F",5000,900000,400000,500,1],
["B_Heli_Attack_01_F",5000,400000,200000,500,1],
["O_Heli_Attack_02_F",5000,1000000,500000,500,1],
["O_Heli_Attack_02_black_F",5000,300000,100000,500,1],
//BATEAU
["C_Rubberboat",200,1000,1000,500,1],
["C_Boat_Civil_01_F",200,5000,5000,500,1],
["C_Boat_Civil_01_rescue_F",200,35000,10000,500,1],
["B_SDV_01_F",500,5000,5000,500,1],
["B_Boat_Armed_01_minigun_F",1000,150000,50000,500,1],
["I_Boat_Armed_01_minigun_F",1000,40000,20000,500,1],
["B_Boat_Transport_01_F",0,1000,1000,500,1],
["O_Boat_Transport_01_F",0,5000,5000,500,1],
["C_Boat_Civil_01_police_F",0,4000,4000,500,1],
["O_SDV_01_F",0,5000,5000,500,1],
//ARME
["O_Boat_Armed_01_hmg_F",2000,20000,10000,500,1],
["B_G_Boat_Transport_01_F",2000,8000,5000,500,1],
["O_G_Offroad_01_armed_F",5000,100000,100000,500,1],
["I_G_Offroad_01_armed_F",5000,100000,100000,500,1],
["B_G_Offroad_01_armed_F",5000,100000,100000,500,1],
["B_MRAP_01_F",0,20000,20000,500,1],
["O_MRAP_02_F",5000,300000,100000,500,1],
["I_MRAP_03_F",5000,100000,200000,500,1],
["B_MRAP_01_hmg_F",10000,200000,200000,500,1],
["B_APC_Wheeled_01_cannon_F",100000,90000,9999999,500,1]
];
CONST(ANL_vehicules,ANL_vehicules);