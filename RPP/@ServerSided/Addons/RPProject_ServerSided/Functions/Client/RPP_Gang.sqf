/*
Script File Author: Lifeman
Script File Mod: Life Server
Script File: RPP_Gang.sqf

Description:
Gangs
*/
["RPP_Gang_Dialog", {
	createDialog "RPP_GangMenu";
	[] call RPP_DB_Gang_Client_LoadStats;

	buttonSetAction [1600,"[] call RPP_DB_Gang_Client_CreateUser;"];
	buttonSetAction [1601,"[] call RPP_Gang_ManageGang;"];
	buttonSetAction [1602,"[] call RPP_Gang_Join;"];
}] call RPP_Function;
publicVariable "RPP_Gang_Dialog";

["RPP_Gang_Delete", {
	private ["_Gang"];
	_Gang = lbdata [1500,lbCurSel 1500];

}] call RPP_Function;
publicVariable "RPP_Gang_Delete";

["RPP_Gang_ManageGang", {
	closeDialog 1;
	createDialog "RPP_GangMange";
	[[player], "RPP_DB_Gang_Server_MembersLoadStats", false] call BIS_fnc_MP;
	buttonSetAction [1600, "[] call RPP_Gang_Delete;"];
	buttonSetAction [1601, "[] call RPP_Gang_KickUser;"];
	buttonSetAction [1602, "[] call RPP_Gang_LockUnlock;"];
}] call RPP_Function;
publicVariable "RPP_Gang_ManageGang";

["RPP_Gang_CaptureArea", {
	[_this select 0] spawn {
		private ["_Capture","_GangName","_GangLeaderUID","_GangMembers"];
		RPP_GangDis = _this select 0;
		_Capture = true;
		{
			if (_x select 0 == RPP_GangDis) exitWith {
				if (_x select 3 == getPlayerUID player) exitWith {
					_Capture = false;
				};
				_Array = _x select 4;
				if (getPlayerUID player in _Array) exitWith {
					_Capture = false;
				};
			};
		} count RPP_GangAreas;

		if (!(_Capture)) exitWith {
			_msg = "Your Gang already own this Area.";
			_color = RPP_Red;
			[_msg,_color] call RPP_MessageSystem;
		};
		["AinvPknlMstpSnonWnonDnon_medic_1","playmove"] call RPP_SwitchAnim_Global;
		sleep 3;
		["AinvPknlMstpSnonWnonDnon_medic_1","playmove"] call RPP_SwitchAnim_Global;
		sleep 3;
		RPP_GangArea = "";
		_GangName = "";
		_GangLeaderUID = "";
		_GangMembers = [];
		_Price = "";
		_c = false;
		{
			if (RPP_GangDis == _x select 0) then {
				RPP_GangArea = _x select 1;
				_GangName = _x select 2;
				_GangLeaderUID = _x select 3;
				_GangMembers = _x select 4;
				_Price = _x select 5;
				_c = true;
			};
			if (_c) exitWith {
				RPP_GangAreas = RPP_GangAreas - [[RPP_GangDis,RPP_GangArea,_GangName,_GangLeaderUID,_GangMembers,_Price]];
				sleep 0.2;
				[[player], "RPP_DB_Gang_Server_CaptureLoadStats", false] call BIS_fnc_MP;
			};
		} count RPP_GangAreas;
		if (!(_c)) then {
			hint "Erorr Failed to capture area.";
		};
	};
}] call RPP_Function;
publicVariable "RPP_Gang_CaptureArea";