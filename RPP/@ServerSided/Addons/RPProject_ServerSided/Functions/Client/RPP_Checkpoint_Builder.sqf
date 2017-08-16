/*
Script File Author: Repentz
Script File Mod: Life Server
Script File: RPP_Checkpoint_Builder.sqf

Description:
cp builder for cops
*/
["RPP_CheckPoint_Var", {
	CP_Menu_Items =
	[	//Class Name | Item Name | Price
		["Land_BarGate_F","Bare Gate",50],
		["RoadCone_F","Road Cone",5],
		["RoadBarrier_F","Road Barrier",25],
		["TapeSign_F", "Red-White Tape", 10],
		["ArrowDesk_L_F","Arrow Desk (left)",15],
		["ArrowDesk_R_F","Arrow Desk (right)",15],
		["ArrowMarker_R_F","Arrow Marker (right)",10],
		["ArrowMarker_L_F","Arrow Marker (left)",10],
		["Land_FieldToilet_F","Toilet",30],
		["FirePlace_burning_F","Fire place (Burning)",5],
		["Land_TentA_F","Tent",30],
		["Land_LampStreet_F","Street Lamp (on)",80]
	];
	publicVariable "CP_Menu_Items";
}] call RPP_Function;
publicVariable "RPP_CheckPoint_Var";

[] call RPP_CheckPoint_Var;

["RPP_CheckPoint_Setup", {
	createDialog "RPP_CheckPointBuilder";
	buttonSetAction [1600, "[] call RPP_CheckPoint_GetItem;"];
	buttonSetAction [1602, "[] call RPP_CheckPoint_Cancel;"];
	buttonSetAction [1601, "[] call RPP_CheckPoint_Pickup;"];
	buttonSetAction [1603, "[] call RPP_CheckPoint_Remove;"];

	{
		lbAdd [1500, format ["%1 ($%2)",_x select 1,_x select 2]];
	} foreach CP_Menu_Items;

	{
		_classname = _x select 0;
		_name = _x select 1;
		_distance = round(player distance _classname);
		lbAdd [1501, format ["%1 (%2 Meters away)",_name,_distance]];
	} foreach CP_Object_Placed;
}] call RPP_Function;
publicVariable "RPP_CheckPoint_Setup";

["RPP_CheckPoint_Cancel", {
	private ["_cur"];

	if (!(CP_Building)) exitWith {
		systemChat "You are not trying to place an object.";
	};
	CP_Building = false;
	detach cp;
	deleteVehicle cp;
	CP_Object_Placed = CP_Object_Placed - [CP_array];
	closeDialog 1;
}] call RPP_Function;
publicVariable "RPP_CheckPoint_Cancel";

["RPP_CheckPoint_GetItem", {
	private ["_array","_item","_price","_place"];

	if (lbCurSel 1500 == -1) exitWith {
		systemChat "Please select a Object to spawn.";
	};

	CP_array = CP_Menu_Items select (lbCurSel 1500);
	_item = CP_array select 0;
	_price = CP_array select 2;
	if (RPP_Cash < _price) exitWith {
		_msg = "You dont have the money for this item.";
		_color = RPP_Red;
		[_msg,_color] call RPP_MessageSystem;
	};
	if (CP_Building) exitWith {
		_msg = "You are already trying to place an item.";
		_color = RPP_Red;
		[_msg,_color] call RPP_MessageSystem;
	};

	CP_Building = true;

	CP_Place_Number = 1.3;
	CP_Forward_Number = 2.2;

	cp = _item createVehicle (position player);
	cp attachTo [player,[0.2,CP_Forward_Number,CP_Place_Number]];
	cp setVariable ["CP_Owner",getPlayerUID player,true];

	CP setpos [getpos CP select 0,getpos CP select 1,0];

	_msg = format ["You bought a %1",_item];
	_color = RPP_Green;
	[_msg,_color] call RPP_MessageSystem;

	[_price] call RPP_AntiCheat_RemoveMoney;

	CP_Forward = player addAction ["Go Forward",{[] call RPP_CheckPoint_goForward}];
	CP_Backford = player addAction ["Go Backford",{[] call RPP_CheckPoint_goBackford}];
	CP_Up = player addAction ["Go Up",{[] call RPP_CheckPoint_goup}];
	CP_Down = player addAction ["Go Down",{[] call RPP_CheckPoint_goDown}];

	CP_Detach = player addAction ["Detach Object",{[] call RPP_CheckPoint_Detach}];
	closeDialog 1;
}] call RPP_Function;
publicVariable "RPP_CheckPoint_GetItem";

["RPP_CheckPoint_Pickup", {
	private ["_cur"];

	if (lbCurSel 1501 == -1) exitWith {
		_msg = "Please select a object to pickup!";
		_color = RPP_Red;
		[_msg,_color] call RPP_MessageSystem;
	};
	_array = CP_Object_Placed select (lbCurSel 1501);
	CP = _array select 0;
	_name = _array select 1;
	_owner = CP getVariable "CP_Owner";
	if (!(_owner == getPlayerUID player)) exitWith {
		_msg = "You don't own this object so you can't pick it up.";
		_color = RPP_Red;
		[_msg,_color] call RPP_MessageSystem;
	};

	if (player distance CP > 10) exitWith {
		_msg = "To far away from the object!";
		_color = RPP_Red;
		[_msg,_color] call RPP_MessageSystem;
	};

	CP_Place_Number = 1.3;
	CP_Forward_Number = 2.2;

	CP attachTo [player,[0.2,CP_Forward_Number,CP_Place_Number]];
	CP setpos [getpos CP select 0,getpos CP select 1,0];

	_msg = format ["You picked up: %1",_name];
	_color = RPP_Green;
	[_msg,_color] call RPP_MessageSystem;

	CP_Object_Placed = CP_Object_Placed - [_array];

	CP_Forward = player addAction ["Go Forward",{[] call RPP_CheckPoint_goForward}];
	CP_Backford = player addAction ["Go Backford",{[] call RPP_CheckPoint_goBackford}];
	CP_Up = player addAction ["Go Up",{[] call RPP_CheckPoint_goup}];
	CP_Down = player addAction ["Go Down",{[] call RPP_CheckPoint_goDown}];

	CP_Detach = player addAction ["Detach Object",{[] call RPP_CheckPoint_Detach}];

	CP_Building = true;
	closeDialog 1;
}] call RPP_Function;
publicVariable "RPP_CheckPoint_Pickup";

["RPP_CheckPoint_Remove", {
	private ["_cur"];

	_array = CP_Object_Placed select (lbCurSel 1501);
	_cur = _array select 0;
	_name = _array select 1;

	_owner = _cur getVariable "CP_Owner";
	if (!(_owner == getPlayerUID player)) exitWith {
		_msg = "You don't own this object so you can't pick it up.";
		_color = RPP_Red;
		[_msg,_color] call RPP_MessageSystem;
	};
	if (player distance _cur > 10) exitWith {
		_msg = "To far away from the object!";
		_color = RPP_Red;
		[_msg,_color] call RPP_MessageSystem;
	};

	_type = typeOf _cur;
	CP_Object_Placed = CP_Object_Placed - [_array];
	deleteVehicle _cur;
	_msg = format ["Deleted: %1",typeof _cur];
	_color = RPP_Red;
	[_msg,_color] call RPP_MessageSystem;
	closeDialog 1;
}] call RPP_Function;
publicVariable "RPP_CheckPoint_Remove";

["RPP_CheckPoint_goDown", {
	CP_Place_Number = CP_Place_Number - 0.2;
	cp attachTo [player,[0.2,CP_Forward_Number,CP_Place_Number]];
}] call  RPP_Function;
publicVariable "RPP_CheckPoint_goDown";

["RPP_CheckPoint_goForward", {
	CP_Forward_Number = CP_Forward_Number + 0.2;
	cp attachTo [player,[0.2,CP_Forward_Number,CP_Place_Number]];
}] call RPP_Function;
publicVariable "RPP_CheckPoint_goForward";

["RPP_CheckPoint_goBackford", {
	CP_Forward_Number = CP_Forward_Number - 0.2;
	cp attachTo [player,[0.2,CP_Forward_Number,CP_Place_Number]];
}] call RPP_Function;
publicVariable "RPP_CheckPoint_goBackford";

["RPP_CheckPoint_goup", {
	CP_Place_Number = CP_Place_Number + 0.2;
	cp attachTo [player,[0.2,CP_Forward_Number,CP_Place_Number]];
}] call RPP_Function;
publicVariable "RPP_CheckPoint_goup";

["RPP_CheckPoint_Detach", {
	player removeAction CP_Detach;
	player removeAction CP_Forward;
	player removeAction CP_Backford;
	player removeAction CP_Up;
	player removeAction	CP_Down;

	_type = typeOf CP;
	CP_Object_Placed = CP_Object_Placed + [[CP,_type]];

	detach CP;
	CP_Building = false;
	CP setpos [getpos CP select 0,getpos CP select 1,0];
}] call RPP_Function;
publicVariable "RPP_CheckPoint_Detach";