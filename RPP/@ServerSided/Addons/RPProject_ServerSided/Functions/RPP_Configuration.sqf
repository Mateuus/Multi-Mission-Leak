/*
Script File Author: Repentz
Script File Mod: Life Server
Script File: RPP_Configuration.sqf

Descriptionon and ect:
Configurati
*/
RPP_Variables = {
	RPP_ServerAddon_Version = 0.8;
	publicVariable "RPP_ServerAddon_Version";
	RPP_AddonVerify = false;

	/* Money/Bank Account */
	RPP_Cash = 0; //Save
	RPP_Bank = 7500; //Save
	RPP_Cash_Str = "";
	RPP_Bank_Str = "";
	RPP_CanUseATM = true;

	RPP_HomeCount = 0;

	/* Phone Cfg */
	RPP_PlaySound = false;
	RPP_Call_Cancel = true;
	RPP_Calling = false;
	RPP_Call = false;
	player setVariable ["RPP_Phone_BeingCalled",false,true];
	player setVariable ["RPP_Phone_Answear",false,true];
	player setVariable ["RPP_Phone_RingToneLive",false,true];
	RPP_Phone_1 = "";
	RPP_Phone_2 = "";
	RPP_Phone_3 = "";
	RPP_Phone_4 = "";
	RPP_Phone_5 = "";
	RPP_Phone_6 = "";
	RPP_Phone_7 = "";
	RPP_Phone_8 = "";
	RPP_PhoneNumber = "123";


	/* Revive system */
	RPP_Cfg_ReviveTimer_Min = 5;
	RPP_Cfg_ReviveTimer_Sec = 10;
	RPP_Cfg_ReviveCanSaveG = true;

	RPP_Plant_Harvesting = false;

	/* SERVER CFG */
	RPP_TaskForceRadio = false; //true if you want to make it so the clients must have taskforce radio on while playing.


	RPP_HarvestObj = [];

	/* Gang */
	RPP_GangLoad = false;
	RPP_GangCanCreate = true;
	RPP_GangDis = "";
	RPP_GangArea = "";
	RPP_GangName = "";

	RPP_Online_data_shop = "";
	RPP_Online_DeliveryPrice = 0;

	RPP_Pick = false;
	RPP_Action_Use = false;

	RPP_InGangName = "";

	/* Governor */
	RPP_isGovernor = false;
	RPP_Governor_CanVote = true;
	RPP_Governor_Votes = 0;
	player setVariable ["RPP_GovernorVotes",RPP_Governor_Votes,true];

	RPP_Delivery_Job = false;
	RPP_Delivery_Pay = 0;
	RPP_Delivery_place = "";

	/* Message System */
	RPP_Messages = [];
	RPP_White = "#F0F0F0";
	RPP_Red = "#bd0707";
	RPP_Blue = "#0033CC";
	RPP_Yellow = "#e0e72e";
	RPP_Black = "#303030";
	RPP_Green = "#009933";

	RPP_Job_Type = "";
	RPP_Repo_Towing = false;
	RPP_Repo_CarOn = false;

	RPP_Rifle_Holstered = "";
	RPP_Rifle_Holstered_Mag = "";

	RPP_PD_Interact = "";
	RPP_Ticket = 0;

	RPP_Process = false;

	CP_Building = false;
	CP_Place_Number = 0;
	CP_Forward_Number = 0;
	CP_Object_Placed = [];
	CP_Place_Number = 0;

	player setVariable ["RPP_LSD",true,true];
	player setVariable ["RPP_LSD_Amount",0,true];

	RPP_Evidence_Destroying = false;
	RPP_Evidence_Destroyed = false;
	RPP_EvidenceCreated = false;

	RPP_PatrolMission = false;
	RPP_PatrolMission_Pay = 0;

	/* AntiCheat */
	RPP_AntiCheat_Bypass = true;
	RPP_AntiCheat_AdminBypass = false;
	RPP_AntiCheat_Loaded = 0;

	RPP_UseItemAmount = 1;

	/* Login System */
	RPP_LoginSys_Username = name player; //Save
	RPP_LoginSys_Password = "Empty"; //Save
	RPP_LoginSys_DOB_D = "Empty"; //Save
	RPP_LoginSys_DOB_Y = "Empty"; //Save
	RPP_LoginSys_DOB_M = "Empty"; //Save
	RPP_LoginSys_IsNewPlayer = true; //Save

	//uid,name,reason,bounty,submitby
	RPP_WantedList = [];
	//uid,name,reason,submitby
	RPP_Crime = [];
	RPP_Server_Police_DB_Saving = false;
	RPP_Server_Vehicle_DB_Saving = false;
	RPP_PoliceDB_StatsLoaded = false;
	RPP_VehicleDB_StatsLoaded = false;
	RPP_Veh_VarSet = false;

	RPP_Vehicle_UID = "";
	RPP_Vehicle_Name = "";
	RPP_Vehicle_ID = "";
	RPP_Vehicle_Type = "";
	RPP_Vehicle_LicensePlate = "";
	RPP_VehicleDB_LicPlateFound = false;
	RPP_LicensePlate_NoFound = false;


	/* Paycheck */
	RPP_CivPaycheck = 165; //Save
	RPP_CopPaycheck = 900; //Save
	RPP_EMTPaycheck = 900; //Save

	RPP_Revoke_p = "";
	RPP_Search = [];

	RPP_isSeatBelt = false;

	RPP_Inventory = []; //Save
	RPP_License = []; //Save
	RPP_TrunkSelected = [];
	RPP_Vehicle_StorageInput = [];

	RPP_DBChecked = false;
	RPP_DB_User_Exist = "";
	RPP_StatsLoaded = false;
	RPP_Login_StatsLoaded = false;

	RPP_Shopping_Price = 0;
	RPP_ShopUsing = "";
	RPP_Shopping_Cart = [];
	RPP_ShopVar = "";
	RPP_ShopPrice = 0;
	RPP_ShopStock = 0;
	RPP_ShopCfg_Type = "";

	RPP_Admin_ShowFPS = false;

	RPP_ProjectLead_Array =
	[
		["76561198144044046","Repentz"]
	];

	RPP_Vehicle_Storage = []; //Save
	RPP_Item_Storage = []; //Save

	RPP_oldGear = [];

	RPP_Hunger = 100; //Save
	RPP_Thirst = 100; //Save
	RPP_Weight = 0; //Save
	RPP_MaxWeight = 100; //Save


	/* WHY IS THIS STILL HERE?????? */
	RPP_Client_CurrentWeapon_Police = []; //Save
	RPP_Client_SecondaryWeapon_Police = "Empty"; //Save
	RPP_Client_Vest_Police = "Empty"; //Save
	RPP_Client_VestItem_Police = []; //Save
	RPP_Client_Backpack_Police = "Empty"; //Save
	RPP_Client_BackpackItem_Police = []; //Save
	RPP_Client_Uniform_Police = "Empty"; //Save
	RPP_Client_UniformItem_Police = []; //Save
	RPP_Client_WeaponMagazines_Police = []; //Save
	RPP_Client_HeadGear_Police = "Empty";

	RPP_Client_CurrentWeapon = []; //Save
	RPP_Client_SecondaryWeapon = "Empty"; //Save
	RPP_Client_Vest = "Empty"; //Save
	RPP_Client_VestItem = []; //Save
	RPP_Client_Backpack = "Empty"; //Save
	RPP_Client_BackpackItem = []; //Save
	RPP_Client_Uniform = "Empty"; //Save
	RPP_Client_UniformItem = []; //Save
	RPP_Client_WeaponMagazines = []; //Save
	RPP_Client_HeadGear = "Empty";


	if (side player == west) then {
		RPP_Client_CurrentWeapon_Police = weapons player; //Save
		RPP_Client_SecondaryWeapon_Police = secondaryWeapon player; //Save
		RPP_Client_Vest_Police = vest player; //Save
		RPP_Client_VestItem_Police = vestItems player; //Save
		RPP_Client_Backpack_Police = backpack player; //Save
		RPP_Client_BackpackItem_Police = backpackItems player; //Save
		RPP_Client_Uniform_Police = uniform player; //Save
		RPP_Client_UniformItem_Police = uniformItems player; //Save
		RPP_Client_WeaponMagazines_Police = magazines player; //Save
		RPP_Client_HeadGear_Police = headgear player;

		if (RPP_Client_SecondaryWeapon_Police == "") then {
			RPP_Client_SecondaryWeapon_Police = "Empty";
		};
		if (RPP_Client_Vest_Police == "") then {
			RPP_Client_Vest_Police = "Empty";
		};
		if (RPP_Client_Backpack_Police == "") then {
			RPP_Client_Backpack_Police = "Empty";
		};
		if (RPP_Client_Uniform_Police == "") then {
			RPP_Client_Uniform_Police = "Empty";
		};
		if (RPP_Client_HeadGear_Police == "") then {
			RPP_Client_HeadGear_Police = "Empty";
		};
	} else {
		RPP_Client_CurrentWeapon = weapons player; //Save
		RPP_Client_SecondaryWeapon = secondaryWeapon player; //Save
		RPP_Client_Vest = vest player; //Save
		RPP_Client_VestItem = vestItems player; //Save
		RPP_Client_Backpack = backpack player; //Save
		RPP_Client_BackpackItem = backpackItems player; //Save
		RPP_Client_Uniform = uniform player; //Save
		RPP_Client_UniformItem = uniformItems player; //Save
		RPP_Client_WeaponMagazines = magazines player; //Save
		RPP_Client_HeadGear = headgear player;

		if (RPP_Client_SecondaryWeapon == "") then {
			RPP_Client_SecondaryWeapon = "Empty";
		};
		if (RPP_Client_Vest == "") then {
			RPP_Client_Vest = "Empty";
		};
		if (RPP_Client_Backpack == "") then {
			RPP_Client_Backpack = "Empty";
		};
		if (RPP_Client_Uniform == "") then {
			RPP_Client_Uniform = "Empty";
		};
		if (RPP_Client_HeadGear == "") then {
			RPP_Client_HeadGear = "Empty";
		};
	};

	RPP_NonlethalWeapons = ["Binocular", "NVGoggles", "ItemMap", "ItemCompass", "ItemRadio", "ItemWatch", "ItemGPS"];

	RPP_AdminLevel = 0; //Save
	RPP_CopLevel = 0; //Save
	RPP_EMTLevel = 0; //Save
	RPP_DonatorLevel = 0; //Save

	RPP_Group_Leader = "Empty"; //Save
	RPP_Group_MembersName = []; //Save
	RPP_Group_MembersUID = []; //Save
	RPP_Group_Name = "Empty"; //Save
	RPP_Group_AreaOwning = []; //Save

	RPP_PlayerAttached = "";
	RPP_Asker = "";
	RPP_Execute_Get = "";

	RPP_Query_inuse = false;
	RPP_Query_SavinginUse = false;
	publicVariable "RPP_Query_SavinginUse";
	publicVariable "RPP_Query_inuse";

	player setVariable ["RPP_Tased",false,true];
	player setVariable ["RPP_HandCuff",false,true];
	player setVariable ["RPP_CableCuff",false,true];
	player setVariable ["RPP_Escorting",false,true];
	player setVariable ["RPP_Handsup",false,true];
	player setVariable ["RPP_InJail",false,true]; //Save
	player setVariable ["RPP_JailEscape",false,true];

	player setVariable ["RPP_Revive",false,true];
	player setVariable ["RPP_Head",false,true];
	player setVariable ["RPP_LeftLeg",false,true];
	player setVariable ["RPP_RightLeg",false,true];
	player setVariable ["RPP_Shoulder",false,true];
	player setVariable ["RPP_RightArm",false,true];
	player setVariable ["RPP_LeftArm",false,true];
	player setVariable ["RPP_PenisHead",false,true];
	player setVariable ["RPP_Torso",false,true];

	player setVariable ["RPP_Civilian", true, true]; //Save
	player setVariable ["RPP_Police", false, true]; //Save
	player setVariable ["RPP_EMS", false, true]; //Save
	_Array = [];
	player setVariable ["RPP_Locker_Civ",_Array,true];
	player setVariable ["RPP_Locker_Cop",_Array,true];
	player setVariable ["RPP_Locker_EMS",_Array,true];


	player addEventHandler ["Respawn",{[_this select 1] call RPP_EMT_Die}];
	//player addEventHandler ["hitpart", {(_this select 0) call RPP_EMT_Hitpart}];
	player addEventHandler["handleDamage",{_this call RPP_Tased;}];
	player addEventHandler["Fired",{[_this select 0, _this select 1] call RPP_Evidence_Create;}];

	RPP_PaintBall_Ticket = false;
	RPP_Paintball_Picket_Weapon = false;
	RPP_Paintball_Picket_Mag = false;
	RPP_Paintball_Weaponusing = "";
	RPP_Paintball_Magusing = "";
	RPP_PaintBall_OldUniform = "";
	RPP_PaintBall_OldWeapon = "";
	player setVariable ["RPP_Paintball_Playing",false,true];
	player setVariable ["RPP_Paintball_ReadytoPlay",false,true];
	player setVariable ["RPP_Paintball_Host",false,true];
	player setVariable ["RPP_Paintball_OnTeamRed",false,true];
	player setVariable ["RPP_Paintball_OnTeamBlue",false,true];
	player setVariable ["RPP_Paintball_Gamemode","",true];
	player setVariable ["RPP_MethLab_Failed",false,true];

	RPP_IsCiv = false; //Save
	RPP_IsCop = false; //Save
	RPP_IsEMT = false; //Save

	RPP_Skill_Vehicle = 0; //Save
	RPP_Skill_Crafting = 0; //Save
	RPP_Skill_Mining = 0; //Save
	RPP_Skill_Gathering = 0; //Save
	RPP_Skill_Fishing = 0; //Save
	RPP_SkillMax = 100;

	RPP_JailTime_H = 0; //Save
	RPP_JailTime_M = 0; //Save
	RPP_JailTime_S = 0; //Save
	RPP_Jail_Pos = 0; //Save
	RPP_Jail_Dir = 0; //Save

	RPP_LoginSys_DOB_Days =
	[
		"1","2","3","4","5","6","7","8","9","10","11","12","13","14","15","16","17",
		"18","19","20","21","22","23","24","25","26","27","28","29","30","31"
	];
	RPP_LoginSys_DOB_Months =
	[
		"January",
		"February",
		"March",
		"April",
		"May",
		"June",
		"July",
		"August",
		"September",
		"October",
		"November",
		"December"
	];
	RPP_LoginSys_DOB_Years =
	[
		"1970","1971","1972","1973","1974","1975","1976","1977","1978","1979","1980","1981","1982","1983",
		"1984","1985","1986","1987","1988","1989","1990","1991","1992","1993","1994","1995","1996","1997","1998","1999",
		"2000","2001","2002","2003","2004","2005","2006","2007","2008","2009","2010","2011","2012","2013","2014","2015"
	];

	RPP_isArmed = {
		if (count (weapons player - RPP_NonlethalWeapons) > 0) then {true} else {false};
	};


	RPP_Company_Price = 0;
	//Owner,owner name, owner uid, company name, company type, company des, company slots, company workers
	RPP_Company_Settings = [];
	RPP_Company_Owning = false;
	//uid,name,rank
	RPP_Company_Workers = [];
	RPP_Company_Storage = [];
	RPP_Company_ApplyingFor = [];
	RPP_Company_Applications = [];
	RPP_Company_Applying = false;
	RPP_Company_Bank = 5000;
	RPP_CompanyLoaded = false;
	RPP_Company_MaxSlots = 10;
	RPP_Company_Slots = 1;

	RPP_DeadLoop_Start = false;

	RPP_MethLab_Placed = 0;
	RPP_MethLab_MaxPlace = 1; //max one because it may bug out with the variables
	RPP_MethLab_Placing = false;
	RPP_MethLab_Update = false;

	RPP_Vehicle_Active = 0;


	RPP_Server = 1;
};
publicVariable "RPP_Variables";

[] call RPP_Variables;
