/*

	Main configuration for non-persistent market system
	Will need triggers to hook into vanilla pricing methods

*/

////////////MAIN CONFIG

life_market_resources = [

	//Schema: SHORTNAME, Default, Min, Max, changes in action, [Sales multiplied by 1, Purchase multiplied by -1]
	//["gold", 1500, 450, 2300, 8, 5],
	
	/*
	Tanoa Farming 2.0
	Made for TanoaRPG.de
	Author: Tim "cat24max" Vogler and CooliMC
	
	Copyright statement:
	You may not reproduce, adapt, modify, communicate to the public, reproduce or otherwise use any part of this script (in particular for commercial purposes) except as set out below, or otherwise with the express written permission from the author.
	*/
	
	
	//Stufe 1:
	["sugarprocessed", 1660, 1383, 2075, 6, 4,   
		[ 
			["waterbottle",1],
			["oildiesel",1],
			["oilkerosin",1],
			["copper_r",1],
			["iron_r",1],
			["coffee1",1]
		] 
	],
	
	["waterbottle", 1660, 1383, 2075, 6, 4,   
		[ 
			["sugarprocessed",1],
			["goldcoins",1],
			["oilheat",1],
			["hmbottled",1]
		] 
	],
	
	["goldcoins", 2016, 1680, 2520, 6, 4,   
		[ 
			["waterbottle",1],
			["oilheat",1],
			["copper_r",1],
			["iron_r",1],
			["oilkerosin",1],
			["coffee1",1]
		] 
	],
	
	["oilheat", 7092, 5910, 8865, 6, 4,   
		[
			["sugarprocessed",1],
			["goldcoins",1],
			["oildiesel",1],
			["copper_r",1],
			["iron_r",1],
			["hmbottled",1]
		] 
	],
	
	["oildiesel", 6488, 5407, 8111, 6, 4,   
		[ 
			["waterbottle",1],
			["oilheat",1],
			["oilkerosin",1],
			["coffee1",1]
		] 
	],
	
	["oilkerosin", 7394, 6162, 9243, 6, 4,   
		[
			["sugarprocessed",1],
			["goldcoins",1],
			["copper_r",1],
			["iron_r",1],
			["oildiesel",1],
			["hmbottled",1]
		] 
	],
	
	["hmbottled", 4526, 3772, 5658, 6, 4,   
		[ 
			["waterbottle",1],
			["oilheat",1],
			["copper_r",1],
			["iron_r",1],
			["oilkerosin",1],
			["coffee1",1]
		] 
	],
	
	["coffee1", 1407, 1200, 1709, 6, 4,   
		[
			["sugarprocessed",1],
			["goldcoins",1],
			["oildiesel",1],
			["copper_r",1],
			["iron_r",1],
			["hmbottled",1]
		] 
	],
	
	["copper_r", 2822, 2352, 3528, 6, 4,   
		[
			["sugarprocessed",1],
			["goldcoins",1],
			["oildiesel",1],
			["hmbottled",1]
		] 
	],
	
	["iron_r", 3024, 2520, 3780, 6, 4,   
		[
			["sugarprocessed",1],
			["goldcoins",1],
			["oildiesel",1],
			["hmbottled",1]
		] 
	],
	
	
	//Stufe 2:
	["hmillegal", 4858, 4048, 6072, 6, 4,   
		[ 
			["energydrink",1], 
			["heroinp",1],
			["cocainep",1],
			["marijuana",1]
		] 
	],
	
	["energydrink", 3200, 2500, 3700, 6, 4,   
		[ 
			["turtle",1],
			["crack",1],
			["hmillegal",1]
		] 
	],
	
	["heroinp", 5990, 4992, 7488, 6, 4,   
		[ 
			["hmillegal",1],
			["turtle",1],
			["crack",1]
		] 
	],
	
	["turtle", 15000, 10000, 25000, 60, 40,  
		[ 
			["heroinp",1],
			["energydrink",1],
			["cocainep",1],
			["marijuana",1]
		] 
	],
	
	["cocainep", 7142, 5952, 8928, 6, 4,   
		[ 
			["crack",1],
			["turtle",1],
			["hmillegal",1]
		] 
	],
	
	["crack", 12404, 10337, 15506, 6, 4,   
		[ 
			["cocainep",1], 
			["heroinp",1],
			["energydrink",1],
			["marijuana",1]
		] 
	],
	
	["marijuana", 4742, 3952, 5928, 6, 6,
		[ 
			["crack",1],
			["turtle",1],
			["hmillegal",1]
		] 
	],
	
	//Stufe 3:
	
	["goldbar", 100000, 70000, 150000, 600, 400,   
		[ 
			["sprengstoff",1],
			["brennstab",1],
			["kidney",1]
		] 
	],
	
	["brennstab", 6376, 5313, 7970, 6, 4,   
		[ 
			["goldbar",1],
			["sprengstoff",1],
			["kidney",1]
		] 
	],
	
	["kidney", 21000, 0, 35000, 1600, 30,
		[ 
			["sprengstoff",1],
			["brennstab",1],
			["goldbar",1]
		] 
	],
	
	["sprengstoff", 9397, 7831, 11747, 6, 4,   
		[
			["goldbar",1],
			["brennstab",1],
			["kidney",1]
		] 
	],
	
	//Stufe 4: Standart
	["glass", 1962, 1635, 2453, 2, 2,
		[ 
			["cement",1],
			["woodfurniture",1]
		] 
	],
	
	["woodfurniture", 5846, 4872, 7308, 6, 4,   
		[ 
			["cement",1],
			["glass",1]
		] 
	],
	
	["cement", 5040, 4200, 6300, 3, 3,
		[ 
			["glass",1],
			["woodfurniture",1]
		]
	]
];
publicVariable "life_market_resources";
life_market_shortnames = []; //shortnames if in market

{
	life_market_shortnames set [count life_market_shortnames, _x select 0];
} foreach life_market_resources;

publicVariable "life_market_shortnames";


if(isNil("life_market_prices")) then
{
	life_market_prices = []; //[SHORTNAME,CURRENTPRICE,DIRECTIONGLOBAL,DIRECTIONLOCAL]
	{
		life_market_prices set [count life_market_prices, [_x select 0, _x select 1, 0, 0] ];
	} foreach life_market_resources;
	
	publicVariable "life_market_prices";
	
	systemChat "Market Prices Generated!";
};