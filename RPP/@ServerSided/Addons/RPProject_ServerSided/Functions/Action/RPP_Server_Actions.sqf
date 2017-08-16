/*
Script File Author: Repentz
Script File Mod: Life Server
Script File: RPP_Config_Shop.sqf

Description:
Server Actions
*/
RPP_S_Actions = {
	//Shops
	RPP_Server_Action1 = player addAction ["<t color='#0000FF'>User Cars</t>",{[RPP_Shop_UserCars,RPP_Shop_UserCars_ShopOwner,RPP_VehicleSpawn_1,"","VEHICLE"] call RPP_Shop_DialogOpen_Shop},[false],1,false,true,"","(player distance (getpos RPP_Civ_Shop1)) < 5"];
	RPP_Server_Action3 = player addAction ["<t color='#0000FF'>Item Shop</t>",{[RPP_Shop_ItemShop1,RPP_Shop_ItemShop1_ShopOwner,"","","ITEM"] call RPP_Shop_DialogOpen_Shop},[false],1,false,true,"","(player distance (getpos RPP_Item_Shop1)) < 5"];
	RPP_Server_Action5 = player addAction ["<t color='#0000FF'>Equipment Store</t>",{[RPP_Shop_GeneralStore,RPP_Shop_GeneralStore_ShopOwner,"RPP_Box_GeneralStore1","","GEAR"] call RPP_Shop_DialogOpen_Shop},[false],1,false,true,"","(player distance (getpos RPP_Shop_GeneralStore1)) < 5"];
	RPP_Server_Action7 = player addAction ["<t color='#0000FF'>Clothing Store</t>",{[RPP_Shop_Cloth,RPP_Shop_Cloth_ShopOwner,"RPP_ClothStore_1_Box","","GEAR"] call RPP_Shop_DialogOpen_Shop},[false],1,false,true,"","(player distance (getpos RPP_ClothStore_1)) < 5"];
	RPP_Server_Action8 = player addAction ["<t color='#0000FF'>Pistol Shop</t>",{[RPP_Shop_PistolShop,RPP_Shop_PistolShop_ShopOwner,"RPP_PistolShop1_Box","Civilian","GEAR"] call RPP_Shop_DialogOpen_Shop},[false],1,false,true,"","(player distance (getpos RPP_Civ_PistolShop)) < 5"];
	RPP_Server_Action18 = player addAction ["<t color='#0000FF'>Air Shop</t>",{[RPP_Shop_AirShop,RPP_Shop_AirShop_ShopOwner,RPP_AirSpawn1,"","VEHICLE"] call RPP_Shop_DialogOpen_Shop},[false],1,false,true,"","(player distance (getpos RPP_Civ_airShop)) < 5"];
	RPP_Server_Action18 = player addAction ["<t color='#0000FF'>Air Shop</t>",{[RPP_Shop_AirShop,RPP_Shop_AirShop_ShopOwner,RPP_AirSpawn2,"","VEHICLE"] call RPP_Shop_DialogOpen_Shop},[false],1,false,true,"","(player distance (getpos RPP_Civ_airShop2)) < 5"];
	RPP_Server_Action19 = player addAction ["<t color='#0000FF'>Blue King</t>",{[RPP_Shop_BlueKing,RPP_Shop_BlueKing_ShopOwner,"","","ITEM"] call RPP_Shop_DialogOpen_Shop},[false],1,false,true,"","(player distance (getpos RPP_BlueKing)) < 5"];
	RPP_Server_Action19 = player addAction ["<t color='#0000FF'>Red King</t>",{[RPP_Shop_RedKing,RPP_Shop_RedKing_ShopOwner,"","","ITEM"] call RPP_Shop_DialogOpen_Shop},[false],1,false,true,"","(player distance (getpos RPP_RedKing)) < 5"];
	RPP_Server_Action20 = player addAction ["<t color='#0000FF'>EMT Vehicle Shop</t>",{[RPP_Shop_VehEMT,RPP_Shop_VehEMT_ShopOwner,RPP_EMT_VehSpawn1,"EMT","VEHICLE"] call RPP_Shop_DialogOpen_Shop},[false],1,false,true,"","(player distance (getpos RPP_EMT_Shop1)) < 5"];
	RPP_Server_Action21 = player addAction ["<t color='#0000FF'>EMT Air Shop</t>",{[RPP_Shop_AirEMT,RPP_Shop_AirEMT_ShopOwner,RPP_EMT_AirSpawn,"EMT","VEHICLE"] call RPP_Shop_DialogOpen_Shop},[false],1,false,true,"","(player distance (getpos RPP_Shop_AirEMT1)) < 5"];
	RPP_Server_Action22 = player addAction ["<t color='#0000FF'>EMT Cloth Shop</t>",{[RPP_Shop_EMTCloth,RPP_Shop_EMTCloth_ShopOwner,RPP_EMT_WeaponBox,"EMT","GEAR"] call RPP_Shop_DialogOpen_Shop},[false],1,false,true,"","(player distance (getpos RPP_EMT_Shop1)) < 5"];
	RPP_Server_Action22 = player addAction ["<t color='#0000FF'>EMT Item Shop</t>",{[RPP_Shop_EMTItems,RPP_Shop_EMTItems_ShopOwner,"","EMT","ITEM"] call RPP_Shop_DialogOpen_Shop},[false],1,false,true,"","(player distance (getpos RPP_EMT_Shop1)) < 5"];
	RPP_Server_Action33 = player addAction ["<t color='#0000FF'>Fishing Tools</t>",{[RPP_Shop_FishingTools,RPP_Shop_FishingTools_ShopOwner,"","","ITEM"] call RPP_Shop_DialogOpen_Shop},[false],1,false,true,"","(player distance (getpos RPP_FishingTools)) < 5"];
	RPP_Server_Action38 = player addAction ["<t color='#0000FF'>Illegal Helis</t>",{[RPP_Shop_Ilegall_Helis,RPP_Shop_Ilegall_Helis_ShopOwner,RPP_Ilegal_heliSpawn,"Civilian","VEHICLE"] call RPP_Shop_DialogOpen_Shop},[false],1,false,true,"","(player distance (getpos RPP_Civ_illegalHeli)) < 5"];
	RPP_Server_Action39 = player addAction ["<t color='#0000FF'>Illegal Weapons</t>",{[RPP_Shop_Ilegall_Weapons,RPP_Shop_Ilegall_Weapons_ShopOwner,RPP_illegalWeapons_box,"Civilian","GEAR"] call RPP_Shop_DialogOpen_Shop},[false],1,false,true,"","(player distance (getpos RPP_Civ_illegalWeapons)) < 5"];
	RPP_Server_Action39 = player addAction ["<t color='#0000FF'>BlackMarket Items</t>",{[RPP_Shop_BlackMarketItems,RPP_Shop_BlackMarketItems_ShopOwner,"","Civilian","ITEM"] call RPP_Shop_DialogOpen_Shop},[false],1,false,true,"","(player distance (getpos RPP_Civ_illegalWeapons)) < 5"];
	RPP_Server_Action40 = player addAction ["<t color='#0000FF'>Boat Shop</t>",{[RPP_Shop_BoatShop1,RPP_Shop_BoatShop1_ShopOwner,RPP_Boat_spawn1,"Civilian","VEHICLE"] call RPP_Shop_DialogOpen_Shop},[false],1,false,true,"","(player distance (getpos RPP_BoatShop_1)) < 5"];
	RPP_Server_Action41 = player addAction ["<t color='#0000FF'>Medium Cars</t>",{[RPP_Shop_MediumCars,RPP_Shop_MediumCars_ShopOwner,RPP_Mediumcars_1,"Civilian","VEHICLE"] call RPP_Shop_DialogOpen_Shop},[false],1,false,true,"","(player distance (getpos RPP_Civ_MediumCars1)) < 5"];
	RPP_Server_Action42 = player addAction ["<t color='#0000FF'>HighEnd Cars</t>",{[RPP_Shop_HighEnd,RPP_Shop_HighEnd_ShopOwner,RPP_VehicleSpawn_HighEnd,"Civilian","VEHICLE"] call RPP_Shop_DialogOpen_Shop},[false],1,false,true,"","(player distance (getpos RPP_Civ_highend)) < 5"];
	RPP_Server_Action44 = player addAction ["<t color='#0000FF'>Truck Shop</t>",{[RPP_Shop_Trucks,RPP_Shop_Trucks_ShopOwner,RPP_Vehicle_TruckShop,"Civilian","VEHICLE"] call RPP_Shop_DialogOpen_Shop},[false],1,false,true,"","(player distance (getpos RPP_Shop_Trucks1)) < 5"];
	RPP_Server_Action46 = player addAction ["<t color='#0000FF'>Seed Dealer</t>",{[RPP_Shop_SeedDealer,RPP_Shop_SeedDealer_ShopOwner,"","Civilian","ITEM"] call RPP_Shop_DialogOpen_Shop},[false],1,false,true,"","(player distance (getpos RPP_SeedDealer)) < 5"];

	//Police Shops
	RPP_Server_Action10 = player addAction ["<t color='#0000FF'>Police Item Shop</t>",{[RPP_Shop_PoliceItem,RPP_Shop_PoliceItem_ShopOwner,"","Police","ITEM"] call RPP_Shop_DialogOpen_Shop},[false],1,false,true,"","(player distance (getpos RPP_Cop_Shop)) < 5"];
	RPP_Server_Action12 = player addAction ["<t color='#0000FF'>Police Vehicle Shop</t>",{[RPP_Shop_PoliceVehicle,RPP_Shop_PoliceVehicle_ShopOwner,RPP_Cop_VehSpawn,"Police","VEHICLE"] call RPP_Shop_DialogOpen_Shop},[false],1,false,true,"","(player distance (getpos RPP_Cop_VehShop)) < 5"];
	RPP_Server_Action12 = player addAction ["<t color='#0000FF'>Police Air Shop</t>",{[RPP_Shop_PoliceAir,RPP_Shop_PoliceAir_ShopOwner,RPP_Cop_AirSpawn,"Police","VEHICLE"] call RPP_Shop_DialogOpen_Shop},[false],1,false,true,"","(player distance (getpos RPP_Cop_VehShop)) < 5"];
	RPP_Server_Action11 = player addAction ["<t color='#0000FF'>Probationary Deputy Shop</t>",{[RPP_Shop_ProbationaryDeputy,RPP_Shop_ProbationaryDeputy_ShopOwner,"RPP_Cop_WeaponBox","Police","GEAR"] call RPP_Shop_DialogOpen_Shop},[false],1,false,true,"","(player distance (getpos RPP_Cop_ClothShop)) < 5"];
	RPP_Server_Action11 = player addAction ["<t color='#0000FF'>Deputy Shop</t>",{[RPP_Shop_Deputy,RPP_Shop_Deputy_ShopOwner,"RPP_Cop_WeaponBox","Police","GEAR"] call RPP_Shop_DialogOpen_Shop},[false],1,false,true,"","(player distance (getpos RPP_Cop_ClothShop)) < 5"];
	RPP_Server_Action11 = player addAction ["<t color='#0000FF'>Senior Deputy Shop</t>",{[RPP_Shop_Senior_Deputy,RPP_Shop_Senior_Deputy_ShopOwner,"RPP_Cop_WeaponBox","Police","GEAR"] call RPP_Shop_DialogOpen_Shop},[false],1,false,true,"","(player distance (getpos RPP_Cop_ClothShop)) < 5"];
	RPP_Server_Action11 = player addAction ["<t color='#0000FF'>Corporal Shop</t>",{[RPP_Shop_Corporal,RPP_Shop_Corporal_ShopOwner,"RPP_Cop_WeaponBox","Police","GEAR"] call RPP_Shop_DialogOpen_Shop},[false],1,false,true,"","(player distance (getpos RPP_Cop_ClothShop)) < 5"];
	RPP_Server_Action11 = player addAction ["<t color='#0000FF'>Sergenat Shop</t>",{[RPP_Shop_Sergeant,RPP_Shop_Sergeant_ShopOwner,"RPP_Cop_WeaponBox","Police","GEAR"] call RPP_Shop_DialogOpen_Shop},[false],1,false,true,"","(player distance (getpos RPP_Cop_ClothShop)) < 5"];
	RPP_Server_Action11 = player addAction ["<t color='#0000FF'>Lieutenant Shop</t>",{[RPP_Shop_Lieutenant,RPP_Shop_Lieutenant_ShopOwner,"RPP_Cop_WeaponBox","Police","GEAR"] call RPP_Shop_DialogOpen_Shop},[false],1,false,true,"","(player distance (getpos RPP_Cop_ClothShop)) < 5"];
	RPP_Server_Action11 = player addAction ["<t color='#0000FF'>Captain Shop</t>",{[RPP_Shop_Captain,RPP_Shop_Captain_ShopOwner,"RPP_Cop_WeaponBox","Police","GEAR"] call RPP_Shop_DialogOpen_Shop},[false],1,false,true,"","(player distance (getpos RPP_Cop_ClothShop)) < 5"];
	RPP_Server_Action11 = player addAction ["<t color='#0000FF'>Sheriff Shop</t>",{[RPP_Shop_Sheriff,RPP_Shop_Sheriff_ShopOwner,"RPP_Cop_WeaponBox","Police","GEAR"] call RPP_Shop_DialogOpen_Shop},[false],1,false,true,"","(player distance (getpos RPP_Cop_ClothShop)) < 5"];
	RPP_Server_Action11 = player addAction ["<t color='#0000FF'>SERT Shop</t>",{[RPP_Shop_SERT,RPP_Shop_SERT_ShopOwner,"RPP_Cop_WeaponBox","Police","GEAR"] call RPP_Shop_DialogOpen_Shop},[false],1,false,true,"","(player distance (getpos RPP_Cop_ClothShop)) < 5"];
	

	//Gas Station
	RPP_Server_Action9 = player addAction ["<t color='#0000FF'>Gas Station Shop</t>",{[RPP_Shop_GasStation1,RPP_Shop_GasStation1_ShopOwner,"","","ITEM"] call RPP_Shop_DialogOpen_Shop},[false],1,false,true,"","(player distance (getpos RPP_GasStation1)) < 5"];
	RPP_Server_Action23 = player addAction ["<t color='#0000FF'>Gas Station Shop</t>",{[RPP_Shop_GasStation1,RPP_Shop_GasStation1_ShopOwner,"","","ITEM"] call RPP_Shop_DialogOpen_Shop},[false],1,false,true,"","(player distance (getpos RPP_GasStation2)) < 5"];

	//Market
	RPP_Server_Action24 = player addAction ["<t color='#0000FF'>Market Dealer</t>",{[RPP_Dealer_Market] call RPP_Market_Dealer_Dialog},[false],1,false,true,"","(player distance (getpos RPP_Civ_Market)) < 5"];
	RPP_Server_Action25 = player addAction ["<t color='#0000FF'>Whale Dealer</t>",{[RPP_Dealer_Whale] call RPP_Market_Dealer_Dialog},[false],1,false,true,"","(player distance (getpos RPP_Whale_Dealer)) < 5"];
	RPP_Server_Action26 = player addAction ["<t color='#0000FF'>Dophin Dealer</t>",{[RPP_Dealer_Dolphin] call RPP_Market_Dealer_Dialog},[false],1,false,true,"","(player distance (getpos RPP_Dolphin_Dealer)) < 5"];
	RPP_Server_Action26 = player addAction ["<t color='#0000FF'>Turtle Dealer</t>",{[RPP_Dealer_Turtle] call RPP_Market_Dealer_Dialog},[false],1,false,true,"","(player distance (getpos RPP_Turtles_Dealer)) < 5"];
	RPP_Server_Action27 = player addAction ["<t color='#0000FF'>Fishing Market</t>",{[RPP_Dealer_Fish] call RPP_Market_Dealer_Dialog},[false],1,false,true,"","(player distance (getpos RPP_FishingMarket)) < 5"];
	RPP_Server_Action27 = player addAction ["<t color='#0000FF'>Drug Dealer</t>",{[RPP_Dealer_Drug] call RPP_Market_Dealer_Dialog},[false],1,false,true,"","(player distance (getpos RPP_DrugDealer)) < 5"];


	//Area
	//Fishing
	RPP_Server_Action27 = player addAction ["<t color='#0000FF'>Catch Whale</t>",{["Whale",15,"Fishing Pole",15] call RPP_Start_Fishing},[false],1,false,true,"","(player distance (getMarkerPos 'RPP_Whale')) < 150"];
	RPP_Server_Action28 = player addAction ["<t color='#0000FF'>Catch Tuna</t>",{["Tuna",0,"Fishing Pole",7] call RPP_Start_Fishing},[false],1,false,true,"","(player distance (getMarkerPos 'RPP_Tuna')) < 150"];
	RPP_Server_Action29 = player addAction ["<t color='#0000FF'>Catch Mackerel</t>",{["Mackerel",0,"Fishing Pole",6] call RPP_Start_Fishing},[false],1,false,true,"","(player distance (getMarkerPos 'RPP_mackerel')) < 150"];
	RPP_Server_Action30 = player addAction ["<t color='#0000FF'>Catch Turtel</t>",{["Turtel",5,"Fishing Pole",10] call RPP_Start_Fishing},[false],1,false,true,"","(player distance (getMarkerPos 'RPP_Turtles')) < 150"];
	RPP_Server_Action31 = player addAction ["<t color='#0000FF'>Catch Salema</t>",{["Salema",0,"Fishing Pole",5] call RPP_Start_Fishing},[false],1,false,true,"","(player distance (getMarkerPos 'RPP_Salema')) < 150"];
	RPP_Server_Action32 = player addAction ["<t color='#0000FF'>Catch Dolphin</t>",{["Dolphin",10,"Fishing Pole",10] call RPP_Start_Fishing},[false],1,false,true,"","(player distance (getMarkerPos 'RPP_Dolphin')) < 150"];
	
	//Gathering
	RPP_Server_Action34 = player addAction ["<t color='#0000FF'>Pick Apple</t>",{["Apple",0,"Pickaxe",5,"Gathering"] call RPP_Start_Field_Pick},[false],1,false,true,"","(player distance (getMarkerPos 'RPP_AppleField')) < 25"];
	RPP_Server_Action35 = player addAction ["<t color='#0000FF'>Mine Gold</t>",{["Gold",6,"Pickaxe",5,"Mining"] call RPP_Start_Field_Pick},[false],1,false,true,"","(player distance (getMarkerPos 'RPP_GoldField')) < 25"];
	RPP_Server_Action36 = player addAction ["<t color='#0000FF'>Mine Diamond</t>",{["Diamond",60,"Pickaxe",5,"Mining"] call RPP_Start_Field_Pick},[false],1,false,true,"","(player distance (getMarkerPos 'RPP_DiamondField')) < 25"];
	RPP_Server_Action37 = player addAction ["<t color='#0000FF'>Mine Iron</t>",{["Iron",0,"Pickaxe",5,"Mining"] call RPP_Start_Field_Pick},[false],1,false,true,"","(player distance (getMarkerPos 'RPP_IronField')) < 25"];
	

	//Other
	RPP_Server_Action4 = player addAction ["<t color='#0000FF'>Rob Bank</t>",{[] call RPP_BankRobbery_Rob},[false],1,false,true,"","(player distance (getpos RPP_Safe)) < 5"];
	RPP_Server_Action4 = player addAction ["<t color='#0000FF'>DMV</t>",{[] call RPP_DMV_Dialog},[false],1,false,true,"","(player distance (getpos RPP_DMV)) < 5"];
	RPP_Server_Action4 = player addAction ["<t color='#0000FF'>Company Menu</t>",{[] call RPP_CompanySystem_MainMenu},[false],1,false,true,"","(player distance (getpos RPP_Item_Shop1)) < 5"];
	RPP_Server_Action43 = player addAction ["<t color='#0000FF'>Power Generator</t>",{[] call RPP_Electric_Dialog},[false],1,false,true,"","(player distance (getpos RPP_PowerGenerator)) < 5"];
	RPP_Server_Action44 = player addAction ["<t color='#0000FF'>Job Finder</t>",{[] call RPP_JobFinder_Dialog},[false],1,false,true,"","(player distance (getpos RPP_ShopFinder)) < 5"];
	RPP_Server_Action45 = player addAction ["<t color='#0000FF'>Get Delivery Mission</t>",{[] call RPP_Delivery_Get},[false],1,false,true,"","(player distance (getpos RPP_Item_Shop1)) < 5"];
	RPP_Server_Action46 = player addAction ["<t color='#0000FF'>Get Illigal Delivery Mission</t>",{[] call RPP_IlligalDelivery_Get},[false],1,false,true,"","(player distance (getpos RPP_Item_Shop1)) < 5"];
	RPP_Server_Action47 = player addAction ["<t color='#0000FF'>Online Shopping</t>",{[] call RPP_OnlineShopping_Dialog},[false],1,false,true,"","(player distance (getpos RPP_Item_Shop1)) < 5"];
	RPP_Server_Action48 = player addAction ["<t color='#0000FF'>Governor Votting</t>",{[] call RPP_Goverment_MainMenu},[false],1,false,true,"","(player distance (getpos RPP_Governor_Votting)) < 5"];
	//RPP_Server_Action48 = player addAction ["<t color='#0000FF'>Open Money Bag</t>",{[] call RPP_Process_MoneyBagOpen},[false],1,false,true,"","(player distance (getpos RPP_Process_MoneyBag)) < 5"];
	
	//Duty
	RPP_Server_Action48 = player addAction ["<t color='#0000FF'>Police Department</t>",{["Police"] call RPP_Duty_Dialog},[false],1,false,true,"","(player distance (getpos RPP_Cop_Duty)) < 5"];
	RPP_Server_Action48 = player addAction ["<t color='#0000FF'>EMS Department</t>",{["EMS"] call RPP_Duty_Dialog},[false],1,false,true,"","(player distance (getpos RPP_EMT_Duty)) < 5"];

	//Gang Areas
	RPP_Server_Action48 = player addAction ["<t color='#0000FF'>Capture West Gang Area</t>",{[RPP_GangWest] call RPP_Gang_CaptureArea},[false],1,false,true,"","(player distance (getpos RPP_GangFlag_West)) < 5"];
	RPP_Server_Action48 = player addAction ["<t color='#0000FF'>Capture East Gang Area</t>",{[RPP_GangEast] call RPP_Gang_CaptureArea},[false],1,false,true,"","(player distance (getpos RPP_GangFlag_East)) < 5"];
	RPP_Server_Action48 = player addAction ["<t color='#0000FF'>Capture North Gang Area</t>",{[RPP_GangNorth] call RPP_Gang_CaptureArea},[false],1,false,true,"","(player distance (getpos RPP_GangFlag_North)) < 5"];
	RPP_Server_Action48 = player addAction ["<t color='#0000FF'>Capture South Gang Area</t>",{[RPP_GangSouth] call RPP_Gang_CaptureArea},[false],1,false,true,"","(player distance (getpos RPP_GangFlag_South)) < 5"];

	//ATM
	RPP_Server_Action5 = player addAction ["<t color='#0000FF'>ATM</t>",{[] call RPP_ATM_Dialog},[false],1,false,true,"","(player distance (getpos RPP_ATM)) < 5"];
	RPP_Server_Action19 = player addAction ["<t color='#0000FF'>ATM</t>",{[] call RPP_ATM_Dialog},[false],1,false,true,"","(player distance (getpos RPP_CopATM)) < 5"];
	RPP_Server_Action6 = player addAction ["<t color='#0000FF'>ATM</t>",{[] call RPP_ATM_Dialog},[false],1,false,true,"","(player distance (getpos RPP_DMV)) < 5"];
	RPP_Server_Action13 = player addAction ["<t color='#0000FF'>ATM</t>",{[] call RPP_ATM_Dialog},[false],1,false,true,"","(player distance (getpos RPP_Civ_PistolShop)) < 5"];
	RPP_Server_Action17 = player addAction ["<t color='#0000FF'>ATM</t>",{[] call RPP_ATM_Dialog},[false],1,false,true,"","(player distance (getpos RPP_EMT_Shop1)) < 5"];
	RPP_Server_Action22 = player addAction ["<t color='#0000FF'>ATM</t>",{[] call RPP_ATM_Dialog},[false],1,false,true,"","(player distance (getpos RPP_ATM1)) < 5"];
	
	//Storage
	RPP_Server_Action14 = player addAction ["<t color='#0000FF'>Vehicle Storage</t>",{[RPP_Cop_VehSpawn] call RPP_Vehicle_Storage_Dialog},[false],1,false,true,"","(player distance (getpos RPP_Cop_VehShop)) < 5"];
	RPP_Server_Action15 = player addAction ["<t color='#0000FF'>Vehicle Storage</t>",{[RPP_VehicleStorage_Spawn1] call RPP_Vehicle_Storage_Dialog},[false],1,false,true,"","(player distance (getpos RPP_VehicleStorage_1)) < 5"];
	RPP_Server_Action16 = player addAction ["<t color='#0000FF'>Vehicle Storage</t>",{[RPP_VehicleStorage_Spawn2] call RPP_Vehicle_Storage_Dialog},[false],1,false,true,"","(player distance (getpos RPP_VehicleStorage_2)) < 5"];
	RPP_Server_Action16 = player addAction ["<t color='#0000FF'>Vehicle Storage</t>",{[RPP_VehicleStorage_Spawn3] call RPP_Vehicle_Storage_Dialog},[false],1,false,true,"","(player distance (getpos RPP_VehicleStorage_3)) < 5"];

	//Fun
	RPP_Server_Action2 = player addAction ["<t color='#0000FF'>Paintball Menu</t>",{[] call RPP_Paintball_Dialog},[false],1,false,true,"","(player distance (getpos RPP_Paintball)) < 5"];
};
publicVariable "RPP_S_Actions";