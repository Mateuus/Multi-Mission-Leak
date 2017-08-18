#include <macro.h>
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
	case "market": {["Altis Market",["apple","blueberry","bottles","chainsaw","civdefusekit","fuelF","gpstracker","orange","nitro","peach","pickaxe","storagesmall","storagebig","sechouse","strawberry","tbacon","tentciv","underwatercharge","water","wood","ammoBoxS","ammoBox","chicken_meat","sheep_meat","goat_meat","rabbit_meat"]]};
	case "rebel": {["Rebel Market",["blastingcharge","blindfold","boltcutter","demolitioncharge","fuelF","lockpick","speedbomb","tbacon","underwatercharge","vehAmmo","water","zipties","ammoBoxS","ammoBox"]]};
	case "gang": {["Gang Market", ["blastingcharge","blindfold","boltcutter","bottledbeer","bottledshine","bottledwhiskey","fuelF","gpstracker","joint","lockpick","tbacon","water","zipties"]]};
	case "wongs": {["Wong's Food Cart",["turtlesoup","turtle"]]};
	case "coffee": {["Stratis Coffee Club",["coffee","donuts"]]};
	case "heroin": {["Drug Dealer",["cocainep","heroinp","marijuana","methp","joint"]]};
	case "oil": {["Oil Trader",["oilp","pickaxe","fuelF"]]};
	case "fishmarket": {["Altis Fish Market",["ornate","salema","mullet","mackerel","catshark","tuna"]]};
	case "glass": {["Altis Glass Dealer",["glass"]]};
	case "iron": {["Altis Industrial Trader",["iron_r","copper_r"]]};
	case "diamond": {["Diamond Dealer",["diamond","diamondc"]]};
	case "salt": {["Salt Dealer",["salt_r"]]};
	case "cop":
	{
		switch(true) do
		{
			case (__GETC__(life_coplevel) == 0 ):
			{["Cop Item Shop",["coffee","donuts","handCuffs","handCuffKey","tbacon"]]};
			case (__GETC__(life_coplevel) == 1 ):
			{["Cop Item Shop",["coffee","donuts","gpstracker","handCuffs","handCuffKey","tbacon"]]};
			case (__GETC__(life_coplevel) == 2 ):
			{["Cop Item Shop",["bombdetect","civdefusekit","blueBarrier","coffee","donuts","defusekit","gpstracker","handCuffs","handCuffKey","spikeStrip","tbacon"]]};
			case (__GETC__(life_coplevel) == 3 ):
			{["Cop Item Shop",["barGate","bombdetect","civdefusekit","blueBarrier","cncBarrier","cncBarrierL","coffee","donuts","defusekit","floodLightSingle","flightLightDouble","gpstracker","handCuffs","handCuffKey","roadBarrier","roadCone","spikeStrip","tbacon"]]};
			case (__GETC__(life_coplevel) == 4 ):
			{["Cop Item Shop",["barGate","bombdetect","civdefusekit","blueBarrier","cncBarrier","cncBarrierL","coffee","donuts","defusekit","dogwhistle","floodLightSingle","floodLightDouble","gpstracker","handCuffs","handCuffKey","roadBarrier","roadCone","spikeStrip","tbacon"]]};
			case (__GETC__(life_coplevel) >= 5 ):
			{["Cop Item Shop",["barGate","bombdetect","civdefusekit","blueBarrier","cncBarrier","cncBarrierL","coffee","donuts","defusekit","dogwhistle","floodLightSingle","floodLightDouble","gpstracker","handCuffs","handCuffKey","mobileOutpost","outpostHMG","roadBarrier","roadCone","spikeStrip","tbacon","vehAmmo"]]};
		};
	};
	case "uc": {["Cop Item Shop",["coffee","donuts","gpstracker","handCuffs","handCuffKey","tbacon"]]};
	case "cement": {["Cement Dealer",["cement"]]};
	case "gold": {["Gold Buyer",["goldbar"]]};
	case "bar": {["The Lounge",["bottledbeer","bottledwhiskey"]]};
	case "speakeasy": {["Speakeasy's",["bottledwhiskey","bottledshine","bottledbeer","moonshine"]]};
	case "organ": {["Organ Dealer",["kidney","scalpel","handCuffKey","silverRing","goldRing","diamondRing","pearlNecklace","emerald","sapphire","ruby"]]}; 
	case "prospector": {["Gold Scrap Dealer",["goldbarp"]]};
	case "crafting": {["Crafting Store",["408Bullet","408Case","45Bullet","45Case","556Bullet","556Case","65Bullet","65Case","762Bullet","762Case","9mmBullet","9mmCase","chamber","electric","explosive","glasslens","gunpowder","handgrip","heavythread","leather","metalcase","metalplate","needle","primer","steeltube","thread","trigger","zipper"]]};
	case "bh": {["Bounter Hunter Item Shop",["blindfold","fuelF","lockpick","tbacon","tent","water","zipties"]]};
	case "c3": {["Class 3 Item Shop",[""]]};
};