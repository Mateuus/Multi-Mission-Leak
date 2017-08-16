/*
##################### DYNAMIC MARKET SCRIPT #####################
### AUTHOR: RYAN TT.                                          ###
### STEAM: www.steamcommunity.com/id/ryanthett                ###
###                                                           ###
### DISCLAIMER: THIS SCRIPT CAN BE USED ON EVERY SERVER ONLY  ###
###             WITH THIS HEADER / NOTIFICATION               ###
#################################################################
*/

// ███████████████████████████████████████████████████████████████████████
// █████████████████ DYNAMIC MARKET BASIC CONFIGURATION ██████████████████
// ███████████████████████████████████████████████████████████████████████

DYNMARKET_Serveruptime         = 08;   // Serveruptime after restart in hours
DYNMARKET_UseExternalDatabase  = true; // Should the script use the External Database?
DYNMARKET_PriceUpdateInterval  = 01;   // After how many minutes should the price be updated?
DYNMARKET_CreateBackups        = true; // Should the server save write the prices regulary into the Database? If false, it will save the prices before Server-restart?
DYNMARKET_CreateBackupInterval = 10;   // After how many updates (PriceUpdateIntervals) should the prices be saved into the Database?
DYNMARKET_UserNotification     = false; // Should the user be informed with a hint whenever the prices got updated?

// █████████████████ USER NOTIFICATION TEXTS  █████████████████

DYNMARKET_UserNotification_Text =
[
	"Your prices have been updated!",
	"The new prices are being calculated by the server..."
];

// █████████████████ ITEM GROUP CONFIGURATION █████████████████

/*
1. The Tag: "Legal" = This is used to identify the group, it can be nonsense if you want it to be, but it must be unique!
2. The Itemarray = This is the array which contains all the items that should be assigned to the group:
3. The Item = This is the format that should be used for new items ["itemname",-1,MinPrice,MaxPrice],
4. The Groupfactor = This factor decides how much sold items of a group should influence the price of other items in their group.

Informations:
  - You can create as many groups as you want
  - You can add as many items as you want to a group, just make sure items are only assigned to one group
  - Don't mind about the -1, its just there for... purposes. Just leave it there.
*/

DYNMARKET_Items_Groups =
[
	["Legal",
		[
			["apple",-1,50,500],
			["peach",-1,70,590],
			["goldnugget",-1,4900,18147],
			["salt_refined",-1,3165,12351],
			["saltpetre_acid",-1,3591,10698],
			["sulfur_acid",-1,4258,15236],
			["coal",-1,987,3861],
			["cement",-1,2987,7215],
			["oil_processed",-1,3794,25044],
			["uranium_fuelrod",-1,65321,241960],
			["glass",-1,3147,9312],
			["zucker",-1,5478,18456],
			["mehl",-1,5478,18697],
			["rum",-1,4069,15687],
			["bier",-1,15387,45879]
		],
		0.8
	],
	["Metals",
		[
			["copper_ingot",-1,3578,14700],
			["iron_ingot",-1,3580,16100],
			["tin_ingot",-1,4623,19910],
			["aluminium_ingot",-1,2684,7603],
			["lead_ingot",-1,9875,35046],
			["silver_ingot",-1,11369,36870],
			["platinum_ingot",-1,10000,37244],
			["titanium_ingot",-1,5623,17640],
			["molybdenum_ingot",-1,6483,22701],
			["zinc_ingot",-1,3126,10395],
			["didymium",-1,12987,46322],
			["neodymium",-1,6542,20340],
			["mercury",-1,10987,55426],
			["iridium",-1,35698,274808]
		],
		0.8
	],
	["Alloys",
		[
			["titaniumgold",-1,11778,108121],
			["bronze",-1,9321,38071],
			["aluminiumbronze",-1,9645,33454],
			["brass",-1,9632,37642],
			["goldamalgam",-1,40687,164800],
			["ornament",-1,70658,362174],
			["magnet",-1,4615,54660],
			["leadbronze",-1,25069,101079],
			["whitegold",-1,65314,253671],
			["blackpowder",-1,1466,5791],
			["redbrass",-1,12658,67507]
		],
		0.8
	],
	["Jewels",
		[
			["topaz_cut",-1,8745,34767],
			["ruby_cut",-1,9638,38311],
			["sapphire_cut",-1,9568,34097],
			["diamond_cut",-1,18659,77485],
			["emerald_cut",-1,8765,37223],
			["quartz_cut",-1,5983,25074],
			["garnet_cut",-1,8652,24948]
		],
		0.8
	],
	["Illegal",
		[
			["heroin_processed",-1,7508,22368],
			["cocaine_processed",-1,5348,14358],
			["marijuana",-1,7698,20978],
			["uranium_dirty",-1,41390,90365],
			["dino",-1,19687,68236],
			["turtle_raw",-1,4682,13687],
			["LSD",-1,4054,11354],
			["starkbier",-1,2564,63412],
			["whiskey",-1,3986,15324]
		],
		0.8
	]
];

// █████████████████    ALL SELLABLE ITEMS    █████████████████

DYNMARKET_Items_ToTrack        =
[

	["apple",75],
	["peach",90],
	/*
	["tbacon",125],
	["donut",130],
	["rabbit_raw",150],
	["rabbit_grilled",170],
	["ornate_raw",190],
	["ornate_grilled",190],
	["mackerel_raw",190],
	["mackerel_grilled",190],
	["tuna_raw",190],
	["tuna_grilled",190],
	["mullet_raw",190],
	["mullet_fried",200],
	["catshark_raw",200],
	["catshark_Fried",200],
	*/
	["turtle_raw",9620],
	/*
	["hen_raw",200],
	["hen_fried",200],
	["rooster_raw",210],
	["sheep_raw",210],
	["sheep_grilled",155],
	["goat_raw",155],
	["goat_grilled",300],

	["redgull",1500],
	["coffee",10],
	["waterbottle",10],

	["pickaxe",350],
	["fuel_full",500],
	["spikeStrip",1200],
	["lockpick",100000],
	["goldbar",95000],
	["blastingcharge",35000],
	["boltcutter",1500000],
	["defusekit",2500],
	["tracker",5000],
	["barrier",2500],
	*/
    ["goldnugget",9073],
	["copper_ingot",6500],
	["iron_ingot",8125],
	["tin_ingot",9955],
	["aluminium_ingot",3801],
	["lead_ingot",17523],
	["silver_ingot",18435],
	["platinum_ingot",18622],
	["titanium_ingot",8820],
	["molybdenum_ingot",11350],
	["zinc_ingot",5197],
	["mercury",27713],
	["iridium",137404],
	["topaz_cut",17383],
	["ruby_cut",19155],
	["sapphire_cut",17048],
	["diamond_cut",38742],
	["emerald_cut",18666],
	["quartz_cut",12537],
	["garnet_cut",12474],
	["didymium",23161],
	["neodymium",10170],
	["dino",68236],
	["salt_refined",6175],
	["saltpetre_acid",5349],
	["sulfur_acid",7618],
	["coal",1930],
	["cement",3607],
	["oil_processed",10127],
	["uranium_fuelrod",48392],
	["glass",4656],
	["bier",26873],
	["zucker",6874],
	["mehl",2000],
	["rum",4547],
	["titaniumgold",23556],
	["bronze",2169],
	["aluminiumbronze",5581],
	["brass",3096],
	["goldamalgam",27864],
	["ornament",43311],
	["magnet",9231],
	["leadbronze",14472],
	["whitegold",193401],
	["blackpowder",1760],
	["redbrass",5871],


	["heroin_processed",15016],
	["marijuana",17075],
	["cocaine_processed",11903],
	["uranium_dirty",45530],
	["LSD",21203],
	["starkbier",31203],
	["whiskey",33105]
];

//███████████████████████████████████████████████████████████████████████
//██████████████████ DO NOT MODIFY THE FOLLOWING CODE! ██████████████████
//███████████████████████████████████████████████████████████████████████

DYNMARKET_Items_CurrentPriceArr = [];
DYNMARKET_sellarraycopy = DYNMARKET_Items_ToTrack;
DYNMARKET_Serveruptime = (DYNMARKET_Serveruptime * 3600) - 300;
{
	_currentArray = _x;
	DYNMARKET_Items_CurrentPriceArr pushBack [_currentArray select 0,_currentArray select 1,0];
} forEach DYNMARKET_Items_ToTrack;
publicVariable "DYNMARKET_UserNotification";
publicVariable "DYNMARKET_UserNotification_Text";
if (DYNMARKET_UseExternalDatabase) then {[1] call TON_fnc_HandleDB;};
DYNMARKET_UpdateCount = 0;
if (DYNMARKET_UseExternalDatabase) then {
	[] spawn {
		sleep DYNMARKET_Serveruptime;
		diag_log "### DYNMARKET >> CURRENT PRICES ARE BEING WRITTEN TO THE DATABASE    ###";
		diag_log "### DYNMARKET >> AS PLANNED, AWAITING RESULT...                      ###";
		[0] call TON_fnc_HandleDB;
	};
};
sleep 5;
[] call TON_fnc_sleeper;
