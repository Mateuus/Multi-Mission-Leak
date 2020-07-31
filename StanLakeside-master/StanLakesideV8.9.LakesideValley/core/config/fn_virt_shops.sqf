/*
	File: fn_virt_shops.sqf
	
	
	Description:
	Config for virtual shops.
*/
private["_shop"];
_shop = _this select 0;

switch (_shop) do
{
	case "phones": {["Telefony i dodatki",["nos"]]};
	case "market": {["Market",["medkit","condom","bandage","water","tierope","bec","cigarette","rabbit","apple","redgull","tbacon","lockpick","fuelF","peach","boltcutter","storagesmall","storagebig"]]};
	case "drinks": {["Bar u Zbysia",["cigarette","zoobeer","zoobeer2","vodka","jagerbomb","absinthe","redwine","whiterussian","sexonthebeach","tequila","jackdanielsandcoke","Rax's Rum","water","redgull"]]};
	case "rebel": {["Market rebelii",["tierope","bandage","RoadBlockConc","water","rabbit","apple","redgull","tbacon","lockpick","pickaxe","fuelF","peach","boltcutter","blastingcharge","hackingtool"]]};
	case "gang": {["Gang Market", ["bandage","water","rabbit","apple","redgull","tbacon","lockpick","pickaxe","fuelF","peach","blastingcharge","boltcutter"]]};
	case "wongs": {["Fanatyk zolwi",["turtlesoup","turtle"]]};
	case "coffee": {["Kawiarnia",["coffee","donuts"]]};
	case "heroin": {["Diler narkotykowy",["marijuana","cokep","cokeu","methp","methu","MDMAp","MDMAu"]]};
	case "gems": {["Handlarz klejnotow",["sapphire","ruby","emerald"]]};
	case "oil": {["Handlarz ropy z USA",["oilp","pickaxe","fuelF"]]};
	case "fishmarket": {["Market rybny",["salema","ornate","mackerel","mullet","tuna","catshark"]]};
	case "farmingmarket": {["Market",["wheat","sunflower","corn","bean","cotton","olive","opium","cannabis","pumpkin"]]};	
	case "glass": {["Szklarz",["glass"]]};
	case "iron": {["Hutnik",["iron_r","copper_r"]]};
	case "diamond": {["Jubiler",["weddingring","diamond","diamondc"]]};
	case "salt": {["Handlarz sola",["salt_r"]]};
	case "cop": {["Przedmioty policyjne",["medkit","panicbutton","bandage","fuelF","defusekit","BarGate","RoadBlockWood","RoadCone","RoadConeStrip","RoadConeB","RoadConeStripB"]]};
	case "donuts": {["Dunkin Donuts",["donuts","coffee","water","redgull"]]};
	case "cement": {["Handalrz cementem",["cement"]]};
	case "gold": {["Zlotnik",["goldbar"]]};
	case "ems": {["Przedmioty EMS",["airkit","panicbutton","condom","bec","water","rabbit","apple","redgull","tbacon","peach","RoadBlockWood","RoadCone","RoadConeStrip","RoadConeB","RoadConeStripB"]]};
	case "butcher": {["Rzeznik",["Raw Meat"]]};
};


