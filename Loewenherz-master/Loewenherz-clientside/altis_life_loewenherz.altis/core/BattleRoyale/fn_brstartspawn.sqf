/*
	File: fn_brstartspawn.sqf
	Author: Bloodwyn

	Description:
	Player spawns into BattleRoyale
*/
player setposATL [23510.6,17820.5,10.6];
_action = [
		"Wollen Sie wirklich am Event teilnehmen? Ihr Equipment wird für sie aufgehoben!",
		"Teilnahmebestaetigung",
		"JA",
		"NEIN"
	] call BIS_fnc_guiMessage;

	waituntil{ str _action == "true" or  str _action == "false"};

if(_action)then{
	[] call lhm_fnc_saveGear;
	BR_old_gear = lhm_gear;
	Gericht_1 setVariable ["LHM_BR_members",(Gericht_1 getVariable ["LHM_BR_members",[]])+[player],true];
	[] call lhm_fnc_stripDownPlayer;

//anti dupe
{
    _name = (_x select 0);
    _val = (_x select 1);
    if (_val > 0) then {
        [false,([_name,1]call lhm_fnc_varHandle),_val] call lhm_fnc_handleInv;
    };
} forEach [
    ["lhm_inv_cornmeal",lhm_inv_cornmeal],
	["lhm_inv_beerp",lhm_inv_beerp],
	["lhm_inv_whiskey",lhm_inv_whiskey],
	["lhm_inv_rye",lhm_inv_rye],
	["lhm_inv_hops",lhm_inv_hops],
	["lhm_inv_yeast",lhm_inv_yeast],
	["lhm_inv_bottles",lhm_inv_bottles],
	["lhm_inv_bottledshine",lhm_inv_bottledshine],
	["lhm_inv_bottledbeer",lhm_inv_bottledbeer],
	["lhm_inv_bottledwhiskey",lhm_inv_bottledwhiskey],
	["lhm_inv_moonshine",lhm_inv_moonshine],
	["lhm_inv_mash",lhm_inv_mash],
	["lhm_inv_tracker",lhm_inv_tracker],
	["lhm_inv_tracker2",lhm_inv_tracker2],
	["lhm_inv_lzigarette",lhm_inv_lzigarette],
	["lhm_inv_krauser",lhm_inv_krauser],
	["lhm_inv_rooth",lhm_inv_rooth],
	["lhm_inv_malle",lhm_inv_malle],
	["lhm_inv_stoivesant",lhm_inv_stoivesant],
	["lhm_inv_sensor",lhm_inv_sensor],
	["lhm_inv_sensor1",lhm_inv_sensor1],
	["lhm_inv_graffiti",lhm_inv_graffiti],
	["lhm_inv_geocatch",lhm_inv_geocatch],
	["lhm_inv_gas",lhm_inv_gas],
	["lhm_inv_hacken",lhm_inv_hacken],
	["lhm_inv_woodu",lhm_inv_woodu],
	["lhm_inv_woodp",lhm_inv_woodp],
	["lhm_inv_axe",lhm_inv_axe],
	["lhm_inv_egg",lhm_inv_egg],
	["lhm_inv_oilu",lhm_inv_oilu],
	["lhm_inv_oilp",lhm_inv_oilp],
	["lhm_inv_heroinu",lhm_inv_heroinu],
	["lhm_inv_heroinp",lhm_inv_heroinp],
	["lhm_inv_cannabis",lhm_inv_cannabis],
	["lhm_inv_marijuana",lhm_inv_marijuana],
	["lhm_inv_apple",lhm_inv_apple],
	["lhm_inv_rabbit",lhm_inv_rabbit],
	["lhm_inv_salema",lhm_inv_salema],
	["lhm_inv_ornate",lhm_inv_ornate],
	["lhm_inv_mackerel",lhm_inv_mackerel],
	["lhm_inv_tuna",lhm_inv_tuna],
	["lhm_inv_mullet",lhm_inv_mullet],
	["lhm_inv_catshark",lhm_inv_catshark],
	["lhm_inv_turtle",lhm_inv_turtle],
	["lhm_inv_fishingpoles",lhm_inv_fishingpoles],
	["lhm_inv_water",lhm_inv_water],
	["lhm_inv_donuts",lhm_inv_donuts],
	["lhm_inv_turtlesoup",lhm_inv_turtlesoup],
	["lhm_inv_coffee",lhm_inv_coffee],
	["lhm_inv_fuelF",lhm_inv_fuelF],
	["lhm_inv_fuelE",lhm_inv_fuelE],
	["lhm_inv_pickaxe",lhm_inv_pickaxe],
	["lhm_inv_copperore",lhm_inv_copperore],
	["lhm_inv_ironore",lhm_inv_ironore],
	["lhm_inv_ironr",lhm_inv_ironr],
	["lhm_inv_copperr",lhm_inv_copperr],
	["lhm_inv_sand",lhm_inv_sand],
	["lhm_inv_salt",lhm_inv_salt],
	["lhm_inv_saltr",lhm_inv_saltr],
	["lhm_inv_glass",lhm_inv_glass],
	["lhm_inv_tbacon",lhm_inv_tbacon],
	["lhm_inv_lockpick",lhm_inv_lockpick],
	["lhm_inv_redgull",lhm_inv_redgull],
	["lhm_inv_peach",lhm_inv_peach],
	["lhm_inv_diamond",lhm_inv_diamond],
	["lhm_inv_coke",lhm_inv_coke],
	["lhm_inv_cokep",lhm_inv_cokep],
	["lhm_inv_diamondr",lhm_inv_diamondr],
	["lhm_inv_spikeStrip",lhm_inv_spikeStrip],
	["lhm_inv_rock",lhm_inv_rock],
	["lhm_inv_cement",lhm_inv_cement],
	["lhm_inv_blastingcharge",lhm_inv_blastingcharge],
	["lhm_inv_boltcutter",lhm_inv_boltcutter],
	["lhm_inv_defusekit",lhm_inv_defusekit],
	["lhm_inv_storagesmall",lhm_inv_storagesmall],
	["lhm_inv_storagebig",lhm_inv_storagebig],
	["lhm_inv_roadbarrier1",lhm_inv_roadbarrier1],
	["lhm_inv_roadcone1",lhm_inv_roadcone1],
	["lhm_inv_card",lhm_inv_card],
	["lhm_inv_uran",lhm_inv_uran],
	["lhm_inv_uranwaste",lhm_inv_uranwaste],
	["lhm_inv_tabak",lhm_inv_tabak],
	["lhm_inv_zigarette",lhm_inv_zigarette],
	["lhm_inv_kidney",lhm_inv_kidney],
	["lhm_inv_container",lhm_inv_container],
	["lhm_inv_protest",lhm_inv_protest]
];
		lhm_health = 100;
		lhm_thirst = 100;
		lhm_hunger = 100;
		lhm_stamina = 100;
		player forceaddUniform "U_C_Poloshirt_burgundy";
		BR_spawn = selectRandom (Gericht_1 getVariable "LHM_BR_availablespawns");
		Gericht_1 setVariable ["LHM_BR_availablespawns",(Gericht_1 getVariable "LHM_BR_availablespawns")-[BR_spawn],true];
		[]spawn{
			while{!(Gericht_1 getVariable ["LHM_BR_eventstarted",false])}do{
				if ((player distance BR_spawn)>1.2)then{
					player setPosATL BR_spawn;
					titleText ["Bitte warten Sie, bis das Event begonnen hat.","PLAIN"];
				};
				sleep 0.1;
			};
		};
		titleText ["Bitte warten Sie, bis das Event begonnen hat.","PLAIN"];
};