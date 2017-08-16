/*
	File: fn_varHandle.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Master handler for getting a variables name, short name, etc.
*/
private["_var","_mode"];
_var = param [0,"",[""]];
_mode = param [1,-1,[0]];
if(_var == "" OR _mode == -1) exitWith {""};

switch (_mode) do
{
	case 0:
	{
		switch (_var) do
		{
			// AWS START
			case "tourniquet": {"lhm_inv_tourniquet"};
			case "Israeli_bandage": {"lhm_inv_Israeli_bandage"};
			case "combat_gauze": {"lhm_inv_combat_gauze"};
			case "druckverband": {"lhm_inv_druckverband"};
			case "morphin": {"lhm_inv_morphin"};
			case "tabletten": {"lhm_inv_tabletten"};
			case "schiene": {"lhm_inv_schiene"};
// AWS END
//LHM Alcohol Start
			case "rye": {"lhm_inv_rye"};
			case "hops": {"lhm_inv_hops"};
			case "yeast": {"lhm_inv_yeast"};
			case "cornmeal": {"lhm_inv_cornmeal"};
			case "moonshine": {"lhm_inv_moonshine"};
			case "bottles": {"lhm_inv_bottles"};
			case "bottledshine": {"lhm_inv_bottledshine"};
			case "bottledbeer": {"lhm_inv_bottledbeer"};
			case "bottledwhiskey": {"lhm_inv_bottledwhiskey"};
			case "beerp": {"lhm_inv_beerp"};
			case "whiskey": {"lhm_inv_whiskey"};
			case "mash": {"lhm_inv_mash"};
//LHM Alcohol End
			case "tracker": {"lhm_inv_tracker"}; //GPS TRACKER
			case "tracker2": {"lhm_inv_tracker2"}; //GPS TRACKER fuer cops
// kippen start
			case "lzigarette": {"lhm_inv_lzigarette"};
			case "krauser": {"lhm_inv_krauser"};
			case "rooth": {"lhm_inv_rooth"};
			case "malle": {"lhm_inv_malle"};
			case "stoivesant": {"lhm_inv_stoivesant"};
//kippen end
			case "roadbarrier1": {"lhm_inv_roadbarrier1"};  //roadbarrier
			case "roadcone1": {"lhm_inv_roadcone1"};  //roadcone
			case "card": {"lhm_inv_card"};  //Rubbel-LOS
			case "protest": {"lhm_inv_protest"};  //Protest Sign
			case "sensor": {"lhm_inv_sensor"}; //Bewegungsmelder
			case "sensor1": {"lhm_inv_sensor1"}; //Bewegungsmelder
			case "graffiti": {"lhm_inv_graffiti"}; //Bewegungsmelder
			case "geocatch": {"lhm_inv_geocatch"};
			case "gas": {"lhm_inv_gas"};
			case "hacken": {"lhm_inv_hacken"};
			case "woodu": {"lhm_inv_woodu"};
			case "woodp": {"lhm_inv_woodp"};
			case "axe": {"lhm_inv_axe"};
			case "egg": {"lhm_inv_egg"};
			case "oilu": {"lhm_inv_oilu"};
			case "oilp": {"lhm_inv_oilp"};
			case "heroinu": {"lhm_inv_heroinu"};
			case "heroinp": {"lhm_inv_heroinp"};
			case "cannabis": {"lhm_inv_cannabis"};
			case "marijuana": {"lhm_inv_marijuana"};
			case "apple": {"lhm_inv_apple"};
			case "water": {"lhm_inv_water"};
			case "rabbit": {"lhm_inv_rabbit"};
			case "salema": {"lhm_inv_salema"};
			case "ornate": {"lhm_inv_ornate"};
			case "mackerel": {"lhm_inv_mackerel"};
			case "tuna": {"lhm_inv_tuna"};
			case "mullet": {"lhm_inv_mullet"};
			case "catshark": {"lhm_inv_catshark"};
			case "turtle": {"lhm_inv_turtle"};
			case "fishing": {"lhm_inv_fishingpoles"};
			case "coffee": {"lhm_inv_coffee"};
			case "turtlesoup": {"lhm_inv_turtlesoup"};
			case "donuts": {"lhm_inv_donuts"};
			case "fuelE": {"lhm_inv_fuelE"};
			case "fuelF": {"lhm_inv_fuelF"};
			case "money": {"lhm_cash"};
			case "pickaxe": {"lhm_inv_pickaxe"};
			case "copperore": {"lhm_inv_copperore"};
			case "ironore": {"lhm_inv_ironore"};
			case "iron_r": {"lhm_inv_ironr"};
			case "copper_r": {"lhm_inv_copperr"};
			case "salt": {"lhm_inv_salt"};
			case "salt_r": {"lhm_inv_saltr"};
			case "sand": {"lhm_inv_sand"};
			case "glass": {"lhm_inv_glass"};
			case "tbacon": {"lhm_inv_tbacon"};
			case "lockpick": {"lhm_inv_lockpick"};
			case "redgull": {"lhm_inv_redgull"};
			case "peach": {"lhm_inv_peach"};
			case "diamond": {"lhm_inv_diamond"};
			case "diamondc": {"lhm_inv_diamondr"};
			case "cocaine": {"lhm_inv_coke"};
			case "cocainep": {"lhm_inv_cokep"};
			case "spikeStrip": {"lhm_inv_spikeStrip"};
			case "cement": {"lhm_inv_cement"};
			case "rock": {"lhm_inv_rock"};
			case "goldbar": {"lhm_inv_goldbar"};
			case "blastingcharge": {"lhm_inv_blastingcharge"};
			case "boltcutter": {"lhm_inv_boltcutter"};
			case "defusekit": {"lhm_inv_defusekit"};
			case "storagesmall": {"lhm_inv_storagesmall"};
			case "storagebig": {"lhm_inv_storagebig"};
			case "uran": {"lhm_inv_uran"}; // neu
			case "uranwaste": {"lhm_inv_uranwaste"}; // neu
			case "tabak": {"lhm_inv_tabak"}; // neu
			case "zigarette": {"lhm_inv_zigarette"}; //neu
			case "kidney": {"lhm_inv_kidney"};
			case "container": {"lhm_inv_container"};
			case "unpMeth": {"lhm_inv_unpMeth"};
			case "procMeth": {"lhm_inv_procMeth"};
			default {([_var,0] call lhm_fnc_don_varHandle)};
		};
	};

	case 1:
	{
		switch (_var) do
		{
			// AWS START
			case "lhm_inv_tourniquet": {"tourniquet"};
			case "lhm_inv_Israeli_bandage": {"Israeli_bandage"};
			case "lhm_inv_combat_gauze": {"combat_gauze"};
			case "lhm_inv_druckverband": {"druckverband"};
			case "lhm_inv_morphin": {"morphin"};
			case "lhm_inv_tabletten": {"tabletten"};
			case "lhm_inv_schiene": {"schiene"};
// AWS END
//LHM Alcohol Start
			case "lhm_inv_mash": {"mash"};
			case "lhm_inv_yeast": {"yeast"};
			case "lhm_inv_rye": {"rye"};
			case "lhm_inv_hops": {"hops"};
			case "lhm_inv_whiskey": {"whiskey"};
			case "lhm_inv_beerp": {"beerp"};
			case "lhm_inv_bottles": {"bottles"};
			case "lhm_inv_cornmeal": {"cornmeal"};
			case "lhm_inv_bottledwhiskey": {"bottledwhiskey"};
			case "lhm_inv_bottledbeer": {"bottledbeer"};
			case "lhm_inv_bottledshine": {"bottledshine"};
			case "lhm_inv_moonshine": {"moonshine"};
// LHM Alcohol End
			case "lhm_inv_tracker": {"tracker"};//GPS TRACKER
			case "lhm_inv_tracker2": {"tracker2"};//GPS TRACKER fuer cops
//kippe start
			case "lhm_inv_lzigarette": {"lzigarette"};
			case "lhm_inv_krauser": {"krauser"};
			case "lhm_inv_rooth": {"rooth"};
			case "lhm_inv_malle": {"malle"};
			case "lhm_inv_stoivesant": {"stoivesant"};
//kippe end
			case "lhm_inv_roadbarrier1": {"roadbarrier1"}; //roadbarrier
			case "lhm_inv_roadcone1": {"roadcone1"};  //roadcone
			case "lhm_inv_card": {"card"};  //Rubbel-LOS
			case "lhm_inv_protest": {"protest"}; //Protest sign
			case "lhm_inv_sensor": {"sensor"}; //Bewegungsmelder
			case "lhm_inv_sensor1": {"sensor1"}; //Bewegungsmelder
			case "lhm_inv_graffiti": {"graffiti"}; //Bewegungsmelder
			case "lhm_inv_geocatch": {"geocatch"};
			case "lhm_inv_gas": {"gas"};
			case "lhm_inv_hacken": {"hacken"};
			case "lhm_inv_woodu": {"woodu"};
			case "lhm_inv_woodp": {"woodp"};
			case "lhm_inv_axe": {"axe"};
			case "lhm_inv_egg": {"egg"};
			case "lhm_inv_oilu": {"oilu"};
			case "lhm_inv_oilp": {"oilp"};
			case "lhm_inv_heroinu": {"heroinu"};
			case "lhm_inv_heroinp": {"heroinp"};
			case "lhm_inv_cannabis": {"cannabis"};
			case "lhm_inv_marijuana": {"marijuana"};
			case "lhm_inv_apple": {"apple"};
			case "lhm_inv_water": {"water"};
			case "lhm_inv_rabbit": {"rabbit"};
			case "lhm_inv_salema": {"salema"};
			case "lhm_inv_ornate": {"ornate"};
			case "lhm_inv_mackerel": {"mackerel"};
			case "lhm_inv_tuna": {"tuna"};
			case "lhm_inv_mullet": {"mullet"};
			case "lhm_inv_catshark": {"catshark"};
			case "lhm_inv_turtle": {"turtle"};
			case "lhm_inv_fishingpoles": {"fishing"};
			case "lhm_inv_coffee": {"coffee"};
			case "lhm_inv_turtlesoup": {"turtlesoup"};
			case "lhm_inv_donuts": {"donuts"};
			case "lhm_inv_fuelE": {"fuelE"};
			case "lhm_inv_fuelF": {"fuelF"};
			case "lhm_cash": {"money"};
			case "lhm_inv_pickaxe": {"pickaxe"};
			case "lhm_inv_copperore": {"copperore"};
			case "lhm_inv_ironore": {"ironore"};
			case "lhm_inv_ironr": {"iron_r"};
			case "lhm_inv_copperr": {"copper_r"};
			case "lhm_inv_sand": {"sand"};
			case "lhm_inv_salt": {"salt"};
			case "lhm_inv_glass": {"glass"};
			case "lhm_inv_redgull": {"redgull"};
			case "lhm_inv_lockpick": {"lockpick"};
			case "lhm_inv_tbacon": {"tbacon"};
			case "lhm_inv_peach": {"peach"};
			case "lhm_inv_diamond": {"diamond"};
			case "lhm_inv_diamondr": {"diamondc"};
			case "lhm_inv_saltr": {"salt_r"};
			case "lhm_inv_coke": {"cocaine"};
			case "lhm_inv_cokep": {"cocainep"};
			case "lhm_inv_spikeStrip": {"spikeStrip"};
			case "lhm_inv_cement": {"cement"};
			case "lhm_inv_rock": {"rock"};
			case "lhm_inv_goldbar": {"goldbar"};
			case "lhm_inv_blastingcharge": {"blastingcharge"};
			case "lhm_inv_boltcutter": {"boltcutter"};
			case "lhm_inv_defusekit": {"defusekit"};
			case "lhm_inv_storagesmall": {"storagesmall"};
			case "lhm_inv_storagebig": {"storagebig"};
			case "lhm_inv_uran": {"uran"}; // neu
			case "lhm_inv_uranwaste": {"uranwaste"}; //neu
			case "lhm_inv_tabak": {"tabak"}; // neu
			case "lhm_inv_zigarette": {"zigarette"}; // neu
			case "lhm_inv_kidney": {"kidney"};
			case "lhm_inv_container": {"container"};
			case "lhm_inv_unpMeth": {"unpMeth"};
			case "lhm_inv_procMeth": {"procMeth"};
			default {([_var,1] call lhm_fnc_don_varHandle)};
		};
	};
};
