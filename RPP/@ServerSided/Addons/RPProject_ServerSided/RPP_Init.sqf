#include "\RPProject_ServerSided\macros.hpp"
/*
Script File Author: Repentz
Script File Mod: Life Server
Script File: RPP_Init.sqf

Description:
Loading the server sided files and load them back to the client
*/
RPP_SRV_READY = false;
RPP_extDB_Error = "";
publicVariable "RPP_SRV_READY";

RPP_Server_init = {
	private ["_Functions","_folder","_sqf"];
	_Functions =
	[
		//Folder, Script file name
		//Init
		["","RPP_Configuration"],
		["","RPP_ClientSetup"],
		["","KRON_Strings"],

		//Server Core
		["Server_Core","RPP_S_Core"],
		["Server_Core","RPP_LIB"],

		//Admin
		["Admin","RPP_Admin"],

		//Database
		["Database","RPP_DB_Client"],
		["Database","RPP_DB_Server"],
		["Database","RPP_PoliceCrime_DB"],
		["Database","RPP_Vehicle_DB"],
		["Database","RPP_VehicleStorage_DB"],
		["Database","RPP_GangDB"],

		//Server
		["Server","RPP_Server_cfg"],
		["Server","RPP_Server_Loop"],

		//Login System
		["LoginSys","RPP_LoginSys"],
		["LoginSys","RPP_LoginSys_DB"],

		//Shop
		["Shop","RPP_Shop"],
		["Shop","RPP_Shop_Manager"],
		["Shop","RPP_OnlineShopping"],

		//Vehicle
		["Vehicle","RPP_VehicleMenu"],

		//Anti-Cheat
		["Anti-Cheat","RPP_AntiCheat"],

		//Config
		["Config","RPP_Config_Shop"],
		["Config","RPP_Config_Items"],
		["Config","RPP_Config_Vehicles"],

		//Action
		["Action","RPP_Server_Actions"],
		["Action","RPP_Client_Actions"],

		//Client
		["Client","RPP_PlayerInventory"],
		["Client","RPP_Taser"],
		["Client","RPP_Paintball"],
		["Client","RPP_Phone"],
		["Client","RPP_Animation"],
		["Client","RPP_PlayerInteracting"],
		["Client","RPP_Civ_Interact"],
		["Client","RPP_EMT_Interact"],
		["Client","RPP_Cop_Interact"],
		["Client","RPP_BankRobbery"],
		["Client","RPP_ATM"],
		["Client","RPP_Side_Markers"],
		["Client","RPP_Hud"],
		["Client","RPP_Starving"],
		["Client","RPP_OnKeyPress"],
		["Client","RPP_DMV"],
		["Client","RPP_PoliceDB"],
		["Client","RPP_Jail"],
		["Client","RPP_EL_Chair"],
		["Client","RPP_Storage"],
		["Client","RPP_PayCheck"],
		["Client","RPP_Checkpoint_Builder"],
		["Client","RPP_AddonVerify"],
		["Client","RPP_PostOffice"],
		["Client","RPP_CompanySystem"],
		["Client","RPP_Market_Dealer"],
		["Client","RPP_Evidence"],
		["Client","RPP_RemoteControl"],
		["Client","RPP_Electric"],
		["Client","RPP_Holster"],
		["Client","RPP_Goverment"],
		["Client","RPP_Gang"],
		["Client","RPP_Process"],
		//["Client","RPP_Siren"],

		//Items
		["Items","RPP_Item_Food"],
		["Items","RPP_Item_Drugs"],
		["Items","RPP_Item_Use"],
		["Items","RPP_Use_Seed"],
		["Items","RPP_Kit"],
		["Items","RPP_Lockpick"],
		["Items","RPP_CarJack"],

		//Jobs
		["Jobs","RPP_Pick_Apple"],
		["Jobs","RPP_Pick_Mining"],
		["Jobs","RPP_Fishing"],
		["Jobs","RPP_JobFinder"],
		["Jobs","RPP_Repo"],
		["Jobs","RPP_DeliveryMission"]
		//["Jobs","RPP_Truck_Mission"]
	];

	_Server_Functions =
	[
		["","RPP_LicensePlate"]
	];

	_folder = "";
	_sqf = "";


	diag_log "======================================";
	diag_log "======= RPProject_FW Loading. ========";
	diag_log "============ By: Repentz ============";
	diag_log "======================================";

	{
		_folder = _x select 0;
		_sqf = _x select 1;

		if (!(_folder == "")) then {
			[] execVM format ["\RPProject_ServerSided\Functions\%1\%2.sqf",_folder,_sqf];
		} else {
			[] execVM format ["\RPProject_ServerSided\Functions\%1.sqf",_sqf];
		};
	} foreach _Functions;

	{
		_folder = _x select 0;
		_sqf = _x select 1;

		if (!(_folder == "")) then {
			[] execVM format ["\RPProject_ServerSided\Server_Functions\%1\%2.sqf",_folder,_sqf];
		} else {
			[] execVM format ["\RPProject_ServerSided\Server_Functions\%1.sqf",_sqf];
		};
	} foreach _Server_Functions;

	diag_log "======================================";
	diag_log "======= RPProject_FW Loaded. ========";
	diag_log "============ By: Repentz ============";
	diag_log "======================================";
};
publicVariable "RPP_Server_init";

RPP_Client_init = {
	private ["_player"];
	_player = _this select 0;
	[] remoteExec ["RPP_Client_Load",_player];
};
publicVariable "RPP_Client_init";

RPP_Function = {
	private ["_name","_Content","_Private"];
	_Name = [_this, 0] call BIS_fnc_param;
	_Content = [_this, 1] call BIS_fnc_param;
	_Private = [_this, 2, false] call BIS_fnc_param;

	call compile format ["%1 = %2;", _Name, _Content];

	if(!_Private) then { publicVariable _Name; };
};
publicVariable "RPP_Function";

[] call RPP_Server_init;