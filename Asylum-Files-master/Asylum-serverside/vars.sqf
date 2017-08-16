life_gangbank_cap = 100000;
life_dispatchTasks = [];
life_isRebooting = false;
life_animals_spawned = false;
life_animals_spawned_time = -500;
life_animals_array = [];
life_storage_array = [];
life_update_buffer = [];
life_configuration = [];
life_configuration_last = [];
life_dispatchUsers = [];
life_max_players = 100;
life_restart_delay = 9000;
publicVariable "life_restart_delay";
life_server_training = false;
life_server_instance = profileNamespace getVariable ["server_instance",1];
life_server_port = -1;
life_scanned_houses = [];
life_server_gangs = [];
life_server_gangs_queue = [];
life_server_gang_groups = [];
life_join_queue = [];
life_dispatcher = objNull;
srv_table_players = switch (worldName) do { case "Australia": { "players_aus" }; default { "players" }; };
srv_table_wanted = switch (worldName) do { case "Australia": { "wanted_aus" }; default { "wanted" }; };
srv_table_vehicles = switch (worldName) do { case "Australia": { "vehicles_aus" }; case "Stratis": { "vehicles_strat" }; case "Tanoa": { "vehicles_tanoa" }; default { "vehicles" }; };
publicVariable "life_dispatcher";
life_dispatchWaypoints = [];
life_capture_changed = [];
life_capture_containers = [];
life_lastWeather = [0,0,0,0];
life_gang_banks = [];
life_house_owners = []; 
HC_UID = 0;
life_HC = false;
life_wanted = 0;
life_past_APB = [];
life_coca_leaves = 0;
publicVariable "life_coca_leaves";
life_active_football = [];
life_bank_funds = 10000;
life_connected = [];
life_disconnects = [];
life_topWealth = [];
life_trial_votes = 0;
life_laser_queue = [];
life_restrained_players = [];
life_laser_players = [];
life_swat_instance = 0;
life_swat_deployed = false;
life_swat_officers = [];
life_swat_active = [];
life_laser_inprogress = false;
life_laser_group_blue = grpNull;
life_laser_group_red = grpNull;
life_animal_group = createGroup Civilian;
publicVariable "life_laser_group_blue";
publicVariable "life_laser_group_red";
publicVariable "life_animal_group";
life_laser_group1 = (createGroup civilian);
life_laser_group2 = (createGroup civilian);
life_lastPrison = -1000;
life_active_turf = -1;
publicVariable "life_lastPrison";
publicVariable "life_active_turf";
life_karaoke = "";
publicVariable "life_karaoke";
life_active_event = [];
publicVariable "life_active_event";

DB_Async_Active = false;
DB_Async_ExtraLock = false;

life_capture_list =
[
["Arms Dealer", "0", 0, -2100, true, "life_inv_dirty_money", 0],		
["Drug Cartel", "0", 0, -2100, true, "life_inv_dirty_money", 0],
["Oil Cartel", "0", 0, -2100, false, "life_inv_rubber", 0],
["Wong Triad", "0", 0, -2100, false, "life_inv_dirty_money", 0]
];
life_capture_old = life_capture_list;
publicVariable "life_capture_list";

life_turf_list = switch (worldName) do
{
case "Altis": {
[
["Rodopoli", "0", "Contested"],		
["Zaros", "0", "Contested"],
["Panagia", "0", "Contested"]
];
};
case "Tanoa": {
[
["Nandai", "0", "Contested"],
["Moddergat", "0", "Contested"],
["Lakatoro", "0", "Contested"]
];
};
case "Australia": {
[
["Tailem Bend", "0", "Contested"],
["Willcania", "0", "Contested"],
["Broken Hill", "0", "Contested"]
];
};
default {
[
["Rodopoli", "0", "Contested"],	
["Zaros", "0", "Contested"]
];
};
};
life_capture_old = life_turf_list;
publicVariable "life_turf_list";

life_last_broadcast = -3000;
publicVariable "life_last_broadcast";

life_trial_jury = [];
life_trial_inprogress = false;
publicVariable "life_trial_inprogress";

life_bank_spawns = switch (worldName) do
{
case "Stratis": { [[1609.52,5177.26,6.23029],[1609.62,5174.75,6.09425],[1604.09,5150.38,6.23029],[1603.93,5152.89,6.23029],[1660.5,5112.94,6.23029],[1656.51,5091.67,6.23029],[1654.33,5089.76,6.23029],[1595.9,5066.33,6.10311],[1594.33,5061.43,6.10311],[1589.67,5068.47,6.10311],[1588.56,5064.72,8.70311],[1567.81,5130.07,6.10311],[1565.93,5124.87,6.10311],[1560.04,5124.99,6.10311],[1563.54,5130.41,8.70311]] };
case "Altis": { [[16145.5,16948.9,13.9942],[16147.6,16947.3,13.9892],[16148.1,16949.4,13.8519],[16165.5,16970.3,13.8247],[16068.7,16912,14.0727],[16074.3,16913.8,16.5885],[16075.6,16919.3,14.0616],[16015.2,16960,14.4047],[16013.4,16958.5,14.4085],[16014.6,16957.1,14.2699],[16014.9,16959.9,14.4054],[16028.5,17047.5,14.0661],[16017.1,17028.2,16.5607],[16023.3,17022.9,13.9512],[16014.7,17062.3,13.9901],[16005.2,17031.9,14.1631],[16007.1,17037.9,14.1605],[16094.5,17083.4,14.21],[16091.5,17095,14.068],[16095.6,17073,14.2049],[16071.4,17088,14.2217],[16156.1,17042.3,14.1817],[16153.7,17044.6,14.0457],[16156.4,17041.2,14.1817],[16018.7,16853.1,14.9652],[16010.9,16854.5,17.5652]] };
case "Australia": { [[19732,24333,19.2],[19727,24339,21.7],[19778,24301,21.7],[19782,24296,19.2],[19901,24302,19.2],[19917,24287,19.2],[19973,24243,19.2],[19957,24258,19.2]] };
};
life_prison_inProgress = false;
publicVariable "life_prison_inProgress";
life_bank_inProgress = false;
publicVariable "life_bank_inProgress";
life_bank_robbers = [];
publicVariable "life_bank_robbers";

life_race1 = 0;
life_race2 = 0;
life_race3 = 0;
life_race4 = 0;
life_race5 = 0;
publicVariable "life_race1";
publicVariable "life_race2";
publicVariable "life_race3";
publicVariable "life_race4";
publicVariable "life_race5";
life_racers = [[],[],[],[]];