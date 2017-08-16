/*
Darkside Life

Author: Shawn "Huntah" Macgillivray

Description:
For the winner of an auction to claim his prize
*/
private ["_itemArray"];

_itemArray = _this select 0;

switch(_itemArray select 4)do
	{
	case "0"://Night Stalker (Y Item + Weapon Item)
		{
		[(_itemArray select 0),true,1] call DS_fnc_handleInventory;
		[(_itemArray select 1),false,false,false,false] call DS_fnc_equipItem;
		};
	case "1"://Upgrades (Just Y Items)
		{
		[(_itemArray select 0),true,1] call DS_fnc_handleInventory;
		};
	case "2"://Weapons (Weapon item plus 5X Y item
		{
		[(_itemArray select 1),false,false,false,false] call DS_fnc_equipItem;
		[(_itemArray select 0),true,5] call DS_fnc_handleInventory;
		};
	case "3"://Weapons (Multiple Y items - Lynx - 50 APDS Rounds)
		{
		[(_itemArray select 0),true,1] call DS_fnc_handleInventory;
		[(_itemArray select 1),true,10] call DS_fnc_handleInventory;
		};
	case "4"://Vehicles
		{
		[[(getPlayerUID player),civilian,(_itemArray select 0),(_itemArray select 1),false,false,true],"HUNT_fnc_vehicleRewards"] spawn BIS_fnc_MP;
		};
	case "5"://Scope/Batterys 3X each
		{
		[(_itemArray select 0),true,3] call DS_fnc_handleInventory;
		[(_itemArray select 1),false,false,false,false] call DS_fnc_equipItem;
		[(_itemArray select 1),false,false,false,false] call DS_fnc_equipItem;
		[(_itemArray select 1),false,false,false,false] call DS_fnc_equipItem;
		};
	case "6"://20X Mini grenades
		{
		[(_itemArray select 1),false,false,false,false] call DS_fnc_equipItem;
		[(_itemArray select 1),false,false,false,false] call DS_fnc_equipItem;
		[(_itemArray select 1),false,false,false,false] call DS_fnc_equipItem;
		[(_itemArray select 1),false,false,false,false] call DS_fnc_equipItem;
		[(_itemArray select 1),false,false,false,false] call DS_fnc_equipItem;
		[(_itemArray select 1),false,false,false,false] call DS_fnc_equipItem;
		[(_itemArray select 1),false,false,false,false] call DS_fnc_equipItem;
		[(_itemArray select 1),false,false,false,false] call DS_fnc_equipItem;
		[(_itemArray select 1),false,false,false,false] call DS_fnc_equipItem;
		[(_itemArray select 1),false,false,false,false] call DS_fnc_equipItem;
		[(_itemArray select 1),false,false,false,false] call DS_fnc_equipItem;
		[(_itemArray select 1),false,false,false,false] call DS_fnc_equipItem;
		[(_itemArray select 1),false,false,false,false] call DS_fnc_equipItem;
		[(_itemArray select 1),false,false,false,false] call DS_fnc_equipItem;
		[(_itemArray select 1),false,false,false,false] call DS_fnc_equipItem;
		[(_itemArray select 1),false,false,false,false] call DS_fnc_equipItem;
		[(_itemArray select 1),false,false,false,false] call DS_fnc_equipItem;
		[(_itemArray select 1),false,false,false,false] call DS_fnc_equipItem;
		[(_itemArray select 1),false,false,false,false] call DS_fnc_equipItem;
		[(_itemArray select 1),false,false,false,false] call DS_fnc_equipItem;
		};
	case "7"://1X 3GL + 10 Grenades
		{
		[(_itemArray select 0),false,false,false,false] call DS_fnc_equipItem;
		[(_itemArray select 1),false,false,false,false] call DS_fnc_equipItem;
		[(_itemArray select 1),false,false,false,false] call DS_fnc_equipItem;
		[(_itemArray select 1),false,false,false,false] call DS_fnc_equipItem;
		[(_itemArray select 1),false,false,false,false] call DS_fnc_equipItem;
		[(_itemArray select 1),false,false,false,false] call DS_fnc_equipItem;
		[(_itemArray select 1),false,false,false,false] call DS_fnc_equipItem;
		[(_itemArray select 1),false,false,false,false] call DS_fnc_equipItem;
		[(_itemArray select 1),false,false,false,false] call DS_fnc_equipItem;
		[(_itemArray select 1),false,false,false,false] call DS_fnc_equipItem;
		[(_itemArray select 1),false,false,false,false] call DS_fnc_equipItem;
		};
	case "8"://20X Y inventory item
		{
		[(_itemArray select 0),true,20] call DS_fnc_handleInventory;
		};
	case "9"://1X I inventory Item
		{
		[(_itemArray select 0),false,false,false,false] call DS_fnc_equipItem;
		};
	case "10"://10X I inventory Item
		{
		[(_itemArray select 0),false,false,false,false] call DS_fnc_equipItem;
		[(_itemArray select 0),false,false,false,false] call DS_fnc_equipItem;
		[(_itemArray select 0),false,false,false,false] call DS_fnc_equipItem;
		[(_itemArray select 0),false,false,false,false] call DS_fnc_equipItem;
		[(_itemArray select 0),false,false,false,false] call DS_fnc_equipItem;
		[(_itemArray select 0),false,false,false,false] call DS_fnc_equipItem;
		[(_itemArray select 0),false,false,false,false] call DS_fnc_equipItem;
		[(_itemArray select 0),false,false,false,false] call DS_fnc_equipItem;
		[(_itemArray select 0),false,false,false,false] call DS_fnc_equipItem;
		[(_itemArray select 0),false,false,false,false] call DS_fnc_equipItem;
		};
	case "11"://Vehicles (BulletProof
		{
		[[(getPlayerUID player),civilian,(_itemArray select 0),(_itemArray select 1),true,false,true],"HUNT_fnc_vehicleRewards"] spawn BIS_fnc_MP;
		};
	case "12"://Vehicles 3X
		{
		[[(getPlayerUID player),civilian,(_itemArray select 0),(_itemArray select 1)],"HUNT_fnc_vehicleRewards"] spawn BIS_fnc_MP;
		[[(getPlayerUID player),civilian,(_itemArray select 0),(_itemArray select 1)],"HUNT_fnc_vehicleRewards"] spawn BIS_fnc_MP;
		[[(getPlayerUID player),civilian,(_itemArray select 0),(_itemArray select 1)],"HUNT_fnc_vehicleRewards"] spawn BIS_fnc_MP;
		};
	case "13"://50X Y inventory item
		{
		[(_itemArray select 0),true,50] call DS_fnc_handleInventory;
		};
	case "14"://Rebel Tokens
		{
		_tempNum = (DS_realEstateArray select 6);
		_tempNum = _tempNum + 100;
		DS_realEstateArray set [6,_tempNum];
		};
	case "15"://Rebel Tokens
		{
		_tempNum = (DS_realEstateArray select 6);
		_tempNum = _tempNum + 250;
		DS_realEstateArray set [6,_tempNum];
		};
	case "16"://Thermal Vehicles
		{
		[[(getPlayerUID player),civilian,(_itemArray select 0),(_itemArray select 1),false,true,true],"HUNT_fnc_vehicleRewards"] spawn BIS_fnc_MP;
		sleep 5;
		if((DS_infoArray select 17) == 37)then{[2] call DS_fnc_questCompleted;};
		};
	case "17"://Random High End
		{
		_randomNum = round random 30;
		sleep 2;
		switch(_randomNum)do
			{
			case 0:
				{
				hint "Congratulations, you have won a bullet proof SUV, your new vehicle is in your garage!";
				[[(getPlayerUID player),civilian,"Car","C_SUV_01_F",true,false,true],"HUNT_fnc_vehicleRewards"] spawn BIS_fnc_MP;
				[[0,format["A %1 was just won in a random auction","Bulletproof SUV"]],"DS_fnc_globalMessage",true,false] spawn BIS_fnc_MP;
				};
			case 1:
				{
				hint "Congratulations, you have won a thermal armed strider, your new vehicle is in your garage!";
				[[(getPlayerUID player),civilian,"Car","I_MRAP_03_hmg_F",false,true,true],"HUNT_fnc_vehicleRewards"] spawn BIS_fnc_MP;
				[[0,format["A %1 was just won in a random auction","Thermal Armed Strider"]],"DS_fnc_globalMessage",true,false] spawn BIS_fnc_MP;
				};
			case 2:
				{
				hint "Congratulations, you have won a Dar Pawnee. The item has been added to your inventory";
				["pawnee",true,1] call DS_fnc_handleInventory;
				[[0,format["A %1 was just won in a random auction","Dar Pawnee"]],"DS_fnc_globalMessage",true,false] spawn BIS_fnc_MP;
				};
			case 3:
				{
				hint "Congratulations, you have won an Air Ammo Upgrade, The item has been added to your inventory";
				["weaponsAir",true,1] call DS_fnc_handleInventory;
				[[0,format["A %1 was just won in a random auction","Air Ammo Upgrade"]],"DS_fnc_globalMessage",true,false] spawn BIS_fnc_MP;
				};
			case 4:
				{
				hint "Congratulations, you have won an Land Vehicle Ammo Upgrade, The item has been added to your inventory";
				["weaponsLand",true,1] call DS_fnc_handleInventory;
				[[0,format["A %1 was just won in a random auction","Land Vehicle Ammo Upgrade"]],"DS_fnc_globalMessage",true,false] spawn BIS_fnc_MP;
				};
			case 5:
				{
				hint "Congratulations, you have won a vehicle thermal Upgrade, The item has been added to your inventory";
				["thermal",true,1] call DS_fnc_handleInventory;
				[[0,format["A %1 was just won in a random auction","Thermal Vehicle Upgrade"]],"DS_fnc_globalMessage",true,false] spawn BIS_fnc_MP;
				};
			case 6:
				{
				hint "Congratulations, you have won 8 steroids, The items has been added to your inventory";
				["steriods",true,8] call DS_fnc_handleInventory;
				[[0,format["8 %1 was just won in a random auction","Steroids"]],"DS_fnc_globalMessage",true,false] spawn BIS_fnc_MP;
				};
			case 7:
				{
				hint "Congratulations, you have won 5 Y inventory Navids, The items has been added to your inventory";
				["gunNavid",true,5] call DS_fnc_handleInventory;
				[[0,format["5 %1 was just won in a random auction","Navid's"]],"DS_fnc_globalMessage",true,false] spawn BIS_fnc_MP;
				};
			case 8:
				{
				hint "Congratulations, you have won 5 Y inventory Lynxs, The items has been added to your inventory";
				["gunLynx",true,5] call DS_fnc_handleInventory;
				[[0,format["5 %1 was just won in a random auction","Lynx's"]],"DS_fnc_globalMessage",true,false] spawn BIS_fnc_MP;
				};
			case 9:
				{
				hint "Congratulations, you have won 5 Y inventory RPG's, The items has been added to your inventory";
				["gunRPG",true,5] call DS_fnc_handleInventory;
				[[0,format["5 %1 was just won in a random auction","RPG's"]],"DS_fnc_globalMessage",true,false] spawn BIS_fnc_MP;
				};
			case 10:
				{
				hint "Congratulations, you have won 10 Y inventory 3GL's, The items has been added to your inventory";
				["gun3GL",true,10] call DS_fnc_handleInventory;
				[[0,format["10 %1 was just won in a random auction","3GL's"]],"DS_fnc_globalMessage",true,false] spawn BIS_fnc_MP;
				};
			case 11:
				{
				hint "Congratulations, you have won a house item upgrade, The items has been added to your inventory";
				["houseItemUpgrade",true,1] call DS_fnc_handleInventory;
				[[0,format["A %1 was just won in a random auction","House Upgrade"]],"DS_fnc_globalMessage",true,false] spawn BIS_fnc_MP;
				};
			case 12:
				{
				hint "Congratulations, you have won 10 spy docs, The items has been added to your inventory";
				["spyDocs",true,10] call DS_fnc_handleInventory;
				[[0,format["10 %1 was just won in a random auction","Spy Docs"]],"DS_fnc_globalMessage",true,false] spawn BIS_fnc_MP;
				};
			case 13:
				{
				if((DS_infoArray select 13) > 46)then
					{
					hint "Congratulations, you have won 5 Y inventory Navids, The items has been added to your inventory";
					["gunNavid",true,5] call DS_fnc_handleInventory;
					[[0,format["5 %1 was just won in a random auction","Navid's"]],"DS_fnc_globalMessage",true,false] spawn BIS_fnc_MP;
					}
					else
					{
					hint "Congratulations, you have won a rock, The item has been added to your inventory";
					["rocku",true,1] call DS_fnc_handleInventory;
					[[0,format["A %1 was just won in a random auction","Rock"]],"DS_fnc_globalMessage",true,false] spawn BIS_fnc_MP;
					};
				};
			case 14:
				{
				if((DS_infoArray select 13) > 46)then
					{
					hint "Congratulations, you have won a bullet proof SUV, your new vehicle is in your garage!";
					[[(getPlayerUID player),civilian,"Car","C_SUV_01_F",true,false,true],"HUNT_fnc_vehicleRewards"] spawn BIS_fnc_MP;
					[[0,format["A %1 was just won in a random auction","Bulletproof SUV"]],"DS_fnc_globalMessage",true,false] spawn BIS_fnc_MP;;
					}
					else
					{
					hint "Congratulations, you have won a loaf of bread, The item has been added to your inventory";
					["wheatp",true,1] call DS_fnc_handleInventory;
					[[0,format["A %1 was just won in a random auction","Loaf of bread"]],"DS_fnc_globalMessage",true,false] spawn BIS_fnc_MP;
					};
				};
			case 15:
				{
				if((DS_infoArray select 13) > 46)then
					{
					sleep 2;
					hint "Congratulations, you have won a 200 pack of Steel";
					["packSteel",true,1] call DS_fnc_handleInventory;
					[[0,format["A %1 was just won in a random auction","200 pack of Steel"]],"DS_fnc_globalMessage",true,false] spawn BIS_fnc_MP;
					}
					else
					{
					hint "Congratulations, you have won a relic, The item has been added to your inventory";
					["relic",true,1] call DS_fnc_handleInventory;
					[[0,format["A %1 was just won in a random auction","Dirty Relic"]],"DS_fnc_globalMessage",true,false] spawn BIS_fnc_MP;
					};
				};
			case 16:
				{
				hint "Congratulations, you have won a No Recoil Item, The item has been added to your inventory";
				["noRecoil",true,1] call DS_fnc_handleInventory;
				[[0,format["A %1 was just won in a random auction","no Recoil Item"]],"DS_fnc_globalMessage",true,false] spawn BIS_fnc_MP;
				};
			case 17:
				{
				if((DS_infoArray select 13) > 46)then
					{
					hint "Congratulations, you have won 500 rebel tokens, The item has been added to your inventory";
					_tempNum = (DS_realEstateArray select 6);
					_tempNum = _tempNum + 500;
					DS_realEstateArray set [6,_tempNum];
					[[0,format["500 %1 was just won in a random auction","rebel tokens"]],"DS_fnc_globalMessage",true,false] spawn BIS_fnc_MP;
					}
					else
					{
					hint "Congratulations, you have won a Piece of wood, The item has been added to your inventory";
					["woodu",true,1] call DS_fnc_handleInventory;
					[[0,format["A %1 was just won in a random auction","Piece of wood"]],"DS_fnc_globalMessage",true,false] spawn BIS_fnc_MP;
					};
				};
			case 18:
				{
				if((DS_infoArray select 13) > 46)then
					{
					sleep 2;
					hint "Congratulations, you have won a 15 pack of CPU's";
					["packCPU",true,1] call DS_fnc_handleInventory;
					[[0,format["A %1 was just won in a random auction","15 pack of CPU's"]],"DS_fnc_globalMessage",true,false] spawn BIS_fnc_MP;
					}
					else
					{
					hint "Congratulations, you have won a lump of salt, The item has been added to your inventory";
					["saltu",true,1] call DS_fnc_handleInventory;
					[[0,format["A %1 was just won in a random auction","lump of salt"]],"DS_fnc_globalMessage",true,false] spawn BIS_fnc_MP;
					};
				};
			case 19:
				{
				if((DS_infoArray select 13) > 46)then
					{
					sleep 2;
					hint "Congratulations, you have won 50 life insurances";
					_tempNum = (DS_realEstateArray select 0);
					_tempNum = _tempNum + 50;
					DS_realEstateArray set [0,_tempNum];
					[[0,format["A %1 was just won in a random auction","25 Life insurances"]],"DS_fnc_globalMessage",true,false] spawn BIS_fnc_MP;
					}
					else
					{
					hint "Congratulations, you have won a grain of sand, The item has been added to your inventory";
					["sandu",true,1] call DS_fnc_handleInventory;
					[[0,format["A %1 was just won in a random auction","grain of sand"]],"DS_fnc_globalMessage",true,false] spawn BIS_fnc_MP;
					};
				};
			case 20:
				{
				hint "Congratulations, you have won 500 rebel tokens, The item has been added to your inventory";
				_tempNum = (DS_realEstateArray select 6);
				_tempNum = _tempNum + 500;
				DS_realEstateArray set [6,_tempNum];
				[[0,format["500 %1 was just won in a random auction","rebel tokens"]],"DS_fnc_globalMessage",true,false] spawn BIS_fnc_MP;
				};
			case 21:
				{
				hint "Congratulations, you have won 1000 rebel tokens, The item has been added to your inventory";
				_tempNum = (DS_realEstateArray select 6);
				_tempNum = _tempNum + 1000;
				DS_realEstateArray set [6,_tempNum];
				[[0,format["1000 %1 was just won in a random auction","rebel tokens"]],"DS_fnc_globalMessage",true,false] spawn BIS_fnc_MP;
				};
			case 22:
				{
				sleep 2;
				hint "Congratulations, you have won a 200 pack of Steel";
				["packSteel",true,1] call DS_fnc_handleInventory;
				[[0,format["A %1 was just won in a random auction","200 pack of Steel"]],"DS_fnc_globalMessage",true,false] spawn BIS_fnc_MP;
				};
			case 23:
				{
				sleep 2;
				hint "Congratulations, you have won a 200 pack of Bronze";
				["packBronze",true,1] call DS_fnc_handleInventory;
				[[0,format["A %1 was just won in a random auction","200 pack of Bronze"]],"DS_fnc_globalMessage",true,false] spawn BIS_fnc_MP;
				};
			case 24:
				{
				sleep 2;
				hint "Congratulations, you have won a 200 pack of Crystal Glass";
				["packGlass",true,1] call DS_fnc_handleInventory;
				[[0,format["A %1 was just won in a random auction","200 pack of Crystal Glass"]],"DS_fnc_globalMessage",true,false] spawn BIS_fnc_MP;
				};
			case 25:
				{
				sleep 2;
				hint "Congratulations, you have won a 30 pack of Circuit boards";
				["packCircuitBoard",true,1] call DS_fnc_handleInventory;
				[[0,format["A %1 was just won in a random auction","30 pack of Circuit boards"]],"DS_fnc_globalMessage",true,false] spawn BIS_fnc_MP;
				};
			case 26:
				{
				sleep 2;
				hint "Congratulations, you have won a 30 pack of Small Batteries";
				["packBattery",true,1] call DS_fnc_handleInventory;
				[[0,format["A %1 was just won in a random auction","30 pack of Small Batteries"]],"DS_fnc_globalMessage",true,false] spawn BIS_fnc_MP;
				};
			case 27:
				{
				sleep 2;
				hint "Congratulations, you have won a 15 pack of CPU's";
				["packCPU",true,1] call DS_fnc_handleInventory;
				[[0,format["A %1 was just won in a random auction","15 pack of CPU's"]],"DS_fnc_globalMessage",true,false] spawn BIS_fnc_MP;
				};
			case 28:
				{
				sleep 2;
				hint "Congratulations, you have won 50 life insurances";
				_tempNum = (DS_realEstateArray select 0);
				_tempNum = _tempNum + 50;
				DS_realEstateArray set [0,_tempNum];
				[[0,format["A %1 was just won in a random auction","25 Life insurances"]],"DS_fnc_globalMessage",true,false] spawn BIS_fnc_MP;
				};
			case 29:
				{
				if((DS_infoArray select 13) > 46)then
					{
					sleep 2;
					hint "Congratulations, you have won a 30 pack of Circuit boards";
					["packCircuitBoard",true,1] call DS_fnc_handleInventory;
					[[0,format["A %1 was just won in a random auction","30 pack of Circuit boards"]],"DS_fnc_globalMessage",true,false] spawn BIS_fnc_MP;
					}
					else
					{
					sleep 2;
					hint "Congratulations, you have won a Rabbit";
					["rabbit",true,1] call DS_fnc_handleInventory;
					[[0,format["A %1 was just won in a random auction","Rabbit"]],"DS_fnc_globalMessage",true,false] spawn BIS_fnc_MP;
					};
				};
			case 30:
				{
				if((DS_infoArray select 13) > 46)then
					{
					hint "Congratulations, you have won a bullet proof SUV, your new vehicle is in your garage!";
					[[(getPlayerUID player),civilian,"Car","C_SUV_01_F",true,false,true],"HUNT_fnc_vehicleRewards"] spawn BIS_fnc_MP;
					[[0,format["A %1 was just won in a random auction","Bulletproof SUV"]],"DS_fnc_globalMessage",true,false] spawn BIS_fnc_MP;
					}
					else
					{
					sleep 2;
					hint "Congratulations, you have won a camp fire";
					["fire",true,1] call DS_fnc_handleInventory;
					[[0,format["A %1 was just won in a random auction","camp fire"]],"DS_fnc_globalMessage",true,false] spawn BIS_fnc_MP;
					};
				};
			};
		if((DS_infoArray select 13) == 45)then{[0] call DS_fnc_questCompleted;};
		};
	};	
	
[] call DS_fnc_compileData;
	
sleep 5;
if((DS_infoArray select 13) == 33)then
	{
	[0] call DS_fnc_questCompleted;
	};