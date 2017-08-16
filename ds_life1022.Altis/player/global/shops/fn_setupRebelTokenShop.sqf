/*
	Darkside Life

	Author: Shawn "Huntah" Macgillivray

	Description:
	Sets up the list in the rebel token shop
*/

private ["_shop","_dialog","_list","_shopArray","_className","_price","_name","_tooltip","_index"];

disableSerialization;

_shop = _this select 0;
_dialog = findDisplay 666667;
_list = _dialog displayCtrl 1501;

ctrlShow [66653,false];
ctrlShow [778,false];
ctrlShow [777,false];
ctrlShow [66654,false];

_shopArray = [];

if(_shop isEqualTo 162)then {
	_shopArray = [
		["Rebel Ladder","(50 Tokens) Use this item place a ladder, enabling you to scale walls",DS_item_jail10,"1",50],
		["Super Safe Cracker","(50 Tokens) Crack open a safe at Fort Knox or the Research Facility 5 minutes quicker with this device",DS_item_safeCrackerAdv,"2",50],
		["Get out of jail Card","(75 Tokens) Use this item while in jail to summon a free breakout",DS_item_jailBreak,"3",75],
		["Bulletproof SUV","(500 Tokens) This will put an SUV with a bulletproof cabin into your garage",DS_item_jail10,"4",500],
		["Steroids","(30 Tokens) Using this item will enable you to carry 500kg's for 1 hour",DS_item_steroids,"5",30],
		["Spy Document","(60 Tokens) Either sold for cash at rebel outpost or traded in to complete certain quest",DS_item_spyDocs,"6",60],
		["Quick KOS Cap","(20 Tokens) Using this item will enable you to capture Rebel Kos in 15 minutes",DS_item_quickCap,"7",20],
		["Silent Convoy Starter","(80 Tokens) Having this item in your inventory when starting a Rebel Convoy will silence the server wide warning",DS_item_convoy,"9",80],
		["Lotto Ticket","(1 Token and $1,000) Buy a lotto ticket",DS_item_pawnee,"10",1],
		["Vehicle Ammo Upgrade","(200 Tokens) Applies extra ammo to the following vehicles (Hunter, Ifrit, Strider, Gorgon, Offroad)",DS_item_vehAmmo,"11",200],
		["Hydrochloric Acid Pack","(10 Tokens) Use this cook meth or to craft Steady Aim items",DS_item_hydroPack,"13",10],
		["Sodium Hydroxide Pack","(10 Tokens) Use this cook meth or to craft Steady Aim items",DS_item_sodiumPack,"14",10],
		["Steady Aim","(20 Tokens) Use this item to give you no recoil for 10 minutes",DS_item_noRecoil,"15",20],
		["Air Vehicle Ammo Upgrade","(400 Tokens) Adds ammo to the following air vehicles (Pawnee, Orca, Kajman, Blackfoot)",DS_item_weaponsAir,"16",400],
		["3x RPG AT Rocket","(10 Tokens) Use this to convert it into 3x RPG AT Rockets",DS_item_ammoRpgAdv,"17",10],
		["3x RPG HE Rocket","(10 Tokens) Use this to convert it into 3x RPG HE Rockets",DS_item_ammoRpgHEAdv,"18",10],
		["Navid Weapon","(50 Tokens) Use this to convert it into a Navid",DS_item_gunNavid,"19",20],
		["Vehicle Airbags","(30 Tokens) Use this on a vehicle to give it 100 air bags",DS_item_airbags,"20",30],
		["Vehicle Insurance","(60 Tokens) Use this on a vehicle to give it one insurance life",DS_item_insurance,"21",40],
		["Advanced Body Armour","(5 Tokens) Use this to give yourself 50% stronger body armour",DS_item_armourAdv,"22",5],
		["SPMG","(50 Tokens) Use this to convert it into an SPMG",DS_item_gunSpmg,"23",20],
		["Lynx Ammo","(10 Tokens) 5 Pack of Lynx Ammo",DS_item_gunSpmg,"26",10]
	];

	if((DS_infoArray select 17) > 29)then{_shopArray pushBack ["Armed Plane (Rental)","(250 Tokens) This will give you an armed plane (With HMG) to use as a rental",DS_item_pawnee,"25",250];};
	if((DS_infoArray select 17) > 34)then{_shopArray pushBack ["Fully Armed Pawnee (Rental)","(300 Tokens) This will give you a fully armed pawnee (With missiles) to use as a rental",DS_item_pawnee,"8",300];};
	if((DS_infoArray select 17) > 38)then{_shopArray pushBack ["Blackfoot Chopper","(1200 Tokens) A Y inventory item that when used spawns a blackfoot chopper for your use",DS_item_blackfoot,"12",1200];};
} else {
	_shopArray = [
		["Rebel Ladder","(200 Tokens) Use this item place a ladder, enabling you to scale walls",DS_item_jail10,"1",200],
		["Super Safe Cracker","(200 Tokens) Crack open a safe at Fort Knox or the Research Facility 5 minutes quicker with this device",DS_item_safeCrackerAdv,"2",200],
		["Get out of jail Card","(250 Tokens) Use this item while in jail to summon a free breakout",DS_item_jailBreak,"3",250],
		["Bulletproof SUV","(850 Tokens) This will put an SUV with a bulletproof cabin into your garage",DS_item_jail10,"4",850],
		["Steroids","(100 Tokens) Using this item will enable you to carry 500kg's for 1 hour",DS_item_steroids,"5",100],
		["Spy Document","(150 Tokens) Either sold for cash at rebel outpost or traded in to complete certain quest",DS_item_spyDocs,"6",150],
		["Quick KOS Cap","(40 Tokens) Using this item will enable you to capture Rebel Kos in 15 minutes",DS_item_quickCap,"7",40],
		["Silent Convoy Starter","(160 Tokens) Having this item in your inventory when starting a Rebel Convoy will silence the server wide warning",DS_item_convoy,"9",160],
		["Lotto Ticket","(5 Tokens and $1,000) Buy a lotto ticket",DS_item_pawnee,"10",5],
		["Vehicle Ammo Upgrade","(500 Tokens) Applies extra ammo to the following vehicles (Hunter, Ifrit, Strider, Gorgon, Offroad)",DS_item_vehAmmo,"11",500]
	];

	if((DS_infoArray select 17) > 29)then{_shopArray pushBack ["Armed Plane (Rental)","(500 Tokens) This will give you an armed plane (With HMG) to use as a rental",DS_item_pawnee,"24",500];};
	if((DS_infoArray select 17) > 34)then{_shopArray pushBack ["Fully Armed Pawnee (Rental)","(600 Tokens) This will give you a fully armed pawnee (With missiles) to use as a rental",DS_item_pawnee,"8",600];};
	if((DS_infoArray select 17) > 38)then{_shopArray pushBack ["Blackfoot Chopper","(2500 Tokens) A Y inventory item that when used spawns a blackfoot chopper for your use",DS_item_blackfoot,"12",2500];};
};

lbClear _list;

{
	_className = (_x select 3);
	_price = (_x select 4);
	_name = (_x select 0);
	_tooltip = (_x select 1);

	_index = _list lbAdd format ["%1",_name];
	_list lbSetTooltip [_index,_tooltip];
	_list lbSetColor [_index,[0,1,0,0.5]];
	_list lbSetData [_index,_className];
} forEach _shopArray;