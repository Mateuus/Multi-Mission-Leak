/*
Script File Author: Repentz
Script File Mod: Life Server
Script File: RPP_CompanySystem.sqf

Description:
Company system
*/
["RPP_CompanySystem_MainMenu", {
	private ["_OwnerName","_CName","_CType","_CMaxSlots","_CSlotsused","_CDes","_data"];
	closeDialog 1;
	createDialog "RPP_Company_Main";

	lbAdd [1500, "OWNER  |  NAME  |  TYPE  |  SLOTS  |  DESCRIPTION"];
	lbAdd [1500, ""];
	{
		_OwnerName = _x select 0;
		_CName = _x select 1;
		_CType = _x select 2;
		_CMaxSlots = _x select 3;
		_CSlotsused = _x select 4;
		_CDes = _x select 5;
		_Data = lbAdd [1500, format ["%1 | %2 | %3 | %4/%5 | %6",_OwnerName,_CName,_CType,_CSlotsused,_CMaxSlots,_CDes]];
		lbSetData [1500, _Data, _CName];
	} foreach RPP_Company_List;

	buttonSetAction [1600, "[] call RPP_CompanySystem_Application_Menu;"];
	buttonSetAction [1601, "[] call RPP_CompanySystem_Create;"];
	buttonSetAction [1602, "[] call RPP_CompanySystem_Delete;"];
}] call RPP_Function;
publicVariable "RPP_CompanySystem_MainMenu";

["RPP_CompanySystem_ManagerMenu", {
	if (!(RPP_Company_Owning)) exitWith {
		_msg = "You don't own a Company";
		_color = RPP_Red;
		[_msg,_color] call RPP_MessageSystem;
	};
	closeDialog 1;
	createDialog "RPP_Company_Manager";

	////////////////////////////////////////////////
	//Paycheck
	{
		_name = _x select 1;
		_paycheck = _x select 3;
		_Data1 = lbAdd [2100, format ["%1 ($%2)",_name,_paycheck]];
		lbSetData [2100, _Data1, _x];
	} foreach RPP_Company_Workers;
	{
		_Data2 = lbAdd [2101, format ["$%1",_x]];
		lbSetData [2101, _Data2, _x];
	} foreach RPP_Company_PayChecks;

	/////////////////////////////////////////////////
	//Posision
	{
		_name = _x select 1;
		_rank = _x select 2;
		_Data3 = lbAdd [2102, format ["%1 (%2)",_name,_rank]];
		lbSetData [2102, _Data3, _x];
	} foreach RPP_Company_Workers;
	{
		_rank = _x select 0;
		_Data4 = lbAdd [2103, format ["%1",_rank]];
		lbSetData [2103, _Data4, _rank];
	} foreach RPP_Company_Ranks;

	/////////////////////////////////////////////////
	//Workers
	{
		_name = _x select 1;
		_rank = _x select 2;
		lbAdd [1501, format ["%1 (%2)",_name,_rank]];
	} foreach RPP_Company_Workers;

	/////////////////////////////////////////////////
	//Storage
	if (!(RPP_Company_Bank <= 0)) then {
		_Data_Bank = lbAdd [1503, format ["Company Bank: $%1",RPP_Company_Bank]];
		lbSetData [1503, _Data_Bank, "CBank"];
	};
	{
		_item = _x select 0;
		_itemAmount = [_x select 0] call RPP_CompanySystem_Count;
		_data_Storage = lbAdd [1503, format ["%1 (x%2)",_item,_itemAmount]];
		lbSetData [1503, _data_Storage, _item];
	} foreach RPP_Company_Storage;

	////////////////////////////////////////////////
	//Player Inventory
	{	
		_item = _x select 0;
		_itemAmount = [_x select 0] call RPP_Inventory_Count;
		_data_inv = lbAdd [1502, format ["%1 (x%2)",_item,_itemAmount]];
		lbSetData [1502, _data_inv, _item];
	} foreach RPP_Inventory;

	buttonSetAction [1609, "[] call RPP_CompanySystem_ManageApplication_Menu;"];
	buttonSetAction [1602, "[] call RPP_CompanySystem_Storage_Add;"];
	buttonSetAction [1606, "[] call RPP_CompanySystem_Storage_Take;"];
	buttonSetAction [1601, "[] call RPP_CompanySystem_Fire;"];
	buttonSetAction [1603, "[] call RPP_CompanySystem_Save_Paycheck;"];
	buttonSetAction [1604, "[] call RPP_CompanySystem_Save_Rank;"];
}] call RPP_Function;
publicVariable "RPP_CompanySystem_ManagerMenu";

["RPP_CompanySystem_ManageApplication_Menu", {
	closeDialog 1;
	createDialog "RPP_Company_ManageApplication";
	buttonSetAction [1600, "[] call RPP_CompanySystem_ManageApplication_GetDetails;"];
	buttonSetAction [1601, "[] call RPP_CompanySystem_ManageApplication_Accept;"];
	buttonSetAction [1602, "[] call RPP_CompanySystem_ManageApplication_Reject;"];

	{
		_Name = _x select 0;
		_UIDP = _x select 1;
		lbAdd [2100, format ["%1 (%2)",_Name,_UIDP]];
	} foreach RPP_Company_Applications;

	lbAdd [1500, "==== Application Details ===="];
}] call RPP_Function;
publicVariable "RPP_CompanySystem_ManageApplication_Menu";

["RPP_CompanySystem_PayCheck_Loop", {
	[] spawn {
		private ["_UID","_OwnerID","_Paycheck","_Player","_1","_2","_Company"];
		if (!(RPP_Company_Owning)) exitWith {};
		while {RPP_Company_Owning} do {
			sleep 600;
			_UID = "";
			_OwnerID = getPlayerUID player;
			_Paycheck = 0;
			_Player = "";
			_1 = false;
			_2 = false;
			_Company = RPP_Company_Settings select 3;

			{
				_UID = _x select 0;
				{
					if (_UID == _x select 0) then {
						_Paycheck = _x select 3;
						_1 = true;
					};
				} count RPP_Company_Workers;

				waituntil{_1};

				{
					if (getPlayerUID _x == _UID) then {
						_Player = _x;
						_2 = true;
					};
				} count playableUnits;

				waituntil{_2};			

				if (!(RPP_Company_Bank >= call compile format ["%1",_Paycheck])) exitWith {
					_msg = "You Failed to send out a paycheck because your company don't have the money for it, please lower there paycheck or make some money!";
					_color = RPP_Red;
					[_msg,_Color] call RPP_MessageSystem;
				};
				
				call compile format ["RPP_Company_Bank = RPP_Company_Bank - %1",_Paycheck];
				call compile (_Paycheck);
				[[_Paycheck,_Company], "RPP_CompanySystem_Paycheck_Give", _Player] call BIS_FNC_MP;

			} foreach RPP_Company_Workers;
		};
	};
}] call RPP_Function;
publicVariable "RPP_CompanySystem_PayCheck_Loop";

["RPP_CompanySystem_Paycheck_Give", {
	private ["_Paycheck","_Company"];
	_Paycheck = call compile(_This select 0);
	_Company = _This select 1;
	[_Paycheck] call RPP_AntiCheat_AddBank;

	_msg = format ["You received a paycheck of $%1 from %2",_paycheck,_Company];
	_color = RPP_Green;
	[_msg,_Color] call RPP_MessageSystem;
}] call RPP_Function;
publicVariable "RPP_CompanySystem_Paycheck_Give";

["RPP_CompanySystem_Save_Rank", {
	private ["_Rank","_Array1","_Array2","_Rankadd","_Canadd","_UID","_Name","_Rank","_Paycheck"];
	if (lbCurSel 2102 == -1) exitWith {
		_msg = "Please select a player first!";
		_color = RPP_Red;
		[_msg,_color] call RPP_MessageSystem;
	};
	if (lbCurSel 2103 == -1) exitWith {
		_msg = "Please select the rank that you want to change to!";
		_color = RPP_Red;
		[_msg,_color] call RPP_MessageSystem;
	};
	_Rank = lbData [ 2103, ( lbCurSel 2103 ) ];
	if (_Rank == "") exitWith {
		systemChat "Error: 2103"; // Can we have description or comment
	};
	_Array1 = RPP_Company_Ranks select (lbCurSel 2103);
	_Array2 = RPP_Company_Workers select (lbCurSel 2102);

	_Rankadd = _Array1 select 0;
	_Canadd = _Array1 select 1;

	_UID = _Array2 select 0;
	_Name = _Array2 select 1;
	_Rank = _Array2 select 2;
	_paycheck = _Array2 select 3;

	if (!(_Canadd)) exitWith {
		_msg = "You are not able to give him this rank!";
		_color = RPP_Red;
		[_msg,_color] call RPP_MessageSystem;
	};
	if (_UID == getPlayerUID player) exitWith {
		_msg = "You are not able to change your own rank!";
		_color = RPP_Red;
		[_msg,_color] call RPP_MessageSystem;
	};
	if (_Rank == _Rankadd) exitWith {
		_msg = "He already got this rank!";
		_color = RPP_Red;
		[_msg,_color] call RPP_MessageSystem;
	};

	RPP_Company_Workers = RPP_Company_Workers - [_Array2];
	RPP_Company_Workers = RPP_Company_Workers + [ [_UID,_Name,_Rankadd,_paycheck] ];

	[] call RPP_CompanySystem_ManagerMenu;

	_msg = format ["Successfully change %1's rank to %2",_Name,_Rankadd];
	_color = RPP_Green;
	[_msg,_color] call RPP_MessageSystem;
}] call RPP_Function;
publicVariable "RPP_CompanySystem_Save_Rank";

["RPP_CompanySystem_Save_Paycheck", {
	private ["_PaycheckAdd","_Array","_UID","_Name","_Rank","_Paycheck"];
	if (lbCurSel 2100 == -1) exitWith {
		_msg = "Please select a player first!";
		_color = RPP_Red;
		[_msg,_color] call RPP_MessageSystem;
	};
	if (lbCurSel 2101 == -1) exitWith {
		_msg = "Please select paycheck that you want to change to!";
		_color = RPP_Red;
		[_msg,_color] call RPP_MessageSystem;
	};
	_PaycheckAdd = lbData [ 2101, ( lbCurSel 2101 ) ];
	if (_PaycheckAdd == "") exitWith {
		systemChat "Error: 2103";
	};
	_Array = RPP_Company_Workers select (lbCurSel 2100);
	_UID = _Array select 0;
	_Name = _Array select 1;
	_Rank = _Array select 2;
	_paycheck = _Array select 3;

	call compile (_PaycheckAdd);

	systemChat format ["Test: %1 %2",_Paycheck,_PaycheckAdd];

	RPP_Company_Workers = RPP_Company_Workers - [_Array];
	RPP_Company_Workers = RPP_Company_Workers + [ [_UID,_Name,_Rank,_PaycheckAdd] ];

	[] call RPP_CompanySystem_ManagerMenu;

	_msg = format ["Successfully change %1's Paycheck to $%2",_Name,_PaycheckAdd];
	_color = RPP_Green;
	[_msg,_color] call RPP_MessageSystem;
}] call RPP_Function;
publicVariable "RPP_CompanySystem_Save_Rank";

["RPP_CompanySystem_Fire", {
	private ["_Array","_UID","_Name","_Company"];
	if (lbCurSel 1501 == -1) exitWith {
		_msg = "Please select a player first!";
		_color = RPP_Red;
		[_msg,_color] call RPP_MessageSystem;
	};
	_Array = RPP_Company_Workers select (lbCurSel 1501);
	_UID = _Array select 0;
	_Name = _Array select 1;
	_Company = RPP_Company_Settings select 3;

	if (_UID == getPlayerUID player) exitWith {
		_msg = "You are not to able to fire yourself!";
		_color = RPP_Red;
		[_msg,_color] call RPP_MessageSystem;
	};

	RPP_Company_Workers = RPP_Company_Workers - [_Array];

	_msg = format ["You fired %1 from your Company (%2)",_Name,_Company];
	_color = RPP_Yellow;
	[_msg,_Color] call RPP_MessageSystem;

	[[_Company,_UID], "RPP_CompanySystem_Fire_Get", false] call BIS_FNC_MP;

	[] call RPP_CompanySystem_ManagerMenu;
}] call RPP_Function;
publicVariable "RPP_CompanySystem_Fire";

["RPP_CompanySystem_Fire_Get", {
	private ["_Company","_UID","_Player"];
	_Company = _this select 0;
	_UID = _this select 1;
	_Player = "";

	{
		if (getPlayerUID _x == _UID) exitWith {
			_Player = _x;
		};
	} count playableUnits;

	[[_Company], "RPP_CompanySystem_Fire_Return", _Player] call BIS_FNC_MP;
}] call RPP_Function;
publicVariable "RPP_CompanySystem_Fire_Get";

["RPP_CompanySystem_Fire_Return", {
	private ["_Company"];
	_Company = _this select 0;
	_msg = format ["%1 You have been fired from %2!",name player,_Company];
	_color = RPP_Red;
	[_msg,_color] call RPP_MessageSystem;
	RPP_Company_ApplyingFor = [];
	RPP_Company_Applying = false;
}] call RPP_Function;
publicVariable "RPP_CompanySystem_Fire_Return";

["RPP_CompanySystem_Storage_Add", {
	private ["_Data"];
	if (lbCurSel 1502 == -1) exitWith {
		_msg = "Please select a item first from your inventory";
		_color = RPP_Red;
		[_msg,_color] call RPP_MessageSystem;
	};
	_data = lbData [ 1502, ( lbCurSel 1502 ) ];
	if (_data == "") exitWith {
		_msg = "Please select a item first from your inventory";
		_color = RPP_Red;
		[_msg,_color] call RPP_MessageSystem;
	};
	[_data,1] call RPP_Inventory_Remove;
	[_data,1] call RPP_CompanySystem_Add;
}] call RPP_Function;
publicVariable "RPP_CompanySystem_Storage_Add";

["RPP_CompanySystem_Storage_Take", {
	private ["_data"];
	if (lbCurSel 1503 == -1) exitWith {
		_msg = "Please select a item first from the company storage";
		_color = RPP_Red;
		[_msg,_color] call RPP_MessageSystem;
	};
	_data = lbData [ 1503, ( lbCurSel 1503 ) ];
	if (_data == "") exitWith {
		_msg = "Please select a item first from the company storage";
		_color = RPP_Red;
		[_msg,_color] call RPP_MessageSystem;
	};
	if (_data == "CBank") exitWith {
		_msg = "You are not allowed to take any money from your company account yet.";
		_color = RPP_Red;
		[_msg,_Color] call RPP_MessageSystem;
	};
	[_data,1] call RPP_Inventory_Add;
	[_data,1] call RPP_CompanySystem_Remove;
}] call RPP_Function;
publicVariable "RPP_CompanySystem_Storage_Take";

["RPP_CompanySystem_ManageApplication_GetDetails", {
	private ["_Array","_UID","_Name","_Rank","_Age","_info","_Where","_Why"];
	if (lbCurSel 2100 == -1) exitWith {
		_msg = "Please select a Player first in the drop down menu!";
		_color = RPP_Red;
		[_msg,_color] call RPP_MessageSystem;
	};
	_Array = RPP_Company_Applications select (lbCurSel 2100);
	_UID = _Array select 0;
	_Name = _Array select 1;
	_Rank = _Array select 2;
	_Age = _Array select 3;
	_info = _Array select 4;
	_Where = _Array select 5;
	_Why = _Array select 6;

	_BoxDetails = [_Name,_UID,_Rank,_Age,_info,_Where,_Why];
	lbClear 1500;
	lbAdd [1500, "==== Application Details ===="];
	{
		lbAdd [1500, _x];
	} foreach _BoxDetails;
}] call RPP_Function;
publicVariable "RPP_CompanySystem_ManageApplication_GetDetails";

["RPP_CompanySystem_ManageApplication_Accept", {
	private ["_Array","_UID","_Name","_rank","_Age","_Why","_Where","_paycheck"];
	if (lbCurSel 2100 == -1) exitWith {
		_msg = "Please select an applicant first in the drop down menu!";
		_color = RPP_Red;
		[_msg,_color] call RPP_MessageSystem;
	};
	_Array = RPP_Company_Applications select (lbCurSel 2100);
	_UID = _Array select 0;
	_Name = _Array select 1;
	_Rank = _Array select 2;
	_Age = _Array select 3;
	_info = _Array select 4;
	_Where = _Array select 5;
	_Why = _Array select 6;
	_paycheck = 50;

	RPP_Company_Workers = RPP_Company_Workers + [ [_Rank,_Name,_UID,_paycheck] ];

	_msg = format ["You accepted %1 into your company, his starter rank will be %2 and his current paycheck from your company is %3",_Name,_Rank,_paycheck];
	_color = RPP_Green;
	[_msg,_Color] call RPP_MessageSystem;
	closeDialog 1;
}] call RPP_Function;
publicVariable "RPP_CompanySystem_ManageApplication_Accept";

["RPP_CompanySystem_ManageApplication_Reject", {
	private ["_Array","_Name","_UID"];
	if (lbCurSel 2100 == -1) exitWith {
		_msg = "Please select an applicant first in the drop down menu!";
		_color = RPP_Red;
		[_msg,_color] call RPP_MessageSystem;
	};
	_Array = RPP_Company_Applications select (lbCurSel 2100);
	_Name = _Array select 0;
	_UID = _Array select 1;

	_msg = format ["You rejected %1's application!",_Name];
	_color = RPP_Yellow;
	[_msg,_Color] call RPP_MessageSystem;

	RPP_Company_Applications = RPP_Company_Applications - [_Array];

	[[_UID], "RPP_CompanySystem_Application_Reject", false] call BIS_FNC_MP;
}] call RPP_Function;
publicVariable "RPP_CompanySystem_ManageApplication_Reject";

["RPP_CompanySystem_Application_Reject", {
	private ["_UID","_Player"];
	_UID = _this select 0;
	_Player = "";
	{
		if (getPlayerUID _X == _UID) exitWith {
			_Player = _x;
		};
	} count playableUnits;

	[[], "RPP_CompanySystem_Application_Reject_Return", _Player] call BIS_FNC_MP;
}] call RPP_Function;
publicVariable "RPP_CompanySystem_Application_Reject";

["RPP_CompanySystem_Application_Reject_Return", {
	RPP_Company_ApplyingFor = [];
	RPP_Company_Applying = false;

	_msg = "We are sorry but your Application was rejected!";
	_color = RPP_Red;
	[_msg,_Color] call RPP_MessageSystem;
}] call RPP_Function;
publicVariable "RPP_CompanySystem_Application_Reject_Return";

["RPP_CompanySystem_Application_Menu", {
	[] spawn {
		private ["_c","_o","_n","_COwner","_CID","_CSlotsMax","_CSlotsused"];
		if (RPP_Company_Applying) exitWith {
			_msg = "You are already applying for a company!";
			_color = RPP_Red;
			[_msg,_Color] call RPP_MessageSystem;
		};
		if (lbCurSel 1500 == -1) exitWith {
			_msg = "Please select a company to apply for!";
			_color = RPP_Red;
			[_msg,_color] call RPP_MessageSystem;
		};
		_Company = lbData [ 1500, ( lbCurSel 1500 ) ];
		if (_Company == "") exitWith {
			_msg = "Please select a company to apply for!";
			_color = RPP_Red;
			[_msg,_Color] call RPP_MessageSystem;
		};
		_c = false;
		_o = false;
		_COwner = "";
		_CID = "";
		_CSlotsMax = "";
		_CSlotsUsed = "";
		systemChat format ["Opening Application Menu to %1, please wait...",_Company];
		{
			if (_Company == _x select 1) exitWith {
				_COwner = _x select 0;
				_CSlotsMax = _x select 3;
				_CSlotsUsed = _x select 4;
				_CID = _x select 6;
				_c = true;
			};
		} count RPP_Company_List;
		if (_CSlotsMax <= _CSlotsused) exitWith {
			systemChat format ["No more slots left (%1/%2)",_CSlotsused,_CSlotsMax];
		};
		waituntil{_c};
		systemChat format ["Checking if player %1 is online, please wait...",_COwner];
		{
			if (_CID == getPlayerUID _x) then {
				systemChat format ["%1 is online we are now sending you to the %2 Application Menu",_COwner,_Company];
				_o = true;
			};
		} count playableUnits;
		if (!(_o)) exitWith {
			systemChat format ["Player %1 is not online please try again later.",_COwner];
		};
		waituntil{_o};
		RPP_Company_ApplyingFor = [_Company,_COwner,_CID,name player,getPlayerUID player,"Newbie"];
		closeDialog 1;
		createDialog "RPP_Company_App";
		buttonSetAction [1600, "[] call RPP_CompanySystem_Apply;"];
	};
}] call RPP_Function;
publicVariable "RPP_CompanySystem_Application_Menu";

["RPP_CompanySystem_Apply", {
	private ["_Name","_Age","_Info","_Where","_Why","_Company","_COwner","_CID","_UIDP","_RankP"];
	_Name = ctrlText 1400;
	_Age = ctrlText 1401;
	_Info = ctrlText 1402;
	_Where = ctrlText 1403;
	_Why = ctrlText 1404;

	if (_Name == "") exitWith {
		_msg = "You are missing some information in your Application!";
		_color = RPP_Red;
		[_msg,_color] call RPP_MessageSystem;
	};
	if (_Age == "") exitWith {
		_msg = "You are missing some information in your Application!";
		_color = RPP_Red;
		[_msg,_color] call RPP_MessageSystem;
	};
	if (_Info == "") exitWith {
		_msg = "You are missing some information in your Application!";
		_color = RPP_Red;
		[_msg,_color] call RPP_MessageSystem;
	};
	if (_Where == "") exitWith {
		_msg = "You are missing some information in your Application!";
		_color = RPP_Red;
		[_msg,_color] call RPP_MessageSystem;
	};
	if (_Why == "") exitWith {
		_msg = "You are missing some information in your Application!";
		_color = RPP_Red;
		[_msg,_color] call RPP_MessageSystem;
	};

	RPP_Company_Applying = true;
	_Company = RPP_Company_ApplyingFor select 0;
	_COwner = RPP_Company_ApplyingFor select 1;
	_CID = RPP_Company_ApplyingFor select 2;
	_UIDP = RPP_Company_ApplyingFor select 3;
	_RankP = RPP_Company_ApplyingFor select 4;

	if (_CID == getPlayerUID player) exitWith {
		_msg = "You own this company. You can't apply to join it...";
		_color = RPP_Red;
		[_msg,_Color] call RPP_MessageSystem;
	};

	[[_Company,_COwner,_CID,_Name,_UIDP,_RankP,_Age,_Info,_Where,_Why], "RPP_CompanySystem_SendApplication", false] call BIS_FNC_MP;

	_msg = format ["Application sent to %1",_Company];
	_color = RPP_Green;
	[_msg,_Color] call RPP_MessageSystem;
}] call RPP_Function;
publicVariable "RPP_CompanySystem_Apply";

["RPP_CompanySystem_SendApplication", {
	private ["_Company","_COwner","_CID","_NameP","_UIDP","_RankP","_Age","_Where","_Why","_OWNER"];
	_Company = _this select 0;
	_COwner = _this select 1;
	_CID = _this select 2;
	_NameP = _this select 3;
	_UIDP = _this select 4;
	_RankP = _this select 5;
	_Age = _this select 6;
	_Info = _this select 7;
	_Where = _this select 8;
	_Why = _this select 9;
	_OWNER = "";
	_c = false;

	{
		if (getPlayerUID _x == _CID) exitWith {
			_OWNER = _x;
			_c = true;
		};
	} count playableUnits;

	waitUntil {_c};

	[[_NameP,_UIDP,_RankP,_Age,_Info,_Where,_Why], "RPP_CompanySystem_SendApplication_Get", _OWNER] call BIS_FNC_MP;
}] call RPP_Function;
publicVariable "RPP_CompanySystem_SendApplication";

["RPP_CompanySystem_SendApplication_Get", {
	private ["_NameP","_UIDP","_RankP","_Age","_Info","_Where","_Why"];
	_NameP = _this select 0;
	_UIDP = _this select 1;
	_RankP = _this select 2;
	_Age = _this select 3;
	_Info = _This select 4;
	_Where = _this select 5;
	_Why = _This select 6;

	RPP_Company_Applications = RPP_Company_Applications + [ [_NameP,_UIDP,_RankP,_Age,_Info,_Where,_Why] ];

	_msg = format ["New company application from %1",_NameP];
	_Color = RPP_Red;
	[_msg,_Color] call RPP_MessageSystem;
}] call RPP_Function;
publicVariable "RPP_CompanySystem_SendApplication_Get";

["RPP_CompanySystem_Create", {
	private ["_text","_Price","_data"];
	closeDialog 1;
	createDialog "RPP_Company_Create";
	buttonSetAction [1600, "[] call RPP_CompanySystem_CreateCompany;"];
	disableSerialization;
	_text = uiNameSpace getVariable ["RPP_Company_Create",displayNull];
	_Price = _text displayCtrl 1003;
	_Price ctrlSetText format["$%1",RPP_Company_Price];
	{
		_data = lbAdd [2100, format ["%1 ($%2)",_x select 0,_x select 1]];
		lbSetData [2100, _data, _x select 0];
	} foreach RPP_Company_Types;
}] call RPP_Function;
publicVariable "RPP_CompanySystem_Create";

["RPP_CompanySystem_CreateCompany", {
	private ["_Name","_Description","_Type","_TypeSelect","_Owner","_NameOwner","_UIDOwner","_MaxWorkers","_Workers","_BannedNames","_c"];
	_Name = ctrlText 1400;
	_Description = ctrlText 1401;
	_Type = lbData [ 2100, ( lbCurSel 2100 ) ];
	_TypeSelect = lbCurSel 2100;
	_Owner = player;
	_NameOwner = name _Owner;
	_UIDOwner = getPlayerUID _Owner;
	_MaxWorkers = 10;
	_Workers = 1;
	_c = true;

	if (RPP_Company_Owning) exitWith {
		_msg = "You already own a Company please delete your old one if you want to create a new Company!";
		_color = RPP_Red;
		[_msg,_color] call RPP_MessageSystem;
	};
	if (_Name == "") exitWith {
		_msg = "Please enter a company Name!";
		_color = RPP_Red;
		[_msg,_color] call RPP_MessageSystem;
	};
	{
		if (_Name == _x select 1) exitWith {
			_c = false;
		};
	} count RPP_Company_List;
	if (!(_c)) exitWith {
		_msg = format ["The name %1 is already taken!",_Name];
		_color = RPP_Red;
		[_msg,_color] call RPP_MessageSystem;
	};
	_hasABannedName = [_name] call RPP_CheckWords;
	_bool = _hasABannedName select 0;

	if(_bool)exitWith{
		_msg = format["%1 is a banned word",(_hasABannedName select 1)];
		_color = RPP_Red;
		[_msg,_color] call RPP_MessageSystem;
	};
	if (_Name == name player) exitWith {
		_msg = "Please pick a different name!";
		_color = RPP_Red;
		[_msg,_color] call RPP_MessageSystem;
	};
 	if (_TypeSelect == -1) exitWith {
		_msg = "Please enter a company type!";
		_color = RPP_Red;
		[_msg,_color] call RPP_MessageSystem;
	};
	if (_Type == "") exitWith {
		_msg = "Please enter a company type!";
		_color = RPP_Red;
		[_msg,_color] call RPP_MessageSystem;
	};
	_hasABannedName = [_Description] call RPP_CheckWords;
	_bool = _hasABannedName select 0;
	if (_Description == "") exitWith {
		_msg = "Please enter a company description!";
		_color = RPP_Red;
		[_msg,_color] call RPP_MessageSystem;
	};
	if(_bool)exitWith{
		_msg = format["%1 is a banned word",(_hasABannedName select 1)];
		_color = RPP_Red;
		[_msg,_color] call RPP_MessageSystem;
	};
	//Owner,owner name, owner uid, company name, company type, company des, company slots, company workers
	RPP_Company_Settings = [_Owner,_NameOwner,_UIDOwner,_Name,_Type,_Description,_MaxWorkers,_Workers];
	RPP_Company_Owning = true;
	RPP_Company_Workers = RPP_Company_Workers + [[getPlayerUID player, name player, "Owner","0"]];
	//Name owner,company name,company type,company max slots, company slots used, des,UID
	RPP_Company_List = RPP_Company_List + [[_NameOwner,_Name,_Type,_MaxWorkers,_Workers,_Description,_UIDOwner]];
	publicVariable "RPP_Company_List";
	_msg = format ["%1 Successfully created!",_Name];
	_color = RPP_Green;
	[_msg,_color] call RPP_MessageSystem;
	[] call RPP_CompanySystem_PayCheck_Loop;
	closeDialog 1;
}] call RPP_Function;
publicVariable "RPP_CompanySystem_CreateCompany";

["RPP_CompanySystem_Delete",{
	private ["_msg","_color","_IDP","_ID","_CName","_c0","_c1","_c2","_c3","_c4","_c5","_c6"];
	if (lbCurSel 1500 == -1) exitWith {
		_msg = "Please select a Company first!";
		_color = RPP_Red;
		[_msg,_color] call RPP_MessageSystem;
	};
	_Check = lbData [ 1500, ( lbCurSel 1500 ) ];
	if (_Check == "") exitWith {
		_msg = "Please select a Company!";
		_color = RPP_Red;
		[_msg,_color] call RPP_MessageSystem;
	};
	_IDP = getPlayerUID player;
	_ID = "";
	_CName = "";
	_c0 = "";
	_c1 = "";
	_c2 = "";
	_c3 = "";
	_c4 = "";
	_c5 = "";
	_c6 = "";

	{
		if (_Check == _x select 1) exitWith {
			_ID = _x select 6;
			_CName = _x select 1;

			_c0 = _x select 0;
			_c1 = _x select 1;
			_c2 = _x select 2;
			_c3 = _x select 3;
			_c4 = _x select 4;
			_c5 = _x select 5;
			_c6 = _x select 6;
		};
	} count RPP_Company_List;

	[[_Check,_IDP], "RPP_CompanySystem_Delete_Global", false] call BIS_FNC_MP;

	if (!(_IDP == _ID)) exitWith {
		_msg = "You don't own this Company!";
		_color = RPP_Red;
		[_msg,_color] call RPP_MessageSystem;
	};

	RPP_Company_List = RPP_Company_List - [[_c0,_c1,_c2,_c3,_c4,_c5,_c6]];
	publicVariable "RPP_Company_List";
	RPP_Company_Owning = false;

	_msg = format ["Company %1 Deleted, ID: %2",_CName,_ID];
	_color = RPP_Red;
	[_msg,_color] call RPP_MessageSystem;
	closeDialog 1;
}] call RPP_Function;
publicVariable "RPP_CompanySystem_Delete";

["RPP_CompanySystem_Delete_Global", {
	private ["_Company","_id","_UID"];
	_Company = _this select 0;
	_id = _this select 1;
	_UID = "";
	if (getPlayerUID player == _id) exitWith {};

	{
		{
			if (_Company == _x select 0) exitWith {
				_UID = _x select 2;
			};
		} count RPP_Company_ApplyingFor;

		if (getPlayerUID _x == _UID) exitWith {
			[[_Company], "RPP_CompanySystem_Delete_Leave", _x] call BIS_FNC_MP;
		};
	} foreach playableUnits;
}] call RPP_Function;
publicVariable "RPP_CompanySystem_Delete_Global";

["RPP_CompanySystem_Delete_Leave", {
	private ["_Company"];
	_Company = _this select 0;

	_msg = format ["%1 The company %2 just shutdown so you are no longer a part of that company!",name player,_Company];
	_color = RPP_Red;
	[_msg,_Color] call RPP_MessageSystem;

	RPP_Company_ApplyingFor = [];
	RPP_Company_Applying = false;
}] call RPP_Function;
publicVariable "RPP_CompanySystem_Delete_Leave";

["RPP_CompanySystem_Add", {
    private ['_itemClass','_amount','_check','_maxCheck','_Weight','_allow'];
	_itemClass = _this select 0;
	_amount = _this select 1;

	[RPP_Company_Storage, _itemClass, _amount] call BIS_fnc_addToPairs;
	[] call RPP_CompanySystem_ManagerMenu;
}] call RPP_Function;
publicVariable 'RPP_CompanySystem_Add';

["RPP_CompanySystem_Count", {
    private ['_itemClass','_return'];
	_itemClass = _this select 0;

	_return = [RPP_Company_Storage, _itemClass, 0] call BIS_fnc_getFromPairs;

	_return;
}] call RPP_Function;
publicVariable 'RPP_CompanySystem_Count';

["RPP_CompanySystem_Remove", {
    private ['_itemClass','_amount','_index','_Weight'];
	_itemClass = _this select 0;
	_amount = _this select 1;

	_index = [RPP_Company_Storage, _itemClass, -_amount] call BIS_fnc_addToPairs;

	if([_itemClass] call RPP_CompanySystem_Count < 1) then {
		_i = 0;
		{
			if(_itemClass == _x select 0) then {
				_index = _i;
			};
			_i = _i + 1;
		} forEach RPP_Company_Storage;
		RPP_Company_Storage set [_index, 'REMOVE'];
		RPP_Company_Storage = RPP_Company_Storage - ['REMOVE'];
	};

	[] call RPP_CompanySystem_ManagerMenu;
}] call RPP_Function;
publicVariable 'RPP_CompanySystem_Remove';