/*
	File: fn_virt_shops.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Config for virtual shops.
*/
private["_shop"];
_shop = _this select 0;

// Name, buyable, sellable
_items = switch (_shop) do
{
	case "rebel" : {["Rebel Market",["water","apple","redgull","adrenalineShot","fuelF","tbacon","painkillers","towRope","lockpick","ziptie","blindfold","vammo","boltCutter","demoCharge","drill","protest","speedbomb","razorwire","bagwallshort","bagwalllong","bagwallround"],["water","apple","redgull","adrenalineShot","fuelF","tbacon","painkillers","towRope","lockpick","ziptie","blindfold","goldbar","protest","dirty_money"]]};
	case "gas" : {["Gas Station Market",["water","apple","redgull","tbacon","fuelF","towRope","nitro","tracker","caralarm","airalarm","campfire","protest"],["water","apple","redgull","tbacon","fuelF","towRope","nitro","tracker","caralarm","airalarm","campfire","protest"]]};
	case "market": {[format["%1 Market", worldName],["water","apple","peach","beer","redgull","tbacon","painkillers","yeast","woodaxe","skinningknife","campfire","tent1","tent2","fuelF","pickaxe","phos","hydro","excavator","caralarm","protest"],["water","rabbit","apple","peach","chicken","chickenp","snake","snakep","rabbitp","goat","goatp","sheep","sheepp","redgull","tbacon","painkillers","yeast","towRope","skinningknife","timber","campfire","tent1","tent2","fuelF","pickaxe","phos","hydro","excavator","caralarm","protest","berry"]]};
	case "redburger": {["Red Burger",["redburger","soda","water","coffee","beer"],[]]};
	case "hospital": {["Asylum Hospital",["adrenalineShot","defib","bloodbag","splint","painkillers","marijuanam"],["marijuanam"]]};
	case "wongs": {["Wong's Food & Liquor",["turtlesoup","dogp","moonshine","yeast"],["turtlesoup","turtle","dog","dogp","moonshine","scotch_0","scotch_1","scotch_2","scotch_3","whiskeyc_0","whiskeyc_1","whiskeyc_2","whiskeyc_3","whiskeyr_0","whiskeyr_1","whiskeyr_2","whiskeyr_3"]]};
	case "coffee": {["Stratis Coffee Club",["coffee","donuts"],[]]};
	case "heroin": {["Drug Dealer",["cocainep","heroinp","marijuana","marijuanam","meth","ephedra","pcp"],["cocainep","heroinp","marijuana","marijuanam","meth","ephedra","pcp"]]};
	case "oil": {["Oil Trader",["oilp","pickaxe","fuelF","rubber"],["oilp","pickaxe","fuelF","rubber"]]};
	case "fishmarket": {[format["%1 Fish Market", worldName],["salema","ornate","mackerel","mullet","tuna","catshark"],["salema","ornate","mackerel","mullet","tuna","catshark"]]};
	case "glass": {["Glass Dealer",["glass"],["glass"]]};
	case "diamond": {["Jewelery Store",["diamondc","diamondf","ruby","pearl","doubloon","silverpiece","pickaxe"],["diamond","diamondc","diamondf","ruby","pearl","doubloon","silverpiece","pickaxe"]]};
	case "salt": {["Salt Dealer",["salt_r"],["salt_r"]]};
	case "cop": {["Cop Item Shop",["donuts","coffee","water","apple","redgull","fuelF","lockpick","spikeStrip","roadCone","roadBarrier","cncBarrier","cncBarrierL","barGate","painkillers","vammo"],["donuts","coffee","water","apple","redgull","fuelF","spikeStrip","roadCone","roadBarrier","cncBarrier","cncBarrierL","barGate","painkillers"]]};
	case "commod": {["Commodities Trader",["diamondc","iron_r","copper_r","woodaxe","pickaxe","glass","rubber","oilp"],["diamond","diamondc","iron_r","copper_r","pickaxe","glass","rubber","oilp","timber"]]};
	case "home": {["Home Improvement",["storage1","storage2","tent1","tent2","agingbarrel","woodaxe"],["storage1","storage2","tent1","tent2","agingbarrel","woodaxe"]]};
	case "vig": {["Bounty Hunter Shop",["water","apple","redgull","fuelF","tbacon","ziptie"],["water","apple","redgull","fuelF","tbacon","ziptie"]]};
	case "toasty": {["Toasty Palace",["toasty","soda","water","coffee","beer"],[]]};
	case "sandwich": {["Sandwich Palace",["sandwich","soda","water","coffee","beer"],[]]};
};

_items;