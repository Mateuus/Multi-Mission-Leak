/*
##################### DYNAMIC MARKET SCRIPT #####################
### AUTHOR: RYAN TT.                                          ###
### STEAM: www.steamcommunity.com/id/ryanthett                ###
###                                                           ###
### DISCLAIMER: THIS SCRIPT CAN BE USED ON EVERY SERVER ONLY  ###
###             WITH THIS HEADER / NOTIFICATION               ###
#################################################################
*/

if (isNil "DYNMARKET_prices") then {[[getPlayerUID player],"TON_fnc_playerLogged",false,false] spawn life_fnc_MP;hint "Getting current prices from the server..";sleep 1;};

disableSerialization;
_dialog = findDisplay 7100;
_listbox = _dialog displayCtrl 7055;
_blacklist =
[
	"408Bullet",
	"408Case",
	"45Bullet",
	"45Case",
	"556Bullet",
	"556Case",
	"65Bullet",
	"65Case",
	"762Bullet",
	"762Case",
	"9mmBullet",
	"9mmCase",
	"ammoBox",
	"ammoBoxS",
	"barGate",
	"beerp",
	"blastingcharge",
	"blindfold",
	"boltcutter",
	"bombdetect",
	"bottledbeer",
	"bottledshine",
	"bottledwhiskey",
	"bottles",
	"chainsaw",
	"chamber",
	"civdefusekit",
	"cncBarrier",
	"cncBarrierL",
	"bluebarrier",
	"coffee",
	"cornmeal",
	"defusekit",
	"demolitioncharge",
	"dogwhistle",
	"donuts",
	"electric",
	"explosive",
	"floodLightDouble",
	"floodLightSingle",
	"fuelF",
	"glasslens",
	"gpstracker",
	"nitro",
	"gunpowder",
	"handCuffs",
	"handCuffKey",
	"handgrip",
	"heavythread",
	"hops",
	"joint",
	"leather",
	"lockpick",
	"mash",
	"metalcase",
	"metalplate",
	"mobileOutpost",
	"moonshine",
	"needle",
	"outpostHMG",
	"pickaxe",
	"primer",
	"roadBarrier",
	"roadCone",
	"rye",
	"scalpel",
	"speedbomb",
	"spikeStrip",
	"steeltube",
	"storagebig",
	"storagesmall",
	"tbacon",
	"tentciv",
	"thread",
	"trigger",
	"turtlesoup",
	"underwatercharge",
	"vehAmmo",
	"water",
	"whiskey",
	"yeast",
	"zipper",
	"zipties"
];

{
	_itemdisplayname = [([(_x select 0),0] call life_fnc_varHandle)] call life_fnc_varToStr;
	_itemIconPath = [_x select 0] call life_fnc_DYNMARKET_getIcon;
	if !(_x select 0 in _blacklist) then {
		_listbox lbAdd format ["%1",_itemdisplayname];
		_listbox lbSetData [(lbSize _listbox)-1,_x select 0];
		if (_itemIconPath!="") then {_listbox lbSetPicture [(lbSize _listbox )-1,_itemIconPath];};
	};
} forEach DYNMARKET_prices;