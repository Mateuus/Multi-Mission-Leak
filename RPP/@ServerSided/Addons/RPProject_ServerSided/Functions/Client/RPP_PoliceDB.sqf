/*
Script File Author: Repentz
Script File Mod: Life Server
Script File: RPP_PoliceDB.sqf

Description:
Police database
*/
["RPP_PoliceDB_Dialog", {
	createDialog "RPP_PoliceDatabase";
	buttonSetAction [1600, "[] call RPP_PoliceDB_Process;"];

	{
		lbAdd [1500, format ["%1",_x select 0]];
	} foreach RPP_PoliceDB_Commands;
}] call RPP_Function;
publicVariable "RPP_PoliceDB_Dialog";

["RPP_PoliceDB_Process", {
	if (lbCurSel 1500 isEqualTo -1) exitWith {
		_msg = "Please select a command to use.";
		_color = RPP_Red;
		[_msg,_color] call RPP_MessageSystem;
	};
	private ["_Array","_call"];
	_Array = RPP_PoliceDB_Commands select (lbCurSel 1500);
	_call = _Array select 1;
	if (_call == "") exitWith {
		_msg = "This command is still a work in progress!";
		_color = RPP_Red;
		[_msg,_color] call RPP_MessageSystem;
	};
	closeDialog 1;
	call compile format ["[] call %1",_call];
}] call RPP_Function;
publicVariable "RPP_PoliceDB_Process";

["RPP_PoliceDB_CrimeRecords", {
	createDialog "RPP_CrimeRecords";
	//id,name,reason,submitby
	{
		_id = _x select 0;
		_name = _x select 1;
		_data = lbAdd [1500, format ["%1",_name]];
		lbSetData [1500, _data, _id];
	} foreach RPP_Crime;
	buttonSetAction [1600, "[] call RPP_PoliceDB_CrimeView;"];
	buttonSetAction [1601, "[] call RPP_PoliceDB_CrimeRevoke;"];
	buttonSetAction [1602, "closeDialog 1;"];
}] call RPP_Function;
publicVariable "RPP_PoliceDB_CrimeRecords";

["RPP_PoliceDB_CrimeView", {
	if (lbCurSel 1500 isEqualTo -1) exitWith {
		_msg = "Please select a user to view first";
		_color = RPP_Red;
		[_msg,_color] call RPP_MessageSystem;
	};
	private ["_Array","_id","_name","_reason","_submitby","_race"];
	_Array = RPP_Crime select (lbCurSel 1500);
	_id = _Array select 0;
	_name = _Array select 1;
	_reason = _Array select 2;
	_submitby = _Array select 3;
	_Race = _Array select 4;

	lbClear 1501;
	lbAdd [1501, format ["Name: %1",_name]];
	lbAdd [1501, format ["Race: %1",_Race]];
	lbAdd [1501, format ["Description: %1",_reason]];
	lbAdd [1501, format ["Reporting Officer: %1",_submitby]];
	lbAdd [1501, format ["ID: %1",_id]];
}] call RPP_Function;
publicVariable "RPP_PoliceDB_CrimeView";

["RPP_PoliceDB_CrimeRevoke", {
	if (lbCurSel 1500 isEqualTo -1) exitWith {
		_msg = "Please select a user to revoke";
		_color = RPP_Red;
		[_msg,_color] call RPP_MessageSystem;
	};
	private ["_Array","_id","_name","_reason","_submitby","_Race"];
	_Array = RPP_Crime select (lbCurSel 1500);
	_id = _Array select 0;
	_name = _Array select 1;
	_reason = _Array select 2;
	_submitby = _Array select 3;
	_Race = _Array select 4;

	RPP_Crime = RPP_Crime - [[_id,_name,_reason,_submitby,_Race]];
	_msg = format ["Crime Record removed! (%1 | %2)",_name,_id];
	_color = RPP_Green;
	[_msg,_color] call RPP_MessageSystem;
	closeDialog 1;
}] call RPP_Function;
publicVariable "RPP_PoliceDB_CrimeRevoke";

["RPP_PoliceDB_CrimeSubmit", {
	createDialog "RPP_CrimeSubmitter";
	{
		_name = lbAdd [2100, format ["%1",name _x]];
		lbSetData [2100, _name, name _x];
	} foreach playableUnits;
	{
		_race = lbAdd [2101, format ["%1",_x]];
		lbSetData [2101, _race, _x];
	} foreach RPP_PoliceDB_Race;
	buttonSetAction [1600, "[] call RPP_PoliceDB_SubmitCrime;"];
}] call RPP_Function;
publicVariable "RPP_PoliceDB_CrimeSubmit";

["RPP_PoliceDB_SubmitCrime", {
	private ["_Reason","_submitby","_name","_race","_id","_c"];
	_Reason = ctrlText 1400;
	_submitby = ctrlText 1401;
	_name = lbData [ 2100, ( lbCurSel 2100 ) ];
	_Race = lbData [ 2101, ( lbCurSel 2101 ) ];
	_id = "";
	_c = false;
	if (lbCurSel 2100 isEqualTo -1) exitWith {
		_msg = "Please select a player!";
		_color = RPP_Red;;
		[_msg,_color] call RPP_MessageSystem;
	};
	if (_Reason isEqualTo "") exitWith {
		_msg = "Please type a reason!";
		_color = RPP_Red;
		[_msg,_color] call RPP_MessageSystem;
	};
	if (_submitby isEqualTo "") exitWith {
		_msg = "Please type your name under submitby!";
		_color = RPP_Red;
		[_msg,_color] call RPP_MessageSystem;
	};
	if (lbCurSel 2101 isEqualTo -1) exitWith {
		_msg = "Please select a race!";
		_color = RPP_Red;
		[_msg,_color] call RPP_MessageSystem;
	};

	{
		if (name _x == _name) then {
			_id = getPlayerUID _x;
			_c = true;
		};
	} foreach playableUnits;

	if (!(_c)) exitWith {
		_msg = "Failed to sumbit record!";
		_color = RPP_Red;
		[_msg,_color] call RPP_MessageSystem;
	};
	//id,name,reason,submitby,race
	RPP_Crime = RPP_Crime + [ [_id,_name,_reason,_submitby,_Race] ];
	_msg = format ["Successfully submit record on %1 for %2",_name,_reason];
	_color = RPP_Green;
	[_msg,_color] call RPP_MessageSystem;
	closeDialog 1;
	[] call RPP_DB_PoliceCrime_Client_UpdateStats;
}] call RPP_Function;
publicVariable "RPP_PoliceDB_SubmitCrime";

["RPP_PoliceVehicleDB_Menu", {
	if (!(RPP_isCop)) exitWith {};
	createDialog "RPP_PoliceVehicleDB";
	buttonSetAction [1600, "[] call RPP_PoliceVehicleDB_Search;"];
	lbAdd [1500, format ["====== Police Vehicle Database ======"]];
}] call RPP_Function;
publicVariable "RPP_PoliceVehicleDB_Menu";

["RPP_PoliceVehicleDB_Search", {
	[] spawn {
		private ["_LicPlate","_LicFound","_uid","_name","_type","_id"];
		_LicPlate = ctrlText 1400;
		lbClear 1500;
		lbAdd [1500, format ["====== Police Vehicle Database ======"]];
		lbAdd [1500, format ["Seaching Database..."]];
		if (_LicPlate == "") exitWith {
			lbAdd [1500, "This License Plate dosent exist in the Database."];
		};
		RPP_VehicleDB_LicPlateFound = false;
		RPP_LicensePlate_NoFound = false;
		[_LicPlate] call RPP_DB_LicPlate_Client_CheckLic;
		waituntil{RPP_VehicleDB_LicPlateFound};
        lbClear 1500;
        if (RPP_LicensePlate_NoFound) exitWith {
        	lbAdd [1500, "That LicensePlate doesn't exist in the Database."];
        };
        lbAdd [1500, "====== Police Vehicle Database ======"];
        lbClear 1500;
        lbAdd [1500, format ["License Plate: %1",RPP_Vehicle_LicensePlate]];
        lbAdd [1500, format ["Owner: %1",RPP_Vehicle_Name]];
        lbAdd [1500, format ["UID: %1",RPP_Vehicle_UID]];
        lbAdd [1500, format ["Type: %1",RPP_Vehicle_Type]];
        lbAdd [1500, format ["ID: %1",RPP_Vehicle_ID]];
	};
}] call RPP_Function;
publicVariable "RPP_PoliceVehicleDB_Search";

["RPP_DB_LicPlate_Client_CheckLic", {
	_plate = _this select 0;
	[[player,_plate], "RPP_DB_LicPlate_Server_FindeLic", false] spawn BIS_fnc_MP;
}] call RPP_Function;
publicVariable "RPP_DB_LicPlate_Client_CheckLic";

["RPP_DB_LicPlate_Server_FindeLic", {
	private ["_player","_playerUID","_databasePull"];

	RPP_Query_inuse = true;
	publicVariable "RPP_Query_inuse";
	_player = _this select 0;
	RPP_LicPlate_Lookup = _this select 1;

	_databasePull = "Arma2Net.Unmanaged" callExtension format["Arma2NETMySQLCommand ['RPProject_DB', 'SELECT EXISTS(SELECT RPP_Vehicles_LicensePlate_String FROM VehicleDB WHERE RPP_Vehicles_LicensePlate_String = '%1')']", RPP_LicPlate_Lookup];
	[[_databasePull], "RPP_DB_LicPlate_Client_DidweFindeit", _player] spawn BIS_fnc_MP;
}] call RPP_Function;
publicVariable "RPP_DB_LicPlate_Server_FindeLic";

["RPP_DB_LicPlate_Client_DidweFindeit", {
	private ["_return"];
	_return = _this select 0;
	_return = call compile _return;
	_return = (_return select 0) select 0;
	
	RPP_DB_User_Exist = _return;
	//systemChat format ["Debug: %1",RPP_DB_User_Exist];

	if ("0" in RPP_DB_User_Exist) then {
		RPP_LicensePlate_NoFound = true;
		RPP_VehicleDB_LicPlateFound = true;
	}
	else
	{
		[] call RPP_DB_LicPlate_Client_LoadStats;
	};
}] call RPP_Function;
publicVariable "RPP_DB_LicPlate_Client_DidweFindeit";

["RPP_DB_LicPlate_Client_LoadStats", {
	[[player], "RPP_DB_LicPlate_Server_LoadStats", false] call BIS_FNC_MP;
}] call RPP_Function;
publicVariable "RPP_DB_LicPlate_Client_LoadStats";

["RPP_DB_LicPlate_Server_LoadStats", {
	private ["_player","_playerUID","_databasePull"]; 

	_player = _this select 0;
	_LicPlate = RPP_LicPlate_Lookup;
	
	_databasePull = "Arma2Net.Unmanaged" callExtension format["Arma2NETMySQLCommand ['RPProject_DB', 'SELECT 

	RPP_UID,RPP_Vehicles_Name,RPP_Vehicles_ID,RPP_Vehicles_Type,RPP_Vehicles_LicensePlate_String

	FROM VehicleDB WHERE RPP_Vehicles_LicensePlate_String = '%1'']", _LicPlate];

	[[_databasePull], "RPP_DB_LicPlate_Client_GetStats", _player] spawn BIS_fnc_MP;
}] call RPP_Function;
publicVariable "RPP_DB_LicPlate_Server_LoadStats";

["RPP_DB_LicPlate_Client_GetStats", {
	private ["_return"];

	_return = _this select 0;
	_return = call compile _return;
	_return = (_return select 0) select 0;

	[_return] call RPP_DB_LicPlate_Client_SetStats;

	//debug
}] call RPP_Function;
publicVariable "RPP_DB_Vehicle_Client_GetStats";

["RPP_DB_LicPlate_Client_SetStats", {
	private ["_statsArray","_RPP_uid","_RPP_name","_id","_Type","_LicPlate"];
	_statsArray = _this select 0;
	_RPP_uid = _statsArray select 0;
	_RPP_name = _statsArray select 1;
	_ID = _statsArray select 2;
	_Type = _statsArray select 3;
	_LicPlate = _statsArray select 4;

	RPP_Vehicle_UID = _RPP_uid;
	RPP_Vehicle_Name = _RPP_name;
	RPP_Vehicle_ID = _ID;
	RPP_Vehicle_Type = _Type;
	RPP_Vehicle_LicensePlate = _LicPlate;

	RPP_Server_LicPlate_Lookup = false;
	publicVariable "RPP_Server_LicPlate_Lookup";

	RPP_VehicleDB_LicPlateFound = true;
}] call RPP_Function;
publicVariable "RPP_DB_LicPlate_Client_SetStats";