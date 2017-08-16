/*
Script File Author: Repentz
Script File Mod: Life Server
Script File: RPP_Config_Items.sqf

Description:
Configs for items
*/
RPP_Items_Config =
[
	//Class,text,weight,price,sell price, can use, call, can drop, drop class, Type
	["RPP_Cash","Cash",0,0,0,false,"",true,"","Land_Suitcase_F","Inventory"],
	
	//Food
	["RPP_Bread","Bread",2,10,6,true,"['Bread'] call RPP_UseItem_Food",true,"","Land_Suitcase_F","Inventory"],
	["RPP_Apple","Apple",1,15,10,true,"['Apple'] call RPP_UseItem_Food",true,"","Land_Suitcase_F","Inventory"],
	["RPP_Donut","Donut",2,15,10,true,"['Donut'] call RPP_UseItem_Food",true,"","Land_Suitcase_F","Inventory"],
	["RPP_Burger","Burger",2,15,10,true,"['Burger'] call RPP_UseItem_Food",true,"","Land_Suitcase_F","Inventory"],

	//Fish
	["RPP_Salema","Salema",2,100,85,true,"['Salema'] call RPP_UseItem_Food",true,"","Land_Suitcase_F","Inventory"],
	["RPP_Mackerel","Mackerel",2,150,120,true,"['Mackerel'] call RPP_UseItem_Food",true,"","Land_Suitcase_F","Inventory"],
	["RPP_Tuna","Tuna",2,100,85,true,"['Tuna'] call RPP_UseItem_Food",true,"","Land_Suitcase_F","Inventory"],

	//ilegal Fishing
	["RPP_Turtle","Turtle",6,1000,900,false,"",true,"","Land_Suitcase_F","Inventory"],
	["RPP_Whale","Whale",25,3600,3020,false,"",true,"","Land_Suitcase_F","Inventory"],
	["RPP_Dolphin","Dolphin",10,1300,1200,false,"",true,"","Land_Suitcase_F","Inventory"],

	//Mining
	["RPP_Gold","Gold",9,320,300,false,"",true,"","Land_Suitcase_F","Inventory"],
	["RPP_Iron","Iron",6,210,180,false,"",true,"","Land_Suitcase_F","Inventory"],
	["RPP_Diamond","Diamond",15,9000,8500,false,"",true,"","Land_Suitcase_F","Inventory"],

	//Drinks
	["RPP_Water","Water",2,5,2,true,"['Water'] call RPP_UseItem_Drink",true,"","Land_Suitcase_F","Inventory"],
	["RPP_Redbull","Redbull",3,10,6,true,"['Redbull'] call RPP_UseItem_Drink",true,"","Land_Suitcase_F","Inventory"],
	["RPP_Cola","Cola",3,10,6,true,"['Cola'] call RPP_UseItem_Drink",true,"","Land_Suitcase_F","Inventory"],
	
	//Items
	["RPP_Handcuff","Handcuff",0,2,2,false,"",false,"","Land_Suitcase_F","Inventory"],
	["RPP_Repairkit","Repairkit",7,200,100,true,"['Repairkit'] call RPP_UseItem_Repairkit",true,"","Land_Suitcase_F","Inventory"],
	["RPP_Medkit","Medkit",6,200,150,true,"['Medkit'] call RPP_UseItem_Medkit",true,"","Land_Suitcase_F","Inventory"],
	["RPP_BankKeys","Bank Keys",4,15000,12000,false,"",true,"","Land_Suitcase_F","Inventory"],
	["RPP_MoneyBag","Money Bag",0,2,1,false,"",true,"","Land_Suitcase_F","Inventory"],
	["RPP_Evidence","Evidence",0,2,1,false,"",true,"","EvKobalt","Inventory"],
	["RPP_FishingPole","Fishing Pole",4,50,43,false,"",true,"","Land_Suitcase_F","Inventory"],
	["RPP_RepoKey","Impound lot Remote Key",0,50,25,true,"['Impound lot Remote Key'] call RPP_Repo_RemoteKey",false,"","Land_Suitcase_F","Inventory"],
	["RPP_JobContract","Job Contract",0,50,25,true,"[] call RPP_Job_Leave",false,"","Land_Suitcase_F","Inventory"],
	["RPP_RepoTowing","Towing",0,50,25,true,"[] call RPP_Repo_TowVehicle",false,"","Land_Suitcase_F","Inventory"],
	["RPP_RifleBag","Rifle Bag",10,750,450,false,"[] call RPP_Holster_Rifle",true,"","Land_Suitcase_F","Inventory"],
	["RPP_PoliceKit","Police Kit",0,2,1,true,"[] call RPP_Police_Kit",false,"","Land_Suitcase_F","Inventory"],
	["RPP_EMTKit","EMT Kit",0,2,1,true,"[] call RPP_EMT_Kit",false,"","Land_Suitcase_F","Inventory"],
	["RPP_Package","Delivery Package",0,2,1,false,"",false,"","Land_Suitcase_F","Inventory"],
	["RPP_IlligalPackage","Illigal Delivery Package",0,2,1,false,"",false,"","Land_Suitcase_F","Inventory"],
	["RPP_Lockpick","Lockpick",5,250,120,true,"[] call RPP_Lockpick_Start",true,"","Land_Suitcase_F","Inventory"],
	["RPP_VehicleJack","Vehicle Jack",8,300,230,true,"[] call RPP_CarJack_Use",true,"","Land_Suitcase_F","Inventory"],
	["RPP_CabelCuff","CabelCuff",5,700,500,false,"[] call RPP_Civilian_CabelCuff",true,"","Land_Suitcase_F","Inventory"],
	["RPP_Breacher","Breacher",5,250,120,true,"",true,"","Land_Suitcase_F","Inventory"],

	//Drugs
					//Weight,buy,sell | 3250
	["RPP_LSD","LSD",2,365,325,true,"['LSD'] call RPP_Item_Drugs_Use",true,"","Land_Suitcase_F","Inventory"],
	["RPP_Herion","Herion",4,620,564,true,"['LSD'] call RPP_Item_Drugs_Use",true,"","Land_Suitcase_F","Inventory"],
	["RPP_Cocaine","Cocaine",5,1200,950,true,"['LSD'] call RPP_Item_Drugs_Use",true,"","Land_Suitcase_F","Inventory"],
	["RPP_Weed","Weed",3,325,320,true,"['LSD'] call RPP_Item_Drugs_Use",true,"","Land_Suitcase_F","Inventory"],

	//Seed
	["RPP_Cannabis_Seed","Cannabis Seed",1,120,80,true,"['Cannabis Seed'] call RPP_Plant_Drug_Start",true,"","Land_Suitcase_F","Inventory"],
	["RPP_LSD_Seed","LSD Seed",1,145,65,true,"['LSD Seed'] call RPP_Plant_Drug_Start",true,"","Land_Suitcase_F","Inventory"],
	["RPP_Cocoa_Seed","Cocoa Seed",1,375,300,true,"['Cocoa Seed'] call RPP_Plant_Drug_Start",true,"","Land_Suitcase_F","Inventory"],
	["RPP_Poppy_Seed","Poppy Seed",1,685,550,true,"['Poppy Seed'] call RPP_Plant_Drug_Start",true,"","Land_Suitcase_F","Inventory"]
];
publicVariable "RPP_Items_Config";


RPP_Seed_Plant =
[	
	//type, plant time x2,bush, Item get, placement
	["Cannabis Seed",150,"xcam_b_FicusC1s_F", "Weed"],
	["LSD Seed",170,"xcam_b_FicusC1s_F", "LSD"],
	["Cocoa Seed",230,"xcam_b_FicusC1s_F", "Cocaine"],
	["Poppy Seed",200,"xcam_b_FicusC1s_F", "Heroin"]
];
publicVariable "RPP_Seed_Plant";

RPP_Food_Config = 
[	//Name,effect
	["Bread",30],
	["Apple",20],
	["Donut",15],
	["Burger",15],
	["Whale",100],
	["Turtle",70],
	["Salema",50],
	["Mackerel",60],
	["Tuna",50]
];
publicVariable "RPP_Food_Config";

RPP_Drink_Config = 
[
	//Name,effect
	["Water",80],
	["Redbull",60],
	["Cola",50]
];
publicVariable "RPP_Drink_Config";

RPP_Drug_Effect =
[
	//Name,Effect,function,time
	["LSD",50,"RPP_Item_Drugs_LSD_Effects",60],
	["Herion",30,"RPP_Item_Drugs_LSD_Effects",60],
	["Cocaine",30,"RPP_Item_Drugs_LSD_Effects",60],
	["Weed",30,"RPP_Item_Drugs_LSD_Effects",60]
];
publicVariable "RPP_Drug_Effect";

RPP_Illigal_Items =
[
	"Whale",
	"Bank Keys",
	"Money Bag",
	"LSD",
	"Herion",
	"Cocaine",
	"Weed",
	"Cannabis Seed",
	"LSD Seed",
	"Cocoa Seed",
	"Poppy Seed",
	"Illigal Delivery Package",
	"Meth"
];
publicVariable "RPP_Illigal_Items";