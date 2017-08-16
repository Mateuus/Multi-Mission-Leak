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
	case "bar": {["The Lounge",["bottledbeer","bottledwhiskey","zigarette"]]}; case "speakeasy": {["Speakeasy's",["bottledwhiskey","bottledshine","bottledbeer","moonshine","zigarette"]]};
	case "market": {["Markt",[
	"cornmeal","bottles",
	"water","rabbit","graffiti","apple","redgull","card","protest","geocatch","tbacon","lockpick","pickaxe","fuelF","peach","boltcutter","storagesmall","storagebig","zigarette","axe"]]};
	case "rebel": {["Rebellendealer",["tracker","sensor","water","rabbit","apple","redgull","tbacon","lockpick","pickaxe","fuelF","peach","boltcutter","blastingcharge"]]};
	case "gang": {["Gangdealer", ["water","rabbit","apple","redgull","tbacon","lockpick","pickaxe","fuelF","peach","blastingcharge","boltcutter","tracker","sensor"]]};
	case "wongs": {["Wong's Food Cart",["turtlesoup","turtle"]]};
	case "coffee": {["Stratis Coffee Club",["coffee","donuts"]]};
	case "heroin": {["Drogendealer",["cocainep","heroinp","marijuana","procMeth"]]};
	case "oil": {["Oelhaendler",["oilp","pickaxe","fuelF"]]};
	case "Fischmarket": {["Fisch Markt",["salema","ornate","mackerel","mullet","tuna","catshark"]]};
	case "glass": {["Glasshaendler",["glass"]]};
	case "iron": {["Industriehaendler",["iron_r","copper_r"]]};
	case "diamond": {["Diamantenhaendler",["diamond","diamondc"]]};
	case "salt": {["Salzhaendler",["salt_r"]]};
	case "cop": {["Polizei Item Shop",(["donuts","coffee","spikeStrip","water","rabbit","apple","redgull","fuelF","defusekit","tracker2","sensor1","roadbarrier1","roadcone1"])]};
	case "cement": {["Zementhaendler",["cement"]]};
	case "gold": {["Goldhaendler",["goldbar"]]};
	case "gas": {["Gashaendler",["gas"]]};
	case "uran": {["Urandealer",["uran"]]};
	case "zigarette": {["Tabakhandel",["zigarette"]]};
	case "organ": {["Organhandel",["kidney"]]};
	case "wood": {["Holzhandel",["woodp"]]};
	case "med_market": {["Arztshop",["roadbarrier1","roadcone1"]]};
	case "kippe": {["Loewenherz Tabaco",["lzigarette","krauser","rooth","malle","zigarette","stoivesant"]]};
	case "sec_market": {["Security Item Shop",["water","rabbit","apple","redgull","tbacon","tracker2","sensor1","fuelF","lockpick"]]};
	case "gang_area_market": {["Gangdealer", ["water","rabbit","apple","redgull","tbacon","lockpick","pickaxe","fuelF","peach","blastingcharge","boltcutter","tracker","sensor"]]};
	case "labor": {["Meth Kueche",["unpMeth"]]};
};