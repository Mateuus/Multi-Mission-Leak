/*
	Darkside Life

	Author: Shawn "Huntah" Macgillivray

	Description:
	Use your rebel tokens
*/

disableSerialization;

private["_freeSpace","_tokens","_weight","_index","_buyMulti","_strName"];

_group = shawn1 getVariable ["gangOwner",grpNull];
if((isNull _group)&&(!(cursorTarget getVariable ["GCU",false]))&&(player distance shawn1 < 1000))exitwith{hint "You must own the rebel KOS zone to use this shop"};
if((((group player) != _group)&&(!(cursorTarget getVariable ["GCU",false])))&&(player distance shawn1 < 1000))exitwith{hint "You must own the rebel KOS zone to use this shop"};
_cost = 666;
_tokens = (DS_realEstateArray select 6);
if(DS_doingStuff)exitwith{};
DS_doingStuff = true;
_freeSpace = DS_maxWeight - DS_currentWeight;
switch(DS_className)do
	{
	case "1":
		{
		if(_freeSpace < 20)exitwith{hint "You need 20kg of free space to buy this"};
		if((DS_infoArray select 33) > 1)then{_cost = 50}else{_cost = 200};
		if(_tokens < _cost)exitwith{hint format ["You don't have enough tokens for this item, you lack %1",(_cost-(_tokens))];};
		["jail10",true,1] call DS_fnc_handleInventory;
		hint "Item Added! \n\n\nUse this item place a ladder, enabling you to scale walls (WARNING - This item can not be stored)";
		systemChat "Item Added! Use this item place a ladder, enabling you to scale walls (WARNING - This item can not be stored)";
		_tempNum = _tokens - _cost;
		DS_realEstateArray set [6,_tempNum];
		};
	case "2":
		{
		if((DS_infoArray select 33) > 1)then{_cost = 50}else{_cost = 200};
		if(_tokens < _cost)exitwith{hint format ["You don't have enough tokens for this item, you lack %1",(_cost-(_tokens))];};
		["safeCrackerAdv",true,1] call DS_fnc_handleInventory;
		hint "Item Added! \n\n\nHave this item in your inventory while cracking the Fort Knox safe to shave 5 minutes from the timer";
		systemChat "Item Added! Have this item in your inventory while cracking the Fort Knox safe to shave 5 minutes from the timer";
		_tempNum = _tokens - _cost;
		DS_realEstateArray set [6,_tempNum];
		};
	case "3":
		{
		if((DS_infoArray select 33) > 1)then{_cost = 75}else{_cost = 250};
		if(_tokens < _cost)exitwith{hint format ["You don't have enough tokens for this item, you lack %1",(_cost-(_tokens))];};
		["jailBreak",true,1] call DS_fnc_handleInventory;
		hint "Item Added! \n\n\nUse this item while in jail to have an elite terrorist group quickly break you out";
		systemChat "Item Added! Use this item while in jail to have an elite terrorist group quickly break you out";
		_tempNum = _tokens - _cost;
		DS_realEstateArray set [6,_tempNum];
		};
	case "4":
		{
		if((DS_infoArray select 33) > 1)then{_cost = 500}else{_cost = 850};
		if(_tokens < _cost)exitwith{hint format ["You don't have enough tokens for this item, you lack %1",(_cost-(_tokens))];};
		[(getPlayerUID player),civilian,"Car","C_SUV_01_F",true] remoteExec ["HUNT_fnc_vehicleRewards",2];
		hint "Item Added! \n\n\nA Bulletproof SUV has been added to your garage";
		systemChat "Item Added! A Bulletproof SUV has been added to your garage";
		_tempNum = _tokens - _cost;
		DS_realEstateArray set [6,_tempNum];
		};
	case "5":
		{
		if((DS_infoArray select 33) > 1)then{_cost = 30}else{_cost = 100};
		if(_tokens < _cost)exitwith{hint format ["You don't have enough tokens for this item, you lack %1",(_cost-(_tokens))];};
		["steroids",true,1] call DS_fnc_handleInventory;
		hint "Item Added! \n\n\nUse this item to raise your carry weight to 500 kg's for 1 hour";
		systemChat "Item Added! Use this item to raise your carry weight to 500 kg's for 1 hour";
		_tempNum = _tokens - _cost;
		DS_realEstateArray set [6,_tempNum];
		};
	case "6":
		{
		if((DS_infoArray select 33) > 1)then{_cost = 60}else{_cost = 150};
		if(_tokens < _cost)exitwith{hint format ["You don't have enough tokens for this item, you lack %1",(_cost-(_tokens))];};
		["spyDocs",true,1] call DS_fnc_handleInventory;
		hint "Item Added! \n\n\nEither sell this item at rebel outpost or trade it in for certain quest completions";
		systemChat "Item Added! Either sell this item at rebel outpost or trade it in for certain quest completions";
		_tempNum = _tokens - _cost;
		DS_realEstateArray set [6,_tempNum];
		};
	case "7":
		{
		if((DS_infoArray select 33) > 1)then{_cost = 20}else{_cost = 40};
		if(_tokens < _cost)exitwith{hint format ["You don't have enough tokens for this item, you lack %1",(_cost-(_tokens))];};
		["quickCap",true,1] call DS_fnc_handleInventory;
		hint "Item Added! \n\n\nHave this item in your inventory while capturing rebel KOS to lower the cap time to 5 minutes";
		systemChat "Item Added! Have this item in your inventory while capturing rebel KOS to lower the cap time to 5 minutes";
		_tempNum = _tokens - _cost;
		DS_realEstateArray set [6,_tempNum];
		};
	case "8":
		{
		if((DS_infoArray select 33) > 1)then{_cost = 300}else{_cost = 600};
		if(_tokens < _cost)exitwith{hint format ["You don't have enough tokens for this item, you lack %1",(_cost-(_tokens))];};
		["pawnee",true,1] call DS_fnc_handleInventory;
		hint "Item Added! \n\n\nUse this item to spawn yourself a fully armed rental pawnee";
		systemChat "Item Added! Use this item to spawn yourself a fully armed rental pawnee";
		_tempNum = _tokens - _cost;
		DS_realEstateArray set [6,_tempNum];
		};
	case "9":
		{
		if((DS_infoArray select 33) > 1)then{_cost = 80}else{_cost = 160};
		if(_tokens < _cost)exitwith{hint format ["You don't have enough tokens for this item, you lack %1",(_cost-(_tokens))];};
		["convoy",true,1] call DS_fnc_handleInventory;
		hint "Item Added! \n\n\nUse this item to silence the server wide warning of a rebel convoy";
		systemChat "Item Added! Use this item to silence the server wide warning of a rebel convoy";
		_tempNum = _tokens - _cost;
		DS_realEstateArray set [6,_tempNum];
		};
	case "10":
		{
		if((DS_infoArray select 33) > 1)then{_cost = 1}else{_cost = 5};
		if(DS_coin < 1000)exitwith{hint "You need $1k to buy this ticket aswell as your tokens"};
		if(_tokens < _cost)exitwith{hint format ["You don't have enough tokens for this item, you lack %1",(5-(_tokens))];};
		[] spawn DS_fnc_lottoBuy;
		_tempNum = _tokens - _cost;
		DS_realEstateArray set [6,_tempNum];
		};
	case "11":
		{
		if(_freeSpace < 1)exitwith{hint "You need 1kg of free space to buy this"};
		if((DS_infoArray select 33) > 200)then{_cost = 1}else{_cost = 500};
		if(_tokens < _cost)exitwith{hint format ["You don't have enough tokens for this item, you lack %1",(_cost-(_tokens))];};
		["vehAmmo",true,1] call DS_fnc_handleInventory;
		hint "Item Added! \n\n\nUse this item to upgrade the Ammo on Armed land vehicles";
		systemChat "Item Added! Use this item to upgrade the Ammo on Armed land vehicles";
		_tempNum = _tokens - _cost;
		DS_realEstateArray set [6,_tempNum];
		};
	case "12":
		{
		if(_freeSpace < 1)exitwith{hint "You need 1kg of free space to buy this"};
		if((DS_infoArray select 33) > 1)then{_cost = 1200}else{_cost = 2500};
		if(_tokens < 2500)exitwith{hint format ["You don't have enough tokens for this item, you lack %1",(_cost-(_tokens))];};
		["blackfoot",true,1] call DS_fnc_handleInventory;
		hint "Item Added! \n\n\nUse this item to spawn yourself an armed rental blackfoot";
		systemChat "Item Added! Use this item to spawn yourself an armed rental blackfoot";
		_tempNum = _tokens - 2500;
		DS_realEstateArray set [6,_tempNum];
		};
	case "13":
		{
		if(_freeSpace < 20)exitwith{hint "You need 20kg of free space to buy this"};
		if(_tokens < 10)exitwith{hint format ["You don't have enough tokens for this item, you lack %1",(10-(_tokens))];};
		["hydroPack",true,1] call DS_fnc_handleInventory;
		hint "Item Added! \n\n\nUse this cook meth or to craft Steady Aim items";
		systemChat "Item Added! Use this cook meth or to craft Steady Aim items";
		_tempNum = _tokens - 10;
		DS_realEstateArray set [6,_tempNum];
		};
	case "14":
		{
		if(_freeSpace < 20)exitwith{hint "You need 20kg of free space to buy this"};
		if(_tokens < 10)exitwith{hint format ["You don't have enough tokens for this item, you lack %1",(10-(_tokens))];};
		["sodiumPack",true,1] call DS_fnc_handleInventory;
		hint "Item Added! \n\n\nUse this cook meth or to craft Steady Aim items";
		systemChat "Item Added! Use this cook meth or to craft Steady Aim items";
		_tempNum = _tokens - 10;
		DS_realEstateArray set [6,_tempNum];
		};
	case "15":
		{
		if(_tokens < 20)exitwith{hint format ["You don't have enough tokens for this item, you lack %1",(20-(_tokens))];};
		["noRecoil",true,1] call DS_fnc_handleInventory;
		hint "Item Added! \n\n\nUse this item to give you no recoil for 10 minutes";
		systemChat "Item Added! Use this item to give you no recoil for 10 minutes";
		_tempNum = _tokens - 20;
		DS_realEstateArray set [6,_tempNum];
		};
	case "16":
		{
		if(_freeSpace < 1)exitwith{hint "You need 1kg of free space to buy this"};
		if(_tokens < 400)exitwith{hint format ["You don't have enough tokens for this item, you lack %1",(400-(_tokens))];};
		["weaponsAir",true,1] call DS_fnc_handleInventory;
		hint "Item Added! \n\n\nAdds ammo to the following air vehicles (Pawnee, Orca, Kajman, Blackfoot)";
		systemChat "Item Added! Adds ammo to the following air vehicles (Pawnee, Orca, Kajman, Blackfoot)";
		_tempNum = _tokens - 400;
		DS_realEstateArray set [6,_tempNum];
		};
	case "17":
		{
		if(_freeSpace < 1)exitwith{hint "You need 1kg of free space to buy this"};
		if(_tokens < 10)exitwith{hint format ["You don't have enough tokens for this item, you lack %1",(10-(_tokens))];};
		["ammoRpgAdv",true,1] call DS_fnc_handleInventory;
		hint "Item Added! \n\n\nUse this to convert it into 3x RPG AT Rockets";
		systemChat "Item Added! Use this to convert it into 3x RPG AT Rockets";
		_tempNum = _tokens - 10;
		DS_realEstateArray set [6,_tempNum];
		};
	case "18":
		{
		if(_freeSpace < 1)exitwith{hint "You need 1kg of free space to buy this"};
		if(_tokens < 10)exitwith{hint format ["You don't have enough tokens for this item, you lack %1",(10-(_tokens))];};
		["ammoRpgHEAdv",true,1] call DS_fnc_handleInventory;
		hint "Item Added! \n\n\nUse this to convert it into 3x RPG HE Rockets";
		systemChat "Item Added! Use this to convert it into 3x RPG HE Rockets";
		_tempNum = _tokens - 10;
		DS_realEstateArray set [6,_tempNum];
		};
	case "19":
		{
		if(_freeSpace < 1)exitwith{hint "You need 1kg of free space to buy this"};
		if(_tokens < 50)exitwith{hint format ["You don't have enough tokens for this item, you lack %1",(50-(_tokens))];};
		["gunNavid",true,1] call DS_fnc_handleInventory;
		hint "Item Added! \n\n\nUse this to convert it into a Navid";
		systemChat "Item Added! Use this to convert it into a Navid";
		_tempNum = _tokens - 50;
		DS_realEstateArray set [6,_tempNum];
		};
	case "20":
		{
		if(_freeSpace < 1)exitwith{hint "You need 1kg of free space to buy this"};
		if(_tokens < 30)exitwith{hint format ["You don't have enough tokens for this item, you lack %1",(30-(_tokens))];};
		["airbags",true,1] call DS_fnc_handleInventory;
		hint "Item Added! \n\n\nUse this on a vehicle to give it 100 air bags";
		systemChat "Item Added! Use this on a vehicle to give it 100 air bags";
		_tempNum = _tokens - 30;
		DS_realEstateArray set [6,_tempNum];
		};
	case "21":
		{
		if(_freeSpace < 1)exitwith{hint "You need 1kg of free space to buy this"};
		if(_tokens < 60)exitwith{hint format ["You don't have enough tokens for this item, you lack %1",(60-(_tokens))];};
		["insurance",true,1] call DS_fnc_handleInventory;
		hint "Item Added! \n\n\nUse this on a vehicle to give it one insurance life";
		systemChat "Item Added! Use this on a vehicle to give it one insurance life";
		_tempNum = _tokens - 60;
		DS_realEstateArray set [6,_tempNum];
		};
	case "22":
		{
		if(_freeSpace < 1)exitwith{hint "You need 1kg of free space to buy this"};
		if(_tokens < 5)exitwith{hint format ["You don't have enough tokens for this item, you lack %1",(5-(_tokens))];};
		["armourAdv",true,1] call DS_fnc_handleInventory;
		hint "Item Added! \n\n\nUse this to give yourself 50% stronger body armour";
		systemChat "Item Added! Use this to give yourself 50% stronger body armour";
		_tempNum = _tokens - 5;
		DS_realEstateArray set [6,_tempNum];
		};
	case "23":
		{
		if(_freeSpace < 1)exitwith{hint "You need 1kg of free space to buy this"};
		if(_tokens < 50)exitwith{hint format ["You don't have enough tokens for this item, you lack %1",(50-(_tokens))];};
		["gunSpmg",true,1] call DS_fnc_handleInventory;
		hint "Item Added! \n\n\nUse this to convert it into an SPMG";
		systemChat "Item Added! Use this to convert it into an SPMG";
		_tempNum = _tokens - 50;
		DS_realEstateArray set [6,_tempNum];
		};
	case "24":
		{
		if(_freeSpace < 1)exitwith{hint "You need 1kg of free space to buy this"};
		if(_tokens < 500)exitwith{hint format ["You don't have enough tokens for this item, you lack %1",(500-(_tokens))];};
		["plane",true,1] call DS_fnc_handleInventory;
		hint "Item Added! \n\n\nUse this to convert it into an Armed plane";
		systemChat "Item Added! Use this to convert it into an Armed plane";
		_tempNum = _tokens - 500;
		DS_realEstateArray set [6,_tempNum];
		};
	case "25":
		{
		if(_freeSpace < 1)exitwith{hint "You need 1kg of free space to buy this"};
		if(_tokens < 250)exitwith{hint format ["You don't have enough tokens for this item, you lack %1",(250-(_tokens))];};
		["plane",true,1] call DS_fnc_handleInventory;
		hint "Item Added! \n\n\nUse this to convert it into an Armed plane";
		systemChat "Item Added! Use this to convert it into an Armed plane";
		_tempNum = _tokens - 250;
		DS_realEstateArray set [6,_tempNum];
		};
	case "26":
		{
		if(_freeSpace < 1)exitwith{hint "You need 1kg of free space to buy this"};
		if(_tokens < 10)exitwith{hint format ["You don't have enough tokens for this item, you lack %1",(10-(_tokens))];};
		["ammoLynxAdv",true,1] call DS_fnc_handleInventory;
		hint "Item Added! \n\n\nUse this to convert it into a 5 pack of APDS Lynx ammo";
		systemChat "Item Added! Use this to convert it into a 5 pack of APDS Lynx ammo";
		_tempNum = _tokens - 10;
		DS_realEstateArray set [6,_tempNum];
		};
	default {hint "Some unknown error occurred!"};
	};
DS_doingStuff = false;
[] call DS_fnc_compileData;
