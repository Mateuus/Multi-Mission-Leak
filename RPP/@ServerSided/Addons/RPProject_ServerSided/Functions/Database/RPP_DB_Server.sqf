/*
Script File Author: Repentz
Script File Mod: Life Server
Script File: RPP_DB_Server.sqf

Description:
get the server data and return it back to the client
*/

["RPP_MySQL_Server_NewPlayerCheck", {
	private ["_player","_playerUID","_databasePull"];

	_player = _this select 0;
	_playerUID = getPlayerUID _player;

	_databasePull = "Arma2Net.Unmanaged" callExtension format["Arma2NETMySQLCommand ['RPProject_DB', 'SELECT EXISTS(SELECT RPP_UID FROM playerdata WHERE RPP_UID = '%1')']", _playerUID];
	[[_databasePull], "RPP_MySQL_Client_LoadNewPlayerCheck", _player] spawn BIS_fnc_MP;
}] call RPP_Function;
publicVariable "RPP_MySQL_Server_NewPlayerCheck";

["RPP_MySQL_Server_LoadStats", {
	private ["_player","_playerUID","_databasePull"];

	_player = _this select 0;
	_playerUID = getPlayerUID _player;
	
	_databasePull = "Arma2Net.Unmanaged" callExtension format["Arma2NETMySQLCommand ['RPProject_DB', 'SELECT 

	RPP_Cash,RPP_Bank,RPP_Inventory,RPP_License,RPP_Vehicle_Storage,RPP_Item_Storage,RPP_Hunger,RPP_Thirst,RPP_Weight,RPP_MaxWeight,
	RPP_AdminLevel,RPP_CopLevel,RPP_EMTLevel,RPP_IsCiv,RPP_IsCop,
	RPP_IsEMT,RPP_Skill_Vehicle,RPP_Skill_Crafting,RPP_Skill_Mining,RPP_Skill_Gathering,RPP_Skill_Fishing,RPP_JailTime_H,RPP_JailTime_M,
	RPP_JailTime_S,RPP_Jail_Pos,RPP_LoginSys_Username,RPP_DonatorLevel,
	RPP_Client_CurrentWeapon,RPP_Client_SecondaryWeapon,RPP_Client_Vest,RPP_Client_VestItem,
	RPP_Client_Backpack,RPP_Client_BackpackItem,RPP_Client_Uniform,
	RPP_Client_UniformItem,RPP_Client_WeaponMagazines,
	RPP_Client_CurrentWeapon_Police,RPP_Client_SecondaryWeapon_Police,
	RPP_Client_Vest_Police,RPP_Client_VestItem_Police,RPP_Client_Backpack_Police,RPP_Client_BackpackItem_Police,
	RPP_Client_Uniform_Police,RPP_Client_UniformItem_Police,
	RPP_Client_HeadGear_Police,RPP_Client_HeadGear

	FROM playerdata WHERE RPP_UID = '%1'']", _playerUID];

	[[_databasePull], "RPP_MySQL_Client_GetStats", _player] spawn BIS_fnc_MP;

	RPP_isServerSaving = false;
}] call RPP_Function;
publicVariable "RPP_MySQL_Server_LoadStats";


["RPP_MySQL_Server_CreateUser", {
	private ["_player","_PlayerUID"];
	_player = _this select 0;
	_RPP_Cash = _this select 1;
	_RPP_Bank = _this select 2;
	_RPP_Inventory = _this select 3;
	_RPP_License = _this select 4;
	_RPP_Vehicle_Storage = _this select 5;
	_RPP_Item_Storage = _this select 6;
	_RPP_Hunger = _this select 7;
	_RPP_Thirst = _this select 8;
	_RPP_Weight = _this select 9;
	_RPP_MaxWeight = _this select 10;
	_RPP_AdminLevel = _this select 11;
	_RPP_CopLevel = _this select 12;
	_RPP_EMTLevel = _this select 13;
	_RPP_IsCiv = _this select 14;
	_RPP_IsCop = _this select 15;
	_RPP_IsEMT = _this select 16;
	_RPP_Skill_Vehicle = _this select 17;
	_RPP_Skill_Crafting = _this select 18;
	_RPP_Skill_Mining = _this select 19;
	_RPP_Skill_Gathering = _this select 20;
	_RPP_Skill_Fishing = _this select 21;
	_RPP_JailTime_H = _this select 22;
	_RPP_JailTime_M = _this select 23;
	_RPP_JailTime_S = _this select 24;
	_RPP_Jail_Pos = _this select 25;
	_RPP_LoginSys_Username = _this select 26;
	_RPP_DonatorLevel = _this select 27;
	_RPP_Client_CurrentWeapon = _this select 28;
	_RPP_Client_SecondaryWeapon = _this select 29;
	_RPP_Client_Vest = _this select 30;
	_RPP_Client_VestItem = _this select 31;
	_RPP_Client_Backpack = _this select 32;
	_RPP_Client_BackpackItem = _this select 33;
	_RPP_Client_Uniform = _this select 34;
	_RPP_Client_UniformItem = _this select 35;
	_RPP_Client_WeaponMagazines = _this select 36;
	_RPP_Client_CurrentWeapon_Police = _this select 37;
	_RPP_Client_SecondaryWeapon_Police = _this select 38;
	_RPP_Client_Vest_Police = _this select 39;
	_RPP_Client_VestItem_Police = _this select 40;
	_RPP_Client_Backpack_Police = _this select 41;
	_RPP_Client_BackpackItem_Police = _this select 42;
	_RPP_Client_Uniform_Police = _this select 43;
	_RPP_Client_UniformItem_Police = _this select 44;
	_RPP_Client_HeadGear_Police = _this select 45;
	_RPP_Client_HeadGear = _this select 46;


	_PlayerUID = getPlayerUID _player;
	"Arma2Net.Unmanaged" callExtension format["Arma2NETMySQLCommand ['RPProject_DB', 'INSERT into playerdata 

(
RPP_UID,RPP_Cash,RPP_Bank,RPP_Inventory,RPP_License,RPP_Vehicle_Storage,RPP_Item_Storage,RPP_Hunger,RPP_Thirst,RPP_Weight,RPP_MaxWeight,
RPP_AdminLevel,RPP_CopLevel,RPP_EMTLevel,RPP_IsCiv,RPP_IsCop,
RPP_IsEMT,RPP_Skill_Vehicle,RPP_Skill_Crafting,RPP_Skill_Mining,RPP_Skill_Gathering,RPP_Skill_Fishing,RPP_JailTime_H,RPP_JailTime_M,
RPP_JailTime_S,RPP_Jail_Pos,RPP_LoginSys_Username,RPP_DonatorLevel,
RPP_Client_CurrentWeapon,RPP_Client_SecondaryWeapon,RPP_Client_Vest,RPP_Client_VestItem,
RPP_Client_Backpack,RPP_Client_BackpackItem,RPP_Client_Uniform,RPP_Client_UniformItem,RPP_Client_WeaponMagazines,
RPP_Client_CurrentWeapon_Police,RPP_Client_SecondaryWeapon_Police,
RPP_Client_Vest_Police,RPP_Client_VestItem_Police,RPP_Client_Backpack_Police,RPP_Client_BackpackItem_Police,
RPP_Client_Uniform_Police,RPP_Client_UniformItem_Police,
RPP_Client_HeadGear_Police,RPP_Client_HeadGear
) 

VALUES 

('%1','%2','%3','%4','%5','%6','%7','%8','%9','%10','%11','%12','%13','%14','%15','%16','%17','%18','%19','%20',
'%21','%22','%23','%24','%25','%26','%27','%28','%29','%30','%31','%32','%33','%34','%35','%36','%37','%38','%39',
'%40','%41','%42','%43','%44','%45','%46','%47')']",

_PlayerUID, _RPP_Cash,_RPP_Bank,_RPP_Inventory,_RPP_License,_RPP_Vehicle_Storage,_RPP_Item_Storage,_RPP_Hunger,_RPP_Thirst,_RPP_Weight,_RPP_MaxWeight,
_RPP_AdminLevel,_RPP_CopLevel,_RPP_EMTLevel,_RPP_IsCiv,_RPP_IsCop,
_RPP_IsEMT,_RPP_Skill_Vehicle,_RPP_Skill_Crafting,_RPP_Skill_Mining,_RPP_Skill_Gathering,_RPP_Skill_Fishing,_RPP_JailTime_H,_RPP_JailTime_M,
_RPP_JailTime_S,_RPP_Jail_Pos,_RPP_LoginSys_Username,_RPP_DonatorLevel,
_RPP_Client_CurrentWeapon,_RPP_Client_SecondaryWeapon,_RPP_Client_Vest,_RPP_Client_VestItem,
_RPP_Client_Backpack,_RPP_Client_BackpackItem,_RPP_Client_Uniform,
_RPP_Client_UniformItem,_RPP_Client_WeaponMagazines,
_RPP_Client_CurrentWeapon_Police,_RPP_Client_SecondaryWeapon_Police,
_RPP_Client_Vest_Police,_RPP_Client_VestItem_Police,_RPP_Client_Backpack_Police,_RPP_Client_BackpackItem_Police,
_RPP_Client_Uniform_Police,_RPP_Client_UniformItem_Police,
_RPP_Client_HeadGear_Police,_RPP_Client_HeadGear
];

	[[], "RPP_MySQL_Client_LoadStats", _player] spawn BIS_fnc_MP;
}] call RPP_Function;
publicVariable "RPP_MySQL_Server_CreateUser";

["RPP_MySQL_Server_SaveStats", {
	private ["_player","_playerUID","_databasePull","_statsSaved"];

	_player = _this select 0;
	_playerUID = getPlayerUID _player;
	if (_playerUID == "") exitWith {
		diag_log format ["Name player saving stats return error: %1 | %2 | UID (%3)",name _player,_player,_playerUID];
	};
	diag_log format ["Saving Stats: %1",_player];
	diag_log format ["Saving: %1",_playerUID];
	RPP_isServerSaving = true;

	_RPP_Cash = _this select 1;
	_RPP_Bank = _this select 2;
	_RPP_Inventory = [_this select 3] call RPP_ArrToSQL;
	_RPP_License = [_this select 4] call RPP_ArrToSQL;
	_RPP_Vehicle_Storage = [_this select 5] call RPP_ArrToSQL;
	_RPP_Item_Storage = [_this select 6] call RPP_ArrToSQL;
	_RPP_Hunger = _this select 7;
	_RPP_Thirst = _this select 8;
	_RPP_Weight = _this select 9;
	_RPP_MaxWeight = _this select 10;
	_RPP_AdminLevel = _this select 11;
	_RPP_CopLevel = _this select 12;
	_RPP_EMTLevel = _this select 13;
	_RPP_IsCiv = _this select 14;
	_RPP_IsCop = _this select 15;
	_RPP_IsEMT = _this select 16;
	_RPP_Skill_Vehicle = _this select 17;
	_RPP_Skill_Crafting = _this select 18;
	_RPP_Skill_Mining = _this select 19;
	_RPP_Skill_Gathering = _this select 20;
	_RPP_Skill_Fishing = _this select 21;
	_RPP_JailTime_H = _this select 22;
	_RPP_JailTime_M = _this select 23;
	_RPP_JailTime_S = _this select 24;
	_RPP_Jail_Pos = _this select 25;
	_RPP_LoginSys_Username = _this select 26;
	_RPP_DonatorLevel = _this select 27;
	_RPP_Client_CurrentWeapon = _this select 28;
	_RPP_Client_SecondaryWeapon = _this select 29;
	_RPP_Client_Vest = _this select 30;
	_RPP_Client_VestItem = [_this select 31] call RPP_ArrToSQL;
	_RPP_Client_Backpack = _this select 32;
	_RPP_Client_BackpackItem = [_this select 33] call RPP_ArrToSQL;
	_RPP_Client_Uniform = _this select 34;
	_RPP_Client_UniformItem = [_this select 35] call RPP_ArrToSQL;
	_RPP_Client_WeaponMagazines = _this select 36;
	_RPP_Client_CurrentWeapon_Police = _this select 37;
	_RPP_Client_SecondaryWeapon_Police = _this select 38;
	_RPP_Client_Vest_Police = _this select 39;
	_RPP_Client_VestItem_Police = [_this select 40] call RPP_ArrToSQL;
	_RPP_Client_Backpack_Police = _this select 41;
	_RPP_Client_BackpackItem_Police = [_this select 42] call RPP_ArrToSQL;
	_RPP_Client_Uniform_Police = _this select 43;
	_RPP_Client_UniformItem_Police = [_this select 44] call RPP_ArrToSQL;
	//_RPP_Client_WeaponMagazines_Police = _this select 45;
	_RPP_Client_HeadGear_Police = _This select 45;
	_RPP_Client_HeadGear = _this select 46;

	_statsSaved = false;

	_databasePull = "Arma2Net.Unmanaged" callExtension format["Arma2NETMySQLCommand ['RPProject_DB', 'UPDATE playerdata SET 

	RPP_Cash='%2',RPP_Bank='%3',RPP_Inventory='%4',RPP_License='%5',RPP_Vehicle_Storage='%6',RPP_Item_Storage='%7',RPP_Hunger='%8',
	RPP_Thirst='%9',RPP_Weight='%10',RPP_MaxWeight='%11',RPP_AdminLevel='%12',RPP_CopLevel='%13',RPP_EMTLevel='%14',RPP_IsCiv='%15',
	RPP_IsCop='%16',RPP_IsEMT='%17',RPP_Skill_Vehicle='%18',RPP_Skill_Crafting='%19',RPP_Skill_Mining='%20',RPP_Skill_Gathering='%21',
	RPP_Skill_Fishing='%22',RPP_JailTime_H='%23',RPP_JailTime_M='%24',RPP_JailTime_S='%25',RPP_Jail_Pos='%26',RPP_LoginSys_Username='%27',
	RPP_DonatorLevel='%28',RPP_Client_CurrentWeapon='%29',RPP_Client_SecondaryWeapon='%30',RPP_Client_Vest='%31',
	RPP_Client_VestItem='%32',RPP_Client_Backpack='%33',RPP_Client_BackpackItem='%34',RPP_Client_Uniform='%35',
	RPP_Client_UniformItem='%36',RPP_Client_WeaponMagazines='%37',
	RPP_Client_CurrentWeapon_Police='%38',RPP_Client_SecondaryWeapon_Police='%39',RPP_Client_Vest_Police='%40',RPP_Client_VestItem_Police='%41',
	RPP_Client_Backpack_Police='%42',RPP_Client_BackpackItem_Police='%43',RPP_Client_Uniform_Police='%44',RPP_Client_UniformItem_Police='%45',
	RPP_Client_HeadGear_Police='%46',RPP_Client_HeadGear='%47'


	WHERE RPP_UID = '%1' ']",
		_playerUID, _RPP_Cash,_RPP_Bank,_RPP_Inventory,_RPP_License,_RPP_Vehicle_Storage,_RPP_Item_Storage,_RPP_Hunger,_RPP_Thirst,_RPP_Weight,_RPP_MaxWeight,
		_RPP_AdminLevel,_RPP_CopLevel,_RPP_EMTLevel,_RPP_IsCiv,_RPP_IsCop,
		_RPP_IsEMT,_RPP_Skill_Vehicle,_RPP_Skill_Crafting,_RPP_Skill_Mining,_RPP_Skill_Gathering,_RPP_Skill_Fishing,_RPP_JailTime_H,_RPP_JailTime_M,
		_RPP_JailTime_S,_RPP_Jail_Pos,_RPP_LoginSys_Username,_RPP_DonatorLevel,
		_RPP_Client_CurrentWeapon,_RPP_Client_SecondaryWeapon,_RPP_Client_Vest,_RPP_Client_VestItem,
		_RPP_Client_Backpack,_RPP_Client_BackpackItem,_RPP_Client_Uniform,_RPP_Client_UniformItem,_RPP_Client_WeaponMagazines,
		_RPP_Client_CurrentWeapon_Police,_RPP_Client_SecondaryWeapon_Police,
		_RPP_Client_Vest_Police,_RPP_Client_VestItem_Police,_RPP_Client_Backpack_Police,_RPP_Client_BackpackItem_Police,
		_RPP_Client_Uniform_Police,_RPP_Client_UniformItem_Police,
		_RPP_Client_HeadGear_Police,_RPP_Client_HeadGear
	];

	_statsSaved = true; 

	diag_log format ["Stats Saved: %1 (%2)",_player,_playerUID];

	//[[_statsSaved], "RPP_MySQL_Client_SaveFinish", _player] spawn BIS_fnc_MP;


	RPP_isServerSaving = true;
}] call RPP_Function;
publicVariable "RPP_MySQL_Server_SaveStats";

