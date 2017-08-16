/*
	Darkside Life

	Author: Shawn "Huntah" Macgillivray

	Description:
	Buys a Virtual Item Kit
*/

private ["_value","_weight","_index","_buyMulti","_strName","_price","_buyKit","_itemArray"];

disableSerialization;

_buyKit = {
	private ["_action","_itemArray","_price","_amount","_longName"];

	_itemArray = _this select 0;

	if(DS_atmCoin < DS_price)exitWith{hint "Some error occurred"};
	if(isNil "_itemArray")exitWith{hint "Some error occurred"};
	[DS_price,true,false] call DS_fnc_handleMoney;

	//First clear inventory of kit items
	{
		_longName = format ["DS_item_%1",(_x select 0)];
		_amount = (missionNamespace getVariable _longName);
		[(_x select 0),false,_amount] call DS_fnc_handleInventory;
	}forEach _itemArray;

	//Give them the items
	{
		[(_x select 0),true,(_x select 1)] call DS_fnc_handleInventory;
	}forEach _itemArray;

	//Add extras
	if(playerSide isEqualTo west)then {
		if(DS_copLevel > 8)then {
			["ammoLynxAdv",true,5] call DS_fnc_handleInventory;
			["ammoRpgHEAdv",true,5] call DS_fnc_handleInventory;
			["ammoRpgAdv",true,5] call DS_fnc_handleInventory;
			["ammoTear",true,5] call DS_fnc_handleInventory;//62
		};

		if((DS_infoArray select 21) > 31)then {
			["armour",true,3] call DS_fnc_handleInventory;
		};
	};

	hint "Your kit has been purchased";
	sleep 2;
	DS_blockExploit = false;
};

if(DS_atmCoin < DS_price)exitWith{};//Heh??

switch(DS_className)do
	{
	case "policekit": {
		if(isNil "DS_blockExploit")then {DS_blockExploit = false;};
		if(DS_blockExploit)exitWith{DS_doingStuff = false};
		DS_blockExploit = true;

		if(DS_copLevel < 3)then {
			_itemArray = [["coffee",4],["donut",4],["mediKit",2],["repairKit",10],["defuse",1],["spikeStrip",2],["UAV",1],["refuelKit",2],["chute",2],["buildingBox",1],["armour",2]];
			[_itemArray] spawn _buyKit;
		} else {
			if((player getVariable ["policeSquad",""]) == "Highway Patrol")then {
				_itemArray = [["coffee",3],["donut",3],["mediKit",1],["defuse",1],["spikeStrip",3],["UAV",1],["fuelDart",7],["refuelKit",2],["chute",2],["buildingBox",1],["armour",2],["ammoTear",2],["ammoFlash",2]];
				[_itemArray] spawn _buyKit;
			} else {
				if((player getVariable ["policeSquad",""]) == "Sharp Shooter")then {
					_itemArray = [["coffee",2],["donut",2],["mediKit",1],["defuse",1],["spikeStrip",3],["repairKit",7],["UAV",1],["goKart",1],["fuelDart",2],["refuelKit",1],["chute",2],["buildingBox",1],["armour",2],["ammoTear",2],["ammoFlash",2]];
					[_itemArray] spawn _buyKit;
				} else {
					_itemArray = [["coffee",4],["donut",4],["mediKit",2],["defuse",1],["spikeStrip",2],["repairKit",10],["UAV",1],["fuelDart",3],["refuelKit",2],["chute",2],["buildingBox",1],["armour",2],["ammoTear",2],["ammoFlash",2]];
					[_itemArray] spawn _buyKit;
				};
			};
		};
	};
	case "bodyArmour": {
		[DS_price,true,false] call DS_fnc_handleMoney;

		if((playerSide isEqualTo west)&&((DS_infoArray select 21) > 27))then {
			sleep 1;
		} else {
			player playMove "AinvPknlMstpSnonWnonDnon_medic_1";
			sleep 4;
		};
		
		if((playerside == west)&&((DS_infoArray select 21) > 34))then {
			DS_armour = 15;
		} else {
			DS_armour = 10;
		};
		if(DS_realMode)then{DS_armour = 15};
		hint "Body Armour Fitted";
	};
	case "sniperKit": {
		if(isNil "DS_blockExploit")then {DS_blockExploit = false;};
		if(DS_blockExploit)exitWith{DS_doingStuff = false};
		DS_blockExploit = true;

		_itemArray = [["tbacon",3],["water",3],["goKart",1],["mediKit",5],["repairKit",5],["refuelKit",1],["lockpick",8],["lighter",4],["chute",2],["fire",1],["ziptie",2],["c4",1],["armour",2]];
		[_itemArray] spawn _buyKit;
		player playMove "AinvPknlMstpSnonWnonDnon_medic_1";
		sleep 3;

		DS_armour = 10;
		if(DS_realMode)then{DS_armour = 15};
		if((DS_infoArray select 17) > 42)then {
			["armour",true,3] call DS_fnc_handleInventory;
		};
	};
	case "generalRebel": {
		if(isNil "DS_blockExploit")then {DS_blockExploit = false;};
		if(DS_blockExploit)exitWith{DS_doingStuff = false};
		DS_blockExploit = true;

		_itemArray = [["doritos",3],["pepsi",3],["siphonKit",2],["mediKit",7],["repairKit",7],["refuelKit",2],["lockpick",7],["lighter",5],["chute",2],["fire",1],["ziptie",4],["c4",1],["armour",2]];
		[_itemArray] spawn _buyKit;
		player playMove "AinvPknlMstpSnonWnonDnon_medic_1";
		sleep 3;

		DS_armour = 10;
		if(DS_realMode)then{DS_armour = 15};
		hint "Kit bought and Stun Armour fitted";
		if((DS_infoArray select 17) > 42)then {
			["armour",true,3] call DS_fnc_handleInventory;
		};
	};
	case "securityKit": {
		if(isNil "DS_blockExploit")then {DS_blockExploit = false;};
		if(DS_blockExploit)exitWith{DS_doingStuff = false};
		DS_blockExploit = true;

		_itemArray = [["doritos",5],["pepsi",5],["mediKit",5],["repairKit",15],["refuelKit",1],["buildingBox",1],["spikeStrip",2],["chute",2],["ammoTear",4],["armour",2]];
		[_itemArray] spawn _buyKit;
		player playMove "AinvPknlMstpSnonWnonDnon_medic_1";
	};
	case "copLives": {
		if(isNil "DS_blockExploit")then {DS_blockExploit = false;};
		if(DS_blockExploit)exitWith{DS_doingStuff = false};
		DS_blockExploit = true;

		switch(DS_copLevel)do {
			case 0: {_price = 25000;};
			case 1: {_price = 35000;};
			case 2: {_price = 45000;};
			case 3: {_price = 70000;};
			case 4: {_price = 90000;};
			case 5: {_price = 110000;};
			case 6: {_price = 130000;};
			case 7: {_price = 150000;};
			case 8: {_price = 150000;};
			case 9: {_price = 150000;};
			case 10: {_price = 150000;};
			case 11: {_price = 150000;};
		};

		if((DS_infoArray select 9) > 45)exitWith {
			hint "You can only buy police lives when you currently have 45 or fewer remaining";
		};

		if([_price,true] call DS_fnc_checkMoney)exitWith{hint "You do not have enough money in the bank to buy this"};
		[_price,true,false] call DS_fnc_handleMoney;
		player playMove "AinvPknlMstpSnonWnonDnon_medic_1";
		sleep 4;

		_tempNum = (DS_infoArray select 9);
		_tempNum = _tempNum + 10;
		DS_infoArray set [9,_tempNum];

		hint "10 Lives added";
		sleep 2;

		DS_blockExploit = false;
	};

	default {hint "Some unknown error occurred!"};
};

[] call DS_fnc_updateHud;
DS_price = 0;
[] call DS_fnc_compileData;