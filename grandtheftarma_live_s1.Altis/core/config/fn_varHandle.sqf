/*
	File: fn_varHandle.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Master handler for getting a variables name, short name, etc.
*/
private["_var","_mode"];
_var = [_this,0,"",[""]] call GTA_fnc_param;
_mode = [_this,1,-1,[0]] call GTA_fnc_param;
if(_var == "" OR _mode == -1) exitWith {""};

switch (_mode) do
{
	case 0:
	{
		switch (_var) do
		{
			case "oil_u": {"life_inv_oil_u"};
			case "oil_p": {"life_inv_oil_p"};
			case "cmeth_u_1": {"life_inv_cmeth_u_1"};
			case "cmeth_u_2": {"life_inv_cmeth_u_2"};
			case "cmeth_u_3": {"life_inv_cmeth_u_3"};
			case "cmeth_p": {"life_inv_cmeth_p"};
			case "heroin_u": {"life_inv_heroin_u"};
			case "heroin_p": {"life_inv_heroin_p"};
			case "cannabis": {"life_inv_cannabis"};
			case "marijuana": {"life_inv_marijuana"};
			case "apple": {"life_inv_apple"};
			case "water": {"life_inv_water"};
			case "rabbit": {"life_inv_rabbit"};
			case "salema": {"life_inv_salema"};
			case "ornate": {"life_inv_ornate"};
			case "mackerel": {"life_inv_mackerel"};
			case "tuna": {"life_inv_tuna"};
			case "mullet": {"life_inv_mullet"};
			case "catshark": {"life_inv_catshark"};
			case "turtle": {"life_inv_turtle"};
			case "fishing": {"life_inv_fishingpoles"};
			case "coffee": {"life_inv_coffee"};
			case "turtlesoup": {"life_inv_turtlesoup"};
			case "donuts": {"life_inv_donuts"};
			case "fuelE": {"life_inv_fuelE"};
			case "fuelF": {"life_inv_fuelF"};
			case "money": {"GTA_money_cash"};
			case "pickaxe": {"life_inv_pickaxe"};
			case "copper_u": {"life_inv_copper_u"};
			case "copper_p": {"life_inv_copper_p"};
			case "iron_u": {"life_inv_iron_u"};
			case "iron_p": {"life_inv_iron_p"};
			case "salt_u": {"life_inv_salt_u"};
			case "salt_p": {"life_inv_salt_p"};
			case "sugar_u": {"life_inv_sugar_u"};
			case "sugar_p": {"life_inv_sugar_p"};
			case "rice_u": {"life_inv_rice_u"};
			case "rice_p": {"life_inv_rice_p"};
			case "sand": {"life_inv_sand"};
			case "glass": {"life_inv_glass"};
			case "tbacon": {"life_inv_tbacon"};
			case "lockpick": {"life_inv_lockpick"};
			case "snapgun": {"life_inv_snapgun"};
			case "redgull": {"life_inv_redgull"};
			case "peach": {"life_inv_peach"};
			case "diamond_u": {"life_inv_diamond_u"};
			case "diamond_p": {"life_inv_diamond_p"};
			case "cocaine_u": {"life_inv_cocaine_u"};
			case "cocaine_p": {"life_inv_cocaine_p"};
			case "spikeStrip": {"life_inv_spikeStrip"};
			case "cement": {"life_inv_cement"};
			case "rock": {"life_inv_rock"};
			case "goldbar": {"life_inv_goldbar"};
			case "moneybag": { "life_inv_moneybag" };
			case "blastingcharge": {"life_inv_blastingcharge"};
			case "boltcutter": {"life_inv_boltcutter"};
			case "defusekit": {"life_inv_defusekit"};
			case "storagesmall": {"life_inv_storagesmall"};
			case "storagebig": {"life_inv_storagebig"};
			case "drill": {"life_inv_drill"};
			case "rye": {"life_inv_rye"};
			case "hops": {"life_inv_hops"};
			case "yeast": {"life_inv_yeast"};
			case "cornmeal": {"life_inv_cornmeal"};
			case "moonshine": {"life_inv_moonshine"};
			case "bottles": {"life_inv_bottles"};
			case "bottledshine": {"life_inv_bottledshine"};
			case "bottledbeer": {"life_inv_bottledbeer"};
			case "bottledwhiskey": {"life_inv_bottledwhiskey"};
			case "beerp": {"life_inv_beerp"};
			case "whiskey": {"life_inv_whiskey"};
			case "mash": {"life_inv_mash"};
			case "zipties": {"life_inv_zipties"};
			case "goldbarp": {"life_inv_goldbarp"};
			case "underwatercharge": {"life_inv_underwatercharge"};
			case "silver_u": {"life_inv_silver_u"};
			case "silver_p": {"life_inv_silver_p"};
			case "watermelon": {"life_inv_watermelon"};
			case "tobacco": {"life_inv_tobacco"};
			case "salad": {"life_inv_salad"};
			case "bubblegum": {"life_inv_bubblegum"};
			case "kitkat": {"life_inv_kitkat"};
			case "present": {"life_inv_present"};
			case "team_red": {"life_inv_team_red"};
			case "team_blue": {"life_inv_team_blue"};
			case "cream": {"life_inv_cream"};
			case "ration_small": {"life_inv_ration_small"};
			case "ration_big": {"life_inv_ration_big"};
			case "kfc_popcorn": {"life_inv_kfc_popcorn"};
			case "kfc_wings": {"life_inv_kfc_wings"};
			case "kfc_bucket": {"life_inv_kfc_bucket"};
			case "kfc_pepsi": {"life_inv_kfc_pepsi"};

			case "kebab": {"life_inv_kebab"};
			case "tea": {"life_inv_tea"};

			case "axe": {"life_inv_axe"};
			case "wood_u": {"life_inv_wood_u"};
			case "wood_p": {"life_inv_wood_p"};

      case "naturalgas": {"life_inv_naturalgas"};
      case "propane": {"life_inv_propane"};

			case "greggs_sausageroll": {"life_inv_greggs_sausageroll"};
			case "greggs_pasty": {"life_inv_greggs_pasty"};
			case "greggs_steakbake": {"life_inv_greggs_steakbake"};
			case "greggs_sausagebean": {"life_inv_greggs_sausagebean"};
			case "greggs_cheesebacon": {"life_inv_greggs_cheesebacon"};

			case "roadcone": { "life_inv_roadcone" };
			case "roadcone_l": { "life_inv_roadcone_l" };
			case "bargate": { "life_inv_bargate" };
			case "safetybarrier": { "life_inv_safetybarrier" };
			case "plasticbarrier_l": { "life_inv_plasticbarrier_l" };
			case "plasticbarrier_m": { "life_inv_plasticbarrier_m" };
			case "cargohouse_g": { "life_inv_cargohouse_g" };
			case "cargohouse_b": { "life_inv_cargohouse_b" };
			case "cargopost_g": { "life_inv_cargopost_g" };
			case "cargopost_b": { "life_inv_cargopost_b" };
			case "cargohq_g": { "life_inv_cargohq_g" };
			case "cargohq_b": { "life_inv_cargohq_b" };
			case "cargotower_g": { "life_inv_cargotower_g" };
			case "cargotower_b": { "life_inv_cargotower_b" };
			case "portablelight_s": { "life_inv_portablelight_s" };
			case "portablelight_d": { "life_inv_portablelight_d" };
			case "roadsign": { "life_inv_roadsign" };
			case "tapebarrier": { "life_inv_tapebarrier" };

			case "streetlamp": { "life_inv_streetlamp" };
			case "concretebarrier_s": { "life_inv_concretebarrier_s" };
			case "concretebarrier_l": { "life_inv_concretebarrier_l" };

			case "target1_pop": { "life_inv_target1_pop" };
			case "target1": { "life_inv_target1" };
			case "target2_pop": { "life_inv_target2_pop" };
			case "target2": { "life_inv_target2" };
			case "target3_pop": { "life_inv_target3_pop" };
			case "target3": { "life_inv_target3" };
			case "target4_pop": { "life_inv_target4_pop" };
			case "target4": { "life_inv_target4" };
			case "shoot_house_stand": { "life_inv_shoot_house_stand" };
			case "shoot_house_crouch": { "life_inv_shoot_house_crouch" };
			case "shoot_house_prone": { "life_inv_shoot_house_prone" };

		};
	};

	case 1:
	{
		switch (_var) do
		{
			case "life_inv_oil_u": {"oil_u"};
			case "life_inv_oil_p": {"oil_p"};
			case "life_inv_cmeth_u_1": {"cmeth_u_1"};
			case "life_inv_cmeth_u_2": {"cmeth_u_2"};
			case "life_inv_cmeth_u_3": {"cmeth_u_3"};
			case "life_inv_cmeth_p": {"cmeth_p"};
			case "life_inv_heroin_u": {"heroin_u"};
			case "life_inv_heroin_p": {"heroin_p"};
			case "life_inv_cannabis": {"cannabis"};
			case "life_inv_marijuana": {"marijuana"};
			case "life_inv_apple": {"apple"};
			case "life_inv_water": {"water"};
			case "life_inv_rabbit": {"rabbit"};
			case "life_inv_salema": {"salema"};
			case "life_inv_ornate": {"ornate"};
			case "life_inv_mackerel": {"mackerel"};
			case "life_inv_tuna": {"tuna"};
			case "life_inv_mullet": {"mullet"};
			case "life_inv_catshark": {"catshark"};
			case "life_inv_turtle": {"turtle"};
			case "life_inv_fishingpoles": {"fishing"};
			case "life_inv_coffee": {"coffee"};
			case "life_inv_turtlesoup": {"turtlesoup"};
			case "life_inv_donuts": {"donuts"};
			case "life_inv_fuelE": {"fuelE"};
			case "life_inv_fuelF": {"fuelF"};
			case "GTA_money_cash": {"money"};
			case "life_inv_pickaxe": {"pickaxe"};
			case "life_inv_copper_u": {"copper_u"};
			case "life_inv_iron_u": {"iron_u"};
			case "life_inv_iron_p": {"iron_p"};
			case "life_inv_copper_p": {"copper_p"};
			case "life_inv_sand": {"sand"};
			case "life_inv_sugar_u": {"sugar_u"};
			case "life_inv_sugar_p": {"sugar_p"};
			case "life_inv_rice_u": {"rice_u"};
			case "life_inv_rice_p": {"rice_p"};
			case "life_inv_salt_u": {"salt_u"};
			case "life_inv_glass": {"glass"};
			case "life_inv_redgull": {"redgull"};
			case "life_inv_lockpick": {"lockpick"};
			case "life_inv_snapgun": {"snapgun"};
			case "life_inv_tbacon": {"tbacon"};
			case "life_inv_peach": {"peach"};
			case "life_inv_diamond_u": {"diamond_u"};
			case "life_inv_diamond_p": {"diamond_p"};
			case "life_inv_salt_p": {"salt_p"};
			case "life_inv_cocaine_u": {"cocaine_u"};
			case "life_inv_cocaine_p": {"cocaine_p"};
			case "life_inv_spikeStrip": {"spikeStrip"};
			case "life_inv_cement": {"cement"};
			case "life_inv_rock": {"rock"};
			case "life_inv_goldbar": {"goldbar"};
			case "life_inv_moneybag": { "moneybag" };
			case "life_inv_blastingcharge": {"blastingcharge"};
			case "life_inv_boltcutter": {"boltcutter"};
			case "life_inv_defusekit": {"defusekit"};
			case "life_inv_storagesmall": {"storagesmall"};
			case "life_inv_storagebig": {"storagebig"};
			case "life_inv_drill": {"drill"};
			case "life_inv_mash": {"mash"};
			case "life_inv_yeast": {"yeast"};
			case "life_inv_rye": {"rye"};
			case "life_inv_hops": {"hops"};
			case "life_inv_whiskey": {"whiskey"};
			case "life_inv_beerp": {"beerp"};
			case "life_inv_bottles": {"bottles"};
			case "life_inv_cornmeal": {"cornmeal"};
			case "life_inv_bottledwhiskey": {"bottledwhiskey"};
			case "life_inv_bottledbeer": {"bottledbeer"};
			case "life_inv_bottledshine": {"bottledshine"};
			case "life_inv_moonshine": {"moonshine"};
			case "life_inv_zipties": {"zipties"};
			case "life_inv_goldbarp": {"goldbarp"};
			case "life_inv_underwatercharge": {"underwatercharge"};
			case "life_inv_silver_u": {"silver_u"};
			case "life_inv_silver_p": {"silver_p"};
			case "life_inv_watermelon": {"watermelon"};
			case "life_inv_tobacco": {"tobacco"};
			case "life_inv_salad": {"salad"};
			case "life_inv_bubblegum": {"bubblegum"};
			case "life_inv_kitkat": {"kitkat"};
			case "life_inv_present": {"present"};
			case "life_inv_team_red": {"team_red"};
			case "life_inv_team_blue": {"team_blue"};
			case "life_inv_cream": {"cream"};
			case "life_inv_ration_small": {"ration_small"};
			case "life_inv_ration_big": {"ration_big"};

			case "life_inv_axe": {"axe"};
			case "life_inv_wood_u": {"wood_u"};
			case "life_inv_wood_p": {"wood_p"};

      case "life_inv_naturalgas": {"naturalgas"};
      case "life_inv_propane": {"propane"};

			case "life_inv_kfc_popcorn": {"kfc_popcorn"};
			case "life_inv_kfc_wings": {"kfc_wings"};
			case "life_inv_kfc_bucket": {"kfc_bucket"};
			case "life_inv_kfc_pepsi": {"kfc_pepsi"};

			case "life_inv_kebab": {"kebab"};
			case "life_inv_tea": {"tea"};

			case "life_inv_greggs_sausageroll": {"greggs_sausageroll"};
			case "life_inv_greggs_pasty": {"greggs_pasty"};
			case "life_inv_greggs_steakbake": {"greggs_steakbake"};
			case "life_inv_greggs_sausagebean": {"greggs_sausagebean"};
			case "life_inv_greggs_cheesebacon": {"greggs_cheesebacon"};

			case "life_inv_roadcone": { "roadcone" };
			case "life_inv_roadcone_l": { "roadcone_l" };
			case "life_inv_bargate": { "bargate" };
			case "life_inv_safetybarrier": { "safetybarrier" };
			case "life_inv_plasticbarrier_l": { "plasticbarrier_l" };
			case "life_inv_plasticbarrier_m": { "plasticbarrier_m" };
			case "life_inv_cargohouse_g": { "cargohouse_g" };
			case "life_inv_cargohouse_b": { "cargohouse_b" };
			case "life_inv_cargopost_g": { "cargopost_g" };
			case "life_inv_cargopost_b": { "cargopost_b" };
			case "life_inv_cargohq_g": { "cargohq_g" };
			case "life_inv_cargohq_b": { "cargohq_b" };
			case "life_inv_cargotower_g": { "cargotower_g" };
			case "life_inv_cargotower_b": { "cargotower_b" };
			case "life_inv_portablelight_s": { "portablelight_s" };
			case "life_inv_portablelight_d": { "portablelight_d" };
			case "life_inv_roadsign": { "roadsign" };
			case "life_inv_tapebarrier": { "tapebarrier" };

			case "life_inv_streetlamp": { "streetlamp" };
			case "life_inv_concretebarrier_s": { "concretebarrier_s" };
			case "life_inv_concretebarrier_l": { "concretebarrier_l" };

			case "life_inv_target1_pop": { "target1_pop" };
			case "life_inv_target1": { "target1" };
			case "life_inv_target2_pop": { "target2_pop" };
			case "life_inv_target2": { "target2" };
			case "life_inv_target3_pop": { "target3_pop" };
			case "life_inv_target3": { "target3" };
			case "life_inv_target4_pop": { "target4_pop" };
			case "life_inv_target4": { "target4" };
			case "life_inv_shoot_house_stand": { "shoot_house_stand" };
			case "life_inv_shoot_house_crouch": { "shoot_house_crouch" };
			case "life_inv_shoot_house_prone": { "shoot_house_prone" };

		};
	};
};
