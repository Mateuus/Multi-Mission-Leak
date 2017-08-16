/*
Darkside Life

Author: Shawn "Huntah" Macgillivray

Description:
	Use your rebel tokens
*/
disableSerialization;

private["_tokens","_weight","_index","_buyMulti","_strName"];
_tokens = (DS_realEstateArray select 6);
if(DS_doingStuff)exitwith{};
DS_doingStuff = true;
switch(DS_className)do
	{
	case "1":
		{
		if(_tokens < 60)exitwith{hint format ["You don't have enough tokens for this item, you lack %1",(60-(_tokens))];};
		["jail10",true,1] call DS_fnc_handleInventory;
		hint "Item Added! \n\n\nUse this item while in jail to have your sentence legally ended";
		systemChat "Item Added! Use this item while in jail to have your sentence legally ended";
		_tempNum = _tokens - 60;
		DS_realEstateArray set [6,_tempNum];
		};
	case "2":
		{
		if(_tokens < 200)exitwith{hint format ["You don't have enough tokens for this item, you lack %1",(200-(_tokens))];};
		["safeCrackerAdv",true,1] call DS_fnc_handleInventory;
		hint "Item Added! \n\n\nHave this item in your inventory while cracking the fortknox safe to shave 5 minutes from the timer";
		systemChat "Item Added! Have this item in your inventory while cracking the fortknox safe to shave 5 minutes from the timer";
		_tempNum = _tokens - 200;
		DS_realEstateArray set [6,_tempNum];
		};	
	case "3":
		{
		if(_tokens < 250)exitwith{hint format ["You don't have enough tokens for this item, you lack %1",(250-(_tokens))];};
		["jailBreak",true,1] call DS_fnc_handleInventory;
		hint "Item Added! \n\n\nUse this item while in jail to have an elite terrorist group quickly break you out";
		systemChat "Item Added! Use this item while in jail to have an elite terrorist group quickly break you out";
		_tempNum = _tokens - 250;
		DS_realEstateArray set [6,_tempNum];
		};	
	case "4":
		{
		if(_tokens < 850)exitwith{hint format ["You don't have enough tokens for this item, you lack %1",(850-(_tokens))];};
		[[(getPlayerUID player),civilian,"Car","C_SUV_01_F",true],"HUNT_fnc_vehicleRewards"] spawn BIS_fnc_MP;
		hint "Item Added! \n\n\nA Bulletproof SUV has been added to your garage";
		systemChat "Item Added! A Bulletproof SUV has been added to your garage";
		_tempNum = _tokens - 850;
		DS_realEstateArray set [6,_tempNum];
		};	
	case "5":
		{
		if(_tokens < 100)exitwith{hint format ["You don't have enough tokens for this item, you lack %1",(100-(_tokens))];};
		["steriods",true,1] call DS_fnc_handleInventory;
		hint "Item Added! \n\n\nUse this item to raise your carry weight to 500 kg's for 1 hour";
		systemChat "Item Added! Use this item to raise your carry weight to 500 kg's for 1 hour";
		_tempNum = _tokens - 100;
		DS_realEstateArray set [6,_tempNum];
		};
	case "6":
		{
		if(_tokens < 200)exitwith{hint format ["You don't have enough tokens for this item, you lack %1",(200-(_tokens))];};
		["noRecoil",true,1] call DS_fnc_handleInventory;
		hint "Item Added! \n\n\nUse this item to be able to fire without recoil for 10 minutes";
		systemChat "Item Added! Use this item to be able to fire without recoil for 10 minutes";
		_tempNum = _tokens - 200;
		DS_realEstateArray set [6,_tempNum];
		};	
	case "7":
		{
		if(_tokens < 40)exitwith{hint format ["You don't have enough tokens for this item, you lack %1",(40-(_tokens))];};
		["quickCap",true,1] call DS_fnc_handleInventory;
		hint "Item Added! \n\n\nHave thie item in your inventory while capturing rebel KOS to lower the cap time to 5 minutes";
		systemChat "Item Added! Have thie item in your inventory while capturing rebel KOS to lower the cap time to 5 minutes";
		_tempNum = _tokens - 40;
		DS_realEstateArray set [6,_tempNum];
		};
	case "8":
		{
		if(_tokens < 600)exitwith{hint format ["You don't have enough tokens for this item, you lack %1",(600-(_tokens))];};
		["pawnee",true,1] call DS_fnc_handleInventory;
		hint "Item Added! \n\n\nUse this item to spawn yourself a fully armed rental pawnee";
		systemChat "Item Added! Use this item to spawn yourself a fully armed rental pawnee";
		_tempNum = _tokens - 600;
		DS_realEstateArray set [6,_tempNum];
		};
	case "9":
		{
		if(_tokens < 160)exitwith{hint format ["You don't have enough tokens for this item, you lack %1",(160-(_tokens))];};
		["convoy",true,1] call DS_fnc_handleInventory;
		hint "Item Added! \n\n\nUse this item to silence the server wide warning of a rebel convoy";
		systemChat "Item Added! Use this item to silence the server wide warning of a rebel convoy";
		_tempNum = _tokens - 160;
		DS_realEstateArray set [6,_tempNum];
		};
	case "10":
		{
		if(DS_coin < 1000)exitwith{hint "You need $1k to buy this ticket aswell as your tokens"};
		if(_tokens < 5)exitwith{hint format ["You don't have enough tokens for this item, you lack %1",(5-(_tokens))];};
		[] spawn DS_fnc_lottoBuy;
		_tempNum = _tokens - 5;
		DS_realEstateArray set [6,_tempNum];
		};
	case "11":
		{
		if(_tokens < 500)exitwith{hint format ["You don't have enough tokens for this item, you lack %1",(500-(_tokens))];};
		["vehAmmo",true,1] call DS_fnc_handleInventory;
		hint "Item Added! \n\n\nUse this item to upgrade the Ammo on Armed land vehicles";
		systemChat "Item Added! Use this item to upgrade the Ammo on Armed land vehicles";
		_tempNum = _tokens - 500;
		DS_realEstateArray set [6,_tempNum];
		};
	default {hint "Some unknown error occurred!"};
	};
DS_doingStuff = false;
[] call DS_fnc_compileData;
