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

DYNMARKET_Serveruptime         = 03;   // Serveruptime after restart in hours
DYNMARKET_UseExternalDatabase  = true; // Should the script use the External Database?
DYNMARKET_PriceUpdateInterval  = 15;   // After how many minutes should the price be updated?
DYNMARKET_CreateBackups        = true; // Should the server save write the prices regulary into the Database? If false, it will save the prices before Server-restart?
DYNMARKET_CreateBackupInterval = 200;   // After how many updates (PriceUpdateIntervals) should the prices be saved into the Database?
DYNMARKET_UserNotification     = false; // Should the user be informed with a hint whenever the prices got updated?

// █████████████████ USER NOTIFICATION TEXTS  █████████████████

DYNMARKET_UserNotification_Text = 
[
	"Your prices have been updated!",
	"The new prices are being calculated by the server..."
];

// █████████████████ ITEM GROUP CONFIGURATION █████████████████

DYNMARKET_Items_Groups =
[
	["Start",
		[
			["apple",-1,10,50],
			["peach",-1,30,55],
			["apfels",-1,530,740],
			["peachs",-1,530,740]
		],
		0.5
	],
	["Mine",
		[
			["oil_processed",-1,2000,3600],
			["copper_refined",-1,2000,2700],
			["iron_refined",-1,2100,3400],
			["salt_refined",-1,1900,2550],
			["glass",-1,1600,2350],
			["diamond_cut",-1,2600,4250],
			["cement",-1,1950,3050],
			["tobacco",-1,1000,1200]
		],
		0.6
	],
	
	["Pickup",
		[
			["kohle_refined",-1,2100,3250],
			["wein_refined",-1,2700,3400],
			["holz_refined",-1,2400,3600],
			["eisen_refined",-1,3800,5000],
			
			["kakaop",-1,2400,3300],
			["kokosu",-1,1200,2500],
			["zuckerp",-1,3600,4100],
			["olivenp",-1,2600,2900],
			["bananen",-1,800,900],
			
			["rye",-1,700,1000],
			["hops",-1,500,600],
			["yeast",-1,800,1200]
		
			
	
		],
		0.6
	],
	
	
	["Hunt",
	[		
			["rabbit_raw",-1,400,900],
			["sheep_raw",-1,3500,5500],
			["goat_raw",-1,4900,8500],
			["hen_raw",-1,2600,2900],
			["rooster_raw",-1,2700,3100],
			["hen",-1,2800,3140],
			["goat_raw",-1,600,7000],
			["sheep",-1,6500,7500],
			["goat",-1,5000,7500]	
		],
		0.7
	],
	["Fish",
		[
			["salema_raw",-1,20,40],
			["tuna_raw",-1,500,700],
			["salema",-1,50,75],
			["rabbit",-1,100,150],
			["ornate",-1,400,1000],
			["ornate_raw",-1,600,100],
			["mackerel_raw",-1,100,150],
			["mackerel",-1,300,800],
			["tuna",-1,900,1250],
			["mullet_raw",-1,180,250],
			["mullet",-1,250,400],
			["catshark_raw",-1,200,300],
			["catshark",-1,260,500]
		],
		0.7
	],
	["Illegal",
		[
			["heroin_processed",-1,4150,5460],
			["cocaine_processed",-1,4400,6800],
			["kidney",-1,14900,20000],
			["pilze_refined",-1,3950,4650],
			["turtle_raw",-1,5900,11000],
			//["moonshine",-1,30,100],
			["beerp",-1,2900,4000],
			["whiskey",-1,3700,4400],
			["bottledshine",-1,4000,7000],
			["bottledwhiskey",-1,4100,6900],
			["bottledbeer",-1,5000,5400],
			
			["meth_refined",-1,4300,4800],
			["speed_refined",-1,4250,4900],
			
			["schwarz_refined",-1,4100,5400],
			["illmed_refined",-1,4900,5600],
			["uran_refined",-1,3900,4200],
			["uran1_refined",-1,5900,6200],
			["uran2_refined",-1,8700,9200],
			
			["muscheln",-1,900,1400],
			["muschelfleis",-1,800,900],
			["perlen",-1,4480,7500],
			["korallen",-1,1480,2400],
			["marijuana",-1,3900,4500],
			["cocaine_processed",-1,3900,7500]
		],
		0.8
	]
];

// █████████████████    ALL SELLABLE ITEMS    █████████████████


DYNMARKET_Items_ToTrack        = 
[

	["apple",45],
	["peach",45],
	["apfels",740],
	["peachs",740],
	
	["oil_processed",3200],
	["copper_refined",2500],
	["iron_refined",3200],
	["salt_refined",2250],	
	["glass",2250],
	["diamond_cut",4100],
	["cement",2950],
	["tobacco",1000],
	
	["kohle_refined",3050],
	["wein_refined",3100],
	["holz_refined",3500],
	["eisen_refined",4800],
	
	["kakaop",3200],
	["zuckerp",4000],
	["olivenp",2800],
	["bananen",850],
	

	["rabbit_raw",800],
	["sheep_raw",5000],
	["goat_raw",8000],
	["hen_raw",2800],	
	["rooster_raw",2800],
	
	
	["salema_raw",130],	
	["tuna_raw",700],	
	["turtle_raw",10000],
	

	["turtle_soup",200],
	

	["tbacon",5],

	
	["zipties",250],
	["scalpel",50],
	["kidney",20000],

	["bottledshine",6000],
	["bottledwhiskey",6700],
	["bottledbeer",5300],
	//["moonshine",13],
	["whiskey",4300],
	["beerp",3900],
	
	["rye",1000],
	["hops",550],
	["yeast",1100],
	
	["cornmeal",200],
	["bottles",125],

	["meth_refined",4750],
	["speed_refined",4700],	
	["schwarz_refined",5200],
	["illmed_refined",5400],
	["uran_refined",4000],
	["uran1_refined",6000],
	["uran2_refined",9000],
	
	["muscheln",1200],
	["muschelfleis",850],
	["perlen",7000],
	["korallen",2200],
		
	["pilze_refined",4600],
	["heroin_processed",5300],
	["marijuana",4300],
	["cocaine_processed",6600],
	
	["gpstracker",250],
	
	["painkiller",2000],
	["Epinephrin",3500],
	
	["licht",17],
	["barriere",17],
	["pylone",17],
	["schranke",17],
	["tape",17],
	
	["redgull",150],
	["coffee",1],
	["waterBottle",1],
	
	["pickaxe",35],
	["fuelFull",50],
	["spikeStrip",120],
	["lockpick",7],
	["goldbar",75000],
	["blastingcharge",3500],
	["boltcutter",750],
	["defusekit",250],
	["storagesmall",7500],
	["storagebig",1500]
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
if (DYNMARKET_UseExternalDatabase) then {[1] call ES_fnc_HandleDB;};
DYNMARKET_UpdateCount = 0;
if (DYNMARKET_UseExternalDatabase) then {
	[] spawn {
		sleep DYNMARKET_Serveruptime;
		[0] call ES_fnc_HandleDB;
		sleep DYNMARKET_Serveruptime;
		[0] call ES_fnc_HandleDB;
		sleep DYNMARKET_Serveruptime;
		[0] call ES_fnc_HandleDB;
		sleep DYNMARKET_Serveruptime;
		[0] call ES_fnc_HandleDB;
		sleep DYNMARKET_Serveruptime;
		[0] call ES_fnc_HandleDB;
	};
};
sleep 5;

[] spawn {

	while {true} do {
		sleep (DYNMARKET_PriceUpdateInterval*60);
		[[0],"ES_fnc_update",true,false] spawn ES_fnc_MP;
		sleep 5;
		[] spawn ES_fnc_calculatePrices;
	};

};
