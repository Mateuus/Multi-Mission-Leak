/*
	File: fn_virt_shops.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Config for virtual shops.
*/
private["_shop"];
_shop = _this select 0;

switch (_shop) do
{
	case "market": {["Altis Market",["water","rabbit","apple","redgull","tbacon","pickaxe","schaufel","fuelF","peach","storagesmall","storagebig","lagerkiste"]]};
	case "pizza": {["Altis Market",["margarita","calzone"]]};
	case "rebel": {["Rebel Market",["water","rabbit","apple","redgull","tbacon","pickaxe","fuelF","peach","sprengstoffp"]]};
	case "gang": {["Gang Market", ["water","rabbit","apple","redgull","tbacon","pickaxe","fuelF","peach"]]};
	case "wongs": {["Wong's Food Cart",["turtlesoup","turtle"]]};
	case "coffee": {["Stratis Coffee Club",["coffee","donuts"]]};
	case "heroin": {["Drug Dealer",["cocainep","heroinp","marijuana","schnaps","methp","lsdp","xtc","sense"]]};
	case "oil": {["Oil Trader",["oilp"]]};
	case "kerosin": {["Kerosin Lager",["kerosin"]]};
	case "fishmarket": {["Altis Fish Market",["salema","ornate","mackerel","mullet","tuna","catshark"]]};
	case "glass": {["Altis Glass Dealer",["glass"]]};
	case "iron": {["Altis Industrial Trader",["iron_r","copper_r","stahl"]]};
	case "diamond": {["Diamond Dealer",["diamond","diamondc"]]};
	case "salt": {["Salt Dealer",["salt_r"]]};
	case "cop": {["Cop Item Shop",["donuts","coffee","spikeStrip","water","rabbit","apple","redgull","fuelF","defusekit","barrier","barricade","strahler","lockpick"]]};
	case "cement": {["Bauhof",["cement","glas"]]};
	case "gold": {["Gold Buyer",["goldbar"]]};
	case "antik": {["Antiquitäten Händler",["vase","schmuck","muenze"]]};
	case "zigexport": {["Zigarren Export",["zigarrenp"]]};
	case "tabakladen": {["Tabak Laden",["zigarettenp"]]};
	case "weinexport": {["Wein Export",["weinp"]]};
	case "schmuckexport": {["Schmuck Outlet Store",["sschmuck","gschmuck"]]};
	case "plastikhaendler": {["Plastik Händler",["plastik"]]};
	case "kohlehaendler": {["Kohle Händler",["kohle"]]};
	case "kieshaendler": {["Kies Händler",["kies"]]};
	case "edelmetall": {["Edelmetallhändler",["goldp","silberp"]]};
	case "medicmarkt": {["Medic Markt",["donuts","coffee","water","rabbit","apple","redgull","fuelF","lockpick","barrier","barricade","strahler"]]};
	case "fanshop": {["Fußball Merchandise",["megaphone"]]};

};