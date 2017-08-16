/*

	Main configuration for non-persistent market system
	Will need triggers to hook into vanilla pricing methods

*/

	//Schema: SHORTNAME, Default, Min, Max, changes in action, [Sales multiplied by 1, Purchase multiplied by -1]
	//["gold", 1500, 450, 2300, 8, 5],

////////////MAIN CONFIG

life_market_resources = [
	
	// Default İsler
	
	["oilp", 11000, 3500, 12000, 1, 1, 
		[ 
			["diamond_cut",1],
			["copper_refined",1],
			["marijuana",1]
		] 
	],
		
	
	["diamond_cut", 3000, 2000, 3650, 1, 1, 
		[ 
			["ruby_refined",1],
       		["cocaine_processed",1],
			["uraniump",1],
			["oil_processed",1],
			["methp",1]
		] 
	],
	
	["platinum_processed", 2800, 2000, 3550, 1, 1, 
		[ 
			["diamond_cut",1],
			["oil_processed",1],
			["iron_refined",1],
			["LSDp",1],
			["uraniump",1]
		] 
	],
	
	["silverp", 2600, 2000, 3100, 1, 1, 
		[ 
			["ruby_refined",1],
       		["cocaine_processed",1],
			["uraniump",1],
			["oil_processed",1],
			["methp",1]
		] 
	],
	
	["ruby_refined", 2900, 1960, 3250, 1, 1, 
		[ 
			["oil_processed",1],
			["copper_refined",1],
			["marijuana",1],
			["uraniump",1]
     	] 
	],
		
	["uraniump", 19000, 5000, 25550, 1, 1, 
		[ 
			["diamond_cut",1],
			["LSDp",1],
			["copper_refined",1],
			["diamond_cut",1]
		] 
	],
	
	["copper_refined", 2200, 1600, 2600, 1, 1, 
		[ 
			["platinum_processed",1],
			["iron_refined",1],
			["uraniump",1],
			["ruby_refined",1],
			["methp",1]
    	] 
	],
	
	["iron_refined", 2000, 1200, 2700, 1, 1,  
		[ 
			["diamond_cut",1],
			["oil_processed",1],
            ["copper_refined",1],
			["oil_processed",1],
			["uraniump",1],
			["marijuana",1]
		] 
	],
	
	["marijuana", 2900, 2800, 4000, 1, 1,   
		[ 
			["cocaine_processed",1],
			["platinum_processed",1],
			["iron_refined",1],
			["ruby_refined",1],
			["uraniump",1]
		] 
	],

	["cocaine_processed", 4000, 4200, 5500, 1, 1,   
		[ 
			["LSDp",1],
			["copper_refined",1],
			["marijuana",1],
			["uraniump",1]
		] 
	],
	
	["methp", 5500, 5000, 6300, 1, 1,   
		[ 
            ["LSDp",1],
			["oil_processed",1],
			["uraniump",1]
		] 
	],
	
	["LSDp", 5800, 5500, 6900, 1, 1, 
		[ 
			["methp",1],
			["iron_refined",1],
			["uraniump",1]
		] 
	],
		
	["heroin_processed", 3700, 3500, 4500, 1, 1,   
		[ 
		    ["marijuana",1],
			["oil_processed",1],
			["uraniump",1]
		] 
	]
];
publicVariable "life_market_resources";

////////////GENERATED CONFIG
//life_market_changes = []; //[SHORTNAME,SELL,BUY]
life_market_shortnames = []; //shortnames if in market
//life_market_clampprices = []; //[SHORTNAME,MIN,MAX]

{
	life_market_shortnames set [count life_market_shortnames, _x select 0];
	//life_market_clampprices set [count life_market_clampprices, [_x select 0, _x select 2, _x select 3] ];
	//life_market_changes set [count life_market_changes, [_x select 0, _x select 4, _x select 5] ];
}
foreach life_market_resources;

publicVariable "life_market_shortnames";
//publicVariable "life_market_clampprices";

////////////SYNC PRICES WITH SERVER IF EMPTY
//if(isNil("life_market_prices")) then
//{
	life_market_prices = []; //[SHORTNAME,CURRENTPRICE,DIRECTIONGLOBAL,DIRECTIONLOCAL]
	{
	
		life_market_prices set [count life_market_prices, [_x select 0, _x select 1, 0, 0] ];
	}
	foreach life_market_resources;
	
	publicVariable "life_market_prices";
	
	systemChat "Market Prices Generated!";
//};