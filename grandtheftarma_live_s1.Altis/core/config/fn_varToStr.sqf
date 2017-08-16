/*
	File: fn_varToStr.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Takes the long-name (variable) and returns a display name for our
	virtual item.
*/
private["_var"];
_var = [_this,0,"",[""]] call GTA_fnc_param;
if(_var == "") exitWith {""};

switch (_var) do
{
	//Virtual Inventory Items
	case "life_inv_roadcone": { "Road Cone" };
	case "life_inv_roadcone_l": { "Road Cone (Light)" };
	case "life_inv_bargate": { "Bargate" };
	case "life_inv_safetybarrier": { "Safety Barrier" };
	case "life_inv_plasticbarrier_l": { "Plastic Barrier (Large)" };
	case "life_inv_plasticbarrier_m": { "Plastic Barrier (Medium)" };
	case "life_inv_cargohouse_g": { "Cargo House (Green)" };
	case "life_inv_cargohouse_b": { "Cargo House (Brown)" };
	case "life_inv_cargopost_g": { "Cargo Post (Green)" };
	case "life_inv_cargopost_b": { "Cargo Post (Brown)" };
	case "life_inv_cargohq_g": { "Cargo HQ (Green)" };
	case "life_inv_cargohq_b": { "Cargo HQ (Brown)" };
	case "life_inv_cargotower_g": { "Cargo Tower (Green)" };
	case "life_inv_cargotower_b": { "Cargo Tower (Brown)" };
	case "life_inv_portablelight_s": { "Portable Light (Single)" };
	case "life_inv_portablelight_d": { "Portable Light (Double)" };
	case "life_inv_roadsign": { "Road Sign" };
	case "life_inv_tapebarrier": { "Tape Barrier" };

	case "life_inv_streetlamp": { "Street Lamp" };
	case "life_inv_concretebarrier_s": { "Concrete Barrier (Short)" };
	case "life_inv_concretebarrier_l": { "Concrete Barrier (Long)" };

	case "life_inv_target1_pop": { "Enemy Target (Pop-Up)" };
	case "life_inv_target1": { "Enemy Target" };
	case "life_inv_target2_pop": { "Sniper Target (Pop-Up)" };
	case "life_inv_target2": { "Sniper Target" };
	case "life_inv_target3_pop": { "Hostage Target (Pop-Up)" };
	case "life_inv_target3": { "Hostage Target" };
	case "life_inv_target4_pop": { "Oval Target (Pop-Up)" };
	case "life_inv_target4": { "Oval Target" };
	case "life_inv_shoot_house_stand": { "Shooting House (Stand)" };
	case "life_inv_shoot_house_crouch": { "Shooting House (Crouch)" };
	case "life_inv_shoot_house_prone": { "Shooting House (Prone)" };

	case "life_inv_present": {"XP Reward (Use Item)"};
	case "life_inv_team_red": {"Red Team (Use Item)"};
	case "life_inv_team_blue": {"Blue Team (Use Item)"};
	case "life_inv_cream": {"Ice Cream"};

	case "life_inv_pickaxe": {"Pickaxe"};

	case "life_inv_ration_small": {"Ration Pack (Small)"};
	case "life_inv_ration_big": {"Ration Pack (Big)"};
	case "life_inv_redgull": {"Redbull"};
	case "life_inv_water": {"Water"};
	case "life_inv_coffee": {"Coffee"};
	case "life_inv_donuts": {"Crumpet"};
	case "life_inv_rabbit": {"Rabbit Meat"};
	case "life_inv_tobacco": {"Candy Cane"};
	case "life_inv_salad": {"Salad"};
	case "life_inv_bubblegum": {"Bubblegum"};
	case "life_inv_kitkat": {"Kit Kat"};
	case "life_inv_tbacon": {"Bacon Sandwich"};
	case "life_inv_turtlesoup": {"Turtle Soup"};

	case "life_inv_kfc_popcorn": {"Popcorn Chicken"};
	case "life_inv_kfc_wings": {"Chicken Wings"};
	case "life_inv_kfc_bucket": {"Bargain Bucket"};
	case "life_inv_kfc_pepsi": {"Pepsi"};

	case "life_inv_kebab": {"Fat Greasy Kebab"};
	case "life_inv_tea": {"Tea"};

	case "life_inv_greggs_sausageroll": {"Sausage Roll"};
	case "life_inv_greggs_pasty": {"Pasty"};
	case "life_inv_greggs_steakbake": {"Steak Bake"};
	case "life_inv_greggs_sausagebean": {"Sausage and Bean Melt"};
	case "life_inv_greggs_cheesebacon": {"Cheese and Bacon Wrap"};

	case "life_inv_apple": {"Apple"};
	case "life_inv_peach": {"Peach"};
	case "life_inv_watermelon": {"Watermelon"};

	case "life_inv_underwatercharge": {"Underwater Charge"};
	case "life_inv_blastingcharge": {"Blasting Charge"};
	case "life_inv_boltcutter": {"Bolt Cutter"};
	case "life_inv_defusekit": {"Defuse Kit"};
	case "life_inv_lockpick": {"Lockpick"};
	case "life_inv_snapgun": {"Snap Gun"};
	case "life_inv_spikeStrip": {"Spike Strip"};
	case "life_inv_zipties": {"Cuffs"};
	case "life_inv_fuelE": {"Emtpy Fuel Can"};
	case "life_inv_fuelF": {"Full Fuel Can"};
	case "life_inv_storagesmall": {"Storage Container (Small)"};
	case "life_inv_storagebig": {"Storage Container (Big)"};
	case "life_inv_drill": { "Drill" };

	case "life_inv_heroin_u": {"Unprocessed Heroin"};
	case "life_inv_heroin_p": {"Processed Heroin"};
	case "life_inv_cannabis": {"Cannabis"};
	case "life_inv_marijuana": {"Marijuana"};
	case "life_inv_cocaine_u": {"Unprocessed Cocaine"};
	case "life_inv_cocaine_p": {"Processed Cocaine"};
	case "life_inv_oil_u": {"Unprocessed Oil"};
	case "life_inv_oil_p": {"Processed Oil"};
	case "life_inv_cmeth_u_1": {"Ephedrine"};
	case "life_inv_cmeth_u_2": {"Phenylacetic Acid"};
	case "life_inv_cmeth_u_3": {"Methylamine"};
	case "life_inv_cmeth_p": {"Blue Crystal Meth"};
	case "life_inv_goldbar": {"Gold Bar"};
	case "life_inv_moneybag": {"Bag of Money"};

	case "life_inv_sugar_u": {"Sugarcane"};
	case "life_inv_sugar_p": {"Refined Sugar"};
	case "life_inv_rice_u": {"Rice Plant"};
	case "life_inv_rice_p": {"Rice Grains"};
	case "life_inv_copper_u": {"Copper Ore"};
	case "life_inv_copper_p": {"Copper Ingot"};
	case "life_inv_iron_u": {"Iron Ore"};
	case "life_inv_iron_p": {"Iron Ingot"};
	case "life_inv_silver_u": {"Silver ore"};
	case "life_inv_silver_p": {"Silver bar"};
	case "life_inv_sand": {"Sand"};
	case "life_inv_glass": {"Glass"};
	case "life_inv_rock": {"Rock"};
	case "life_inv_cement": {"Cement Bag"};
	case "life_inv_salt_u": {"Salt"};
	case "life_inv_salt_p": {"Refined Salt"};
	case "life_inv_diamond_u": {"Uncut Diamonds"};
	case "life_inv_diamond_p": {"Cut Diamonds"};
	case "life_inv_goldbarp": {"Gold Scrap"};

	case "life_inv_salema": {"Selema"};
	case "life_inv_ornate": {"Ornate Meat"};
	case "life_inv_mackerel": {"Mackerel"};
	case "life_inv_tuna": {"Tuna"};
	case "life_inv_mullet": {"Mullet"};
	case "life_inv_catshark": {"Cat Shark"};
	case "life_inv_turtle": {"Turtle"};

	case "life_inv_mash": {"Grain Mash Mixture"};
	case "life_inv_yeast": {"Yeast"};
	case "life_inv_rye": {"Rye"};
	case "life_inv_hops": {"Hops"};

	case "life_inv_axe": {"Axe"};
	case "life_inv_wood_u": {"Logs"};
	case "life_inv_wood_p": {"Planks"};

  case "life_inv_naturalgas": {"Natural Gas"};
  case "life_inv_propane": {"Propane"};

	case "life_inv_bottles": {"Glass Bottles"};
	case "life_inv_cornmeal": {"Cornmeal Grains"};

	case "life_inv_beerp": {"Fermented Beer"};
	case "life_inv_bottledbeer": {"Bottled Beer"};
	case "life_inv_whiskey": {"Distilled Whiskey"};
	case "life_inv_bottledwhiskey": {"Bottled Whiskey"};
	case "life_inv_moonshine": {"Distilled Moonshine"};
	case "life_inv_bottledshine": {"Bottled Moonshine"};

	//License Block
	case "license_civ_home": {"Home Owners License"};
	case "license_civ_driver": {"Driver License"};
	case "license_civ_truck": {"Truck License"};
	case "license_civ_boat": {"Boating License"};
	case "license_civ_dive": {"Scuba Diving Certificate"};
	case "license_civ_air": {"Helicopter License"};
	case "license_civ_jet": {"Jet License"};
	case "license_civ_event": {"Event License"};
	case "license_civ_press": {"Press License"};
	case "license_civ_taxi": {"Metro Taxi Service"};

	case "license_civ_gun": {"Firearm License"};
	case "license_civ_rebel": {"Rebel Training"};
	case "license_civ_advrebel": {"Advanced Rebel Training"};
	case "license_civ_bomb": {"Demolition Training"};

	case "license_civ_copper": {"Copper Training"};
	case "license_civ_iron": {"Iron Training"};
	case "license_civ_silver": {"Silver Training"};
	case "license_civ_sugar": {"Sugar Training"};
	case "license_civ_rice": {"Rice Training"};
	case "license_civ_sand": {"Sand Training"};
	case "license_civ_cement": {"Cement Training"};
	case "license_civ_salt": {"Salt Training"};
	case "license_civ_diamond": {"Diamond Training"};
	case "license_civ_wood": {"Lumberjack Training"};
  case "license_civ_gas": {"Natural Gas Training"};

	case "license_civ_beer": {"Beer Training"};
	case "license_civ_whiskey": {"Whiskey Training"};
	case "license_civ_bootleg": {"Bootleg Training"};

	case "license_civ_heroin": {"Heroin Training"};
	case "license_civ_marijuana": {"Marijuana Training"};
	case "license_civ_coke": {"Cocaine Training"};
	case "license_civ_oil": {"Oil Training"};
	case "license_civ_cmeth": {"Meth Training"};

	case "license_cop_sru": {"Strategic Response Unit"};
	case "license_cop_npas": {"National Police Air Service"};
	case "license_cop_dmt": {"Designated Marksman Team"};
	case "license_cop_mpu": {"Marine Policing Unit"};

  case "license_cop_kav": {"Kavala Police"};
	case "license_cop_pyr": {"Pyrgos Police"};
	case "license_cop_ath": {"Athira Police"};
	case "license_cop_rpu": {"Road Policing Unit"};
};
