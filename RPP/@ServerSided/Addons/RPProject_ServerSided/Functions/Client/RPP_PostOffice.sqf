/*
Script File Author: Repentz
Script File Mod: Life Server
Script File: RPP_PostOffice.sqf

Description:
Delivery jobs
*/
["RPP_PostOffice_Var", {
	RPP_Delivery_Distance =
	[
		"Long Drive",
		"Medium Drive",
		"Short Drive"
	];
	publicVariable "RPP_Delivery_Distance";

	RPP_Delivery_Type =
	[
		["Wood Load","RPP_PostOffice_Wood"],
		["Glass Load","RPP_PostOffice_Glass"],
		["Heavy Load","RPP_PostOffice_Heavy"],
		["Danger Load","RPP_PostOffice_Danger"]
	];
	publicVariable "RPP_Delivery_Type";

	RPP_Delivery_Vehicle =
	[
		"C_VAN_01_box_F"
	];
	publicVariable "RPP_Delivery_Vehicle";
}] call RPP_Function;
publicVariable "RPP_PostOffice_Var";

[] call RPP_PostOffice_Var;

["RPP_PostOffice_Dialog", {
	[] spawn {
		createDialog "RPP_PostOffice_Menu";
		buttonSetAction [1600, "[] call RPP_PostOffice_Take;"];

		{
			_data1 = lbAdd [2100, format ["%1",_x]];
			lbSetData [2100, _data1, _x];
		} foreach RPP_Delivery_Distance;

		{
			_Classname = _x;
			_text = "";
			_c = false;
			{
				if (_Classname == _x select 0) then {
					_text = _x select 2;
					_c = true;
				};
			} count RPP_Vehicle_Config;
			waitUntil {_c};
			_data2 = lbAdd [2101, format ["%1",_text]];
			lbSetData [2101, _data2, _text];
		} foreach RPP_Delivery_Vehicle;

		{	
			_data3 = lbAdd [2102, format ["%1",_x select 0]];
			lbSetData [2102, _data3, _x select 0];
		} foreach RPP_Delivery_Type;
	};
}] call RPP_Function;
publicVariable "RPP_PostOffice_Dialog";

["RPP_PostOffice_Take", {
	_dis = lbCurSel 2100;
	_veh = lbCurSel 2101;
	_type = lbCurSel 2102;

	if (_dis == -1) exitWith {
		_msg = "Please select how far you want to drive!";
		_color = RPP_Red;
		[_msg,_color] call RPP_MessageSystem;
	};
	if (_veh == -1) exitWith {
		_msg = "Please select your vehicle you are using!";
		_color = RPP_Red;
		[_msg,_color] call RPP_MessageSystem;
	};
	if (_type == -1) exitWith {
		_msg = "Please select witch load you want to deliver!";
		_color = RPP_Red;
		[_msg,_color] call RPP_MessageSystem;
	};

	_Data_Distance = lbData [ 2100, ( lbCurSel 2100 ) ];
	_Data_Vehicle = lbData [ 2101, ( lbCurSel 2101 ) ];
	_Data_Type = lbData [ 2102, ( lbCurSel 2102 ) ];

	if (_Data_Distance == "") exitWith {
		_msg = "Error 2100";
		_color = RPP_Red;
		[_msg,_color] call RPP_MessageSystem;
	};
	if (_Data_Distance == "") exitWith {
		_msg = "Error 2101";
		_color = RPP_Red;
		[_msg,_color] call RPP_MessageSystem;
	};
	if (_Data_Distance == "") exitWith {
		_msg = "Error 2102";
		_color = RPP_Red;
		[_msg,_color] call RPP_MessageSystem;
	};

	lbAdd [1500, format ["%1",_Data_Distance]];
	lbAdd [1500, format ["%1",_Data_Vehicle]];
	lbAdd [1500, format ["%1",_Data_Type]];
	lbAdd [1500, ""];
	lbAdd [1500, "Status: OK"];
}] call RPP_Function;
publicVariable "RPP_PostOffice_Take";