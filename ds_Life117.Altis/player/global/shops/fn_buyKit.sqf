/*
Darkside Life

Author: Shawn "Huntah" Macgillivray

Description:
	Buys a Virtual Item Kit
*/
disableSerialization;

private["_value","_weight","_index","_buyMulti","_strName","_price"];

if(DS_atmcoin < DS_price)exitwith{};//Heh??

switch(DS_className)do
	{
	case "policekit":
		{
		if(DS_copLevel < 3)then
			{
			if((DS_maxWeight - DS_currentWeight) < 48)exitwith{hint "You need a full 48kg of space to purchase this kit"};
			[DS_price,true,false] call DS_fnc_handleMoney;
			["coffee",true,4] call DS_fnc_handleInventory;//4
			["donut",true,4] call DS_fnc_handleInventory;//8
			["mediKit",true,2] call DS_fnc_handleInventory;//10
			["repairKit",true,10] call DS_fnc_handleInventory;//20
			["defuse",true,1] call DS_fnc_handleInventory;//21
			["spikeStrip",true,2] call DS_fnc_handleInventory;//29
			["UAV",true,1] call DS_fnc_handleInventory;//39
			["refuelKit",true,2] call DS_fnc_handleInventory;//45
			["chute",true,2] call DS_fnc_handleInventory;//47
			["buildingBox",true,1] call DS_fnc_handleInventory;//48
			["armour",true,2] call DS_fnc_handleInventory;//50
			hint "Your police kit has been purchased";
			}
			else
			{
			if((player getVariable ["policeSquad",""]) == "Highway Patrol")then
				{
				if((DS_maxWeight - DS_currentWeight) < 64)exitwith{hint "You need a full 64kg of space to purchase this kit"};
				[DS_price,true,false] call DS_fnc_handleMoney;
				["coffee",true,3] call DS_fnc_handleInventory;//3
				["donut",true,3] call DS_fnc_handleInventory;//6
				["mediKit",true,1] call DS_fnc_handleInventory;//7
				["defuse",true,1] call DS_fnc_handleInventory;//8
				["spikeStrip",true,3] call DS_fnc_handleInventory;//20
				["UAV",true,1] call DS_fnc_handleInventory;//30
				["fuelDart",true,7] call DS_fnc_handleInventory;//51
				["refuelKit",true,1] call DS_fnc_handleInventory;//54
				["chute",true,2] call DS_fnc_handleInventory;//55
				["buildingBox",true,1] call DS_fnc_handleInventory;//56
				["ammoFlash",true,2] call DS_fnc_handleInventory;//58
				["ammoTear",true,2] call DS_fnc_handleInventory;//61
				["armour",true,2] call DS_fnc_handleInventory;//63
				hint "Your police kit has been purchased";
				}
				else
				{
				if((player getVariable ["policeSquad",""]) == "Sharp Shooter")then
					{
					if((DS_maxWeight - DS_currentWeight) < 64)exitwith{hint "You need a full 64kg of space to purchase this kit"};
					[DS_price,true,false] call DS_fnc_handleMoney;
					["coffee",true,2] call DS_fnc_handleInventory;//2
					["donut",true,2] call DS_fnc_handleInventory;//4
					["mediKit",true,1] call DS_fnc_handleInventory;//5
					["defuse",true,1] call DS_fnc_handleInventory;//9
					["spikeStrip",true,3] call DS_fnc_handleInventory;//21
					["UAV",true,1] call DS_fnc_handleInventory;//31
					["goKart",true,1] call DS_fnc_handleInventory;//41
					["refuelKit",true,1] call DS_fnc_handleInventory;//44
					["chute",true,2] call DS_fnc_handleInventory;//46
					["buildingBox",true,1] call DS_fnc_handleInventory;//47
					["ammoFlash",true,2] call DS_fnc_handleInventory;//49
					["ammoTear",true,2] call DS_fnc_handleInventory;//51
					["repairKit",true,7] call DS_fnc_handleInventory;//58
					["FuelDart",true,2] call DS_fnc_handleInventory;//61
					["armour",true,2] call DS_fnc_handleInventory;//63
					hint "Your police kit has been purchased";
					}
					else
					{
					if((DS_maxWeight - DS_currentWeight) < 64)exitwith{hint "You need a full 64kg of space to purchase this kit"};
					[DS_price,true,false] call DS_fnc_handleMoney;
					["coffee",true,4] call DS_fnc_handleInventory;//3
					["donut",true,4] call DS_fnc_handleInventory;//6
					["mediKit",true,2] call DS_fnc_handleInventory;//8
					["repairKit",true,10] call DS_fnc_handleInventory;//18
					["defuse",true,1] call DS_fnc_handleInventory;//19
					["spikeStrip",true,2] call DS_fnc_handleInventory;//27
					["UAV",true,1] call DS_fnc_handleInventory;//37
					["fuelDart",true,4] call DS_fnc_handleInventory;//49
					["refuelKit",true,2] call DS_fnc_handleInventory;//55
					["chute",true,2] call DS_fnc_handleInventory;//57
					["buildingBox",true,1] call DS_fnc_handleInventory;//58
					["ammoFlash",true,2] call DS_fnc_handleInventory;//60
					["ammoTear",true,2] call DS_fnc_handleInventory;//62
					["armour",true,2] call DS_fnc_handleInventory;//64
					hint "Your police kit has been purchased";
					};
				};
			};
		//Special Conditions for deputy chiefs
		if(DS_copLevel == 7)then
			{
			["ammoLynxAdv",true,5] call DS_fnc_handleInventory;
			["ammoRpgAdv",true,5] call DS_fnc_handleInventory;
			["ammoRpg",true,5] call DS_fnc_handleInventory;
			["ammoTear",true,5] call DS_fnc_handleInventory;//62
			};
		};
	case "bodyArmour":
		{
		[DS_price,true,false] call DS_fnc_handleMoney;
		if((playerside == west)&&((DS_infoArray select 21) > 27))then
			{
			sleep 1;
			}
			else
			{
			player playMove "AinvPknlMstpSnonWnonDnon_medic_1";
			sleep 4;
			};
		if(playerside == civilian)then
			{
			DS_armour = 15;
			}
			else
			{
			DS_armour = 10;
			};
		hint "Body Armour Fitted";
		};
	case "sniperKit":
		{
		if((DS_maxWeight - DS_currentWeight) < 62)exitwith{hint "You need a full 64kg of space to purchase this kit"};
		[DS_price,true,false] call DS_fnc_handleMoney;
		player playMove "AinvPknlMstpSnonWnonDnon_medic_1";
		["tbacon",true,3] call DS_fnc_handleInventory;//3
		["water",true,3] call DS_fnc_handleInventory;//6
		["goKart",true,1] call DS_fnc_handleInventory;//16
		["mediKit",true,5] call DS_fnc_handleInventory;//21
		["repairKit",true,5] call DS_fnc_handleInventory;//26
		["refuelKit",true,1] call DS_fnc_handleInventory;//29
		["lockpick",true,8] call DS_fnc_handleInventory;//45
		["lighter",true,4] call DS_fnc_handleInventory;//49
		["chute",true,2] call DS_fnc_handleInventory;//51
		["fire",true,1] call DS_fnc_handleInventory;//52
		["ziptie",true,2] call DS_fnc_handleInventory;//54
		["c4",true,1] call DS_fnc_handleInventory;//59
		["armour",true,2] call DS_fnc_handleInventory;//62
		sleep 4;
		DS_armour = 15;
		hint "Kit bought and Stun Armour fitted";
		};
	case "generalRebel":
		{
		if((DS_maxWeight - DS_currentWeight) < 59)exitwith{hint "You need a full 59kg of space to purchase this kit"};
		[DS_price,true,false] call DS_fnc_handleMoney;
		player playMove "AinvPknlMstpSnonWnonDnon_medic_1";
		["doritos",true,3] call DS_fnc_handleInventory;//3
		["pepsi",true,3] call DS_fnc_handleInventory;//6
		["siphonKit",true,2] call DS_fnc_handleInventory;//8
		["mediKit",true,7] call DS_fnc_handleInventory;//15
		["repairKit",true,7] call DS_fnc_handleInventory;//22
		["refuelKit",true,2] call DS_fnc_handleInventory;//28
		["lockpick",true,7] call DS_fnc_handleInventory;//42
		["lighter",true,5] call DS_fnc_handleInventory;//47
		["chute",true,2] call DS_fnc_handleInventory;//49
		["fire",true,1] call DS_fnc_handleInventory;//50
		["ziptie",true,4] call DS_fnc_handleInventory;//54
		["C4",true,1] call DS_fnc_handleInventory;//59
		["armour",true,2] call DS_fnc_handleInventory;//61
		sleep 4;
		DS_armour = 15;
		hint "Kit bought and Stun Armour fitted";
		};
	case "securityKit":
		{
		if((DS_maxWeight - DS_currentWeight) < 48)exitwith{hint "You need a full 48kgs of space to purchase this kit"};
		[DS_price,true,false] call DS_fnc_handleMoney;
		player playMove "AinvPknlMstpSnonWnonDnon_medic_1";
		["doritos",true,5] call DS_fnc_handleInventory;//5
		["pepsi",true,5] call DS_fnc_handleInventory;//10
		["mediKit",true,5] call DS_fnc_handleInventory;//15
		["repairKit",true,15] call DS_fnc_handleInventory;//30
		["refuelKit",true,1] call DS_fnc_handleInventory;//33
		["chute",true,2] call DS_fnc_handleInventory;//35
		["buildingBox",true,1] call DS_fnc_handleInventory;//36
		["spikeStrip",true,2] call DS_fnc_handleInventory;//44
		["ammoTear",true,4] call DS_fnc_handleInventory;//48
		["armour",true,2] call DS_fnc_handleInventory;//50
		sleep 4;
		hint "Kit bought";
		};
	case "copLives":
		{
		switch(DS_copLevel)do
			{
			case 0:
				{
				_price = 25000;
				};
			case 1:
				{
				_price = 35000;
				};
			case 2:
				{
				_price = 45000;
				};
			case 3:
				{
				_price = 70000;
				};
			case 4:
				{
				_price = 90000;
				};
			case 5:
				{
				_price = 110000;
				};
			case 6:
				{
				_price = 130000;
				};
			case 7:
				{
				_price = 150000;
				};
			};
		if([_price,true] call DS_fnc_checkMoney)exitwith{hint "You do not have enough money in the bank to buy this"};
		[_price,true,false] call DS_fnc_handleMoney;
		player playMove "AinvPknlMstpSnonWnonDnon_medic_1";
		sleep 4;
		_tempNum = (DS_infoArray select 9);
		_tempNum = _tempNum + 10;
		DS_infoArray set [9,_tempNum];
		hint "10 Lives added";
		};
	default {hint "Some unknown error occurred!"};
	};
[] call DS_fnc_updateHud;
DS_price = 0;
[] call DS_fnc_compileData;