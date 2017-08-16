/*
Script File Author: Repentz
Script File Mod: Life Server
Script File: RPP_Phone.sqf

rpp_rrtradSD23KTGsdNBXz

Description:
message player etc
*/
["RPP_PhoneMenu_Options", {
	RPP_Phone_Options =
	[
		['311 Message','RPP_Phone_311'],
		['911 Message','RPP_Phone_911'],
		['EMT Message','RPP_Phone_EMT'],
		['141 Message','RPP_Phone_141']
	];
	publicVariable 'RPP_Phone_Options';
}] call RPP_Function;
publicVariable 'RPP_PhoneMenu_Options';

[] call RPP_PhoneMenu_Options;

["RPP_Inventory_Phone", {
	private ['_data1','_data2'];
	closeDialog 1;
	createDialog 'RPP_Phone';
	buttonSetAction [1600, '[] call RPP_PhoneMenu_Message;'];

	{
		_data1 = lbAdd [2100, format ['%1',_x select 0]];
		lbSetData [2100, _data1, 'PhoneOptionsList'];
	} foreach RPP_Phone_Options;
	lbAdd [2100, format ['',name player]];
	lbAdd [2100, format ['=== Players ===', name player]];
	{
		_data2 = lbAdd [2100, format ['%1',name _x]];
		lbSetData [2100, _data2, getPlayerUID _x];
	} foreach playableUnits;
}] call RPP_Function;
publicVariable 'RPP_Inventory_Phone';

["RPP_PhoneMenu_Message", {
	private ['_msg','_color','_data','_Message','_array','_call'];
	if (lbCurSel 2100 isEqualTo -1) exitWith {
		_msg = 'Please select someone to message.';
		_color = RPP_Red;
		[_msg,_color] call RPP_MessageSystem;
	};
	_data = lbData [ 2100, ( lbCurSel 2100 ) ];
	_Message = ctrlText 1400;
	if (_data isEqualTo '') exitWith {
		_msg = 'Please select someone to message.';
		_color = RPP_Red;
		[_msg,_color] call RPP_MessageSystem;
	};
	if (_data isEqualTo 'PhoneOptionsList') exitWith {
		_array = RPP_Phone_Options select (lbCurSel 2100);
		_call = _array select 1;
		call compile format ['[_Message,player] call %1;',_call];
		_msg = format ['Message Sent! | %1',_Message];
		_color = RPP_Green;
		[_msg,_color] call RPP_MessageSystem;
	};
	[[player,_data,_Message], 'RPP_Phone_MessagePlayer', false] call BIS_FNC_MP;
	_msg = format ['Message Sent! | %1',_Message];
	_color = RPP_Green;
	[_msg,_color] call RPP_MessageSystem;
	closeDialog 1;
}] call RPP_Function;
publicVariable 'RPP_PhoneMenu_Message';

["RPP_Phone_MessagePlayer", {
	private ['_sender','_id','_Message'];
	_sender = _this select 0;
	_id = _this select 1;
	_Message = _this select 2;
	_sendto = "";

	{
		if (getPlayerUID _x == _id) exitWith {
			_sendto = _x;
		};
	} count playableUnits;

	[[_sender,_Message], "RPP_Phone_PlayerGet_Message", _sendto] call BIS_FNC_MP;
	_msg = format ["%1 sent a message to %2 | %3",name _sender,name _sendto,_Message];
	[_msg] call RPP_Server_Log;
}] call RPP_Function;
publicVariable 'RPP_Phone_MessagePlayer';

["RPP_Phone_PlayerGet_Message", {
	private ["_sender","_Message"];
	_sender = _this select 0;
	_Message = _this select 1;
	_msg = format ["Message From %1: %2",name _sender,_Message];
	_color = RPP_White;
	[_msg,_color] call RPP_MessageSystem;
}] call RPP_Function;
publicVariable "RPP_Phone_PlayerGet_Message";

["RPP_Phone_311", {
	private ['_Message','_sender'];
	_Message = _this select 0;
	_sender  = _this select 1;

	[[_Message,_sender], 'RPP_Phone_311_Get',true] call BIS_FNC_MP;

	_msg = format ["%1 sent a message to 311| %3",name _sender,_Message];
	[_msg] call RPP_Server_Log;
}] call RPP_Function;
publicVariable 'RPP_Phone_311';

["RPP_Phone_311_Get", {
	private ['_Message','_sender'];
	_Message = _this select 0;
	_sender = _this select 1;

	systemChat format ['311 Message from %1: %2',name _sender,_Message];
}] call RPP_Function;
publicVariable 'RPP_Phone_311_Get';

["RPP_Phone_911", {
	private ['_Message','_sender'];
	_Message = _this select 0;
	_sender  = _this select 1;

	[[_Message,_sender], 'RPP_Phone_911_Get',west] call BIS_FNC_MP;

	_msg = format ["%1 sent a message to 911| %3",name _sender,_Message];
	[_msg] call RPP_Server_Log;
}] call RPP_Function;
publicVariable 'RPP_Phone_911';

["RPP_Phone_911_Get", {
	private ['_Message','_sender'];
	_Message = _this select 0;
	_sender = _this select 1;

	systemChat format ['911 Message from %1: %2',name _sender,_Message];
}] call RPP_Function;
publicVariable 'RPP_Phone_911_Get';

["RPP_Phone_141", {
	private ['_Message'];
	_Message = _this select 0;

	[[_Message], 'RPP_Phone_141_Get',true] call BIS_FNC_MP;

	_msg = format ["%1 sent a message to 141| %3",name _sender,_Message];
	[_msg] call RPP_Server_Log;
}] call RPP_Function;
publicVariable 'RPP_Phone_141';

["RPP_Phone_141_Get", {
	private ['_Message'];
	_Message = _this select 0;

	systemChat format ['141 Message: %1',_Message];
}] call RPP_Function;
publicVariable 'RPP_Phone_141_Get';

["RPP_Phone_EMT", {
	private ['_Message','_sender'];
	_Message = _this select 0;
	_sender  = _this select 1;

	[[_Message,_sender], 'RPP_Phone_EMT_Get',resistance] call BIS_FNC_MP;
}] call RPP_Function;
publicVariable 'RPP_Phone_EMT';

["RPP_Phone_EMT_Get", {
	private ['_Message','_sender'];
	_Message = _this select 0;
	_sender = _this select 1;

	systemChat format ['EMT Message from %1: %2',name _sender,_Message];
}] call RPP_Function;
publicVariable 'RPP_Phone_EMT_Get';