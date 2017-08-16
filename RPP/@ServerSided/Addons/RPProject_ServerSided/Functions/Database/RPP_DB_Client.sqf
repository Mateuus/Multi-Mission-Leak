/*
Script File Author: Repentz
Script File Mod: Life Server
Script File: RPP_DB_Client.sqf

Description:
Client side for db requests
*/
["RPP_MySQL_Client_NewPlayerCheck", {
	[[player], "RPP_MySQL_Server_NewPlayerCheck", false] spawn BIS_fnc_MP;
}] call RPP_Function;
publicVariable "RPP_MySQL_Client_NewPlayerCheck";

["RPP_MySQL_Client_LoadNewPlayerCheck", {
	private ["_return"];
	_return = _this select 0;
	_return = call compile _return;
	_return = (_return select 0) select 0;
	
	RPP_DB_User_Exist = _return;
	//systemChat format ["Debug: %1",RPP_DB_User_Exist];

	if ("0" in RPP_DB_User_Exist) then {
		RPP_DBChecked = true;
		[] call RPP_MySQL_Client_CreateNewUser;
	}
	else
	{
		RPP_DBChecked = true;
		[] call RPP_MySQL_Client_LoadStats;
	};
}] call RPP_Function;
publicVariable "RPP_MySQL_Client_LoadNewPlayerCheck";

["RPP_MySQL_Client_LoadStats", {
	[[player], "RPP_MySQL_Server_LoadStats", false] spawn BIS_fnc_MP;
}] call RPP_Function;
publicVariable "RPP_MySQL_Client_LoadStats";

["RPP_MySQL_Client_CreateNewUser", {
	[[player,RPP_Cash,RPP_Bank,RPP_Inventory,RPP_License,RPP_Vehicle_Storage,RPP_Item_Storage,RPP_Hunger,RPP_Thirst,RPP_Weight,RPP_MaxWeight,
	RPP_AdminLevel,RPP_CopLevel,RPP_EMTLevel,RPP_IsCiv,RPP_IsCop,
RPP_IsEMT,RPP_Skill_Vehicle,RPP_Skill_Crafting,RPP_Skill_Mining,RPP_Skill_Gathering,RPP_Skill_Fishing,RPP_JailTime_H,RPP_JailTime_M,
RPP_JailTime_S,RPP_Jail_Pos,name player,RPP_DonatorLevel,RPP_Client_CurrentWeapon,RPP_Client_SecondaryWeapon,
RPP_Client_Vest,RPP_Client_VestItem,RPP_Client_Backpack,RPP_Client_BackpackItem,RPP_Client_Uniform,RPP_Client_UniformItem,
RPP_Client_WeaponMagazines,
RPP_Client_CurrentWeapon_Police,RPP_Client_SecondaryWeapon_Police,
RPP_Client_Vest_Police,RPP_Client_VestItem_Police,RPP_Client_Backpack_Police,RPP_Client_BackpackItem_Police,
RPP_Client_Uniform_Police,RPP_Client_UniformItem_Police,RPP_Client_HeadGear_Police,RPP_Client_HeadGear], "RPP_MySQL_Server_CreateUser", false] call BIS_fnc_MP;
}] call RPP_Function;
publicVariable "RPP_MySQL_Client_CreateNewUser";

["RPP_MySQL_Client_GetStats", {
	private ["_return"];

	_return = _this select 0;
	//systemChat format ["Debug: %1",_return];
	_return = call compile _return;
	_return = (_return select 0) select 0;

	//systemChat format ["Debug: %1",_return];
	_log = format ["Debug Stats on %1 (%2): %3",name player,getPlayerUID player,_return];
	[_log] call RPP_Server_Log;

	[_return] call RPP_MySQL_Client_SetStats;
}] call RPP_Function;
publicVariable "RPP_MySQL_Client_GetStats";

["RPP_MySQL_Client_SetStats", {
	private ["_statsArray"];
	_statsArray = _this select 0;

	_RPP_Cash = _statsArray select 0;
	_RPP_Bank = _statsArray select 1;
	_RPP_Inventory = _statsArray select 2;
	_RPP_License = _statsArray select 3;
	_RPP_Vehicle_Storage = _statsArray select 4;
	_RPP_Item_Storage = _statsArray select 5;
	_RPP_Hunger = _statsArray select 6;
	_RPP_Thirst = _statsArray select 7;
	_RPP_Weight = _statsArray select 8;
	_RPP_MaxWeight = _statsArray select 9;
	_RPP_AdminLevel = _statsArray select 10;
	_RPP_CopLevel = _statsArray select 11;
	_RPP_EMTLevel = _statsArray select 12;
	_RPP_IsCiv = _statsArray select 13;
	_RPP_IsCop = _statsArray select 14;
	_RPP_IsEMT = _statsArray select 15;
	_RPP_Skill_Vehicle = _statsArray select 16;
	_RPP_Skill_Crafting = _statsArray select 17;
	_RPP_Skill_Mining = _statsArray select 18;
	_RPP_Skill_Gathering = _statsArray select 19;
	_RPP_Skill_Fishing = _statsArray select 20;
	_RPP_JailTime_H = _statsArray select 21;
	_RPP_JailTime_M = _statsArray select 22;
	_RPP_JailTime_S = _statsArray select 23;
	_RPP_Jail_Pos = _statsArray select 24;
	_RPP_LoginSys_Username = _statsArray select 25;
	_RPP_DonatorLevel = _statsArray select 26;
	_RPP_Client_CurrentWeapon = _statsArray select 27;
	_RPP_Client_SecondaryWeapon = _statsArray select 28;
	_RPP_Client_Vest = _statsArray select 29;
	_RPP_Client_VestItem = _statsArray select 30;
	_RPP_Client_Backpack = _statsArray select 31;
	_RPP_Client_BackpackItem = _statsArray select 32;
	_RPP_Client_Uniform = _statsArray select 33;
	_RPP_Client_UniformItem = _statsArray select 34;
	_RPP_Client_WeaponMagazines = _statsArray select 35;
	_RPP_Client_CurrentWeapon_Police = _statsArray select 36;
	_RPP_Client_SecondaryWeapon_Police = _statsArray select 37;
	_RPP_Client_Vest_Police = _statsArray select 38;
	_RPP_Client_VestItem_Police = _statsArray select 39;
	_RPP_Client_Backpack_Police = _statsArray select 40;
	_RPP_Client_BackpackItem_Police = _statsArray select 41;
	_RPP_Client_Uniform_Police = _statsArray select 42;
	_RPP_Client_UniformItem_Police = _statsArray select 43;
	//_RPP_Client_WeaponMagazines_Police = _statsArray select 44;
	_RPP_Client_HeadGear_Police = _statsArray select 44;
	_RPP_Client_HeadGear = _statsArray select 45;


	RPP_Cash = call compile (_RPP_Cash);
	RPP_Bank = call compile (_RPP_Bank);
	RPP_Inventory = [_RPP_Inventory] call RPP_SQLToArr;
	RPP_License = [_RPP_License] call RPP_SQLToArr;
	RPP_Vehicle_Storage = [_RPP_Vehicle_Storage] call RPP_SQLToArr;
	RPP_Item_Storage = [_RPP_Item_Storage] call RPP_SQLToArr;
	RPP_Hunger = call compile (_RPP_Hunger);
	RPP_Thirst = call compile (_RPP_Thirst);
	RPP_Weight = call compile (_RPP_Weight);
	RPP_MaxWeight = call compile (_RPP_MaxWeight);
	RPP_AdminLevel = call compile (_RPP_AdminLevel);
	RPP_CopLevel = call compile (_RPP_CopLevel);
	RPP_EMTLevel = call compile (_RPP_EMTLevel);
	RPP_IsCiv = call compile (_RPP_IsCiv);
	RPP_IsCop = call compile (_RPP_IsCop);
	RPP_IsEMT = call compile (_RPP_IsEMT);
	RPP_Skill_Vehicle = call compile (_RPP_Skill_Vehicle);
	RPP_Skill_Crafting = call compile (_RPP_Skill_Crafting);
	RPP_Skill_Mining = call compile (_RPP_Skill_Mining);
	RPP_Skill_Gathering = call compile (_RPP_Skill_Gathering);
	RPP_Skill_Fishing = call compile (_RPP_Skill_Fishing);
	RPP_JailTime_H = call compile (_RPP_JailTime_H);
	RPP_JailTime_M = call compile (_RPP_JailTime_M);
	RPP_JailTime_S = call compile (_RPP_JailTime_S);
	RPP_Jail_Pos = call compile (_RPP_Jail_Pos);
	RPP_LoginSys_Username = _RPP_LoginSys_Username;
	RPP_DonatorLevel = call compile (_RPP_DonatorLevel);
	RPP_Client_CurrentWeapon = [_RPP_Client_CurrentWeapon] call RPP_SQLToArr;
	RPP_Client_SecondaryWeapon = _RPP_Client_SecondaryWeapon;
	RPP_Client_Vest = _RPP_Client_Vest;
	RPP_Client_VestItem = [_RPP_Client_VestItem] call RPP_SQLToArr;
	RPP_Client_Backpack = _RPP_Client_Backpack;
	RPP_Client_BackpackItem = [_RPP_Client_BackpackItem] call RPP_SQLToArr;
	RPP_Client_Uniform = _RPP_Client_Uniform;
	RPP_Client_UniformItem = [_RPP_Client_UniformItem] call RPP_SQLToArr;
	RPP_Client_WeaponMagazines = [_RPP_Client_WeaponMagazines] call RPP_SQLToArr;
	RPP_Client_HeadGear_Police = _RPP_Client_HeadGear_Police;

	RPP_Client_CurrentWeapon_Police = [_RPP_Client_CurrentWeapon_Police] call RPP_SQLToArr;
	RPP_Client_SecondaryWeapon_Police = _RPP_Client_SecondaryWeapon_Police;
	RPP_Client_Vest_Police = _RPP_Client_Vest_Police;
	RPP_Client_VestItem_Police = [_RPP_Client_VestItem_Police] call RPP_SQLToArr;
	RPP_Client_Backpack_Police = _RPP_Client_Backpack_Police;
	RPP_Client_BackpackItem_Police = [_RPP_Client_BackpackItem_Police] call RPP_SQLToArr;
	RPP_Client_Uniform_Police = _RPP_Client_Uniform_Police;
	RPP_Client_UniformItem_Police = [_RPP_Client_UniformItem_Police] call RPP_SQLToArr;
	//RPP_Client_WeaponMagazines_Police = [_RPP_Client_WeaponMagazines_Police] call RPP_SQLToArr;
	RPP_Client_HeadGear = _RPP_Client_HeadGear;


	if (typeName RPP_Inventory == "STRING") then {RPP_Inventory = call compile RPP_Inventory};
	if (typeName RPP_License == "STRING") then {RPP_License = call compile RPP_License};
	if (typeName RPP_Vehicle_Storage == "STRING") then {RPP_Vehicle_Storage = call compile RPP_Vehicle_Storage};
	if (typeName RPP_Item_Storage == "STRING") then {RPP_Item_Storage = call compile RPP_Item_Storage};
	if (typeName RPP_Client_UniformItem_Police == "STRING") then {RPP_Client_UniformItem_Police = call compile RPP_Client_UniformItem_Police};
	if (typeName RPP_Client_BackpackItem_Police == "STRING") then {RPP_Client_BackpackItem_Police = call compile RPP_Client_BackpackItem_Police};
	if (typeName RPP_Client_VestItem_Police == "STRING") then {RPP_Client_VestItem_Police = call compile RPP_Client_VestItem_Police};
	if (typeName RPP_Client_CurrentWeapon_Police == "STRING") then {RPP_Client_CurrentWeapon_Police = call compile RPP_Client_CurrentWeapon_Police};
	//if (typeName RPP_Client_WeaponMagazines_Police == "STRING") then {RPP_Client_WeaponMagazines_Police = call compile RPP_Client_WeaponMagazines_Police};
	if (typeName RPP_Client_UniformItem == "STRING") then {RPP_Client_UniformItem = call compile RPP_Client_UniformItem};
	if (typeName RPP_Client_BackpackItem == "STRING") then {RPP_Client_BackpackItem = call compile RPP_Client_BackpackItem};
	if (typeName RPP_Client_VestItem == "STRING") then {RPP_Client_VestItem = call compile RPP_Client_VestItem};
	if (typeName RPP_Client_CurrentWeapon == "STRING") then {RPP_Client_CurrentWeapon = call compile RPP_Client_CurrentWeapon};
	//if (typeName RPP_Client_WeaponMagazines == "STRING") then {RPP_Client_WeaponMagazines = call compile RPP_Client_WeaponMagazines};

	RPP_StatsLoaded = true;
}] call RPP_Function;
publicVariable "RPP_MySQL_Client_SetStats";

["RPP_MySQL_Client_SendStats", {
	[] spawn {
		sleep 1;
		RPP_StatsLoaded = false;
		if (side player == west) then {
			RPP_Client_SecondaryWeapon_Police = secondaryWeapon player;
			RPP_Client_Vest_Police = vest player;
			RPP_Client_Backpack_Police = backpack player;
			RPP_Client_Uniform_Police = uniform player;
			RPP_Client_WeaponMagazines_Police = magazines player;
			RPP_Client_HeadGear_Police = headgear player;

			RPP_Client_CurrentWeapon_Police = [];
			RPP_Client_VestItem_Police = [];
			RPP_Client_BackpackItem_Police = [];
			RPP_Client_UniformItem_Police = [];


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

			{
				RPP_Client_BackpackItem_Police = RPP_Client_BackpackItem_Police + [_x];
			} foreach backpackItems player;
			{
				RPP_Client_UniformItem_Police = RPP_Client_UniformItem_Police + [_x];
			} foreach uniformItems player;
			{
				RPP_Client_CurrentWeapon_Police = RPP_Client_CurrentWeapon_Police + [_x];
			} foreach weapons player;
		};
		if (side player == civilian) then {
			RPP_Client_SecondaryWeapon = secondaryWeapon player;
			RPP_Client_Vest = vest player;
			RPP_Client_Backpack = backpack player;
			RPP_Client_Uniform = uniform player;
			RPP_Client_WeaponMagazines = magazines player;
			RPP_Client_HeadGear = headgear player;

			RPP_Client_CurrentWeapon = [];
			RPP_Client_VestItem = [];
			RPP_Client_BackpackItem = [];
			RPP_Client_UniformItem = [];

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

			{
				RPP_Client_BackpackItem = RPP_Client_BackpackItem + [_x];
			} foreach backpackItems player;
			{
				RPP_Client_UniformItem = RPP_Client_UniformItem + [_x];
			} foreach uniformItems player;
			{
				RPP_Client_CurrentWeapon = RPP_Client_CurrentWeapon + [_x];
			} foreach weapons player;
		};

		if (side player == independent) then {
			RPP_Client_SecondaryWeapon = secondaryWeapon player;
			RPP_Client_Vest = vest player;
			RPP_Client_Backpack = backpack player;
			RPP_Client_Uniform = uniform player;
			RPP_Client_WeaponMagazines = magazines player;
			RPP_Client_HeadGear = headgear player;

			RPP_Client_CurrentWeapon = [];
			RPP_Client_VestItem = [];
			RPP_Client_BackpackItem = [];
			RPP_Client_UniformItem = [];

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

			{
				RPP_Client_BackpackItem = RPP_Client_BackpackItem + [_x];
			} foreach backpackItems player;
			{
				RPP_Client_UniformItem = RPP_Client_UniformItem + [_x];
			} foreach uniformItems player;
			{
				RPP_Client_CurrentWeapon = RPP_Client_CurrentWeapon + [_x];
			} foreach weapons player;
		};

		[[player,RPP_Cash,RPP_Bank,RPP_Inventory,RPP_License,RPP_Vehicle_Storage,RPP_Item_Storage,RPP_Hunger,RPP_Thirst,RPP_Weight,RPP_MaxWeight,
			RPP_AdminLevel,RPP_CopLevel,RPP_EMTLevel,RPP_IsCiv,RPP_IsCop,
			RPP_IsEMT,RPP_Skill_Vehicle,RPP_Skill_Crafting,RPP_Skill_Mining,RPP_Skill_Gathering,RPP_Skill_Fishing,RPP_JailTime_H,RPP_JailTime_M,
			RPP_JailTime_S,RPP_Jail_Pos,name player,RPP_DonatorLevel,
			RPP_Client_CurrentWeapon,RPP_Client_SecondaryWeapon,RPP_Client_Vest,RPP_Client_VestItem,
			RPP_Client_Backpack,RPP_Client_BackpackItem,RPP_Client_Uniform,RPP_Client_UniformItem,RPP_Client_WeaponMagazines,
			RPP_Client_CurrentWeapon_Police,RPP_Client_SecondaryWeapon_Police,
			RPP_Client_Vest_Police,RPP_Client_VestItem_Police,RPP_Client_Backpack_Police,RPP_Client_BackpackItem_Police,
			RPP_Client_Uniform_Police,RPP_Client_UniformItem_Police,/*RPP_Client_WeaponMagazines_Police*/RPP_Client_HeadGear_Police,RPP_Client_HeadGear
		],"RPP_MySQL_Server_SaveStats", false] spawn BIS_fnc_MP;
	};
}] call RPP_Function;
publicVariable "RPP_MySQL_Client_SendStats";

["RPP_MySQL_Client_SaveCheck", {
	private ["_statsSaved"];
	_statsSaved = _this;
	[] call RPP_MySQL_Client_NewPlayerCheck;

}] call RPP_Function;
publicVariable "RPP_MySQL_Client_SaveCheck";

["RPP_MySQL_Client_SaveFinish", {
	[] call RPP_MySQL_Client_LoadStats;
	RPP_StatsLoaded = true;
}] call RPP_Function;
publicVariable "RPP_MySQL_Client_SaveFinish";
