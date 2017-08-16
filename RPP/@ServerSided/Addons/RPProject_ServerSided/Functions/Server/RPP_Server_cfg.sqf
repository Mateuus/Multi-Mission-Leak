/*
Script File Author: Repentz
Script File Mod: Life Server
Script File: RPP_Init.sqf

Description:
Server Variables
*/
RPP_isBankRobbed = false;
RPP_isBankBehingRobbed = false;
RPP_BankSafe1 = 2500;
RPP_isServerSaving = false;
RPP_Company_List = [];

RPP_Vehicle_SAVING = player;

RPP_ImpoundLotOpen = false;
publicVariable "RPP_ImpoundLotOpen";

addMissionEventHandler ["HandleDisconnect",{
	_uid = _this select 2;
	deleteVehicle _unit;
}];


RPP_Gang_MaxMembers = 10;
publicVariable "RPP_Gang_MaxMembers";

RPP_ServerUpTime_Min = 0;
publicVariable "RPP_ServerUpTime_Min";

RPP_Governor_VottingLog = [];
RPP_Governors = [];
RPP_Governors_TotalVotes = 0;
RPP_Governors_Name = "";
RPP_Governors_UID = "";
RPP_Governors_BodyGuards = [];
publicVariable "RPP_Governors_BodyGuards";
publicVariable "RPP_Governors_TotalVotes";
publicVariable "RPP_Governors";
publicVariable "RPP_Governor_VottingLog";
publicVariable "RPP_Governors_UID";
publicVariable "RPP_Governors_Name";



//District,Gang Area,Gang name,Gang Leader uid,Gang MembersUID,extra paycheck
RPP_GangWest = 
[
	["West","West Gang Area","","",[""],500,"RPP_GangWest"]
];

RPP_GangEast = [
	["East","East Gang Area","","",[""],500,"RPP_GangEast"]
];

RPP_GangNorth = [
	["North","North Gang Area","","",[""],500,"RPP_GangNorth"]
];

RPP_GangSouth = [
	["South","South Gang Area","","",[""],500,"RPP_GangSouth"]
];

publicVariable "RPP_GangWest";
publicVariable "RPP_GangEast";
publicVariable "RPP_GangNorth";
publicVariable "RPP_GangSouth";

RPP_Governor_Laws = [
	"Always drive on the right hand side.",
	"No weapons unholstered intown.",
	"Speed limit intown 60 and out of town 90"
];
publicVariable "RPP_Governor_Laws";

RPP_Delivery_Markers = [
	"RPP_Delivery_pos1",
	"RPP_Delivery_pos2",
	"RPP_Delivery_pos3",
	"RPP_Delivery_pos4",
	"RPP_Delivery_pos5",
	"RPP_Delivery_pos6",
	"RPP_Delivery_pos7",
	"RPP_Delivery_pos8",
	"RPP_Delivery_pos9",
	"RPP_Delivery_pos10"
];
publicVariable "RPP_Delivery_Markers";

RPP_JobFinder_Array =
[	//Text,call function or not,call,info
	["Delivery Missions",false,"","Go to the Post office if you want to deliver package for some good money"],
	["Apple Picker",false,"","Go to the Apple field and pick some Appels then sell it to the Market Dealer"],
	["Mining",false,"","Go to the General Store and get your self a pickaxe but watch out you may need so skill points to get the best price"],
	["Repo Driver",true,"RPP_Repo_TakeJob","A Repo is a tow Truck Driver, you impound vehicles and make sure the street is clean"],
	["Fisher",false,"","A Fisher would need a fishing pool and a boat then you would need to go to the finish areas and catch some fish"],
	["Police Officer",false,"","To Become a Police Officer you would need to be whitelisted, visit [Community website here] for more info"],
	["EMT/Firefigher",false,"","To Become a EMT/FireFigher you would need to be whitelisted, visit [Community website here] for more info"],
	["Taxi Driver",false,"","Become a Taxi driver today and transport the people of RP Project, Visit the Taxi Office for more info"],
	["Truck Driver",false,"","Become a Truck Driver today and Transport food,drugs,cars or what ever you want, Visit the Trucking center for more info"],
	["Company Owner",false,"","Want to own your own Company? well you are at the right place..not really, visit the Civ spawn beside the item store to create your own Company"],
	["Drug Dealer",false,"","Want to crow some weed well then go to the Seed dealer and buy some seed and start crowing out in the woods or at your own home"],
	["Meath Dealer",false,"","Did you know that you will be able to create your own Meath lab at your own house? Still a Work in Progress"],
	["Air Transport",false,"","To become a Air Transporter you would need to be whitelisted, Visit [Community website here] for more info"],
	["Shop Owner",false,"","You can own your own shop by going up to a shop and buying it BUT it cost money"],
	["Make Your own shop with your own items",false,"","Yes thats right, you can make your own shop on the street but only if you own a Company, Craft a Shop bench and place it where ever you want then add the items you want to sell into your Company Storage then you set a price in the Shop Bench"],
	["Want more jobs then click view info here",false,"","We Would love some more jobs for you here but we need some ideas from you! post them on our website: [Community website here]"]
];
publicVariable "RPP_JobFinder_Array";

RPP_Company_Types =
[
	//Type,Cost
	["Trucking",1000],
	["Mining",800],
	["Crafting",2000],
	["Transport",2100],
	["Other",1500]
];

RPP_Company_Ranks =
[
	//Rank,canadd,lvl
	["Owner",false,10],
	["Co-Owner",true,9],
	["Manager",true,8],
	["Administrator",true,5],
	["Moderator",true,4],
	["Worker",true,3],
	["Senior-Worker",true,2],
	["Newbie",true,1]
];

RPP_Company_PayChecks =
[
	//Amount
	"10000",
	"8000",
	"6000",
	"5500",
	"5000",
	"4500",
	"4000",
	"3500",
	"3000",
	"2500",
	"2000",
	"1500",
	"1000",
	"750",
	"500",
	"100",
	"50"
];

RPP_Company_Craft_Type =
[
	//type
	"LANDVEHICLE",
	"AIR",
	"INVENTORY",
	"WEAPONS",
	"MAGAZINE",
	"ITEMS",
	"CLOTH"
];

RPP_Company_Craft_List =
[
	//Classname,Type
	["RPP_Bread","INVENTORY"],
	["RPP_RepairKit","INVENTORY"],
	["RPP_Water","INVENTORY"],
	["RPP_BankKeys","INVENTORY"],
	["RPP_Evidence","INVENTORY"],
	["RPP_Offroad","LANDVEHICLE"],
	["RPP_QuadBike","LANDVEHICLE"]
];

RPP_PatrolMission_Points =
[
	["RPP_PatrolPoint_1","Patrol Point 1"],
	["RPP_PatrolPoint_2","Patrol Point 2"],
	["RPP_PatrolPoint_3","Patrol Point 3"],
	["RPP_PatrolPoint_4","Patrol Point 4"],
	["RPP_PatrolPoint_5","Patrol Point 5"],
	["RPP_PatrolPoint_6","Patrol Point 6"],
	["RPP_PatrolPoint_7","Patrol Point 7"],
	["RPP_PatrolPoint_8","Patrol Point 8"],
	["RPP_PatrolPoint_9","Patrol Point 9"],
	["RPP_PatrolPoint_10","Patrol Point 10"],
	["RPP_PatrolPoint_11","Patrol Point 11"],
	["RPP_PatrolPoint_12","Patrol Point 12"]

];
publicVariable "RPP_PatrolMission_Points";

CP_Menu_Items =
[	//Class Name | Item Name | Price
	["Land_BarGate_F","Bare Gate",50],
	["RoadCone_F","Road Cone",5],
	["RoadBarrier_F","Road Barrier",25],
	["TapeSign_F", "Red-White Tape", 10],
	["ArrowDesk_L_F","Arrow Desk (left)",15],
	["ArrowDesk_R_F","Arrow Desk (right)",15],
	["ArrowMarker_R_F","Arrow Marker (right)",10],
	["ArrowMarker_L_F","Arrow Marker (left",10],
	["Land_FieldToilet_F","Toilet",30],
	["FirePlace_burning_F","Fire place (Burning)",5],
	["Land_TentA_F","Tent",30],
	["Land_LampStreet_F","Street Lamp (on)",80]
];
publicVariable "CP_Menu_Items";

RPP_DMV_Licenses =
[
	//Licenses,price,spawn point,time,need test or not,call
	["Driver License",1000,RPP_DriverLic_Test_Start,180,true,"RPP_DMV_StartTest_Driver"],
	["Truck License",15000,RPP_TruckLic_test_Start,200,true,"RPP_DMV_StartTest_Truck"],
	["Boat License",1000,RPP_Boat_test_Start,220,true,"RPP_DMV_StartTest_Boat"],
	["Pilot License",20000,RPP_Pilot_test_Start,160,true,"RPP_DMV_StartTest_Pilot"],
	["Pistol License",10000,0,0,false,""],
	["Rifle License",95000,0,0,false,""],
	["Hunting License",750,0,0,false,""],
	["Fishing License",500,0,0,false,""],
	["Diving License",3000,0,0,false,""],
	["Bike License",5000,0,0,false,""],
	["Bus License",5000,RPP_TruckLic_test_Start,160,true,"RPP_DMV_StartTest_Bus"]
];
publicVariable "RPP_DMV_Licenses";

RPP_PoliceDB_Commands =
[
	["Crime Records","RPP_PoliceDB_CrimeRecords"],
	["Submit Crime Record","RPP_PoliceDB_CrimeSubmit"],
	["License Plate look up","RPP_PoliceVehicleDB_Menu"],
	["Police CheckPoint Builder","RPP_CheckPoint_Setup"]
	//["Remote Open Police Gate","RPP_RemoteControl_PoliceGate"]
];
publicVariable "RPP_PoliceDB_Commands";

RPP_PoliceDB_Race =
[
	"White",
	"Black"
];
publicVariable "RPP_PoliceDB_Race";

RPP_Animation_list =
[	//Text,Anim,cmd
	["Normal","Normal","switchMove"],
	["Hands up","AmovPercMstpSnonWnonDnon_AmovPercMstpSsurWnonDnon","playmove"],
	["Play Dead","Helper_InjuredRfl","switchMove"]
];
publicVariable "RPP_Animation_list";


RPP_Electric_Errors =
[
	"Wires cut",
	"Burning",
	"Too hot",
	"Wires missing"
];
RPP_Electric_Error = [];
RPP_Electric_Log = [];
RPP_Electric_Status = "ACTIVE";
RPP_isElectric = true;
RPP_isElectric_Broken = false;
RPP_isElectric_off = false;
RPP_Reparing_Electric = false;

publicVariable "RPP_Reparing_Electric";
publicVariable "RPP_isElectric_off";
publicVariable "RPP_isElectric_Broken";
publicVariable "RPP_Electric_Error";
publicVariable "RPP_Electric_Errors";
publicVariable "RPP_isElectric";
publicVariable "RPP_Electric_Status";
publicVariable "RPP_Electric_Log";

RPP_isRobbingBank = false;
RPP_BankSafe1 = 5000;
RPP_BankMoneyadd = 1000;
RPP_BankMoneyadd_WaitTime = 220;

publicVariable "RPP_isRobbingBank";
publicVariable "RPP_BankSafe1";
publicVariable "RPP_BankMoneyadd";
publicVariable "RPP_BankMoneyadd_WaitTime";

RPP_BannedWords = 
[
"rp project","rpp","niggers","cunt","cunts","fuckers","fuck the police","police","police department","fire department","emt","ems","test","123","test123","test 123",
"Repentzfr3","rpproject","lol","lol123","123","pop","dick","dickhead","fuckhead","fuck you","i hate you","shit","fuck boy"
];

RPP_Login_allowedChar = "ABCDEFGHIJKLMNOPQRSTXYZÆØÅ1234567890";
publicVariable "RPP_Login_allowedChar";

RPP_Dealer_Market =
//classname
[
	"RPP_Bread",
	"RPP_Apple",
	"RPP_Gold",
	"RPP_Iron",
	"RPP_Diamond",
	"RPP_Donut",
	"RPP_Burger",
	"RPP_Water",
	"RPP_Redbull",
	"RPP_Cola",
	"RPP_RepairKit",
	"RPP_Medkit"
];

RPP_Dealer_Fish =
[
	"RPP_Salema",
	"RPP_Mackerel",
	"RPP_Tuna"
];

RPP_Dealer_Whale =
//classname
[
	"RPP_Whale"
];

RPP_Dealer_Dolphin =
//classname
[
	"RPP_Dolphin"
];

RPP_Dealer_Turtle =
//classname
[
	"RPP_Turtle"
];

RPP_Dealer_Drug =
[
	"RPP_LSD",
	"RPP_Herion",
	"RPP_Weed"
];
publicVariable "RPP_Dealer_Drug";

RPP_PDGateOpen = false;


publicVariable "RPP_PDGateOpen";
publicVariable "RPP_Dealer_Fish";
publicVariable "RPP_Dealer_Market";
publicVariable "RPP_Dealer_Whale";
publicVariable "RPP_Dealer_Dolphin";
publicVariable "RPP_isBankRobbed";
publicVariable "RPP_isBankBehingRobbed";
publicVariable "RPP_BankSafe1";
publicVariable "RPP_isServerSaving";
publicVariable "RPP_Company_List";
publicVariable "RPP_Company_Types";
publicVariable "RPP_Company_Ranks";
publicVariable "RPP_Company_PayChecks";
publicVariable "RPP_Company_Craft_Type";
publicVariable "RPP_Company_Craft_List";
publicVariable "RPP_BannedWords";


RPP_OnlineShopping_Type = 
[
	["GEAR"],
	["ITEM"],
	["VEHICLE"],
	["AIR"]
];
publicVariable "RPP_OnlineShopping_Type";

RPP_OnlineShopping_Shops =
[
	//ShopArray,ShopOwnerArray,Type,Delivery price
	["RPP_Shop_UserCars","RPP_Shop_UserCars_ShopOwner","VEHICLE",2500],
	["RPP_Shop_MediumCars","RPP_Shop_MediumCars_ShopOwner","VEHICLE",2500],
	["RPP_Shop_HighEnd","RPP_Shop_HighEnd_ShopOwner","VEHICLE",2500],
	["RPP_Shop_AirShop","RPP_Shop_AirShop_ShopOwner","AIR",6000]
];
publicVariable "RPP_OnlineShopping_Shops";

RPP_House_Array = [
	//Classname,price,Storage space
];
publicVariable "RPP_House_Array";