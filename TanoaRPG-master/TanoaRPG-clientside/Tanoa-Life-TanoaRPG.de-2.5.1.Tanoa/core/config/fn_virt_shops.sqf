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
	case "market": {["Markt",["water","fuelK","rabbit","apple","storagebig","storagesmall","redgull","battery","tbacon","pickaxe","peach","boltcutter","fuelF","lockpick","uwsl"]]};
	case "rebel": {["Rebellen Markt",["water","rabbit","apple","storagebig","storagesmall","redgull","battery","tbacon","lockpick","pickaxe","zipties","peach","boltcutter","blastingcharge","fuelF","painkillers"]]};
	case "gang": {["Gang Markt", ["water","apple","redgull","battery","tbacon","lockpick","pickaxe","zipties","peach","blastingcharge","boltcutter","fuelF"]]};
	case "wongs": {["Schildkrötenhändler",["turtlesoup","turtle"]]};
	case "coffee": {["Stratis Coffee Club",["coffee","donuts"]]};
	case "heroin": {["Drogendealer",["cocainep","heroinp","crack","marijuana"]]};
	case "fishmarket": {["Tanoa Fischhändler",["salema","ornate","mackerel","mullet","tuna","catshark"]]};
	case "glass": {["Glassexport",["glass"]]};
	case "iron": {["Eisen und Kupfer Export",["iron_r","copper_r"]]};
	case "diamond": {["Diamantenexport",["diamond","diamondc"]]};
	case "salt": {["Salzhändler",["salt_r"]]};
	case "cop": {["TPD Items",["donuts","coffee","spikeStrip","mauer","einsatzschild","lockpick","battery","painkillers","redgull","defusekit","fuelF"]]};
	case "cement": {["Zementhändler",["cement"]]};
	case "beer": {["Weinhändler",["wine"]]};
	case "pharmacy": {["Apotheke",["painkillers","morphium","scalpel","kidney","defibrilator","battery"]]};
	case "medic": {["Arztbedarf",["apple","donuts","coffee","redgull","mauer","fuelF","painkillers","morphium","lockpick","scalpel","kidney","defibrilator","battery"]]};
	case "speakeasy": {["Speakeasy's",["bottledbeer","bottledwhiskey","bottledshine"]]};
	case "bar": {["The Lounge",["bottles","cornmeal"]]};
	case "uranlegal": {["Atomkraftwerk Tanoa",["brennstab"]]};
	case "uranillegal": {["Nordkorea Export",["sprengstoff"]]};
	case "steleme": {["Physiker",["stelement"]]};
	case "kero": {["Kerosinstation",["fuelK"]]};
	case "adacmarkt": {["Medic Markt",["water","rabbit","apple","storagebig","storagesmall","redgull","battery","tbacon","lockpick","pickaxe","zipties","peach","boltcutter","blastingcharge","fuelF",""]]};
	//case "duenger": {["Düngerverkäufer",["dueng"]]};
	
	
	/*
	Tanoa Farming 2.0
	Made for TanoaRPG.de
	Author: Tim "cat24max" Vogler
	
	Copyright statement:
	You may not reproduce, adapt, modify, communicate to the public, reproduce or otherwise use any part of this script (in particular for commercial purposes) except as set out below, or otherwise with the express written permission from the author.
	*/
	case "wood": {["XXS Einrichtungshaus",["woodfurniture"]]};
	case "sugar": {["Zuckerverkauf",["sugarprocessed"]]};
	case "water": {["Wasserladen",["waterbottle"]]};
	case "gold": {["Münzhändler",["goldcoins"]]};
	case "heat": {["Heizölexport",["oilheat"]]};
	case "diesel": {["Dieselexport",["oildiesel"]]};
	case "kerosin": {["Kerosinstation",["oilkerosin"]]};
	case "huntermaster": {["Alkohol Verkauf",["hmbottled"]]};
	case "huntermasterillegal": {["Alkohol Schmuggler",["hmillegal"]]};
	case "coffee1": {["Kaffeehandel",["coffee1"]]};
	case "energydrink": {["EnergyDrink Schmuggler",["energydrink"]]};
	case "angelstrumpet": {["Engelstrompeten",["angelstrumpetp"]]};
	case "crack": {["Crackdealer",["crack"]]};
};	