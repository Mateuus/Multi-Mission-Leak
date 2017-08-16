/*
Darkside Life

Author: Shawn "Huntah" Macgillivray

Description:
	returns the total weight of the item in question
*/

private["_bigFish","_zeroWeight","_item","_value","_weight","_mining","_processed","_drugsu","_drugsp"];

_item = [_this,0,"",[""]] call BIS_fnc_param; 
_value = [_this,1,0,[0]] call BIS_fnc_param; 
_weight = 0;
_index = 0;

switch(_item)do
	{
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
	case default {_weight = 1};
	};

_bigFish = ["tuna","catshark","turtle","mullet"];
_zeroWeight = ["battery","spyDocs","jail10","safeCrackerAdv","jailBreak","steriods","noRecoil","quickCap","pawnee","convoy","idChanger"];
_mining = ["oilu","diamondu","copperu","rocku","saltu","ironu","sandu","illegalRelicu","woodu","wheatu"];
_processed = ["oilp","diamondp","copperp","rockp","saltp","ironp","sandp","relic","illegalRelicp","woodp","wheatp"];
_drugsu = ["cocaineu","weedu","heroinu"];
_drugsp = ["cocainep","weedp","heroinp"];
if(_item in _mining)then{_weight = 4};
if(_item in _processed)then{_weight = 3};
if(_item in _drugsu)then{_weight = 6};
if(_item in _drugsp)then{_weight = 4};
if(_item in _zeroWeight)then{_weight = 0};
if(_item in _bigFish)then{_weight = 8};	
_weight = (_weight*_value);

_weight;
