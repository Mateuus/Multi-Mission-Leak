/*

	Main configuration for non-persistent market system
	Will need triggers to hook into vanilla pricing methods
	Edited by: Lukas "Alduin86"

*/
private["_queryResult","_query","_item","_itemprice","_applePrice","_peachPrice","_ornatePrice","_salemaPrice","_mulletPrice","_mackerelPrice","_catsharkPrice","_tunaPrice","_saltrPrice","_glassPrice","_cementPrice","_ironrPrice","_copperPrice","_oilpPrice","_marijuanaPrice","_diamondPrice","_turtlePrice","_cocainePrice","_heroinPrice","_goldbarPrice","_goldbarpPrice"];

_query = format["SELECT resource, price FROM resources"];
waitUntil{sleep (random 0.3); !DB_Async_Active};
_queryResult = [_query,2,true] call DB_fnc_asyncCall;
_rows = call compile format["%1",_queryResult]; //compile data
diag_log "------------- Market Query Request -------------";
diag_log format["Query: %1",_query];
diag_log format["Result: %1",_rows];
diag_log "------------------------------------------------";

{
	_item = (_x select 0);
	_itemprice = (_x select 1);
	
	if(_item == "apple") then {_applePrice = _itemprice};
	if(_item == "peach") then {_peachPrice = _itemprice};
	if(_item == "ornate") then {_ornatePrice = _itemprice};
	if(_item == "salema") then {_salemaPrice = _itemprice};
	if(_item == "mullet") then {_mulletPrice = _itemprice};
	if(_item == "mackerel") then {_mackerelPrice = _itemprice};
	if(_item == "catshark") then {_catsharkPrice = _itemprice};
	if(_item == "tuna") then {_tunaPrice = _itemprice};
	if(_item == "salt_r") then {_saltrPrice = _itemprice};
	if(_item == "glass") then {_glassPrice = _itemprice};
	if(_item == "cement") then {_cementPrice = _itemprice};
	if(_item == "iron_r") then {_ironrPrice = _itemprice};
	if(_item == "copper_r") then {_copperPrice = _itemprice};
	if(_item == "oilp") then {_oilpPrice = _itemprice};
	if(_item == "marijuana") then {_marijuanaPrice = _itemprice};
	if(_item == "diamondc") then {_diamondPrice = _itemprice};
	if(_item == "turtle") then {_turtlePrice = _itemprice};
	if(_item == "cocainep") then {_cocainePrice = _itemprice};
	if(_item == "heroinp") then {_heroinPrice = _itemprice};
	if(_item == "goldbar") then {_goldbarPrice = _itemprice};
	if(_item == "goldbarp") then {_goldbarpPrice = _itemprice};
	
} forEach _rows;


life_market_resources = [

	//Schema: SHORTNAME, DEFAULT-WERT, MIN-WERT, MAX-WERT, VERÄNDERUNG BEI AKTION [VERKAUF Multipliziert mit 1, Kauf multipliziert um -1
	
	["apple", _applePrice, 25, 100, 2, 1,
		[
			["peach",1]
		]
	],
	
	["peach", _peachPrice, 50, 300, 2, 1,
		[
			["apple",1]
		]
	],
	
	["ornate", _ornatePrice, 10, 200, 5, 1,
		[
			["salema",1],
			["mullet",1],
			["mackerel",1],
			["catshark",1],
			["tuna",1]
		]
	],
	
	["salema", _salemaPrice, 50, 300, 5, 1,
		[
			["ornate",1],
			["mullet",1],
			["mackerel",1],
			["catshark",1],
			["tuna",1]
		]
	],
	
	["mullet", _mulletPrice, 150, 500, 5, 1,
		[
			["salema",1],
			["ornate",1],
			["mackerel",1],
			["catshark",1],
			["tuna",1]
		]
	],
	
	["mackerel", _mackerelPrice, 200, 750, 5, 1,
		[
			["salema",1],
			["mullet",1],
			["ornate",1],
			["catshark",1],
			["tuna",1]
		]
	],
	
	["catshark", _catsharkPrice, 400, 1500, 5, 1,
		[
			["salema",1],
			["mullet",1],
			["mackerel",1],
			["ornate",1],
			["tuna",1]
		]
	],
	
	["tuna", _tunaPrice, 500, 2000, 5, 1,
		[
			["salema",1],
			["mullet",1],
			["mackerel",1],
			["catshark",1],
			["ornate",1]
		]
	],
	
	["salt_r", _saltrPrice, 250, 1000, 2, 1,
		[
			["iron_r",1],
			["oilp",1],
			["glass",1],
			["cement",1],
			["copper_r",1],
			["diamondc",1],
			["goldbar",1],
			["goldbarp",1]
		]
	],
	
	["glass", _glassPrice, 500, 2000, 3, 1,
		[
			["iron_r",1],
			["oilp",1],
			["salt_r",1],
			["cement",1],
			["copper_r",1],
			["diamondc",1],
			["goldbar",1],
			["goldbarp",1]
		]
	],
	
	["cement", _cementPrice, 750, 2500, 3, 1,
		[
			["salt_r",1],
			["glass",1],
			["iron_r",1],
			["oilp",1],
			["copper_r",1],
			["diamondc",1],
			["goldbar",1],
			["goldbarp",1]
		]
	],
	
	["iron_r", _ironrPrice, 1000, 3000, 3, 1,
		[
			["oilp",1],
			["salt_r",1],
			["glass",1],
			["cement",1],
			["copper_r",1],
			["diamondc",1],
			["goldbar",1],
			["goldbarp",1]
		]
	],
	
	["copper_r", _copperPrice, 2000, 6000, 2, 1,
		[
			["salt_r",1],
			["glass",1],
			["cement",1],
			["iron_r",1],
			["oilp",1],
			["diamondc",1],
			["goldbar",1],
			["goldbarp",1]
		]
	],
	
	["oilp", _oilpPrice, 1250, 2000, 3, 1, 
		[
			["iron_r",1],
			["salt_r",1],
			["glass",1],
			["cement",1],
			["copper_r",1],
			["diamondc",1],
			["goldbar",1],
			["goldbarp",1]
		]
	],
	
	["marijuana", _marijuanaPrice, 3000, 9000, 7, 5,
		[
			["turtle",1]
		]
	],
	
	["diamondc", _diamondPrice, 4000, 10000, 5, 2,
		[
			["salt_r",1],
			["glass",1],
			["copper_r",1],
			["cement",1],
			["iron_r",1],
			["oilp",1],
			["goldbar",1],
			["goldbarp",1]
		]
	],
	
	["turtle", _turtlePrice, 5000, 12000, 20, 18,
		[
			["marijuana",1],
			["heroinp",1],
			["cocainep",1]
		]
	],
	
	["cocainep", _cocainePrice, 6000, 15000, 11, 8,
		[
			["marijuana",1],
			["turtle",1],
			["heroinp",1]
		]
	],
	
	["heroinp", _heroinPrice, 7500, 20000, 11, 8,
		[
			["marijuana",1],
			["turtle",1],
			["cocainep",1]
		]
	],
	
	["goldbar", _goldbarPrice, 150000, 300000, 2, 1,
		[
			["salt_r",1],
			["glass",1],
			["copper_r",1],
			["cement",1],
			["iron_r",1],
			["oilp",1],
			["diamondc",1],
			["goldbarp",1]
		]
	],
	
	["goldbarp", _goldbarpPrice, 100000, 200000, 2, 1,
		[
			["salt_r",1],
			["glass",1],
			["copper_r",1],
			["cement",1],
			["iron_r",1],
			["oilp",1],
			["goldbar",1],
			["diamondc",1]
		]
	]
];

publicVariable "life_market_resources";

diag_log "------------- Life Market Resources -------------";
diag_log format["Result: %1",life_market_resources];
diag_log "-------------------------------------------------";

life_market_shortnames = [];

{
	life_market_shortnames set [count life_market_shortnames, _x select 0];
}
foreach life_market_resources;

publicVariable "life_market_shortnames";

life_market_prices = [];
{
	life_market_prices set [count life_market_prices, [_x select 0, _x select 1, 0, 0] ];
}
foreach life_market_resources;
	
publicVariable "life_market_prices";

systemChat "Market Prices Generated!";