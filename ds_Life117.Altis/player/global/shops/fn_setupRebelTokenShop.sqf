/*
Darkside Life

Author: Shawn "Huntah" Macgillivray

Description:
	Sets up the list in the rebel token shop
*/
disableSerialization;
private["_shop","_dialog","_vehicleListPrice","_vehicleListStr","_className","_price","_weight","_img","_toolTip","_maxSpeed","_armorRating","_shopArray"];

_shop = _this select 0;
disableSerialization;
_dialog = findDisplay 666667;
_vehicleList = _dialog displayCtrl 1501;

ctrlShow[66653,false];
ctrlShow[778,false];
ctrlShow[777,false];
ctrlShow[66654,false];

_shopArray = [
["10 Minute Jail Card","(60 Tokens) Use this item while in jail to have your sentence legally ended",DS_item_jail10,"1",60],
["Super Safe Cracker","(200 Tokens) Crack open a safe at Fortknox in 10 minutes with this device",DS_item_safeCrackerAdv,"2",200],
["Get out of jail Card","(250 Tokens) Use this item while in jail to summon a free breakout",DS_item_jailBreak,"3",250],
["Bulletproof SUV","(850 Tokens) This will put an SUV with a bulletproof cabin into your garage",DS_item_jail10,"4",850],
["Steroids","(100 Tokens) Using this item will enable you to carry 500kg's for 1 hour",DS_item_steriods,"5",100],
["Steady Aim","(200 Tokens) Using this item will enable you to fire without recoil for 10 minutes",DS_item_noRecoil,"6",200],
["Quick KOS Cap","(40 Tokens) Using this item will enable you to capture Rebel Kos in 5 minutes",DS_item_quickCap,"7",40],
["Silent Convoy Starter","(160 Tokens) Having this item in your inventory when starting a Rebel Convoy will silence the server wide warning",DS_item_convoy,"9",160],
["Fully Armed Pawnee (Rental)","(600 Tokens) This will give you a fully armed pawnee (With missiles) to use as a rental",DS_item_pawnee,"8",600],
["Lotto Ticket","(5 Tokens and $1,000) Buy a lotto ticket",DS_item_pawnee,"10",5],
["Vehicle Ammo Upgrade","(500 Tokens) Applies extra ammo to the following vehicles (Hunter, Ifrit, Strider, Gorgon, Offroad)",DS_item_vehAmmo,"11",500]
];

lbClear _vehicleList;

{
	_className = (_x select 3);
	_price = (_x select 4);
	_name = (_x select 0);
	_toolTip = (_x select 1);
	_vehicleList lbAdd format ["%1",_name];
	_vehicleList lbSetTooltip [(lbSize _vehicleList)-1, _toolTip];
	_vehicleList lbSetColor [(lbSize _vehicleList)-1, [0, 1, 0, 0.5]];
	_vehicleList lbSetData [(lbSize _vehicleList)-1,_className];
} foreach _shopArray;

