/*
##################### DYNAMIC MARKET SCRIPT #####################
### AUTHOR: RYAN TT.                                          ###
### STEAM: www.steamcommunity.com/id/ryanthett                ###
###                                                           ###
### DISCLAIMER: THIS SCRIPT CAN BE USED ON EVERY SERVER ONLY  ###
###             WITH THIS HEADER / NOTIFICATION               ###
#################################################################
*/

_itemName = [_this,0,""] call BIS_fnc_param;

_iconPath = "";

switch (_itemName) do {
	case "apple": {_iconPath = "icons\items\apple.paa";};
	case "peach": {_iconPath = "icons\items\peach.paa";};
	case "orange": {_iconPath = "icons\items\orange.paa";};
	case "strawberry": {_iconPath = "icons\items\strawberry.paa";};
	case "blueberry": {_iconPath = "icons\items\blueberry.paa";};
	case "cement": {_iconPath = "icons\items\cement.paa";};
	case "copperore": {_iconPath = "icons\items\copperore.paa";};
	case "copper_r": {_iconPath = "icons\items\copper.paa";};
	case "diamond": {_iconPath = "icons\items\diamond.paa";};
	case "diamondc": {_iconPath = "icons\items\diamondc.paa";};
	case "glass": {_iconPath = "icons\items\glass.paa";};
	case "ironore": {_iconPath = "icons\items\ironore.paa";};
	case "iron_r": {_iconPath = "icons\items\iron.paa";};
	case "oilp": {_iconPath = "icons\items\oilp.paa";};
	case "salt_r": {_iconPath = "icons\items\saltr.paa";};
	case "wood": {_iconPath = "icons\items\wood.paa";};
	case "catshark": {_iconPath = "icons\items\catshark.paa";};
	case "mackerel": {_iconPath = "icons\items\mackerel.paa";};
	case "mullet": {_iconPath = "icons\items\mullet.paa";};
	case "ornate": {_iconPath = "icons\items\ornate.paa";};
	case "salema": {_iconPath = "icons\items\salema.paa";};
	case "tuna": {_iconPath = "icons\items\tuna.paa";};
	case "chicken_meat": {_iconPath = "icons\items\meat.paa";};
	case "sheep_meat": {_iconPath = "icons\items\meat.paa";};
	case "goat_meat": {_iconPath = "icons\items\meat.paa";};
	case "rabbit_meat": {_iconPath = "icons\items\meat.paa";};
	case "hops": {_iconPath = "icons\items\hops.paa";};
	case "mash": {_iconPath = "icons\items\mash.paa";};
	case "rye": {_iconPath = "icons\items\rye.paa";};
	case "cannabis": {_iconPath = "icons\items\cannabis.paa";};
	case "marijuana": {_iconPath = "icons\items\cannabis.paa";};
	case "cocaine": {_iconPath = "icons\items\coke.paa";};
	case "cocainep": {_iconPath = "icons\items\cokep.paa";};
	case "heroinu": {_iconPath = "icons\items\heroinu.paa";};
	case "heroinp": {_iconPath = "icons\items\heroin.paa";};
	case "joint": {_iconPath = "icons\items\cannabis.paa";};
	case "kidney": {_iconPath = "icons\items\kidney.paa";};
	case "turtle": {_iconPath = "icons\items\turtle.paa";};
	case "silverRing": {_iconPath = "icons\items\silverRing.paa";};
	case "goldRing": {_iconPath = "icons\items\goldRing.paa";};
	case "diamondRing": {_iconPath = "icons\items\diamondRing.paa";};
	case "pearlNecklace": {_iconPath = "icons\items\pearlNecklace.paa";};
	case "emerald": {_iconPath = "icons\items\emerald.paa";};
	case "sapphire": {_iconPath = "icons\items\sapphire.paa";};
	case "ruby": {_iconPath = "icons\items\ruby.paa";};
	case "goldbarp": {_iconPath = "icons\items\goldscrap.paa";};
	case "goldbar": {_iconPath = "icons\items\goldbar.paa";};
	case default {_iconPath = "icons\items\noicon.paa";};
};

_iconPath;