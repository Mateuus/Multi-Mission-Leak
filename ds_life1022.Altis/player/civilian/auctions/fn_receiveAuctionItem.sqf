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
		DS_vehicleGarage = [];
		[(getPlayerUID player),civilian,(_itemArray select 0),(_itemArray select 1),false,false,true] remoteExec ["HUNT_fnc_vehicleRewards",2];
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
		DS_vehicleGarage = [];
		[(getPlayerUID player),civilian,(_itemArray select 0),(_itemArray select 1),true,false,true] remoteExec ["HUNT_fnc_vehicleRewards",2];
		};
	case "12"://Vehicles 3X
		{
		DS_vehicleGarage = [];
		[(getPlayerUID player),civilian,(_itemArray select 0),(_itemArray select 1)] remoteExec ["HUNT_fnc_vehicleRewards",2];
		[(getPlayerUID player),civilian,(_itemArray select 0),(_itemArray select 1)] remoteExec ["HUNT_fnc_vehicleRewards",2];
		[(getPlayerUID player),civilian,(_itemArray select 0),(_itemArray select 1)] remoteExec ["HUNT_fnc_vehicleRewards",2];
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
		DS_vehicleGarage = [];
		[(getPlayerUID player),civilian,(_itemArray select 0),(_itemArray select 1),false,true,true] remoteExec ["HUNT_fnc_vehicleRewards",2];
		};
	case "17"://Random High End
		{
		if((DS_infoArray select 13) == 50)then { [0] call DS_fnc_questCompleted };
		_randomNum = round random 30;
		sleep 2;
		switch(_randomNum)do
			{
			case 0:
				{
				DS_vehicleGarage = [];
				hint "Congratulations, you have won a bullet proof SUV, your new vehicle is in your garage!";
				[(getPlayerUID player),civilian,"Car","C_SUV_01_F",true,false,true] remoteExec ["HUNT_fnc_vehicleRewards",2];
				[0,format["A %1 was just won in a random auction","Bulletproof SUV"]] remoteExecCall ["DS_fnc_globalMessage",-2];
				};
			case 1:
				{
				DS_vehicleGarage = [];
				hint "Congratulations, you have won an Armed strider, your new vehicle is in your garage!";
				[(getPlayerUID player),civilian,"Car","I_MRAP_03_hmg_F",false,false,true] remoteExec ["HUNT_fnc_vehicleRewards",2];
				[0,format["A %1 was just won in a random auction","Armed Strider"]] remoteExecCall ["DS_fnc_globalMessage",-2];
				};
			case 2:
				{
				hint "Congratulations, you have won a DAR Pawnee. The item has been added to your inventory";
				["pawnee",true,1] call DS_fnc_handleInventory;
				[0,format["A %1 was just won in a random auction","DAR Pawnee"]] remoteExecCall ["DS_fnc_globalMessage",-2];
				};
			case 3:
				{
				hint "Congratulations, you have won two Air Ammo Upgrades, These item has been added to your inventory";
				["weaponsAir",true,2] call DS_fnc_handleInventory;
				[0,format["Two %1 were just won in a random auction","Air Ammo Upgrades"]] remoteExecCall ["DS_fnc_globalMessage",-2];
				};
			case 4:
				{
				hint "Congratulations, you have won two Land Vehicle Ammo Upgrades, The seitem has been added to your inventory";
				["weaponsLand",true,1] call DS_fnc_handleInventory;
				[0,format["Two %1 was just won in a random auction","Land Vehicle Ammo Upgrades"]] remoteExecCall ["DS_fnc_globalMessage",-2];
				};
			case 5:
				{
				hint "Congratulations, you have won a 200 pack of Steel";
				["packSteel",true,1] call DS_fnc_handleInventory;
				[0,format["A %1 was just won in a random auction","200 pack of Steel"]] remoteExecCall ["DS_fnc_globalMessage",-2];
				};
			case 6:
				{
				hint "Congratulations, you have won 10 fake ID's, The items has been added to your inventory";
				["idChanger",true,10] call DS_fnc_handleInventory;
				[0,format["10 %1 was just won in a random auction","Fake ID's"]] remoteExecCall ["DS_fnc_globalMessage",-2];
				};
			case 7:
				{
				hint "Congratulations, you have won 10 Y inventory Navids, The items has been added to your inventory";
				["gunNavid",true,10] call DS_fnc_handleInventory;
				[0,format["10 %1 was just won in a random auction","Navid's"]] remoteExecCall ["DS_fnc_globalMessage",-2];
				};
			case 8:
				{
				hint "Congratulations, you have won 10 Y inventory Lynxs, The items has been added to your inventory";
				["gunLynx",true,10] call DS_fnc_handleInventory;
				[0,format["10 %1 was just won in a random auction","Lynx's"]] remoteExecCall ["DS_fnc_globalMessage",-2];
				};
			case 9:
				{
				DS_vehicleGarage = [];
				_type = round random 4;
				switch(_type)do
					{
					case 1:
						{
						hint "Congratulations, you have won a V-44 X Blackfish (Vehicle Transport)";
						[(getPlayerUID player),civilian,"Air","B_T_VTOL_01_vehicle_F",false,false,true] remoteExec ["HUNT_fnc_vehicleRewards",2];
						[0,format["A %1 was just won in a random auction","V-44 X Blackfish (Vehicle Transport)"]] remoteExecCall ["DS_fnc_globalMessage",-2];
						};
					case 2:
						{
						hint "Congratulations, you have won a V-44 X Blackfish (Infantry Transport)";
						[(getPlayerUID player),civilian,"Air","B_T_VTOL_01_infantry_F",false,false,true] remoteExec ["HUNT_fnc_vehicleRewards",2];
						[0,format["A %1 was just won in a random auction","V-44 X Blackfish (Infantry Transport)"]] remoteExecCall ["DS_fnc_globalMessage",-2];
						};
					case 0:
						{
						hint "Congratulations, you have won a Y-32 Xi'an (Infantry Transport)";
						[(getPlayerUID player),civilian,"Air","O_T_VTOL_02_infantry_F",false,false,true] remoteExec ["HUNT_fnc_vehicleRewards",2];
						[0,format["A %1 was just won in a random auction","Y-32 Xi'an (Infantry Transport)"]] remoteExecCall ["DS_fnc_globalMessage",-2];
						};
					case 4:
						{
						hint "Congratulations, you have won a Y-32 Xi'an (Vehicle Transport)";
						[(getPlayerUID player),civilian,"Air","O_T_VTOL_02_vehicle_F",false,false,true] remoteExec ["HUNT_fnc_vehicleRewards",2];
						[0,format["A %1 was just won in a random auction","Y-32 Xi'an (Vehicle Transport)"]] remoteExecCall ["DS_fnc_globalMessage",-2];
						};
					case 3:
						{
						hint "Congratulations, you have won Y inventory blackfoot";
						["blackfoot",true,1] call DS_fnc_handleInventory;
						[0,format["A %1 was just won in a random auction","Blackfoot"]] remoteExecCall ["DS_fnc_globalMessage",-2];
						};
					};
				};
			case 10:
				{
				hint "Congratulations, you have won 10 Y inventory AK-GL's, The items has been added to your inventory";
				["gun3GL",true,10] call DS_fnc_handleInventory;
				[0,format["10 %1 was just won in a random auction","AK-GL's"]] remoteExecCall ["DS_fnc_globalMessage",-2];
				};
			case 11:
				{
				hint "Congratulations, you have won a house item upgrade, The items has been added to your inventory";
				["houseItemUpgrade",true,1] call DS_fnc_handleInventory;
				[0,format["A %1 was just won in a random auction","House Upgrade"]] remoteExecCall ["DS_fnc_globalMessage",-2];
				};
			case 12:
				{
				hint "Congratulations, you have won 10 spy docs, The items has been added to your inventory";
				["spyDocs",true,10] call DS_fnc_handleInventory;
				[0,format["10 %1 was just won in a random auction","Spy Docs"]] remoteExecCall ["DS_fnc_globalMessage",-2];
				};
			case 13:
				{
				if((DS_infoArray select 13) > 50)then
					{
					hint "Congratulations, you have won 5 Y inventory Navids, The items has been added to your inventory";
					["gunNavid",true,5] call DS_fnc_handleInventory;
					[0,format["5 %1 was just won in a random auction","Navid's"]] remoteExecCall ["DS_fnc_globalMessage",-2];
					}
					else
					{
					hint "Congratulations, you have won a rock, The item has been added to your inventory";
					["rocku",true,1] call DS_fnc_handleInventory;
					[0,format["A %1 was just won in a random auction","Rock"]] remoteExecCall ["DS_fnc_globalMessage",-2];
					};
				};
			case 14:
				{
				if((DS_infoArray select 13) > 50)then
					{
					DS_vehicleGarage = [];
					hint "Congratulations, you have won a bullet proof SUV, your new vehicle is in your garage!";
					[(getPlayerUID player),civilian,"Car","C_SUV_01_F",true,false,true] remoteExec ["HUNT_fnc_vehicleRewards",2];
					[0,format["A %1 was just won in a random auction","Bulletproof SUV"]] remoteExecCall ["DS_fnc_globalMessage",-2];
					}
					else
					{
					hint "Congratulations, you have won a loaf of bread, The item has been added to your inventory";
					["wheatp",true,1] call DS_fnc_handleInventory;
					[0,format["A %1 was just won in a random auction","Loaf of bread"]] remoteExecCall ["DS_fnc_globalMessage",-2];
					};
				};
			case 15:
				{
				if((DS_infoArray select 13) > 50)then
					{
					sleep 2;
					hint "Congratulations, you have won a 200 pack of Steel";
					["packSteel",true,1] call DS_fnc_handleInventory;
					[0,format["A %1 was just won in a random auction","200 pack of Steel"]] remoteExecCall ["DS_fnc_globalMessage",-2];
					}
					else
					{
					hint "Congratulations, you have won a relic, The item has been added to your inventory";
					["relic",true,1] call DS_fnc_handleInventory;
					[0,format["A %1 was just won in a random auction","Dirty Relic"]] remoteExecCall ["DS_fnc_globalMessage",-2];
					};
				};
			case 16:
				{
				DS_vehicleGarage = [];
				hint "Congratulations, you have won a VTOL Xi'an";
				[(getPlayerUID player),civilian,"Air","O_T_VTOL_02_infantry_F",false,false,true] remoteExec ["HUNT_fnc_vehicleRewards",2];
				[0,format["A %1 was just won in a random auction","VTOL Xi'an"]] remoteExecCall ["DS_fnc_globalMessage",-2];
				};
			case 17:
				{
				if((DS_infoArray select 13) > 50)then
					{
					hint "Congratulations, you have won 1000 rebel tokens, The item has been added to your inventory";
					_tempNum = (DS_realEstateArray select 6);
					_tempNum = _tempNum + 1000;
					DS_realEstateArray set [6,_tempNum];
					[0,format["1000 %1 was just won in a random auction","rebel tokens"]] remoteExecCall ["DS_fnc_globalMessage",-2];
					}
					else
					{
					hint "Congratulations, you have won a Piece of wood, The item has been added to your inventory";
					["woodu",true,1] call DS_fnc_handleInventory;
					[0,format["A %1 was just won in a random auction","Piece of wood"]] remoteExecCall ["DS_fnc_globalMessage",-2];
					};
				};
			case 18:
				{
				if((DS_infoArray select 13) > 50)then
					{
					sleep 2;
					hint "Congratulations, you have won a 15 pack of CPU's";
					["packCPU",true,1] call DS_fnc_handleInventory;
					[0,format["A %1 was just won in a random auction","15 pack of CPU's"]] remoteExecCall ["DS_fnc_globalMessage",-2];
					}
					else
					{
					hint "Congratulations, you have won a lump of salt, The item has been added to your inventory";
					["saltu",true,1] call DS_fnc_handleInventory;
					[0,format["A %1 was just won in a random auction","lump of salt"]] remoteExecCall ["DS_fnc_globalMessage",-2];
					};
				};
			case 19:
				{
				if((DS_infoArray select 13) > 50)then
					{
					hint "Congratulations, you have won a Shikra jet";
					[(getPlayerUID player),civilian,"Air","O_Plane_Fighter_02_F",false,false,true] remoteExec ["HUNT_fnc_vehicleRewards",2];
					[0,format["A %1 was just won in a random auction","Shikra Jet"]] remoteExecCall ["DS_fnc_globalMessage",-2];
					}
					else
					{
					hint "Congratulations, you have won a grain of sand, The item has been added to your inventory";
					["sandu",true,1] call DS_fnc_handleInventory;
					[0,format["A %1 was just won in a random auction","grain of sand"]] remoteExecCall ["DS_fnc_globalMessage",-2];
					};
				};
			case 20:
				{
				hint "Congratulations, you have won 750 rebel tokens, The item has been added to your inventory";
				_tempNum = (DS_realEstateArray select 6);
				_tempNum = _tempNum + 750;
				DS_realEstateArray set [6,_tempNum];
				[0,format["750 %1 was just won in a random auction","rebel tokens"]] remoteExecCall ["DS_fnc_globalMessage",-2];
				};
			case 21:
				{
				hint "Congratulations, you have won 1500 rebel tokens, The item has been added to your inventory";
				_tempNum = (DS_realEstateArray select 6);
				_tempNum = _tempNum + 1500;
				DS_realEstateArray set [6,_tempNum];
				[0,format["1500 %1 was just won in a random auction","rebel tokens"]] remoteExecCall ["DS_fnc_globalMessage",-2];
				};
			case 22:
				{
				sleep 2;
				hint "Congratulations, you have won two 200 packs of Steel";
				["packSteel",true,2] call DS_fnc_handleInventory;
				[0,format["Two %1 was just won in a random auction","200 packs of Steel"]] remoteExecCall ["DS_fnc_globalMessage",-2];
				};
			case 23:
				{
				sleep 2;
				hint "Congratulations, you have won a 200 pack of Bronze";
				["packBronze",true,1] call DS_fnc_handleInventory;
				[0,format["A %1 was just won in a random auction","200 pack of Bronze"]] remoteExecCall ["DS_fnc_globalMessage",-2];
				};
			case 24:
				{
				sleep 2;
				hint "Congratulations, you have won a 200 pack of Crystal Glass";
				["packGlass",true,1] call DS_fnc_handleInventory;
				[0,format["A %1 was just won in a random auction","200 pack of Crystal Glass"]] remoteExecCall ["DS_fnc_globalMessage",-2];
				};
			case 25:
				{
				sleep 2;
				hint "Congratulations, you have won a 30 pack of Circuit boards";
				["packCircuitBoard",true,1] call DS_fnc_handleInventory;
				[0,format["A %1 was just won in a random auction","30 pack of Circuit boards"]] remoteExecCall ["DS_fnc_globalMessage",-2];
				};
			case 26:
				{
				sleep 2;
				hint "Congratulations, you have won a 30 pack of Small Batteries";
				["packBattery",true,1] call DS_fnc_handleInventory;
				[0,format["A %1 was just won in a random auction","30 pack of Small Batteries"]] remoteExecCall ["DS_fnc_globalMessage",-2];
				};
			case 27:
				{
				sleep 2;
				hint "Congratulations, you have won a 15 pack of CPU's";
				["packCPU",true,1] call DS_fnc_handleInventory;
				[0,format["A %1 was just won in a random auction","15 pack of CPU's"]] remoteExecCall ["DS_fnc_globalMessage",-2];
				};
			case 28:
				{
				sleep 2;
				hint "Congratulations, you have won 100 life insurances";
				_tempNum = (DS_realEstateArray select 0);
				_tempNum = _tempNum + 100;
				DS_realEstateArray set [0,_tempNum];
				[0,format["A %1 was just won in a random auction","100 Life insurances"]] remoteExecCall ["DS_fnc_globalMessage",-2];
				};
			case 29:
				{
				if((DS_infoArray select 13) > 50)then
					{
					sleep 2;
					hint "Congratulations, you have won a 30 pack of Circuit boards";
					["packCircuitBoard",true,1] call DS_fnc_handleInventory;
					[0,format["A %1 was just won in a random auction","30 pack of Circuit boards"]] remoteExecCall ["DS_fnc_globalMessage",-2];
					}
					else
					{
					sleep 2;
					hint "Congratulations, you have won a Rabbit";
					["rabbit",true,1] call DS_fnc_handleInventory;
					[0,format["A %1 was just won in a random auction","Rabbit"]] remoteExecCall ["DS_fnc_globalMessage",-2];
					};
				};
			case 30:
				{
				if((DS_infoArray select 13) > 50)then
					{
					DS_vehicleGarage = [];
					hint "Congratulations, you have won a bullet proof SUV, your new vehicle is in your garage!";
					[(getPlayerUID player),civilian,"Car","C_SUV_01_F",true,false,true] remoteExec ["HUNT_fnc_vehicleRewards",2];
					[0,format["A %1 was just won in a random auction","Bulletproof SUV"]] remoteExecCall ["DS_fnc_globalMessage",-2];
					}
					else
					{
					sleep 2;
					hint "Congratulations, you have won a camp fire";
					["fire",true,1] call DS_fnc_handleInventory;
					[0,format["A %1 was just won in a random auction","camp fire"]] remoteExecCall ["DS_fnc_globalMessage",-2];
					};
				};
			};
		};
	};

[] call DS_fnc_compileData;