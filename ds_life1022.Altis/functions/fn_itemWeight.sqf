/*
	Darkside Life

	Author: Shawn "Huntah" Macgillivray

	Description:
	Returns the weight of an item
*/

private ["_weight","_index","_bigFish","_zeroWeight","_mining","_processed","_drugsu","_drugsp"];

params [
	["_item","",[""]],
	["_value",0,[0]]
];

_weight = 0;
_index = 0;

switch(_item)do {
	case "water": {_weight = 1};
	case "goKart": {_weight = 10};
	case "hydroPack": {_weight = 20};
	case "sodiumPack": {_weight = 20};
	case "goldBar": {_weight = 2};
	case "goldBarMedium": {_weight = 4};
	case "goldBarLarge": {_weight = 8};
	case "pickAxe": {_weight = 4};
	case "meth": {_weight = 2};
	case "c4": {_weight = 5};
	case "cracker": {_weight = 10};
	case "spikeStrip": {_weight = 4};
	case "UAV": {_weight = 10};
	case "fuelDart": {_weight = 3};
	case "lockpick": {_weight = 2};
	case "refuelKit": {_weight = 3};
	case "ied": {_weight = 20};
	case "jail10": {_weight = 20};
	case default {_weight = 1};
};

_bigFish = ["tuna","catshark","turtle","mullet"];
_zeroWeight = ["battery","spyDocs","safeCrackerAdv","jailBreak","steroids","noRecoil","quickCap","pawnee","convoy","idChanger"];
_mining = ["oilu","diamondu","copperu","rocku","saltu","ironu","sandu","illegalRelicu","woodu","wheatu"];
_processed = ["oilp","diamondp","copperp","rockp","saltp","ironp","sandp","relic","illegalRelicp","woodp","wheatp"];
_drugsu = ["cocaineu","weedu","heroinu"];
_drugsp = ["cocainep","weedp","heroinp"];

switch(true)do {
	case (_item in _mining): {_weight = 4;};
	case (_item in _processed): {_weight = 3;};
	case (_item in _drugsu): {_weight = 6;};
	case (_item in _drugsp): {_weight = 4;};
	case (_item in _zeroWeight): {_weight = 0;};
	case (_item in _bigFish): {_weight = 8;};
};

_weight = (_weight*_value);

_weight;