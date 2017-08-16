/*

	Main configuration for non-persistent market system
	Will need triggers to hook into vanilla pricing methods

*/

////////////MAIN CONFIG

life_market_resources = [

	//Schema: SHORTNAME, Default, Min, Max, changes in action, [Sales multiplied by 1, Purchase multiplied by -1]
	//["gold", 1500, 450, 2300, 8, 5],
	
	["oilp", 6000, 5500, 6300, 8, 5,
		[
			["diamondc",1],
			["iron_r",1],
			["copper_r",1]
		]
	],

	["praline", 6000, 4000, 7000, 8, 5,
		[
			["schokolade",1],
			["iron_r",1],
			["copper_r",1]
		]
	],

	["schokolade", 2300, 2000, 2500, 8, 5,
		[
			["praline",1],
			["bottledshine",1],
			["salt_r",1]
		]
	],
	
	["plastik", 6700, 5900, 6800, 8, 5,
		[
			["iron_r",1],
			["copper_r",1],
			["laminat",1],
			["mahagoni",1],
			["bauholz",1],
			["mahagoni",1],
			["oilp",1],
			["cement",1]
		]
	],
	
	["perlen", 4200, 3800, 4500, 8, 5,
		[
			["bottledshine",1],
			["diamondc",1],
			["goldbar",1],
			["glass",1]
		]
	],
		
	["bauholz", 1700, 1200, 1800, 8, 5,
		[
			["laminat",1],
			["mahagoni",1],
			["iron_r",1],
			["copper_r",1]
		]
	],
	
	["laminat", 1900, 1500, 2000, 8, 5,
		[
			["bauholz",1],
			["mahagoni",1],
			["iron_r",1],
			["copper_r",1]
		]
	],
	
	["mahagoni", 2200, 1800, 2300, 8, 5,
		[
			["laminat",1],
			["bauholz",1],
			["iron_r",1],
			["copper_r",1]
		]
	],
	
	["schmuck", 16000, 14000, 20000, 8, 5,
		[
			["diamondc",1],
			["perlen",1],
			["glass",1]
		]
	],
	
	["iron_r", 3500, 2500, 3700, 8, 5,  
		[
			["diamondc",1], 
			["copper_r",1],
			["cement",1],
			["glass",1]
		]
	],
	
	["diamondc", 4700, 4200, 5000, 8, 5, 
		[ 
			["oilp",1],
			["iron_r",1],
			["copper_r",1],
			["glass",1]
		]
	],
	
	["copper_r", 2000, 1500, 2200, 8, 5,
		[
			["diamondc",1], 
			["oilp",1],
			["iron_r",1],
			["salt_r",1],
			["cement",1],
			["glass",1]
		]
	],
	
	["salt_r", 3000, 2700, 3150, 8, 5,
		[ 
			["diamondc",1],
			["oilp",1],
			["iron_r",1],
			["copper_r",1],
			["plutonium",1]
		]
	],

	["banane", 1400, 1000, 1500, 8, 5,
		[ 
			["salat",1],
			["tomate",1],
			["gsalat",1]
		]
	],
	
	["glass", 2300, 1900, 2500, 8, 5,
		[ 
			["diamondc",1], 
			["oilp",1],
			["iron_r",1],
			["copper_r",1],
			["salt_r",1],
			["cement",1]
		] 
	],
	
	["cement", 3300, 2700, 3500, 8, 5,
		[ 
			["diamondc",1],
			["oilp",1],
			["iron_r",1],
			["copper_r",1],
			["glass",1]
		] 
	],


	["john", 45000, 40000, 50000, 8, 5,   
		[ 
			["ron",1],
			["momphred",1],
			["bertram",1],
			["goetzi",1]
		] 
	],

	["bertram", 140000, 125000, 150000, 8, 5,   
		[ 
			["ron",1],
			["momphred",1],
			["john",1],
			["goetzi",1]
		] 
	],
	
	["goetzi", 270000, 250000, 280000, 8, 5,   
		[ 
			["ron",1],
			["momphred",1],
			["john",1],
			["bertram",1]
		] 
	],

	["ron", 410000, 380000, 420000, 8, 5,   
		[ 
			["bertram",1],
			["momphred",1],
			["john",1],
			["goetzi",1]
		] 
	],

	["momphred", 490000, 490000, 500000, 8, 5,   
		[ 
			["ron",1],
			["bertram",1],
			["john",1],
			["goetzi",1]
		] 
	],

	["bottledbeer", 19000, 15000, 20000, 8, 5,   
		[ 
			["bottledshine",1],
			["bottledwhiskey",1]
		] 
	],
	
	["bottledwhiskey", 21000, 18000, 22000, 8, 5,   
		[ 
			["bottledshine",1],
			["bottledbeer",1]
		]
	],
/////////////////////////
	
	["bottledshine", 25000, 20000, 26000, 8, 5,   
		[ 
			["bottledwhiskey",1],
			["bottledbeer",1]
		]
	],

	["marijuana", 5200, 4600, 5400, 8, 5,   
		[ 
			["bottledshine",1], 
			["cocainep",1],
			["heroinp",1],
			["plutonium",1]
		]
	],
	
	["cocainep", 6500, 5500, 7000, 8, 5,   
		[
			["marijuana",1], 
			["bottledshine",1],
			["heroinp",1],
			["plutonium",1]
		] 
	],

	["heroinp", 9500, 8600, 9750, 8, 5,   
		[ 
			["marijuana",1], 
			["bottledshine",1],
			["cocainep",1],
			["plutonium",1]
		] 
	],
	
	["plutonium", 8500, 8000, 10500, 8, 5,
		[
			["cocainep",1],
			["heroinp",1],
			["marijuana",1],
			["bottledbeer",1],
			["bottledwhiskey",1],
			["diamondc",1],
			["plutonium",1]
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

//SYNC PRICES WITH SERVER IF EMPTY
if(isNil("life_market_prices")) then
{
	life_market_prices = []; //[SHORTNAME,CURRENTPRICE,DIRECTIONGLOBAL,DIRECTIONLOCAL]
	{
	
		life_market_prices set [count life_market_prices, [_x select 0, _x select 1, 0, 0] ];
	}
	foreach life_market_resources;
	
	publicVariable "life_market_prices";
};