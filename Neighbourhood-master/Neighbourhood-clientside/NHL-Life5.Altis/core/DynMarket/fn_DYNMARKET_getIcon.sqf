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
	case "oilp": {_iconPath = "icons\items\oil_processed.paa";};
	case "heroinp": {_iconPath = "icons\items\heroin_processed.paa";};
	case "marijuana": {_iconPath = "icons\items\marijuana.paa";};
	case "iron_r": {_iconPath = "icons\items\iron.paa";};
	case "silberp": {_iconPath = "icons\items\silberbarren.paa";};
	case "copper_r": {_iconPath = "icons\items\copper.paa";};
	case "salt_r": {_iconPath = "icons\items\salt.paa";};
	case "glass": {_iconPath = "icons\items\glass.paa";};
	case "diamondc": {_iconPath = "icons\items\diamond.paa";};
	case "peach": {_iconPath = "icons\items\peach.paa";};
	case "cocainep": {_iconPath = "icons\items\cocain_processed.paa";};
	case "cement": {_iconPath = "icons\items\cement.paa";};
	case "schnaps": {_iconPath = "icons\items\moonshine.paa";};
	case "goldp": {_iconPath = "icons\items\ico_Goldbarren.paa";};
	case "zigarrenp": {_iconPath = "icons\items\ico_Zigarren.paa";};
	case "zigarettenp": {_iconPath = "icons\items\zigaretten.paa";};
	case "gschmuck": {_iconPath = "icons\items\ico_Goldschmuck.paa";};
	case "sschmuck": {_iconPath = "icons\items\ico_Silberrschmuck.paa";};
	case "lsdp": {_iconPath = "icons\items\ico_LSD.paa";};
	case "weinp": {_iconPath = "icons\items\wein.paa";};
	case "sprengstoffp": {_iconPath = "icons\items\ico_Dynamite.paa";};
	case "methp": {_iconPath = "icons\items\methp.paa";};
	case "kohle": {_iconPath = "icons\items\coal.paa";};
	case "stahl": {_iconPath = "icons\items\stahl.paa";};
	case "kies": {_iconPath = "icons\items\kies.paa";};
	case "xtc": {_iconPath = "icons\items\methu.paa";};
	case "sense": {_iconPath = "icons\items\methp.paa";};
	case "plastik": {_iconPath = "icons\items\plastik.paa";};
	case "turtle": {_iconPath = "icons\items\turtle.paa";};
	case default {_iconPath = "";};
};

_iconPath;