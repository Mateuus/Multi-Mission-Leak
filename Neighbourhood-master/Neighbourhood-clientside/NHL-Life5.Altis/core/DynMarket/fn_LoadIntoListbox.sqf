/*
##################### DYNAMIC MARKET SCRIPT #####################
### AUTHOR: RYAN TT.                                          ###
### STEAM: www.steamcommunity.com/id/ryanthett                ###
###                                                           ###
### DISCLAIMER: THIS SCRIPT CAN BE USED ON EVERY SERVER ONLY  ###
###             WITH THIS HEADER / NOTIFICATION               ###
#################################################################
*/

if (isNil "DYNMARKET_prices") then {[[getPlayerUID player],"TON_fnc_playerLogged",false,false] spawn life_fnc_MP;hint "Suche nach den aktuellen Marktpreisen..";sleep 1;};

disableSerialization;
_dialog = findDisplay 7100;
_listbox = _dialog displayCtrl 7055;
_blacklist =
[
	"apple",
	"heroinu",
	"salema",
	"ornate",
	"mackerel",
	"tuna",
	"mullet",
	"catshark",
	"rabbit",
	"water",
	"coffee",
	"turtlesoup",
	"donuts",
	"tbacon",
	"lockpick",
	"pickaxe",
	"redgull",
	"peach",
	"cocaine",
	"diamond",
	"fuelF",
	"spikeStrip",
	"barrier",
	"barricade",
	"strahler",
	"bauma",
	"mais",
	"zucker",
	"brenn",
	"schaufel",
	"vase",
	"muenze",
	"schmuck",
	"silberu",
	"zigarettenu",
	"weinu",
	"sprengstoffu",
	"zigarrenu",
	"lsdu",
	"goldu",
	"methu",
	"bauschaufel",
	"kerosin",
	"zipties",
	"baumwolle",
	"goldbar"

	
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