/*
Script File Author: Repentz
Script File Mod: Life Server
Script File: RPP_DeliveryMission.sqf

Description:
Delivery job
*/

["RPP_Delivery_Get", {
	if (RPP_Delivery_Job) exitWith {
		_msg = "Please finish your current delivery mission first or cancel it.";
		_color = RPP_Red;
		[_msg,_color] call RPP_MessageSystem;
	};

	RPP_Delivery_Job = true;
	RPP_Delivery_place = RPP_Delivery_Markers call bis_fnc_selectrandom;
	RPP_Delivery_Pay = round(player distance getmarkerpos RPP_Delivery_place);
	["Delivery Package",1] call RPP_Inventory_Add;

	RPP_DeliveryMarker = createMarkerLocal ["RPP_Delivery",getMarkerPos RPP_Delivery_place];
	RPP_DeliveryMarker setMarkerColorLocal "ColorYellow";
	RPP_DeliveryMarker setMarkerTypeLocal "mil_dot";
	RPP_DeliveryMarker setMarkerTextLocal "Delivery Mission!";

	_msg = format ["Delivery mission at grid: %1",mapGridPosition getmarkerpos RPP_Delivery_place];
	_color = RPP_Green;
	[_msg,_color] call RPP_MessageSystem;

	RPP_Delivery_Action = player addAction ["Cancel Current Delivery",{[] call RPP_Delivery_Cancel}];

	[] call RPP_Delivery_Finish;
}] call RPP_Function;
publicVariable "RPP_Delivery_Get";

["RPP_Delivery_Cancel", {
	if (!(RPP_Delivery_Job)) exitWith {
		_msg = "You don't have any deliverys";
		_color = RPP_Red;
		[_msg,_color] call RPP_MessageSystem;
	};

	RPP_Delivery_Job = false;
	RPP_Delivery_Pay = 0;
	deleteMarker RPP_DeliveryMarker;
	player removeAction RPP_Delivery_Action;
	["Delivery Package",1] call RPP_Inventory_Remove;

	_msg = "Delivery canceled!";
	_color = RPP_Green;
	[_msg,_color] call RPP_MessageSystem;
}] call RPP_Function;
publicVariable "RPP_Delivery_Cancel";

["RPP_Delivery_Finish", {
	while {RPP_Delivery_Job} do {
		if (player distance (getMarkerPos RPP_Delivery_place) < 15) exitWith {
			[RPP_Delivery_Pay] call RPP_AntiCheat_AddMoney;
			_msg = format ["You got paid %1$ for your delivery",RPP_Delivery_Pay];
			_color = RPP_Green;
			[_msg,_color] call RPP_MessageSystem;

			RPP_Delivery_Job = false;
			RPP_Delivery_Pay = 0;
			deleteMarker RPP_DeliveryMarker;
			player removeAction RPP_Delivery_Action;
			["Delivery Package",1] call RPP_Inventory_Remove;
		};
		sleep 0.5;
	};
}] call RPP_Function;
publicVariable "RPP_Delivery_Finish";

["RPP_IlligalDelivery_Get", {
	if (RPP_Delivery_Job) exitWith {
		_msg = "Please finish your current delivery mission first or cancel it.";
		_color = RPP_Red;
		[_msg,_color] call RPP_MessageSystem;
	};

	RPP_Delivery_Job = true;
	RPP_Delivery_place = RPP_Delivery_Markers call bis_fnc_selectrandom;
	RPP_Delivery_Pay = round(player distance getmarkerpos RPP_Delivery_place);
	RPP_Delivery_Pay = RPP_Delivery_Pay + RPP_Delivery_Pay;
	["Illigal Delivery Package",1] call RPP_Inventory_Add;

	RPP_DeliveryMarker = createMarkerLocal ["RPP_Delivery",getMarkerPos RPP_Delivery_place];
	RPP_DeliveryMarker setMarkerColorLocal "ColorRed";
	RPP_DeliveryMarker setMarkerTypeLocal "mil_warning";
	RPP_DeliveryMarker setMarkerTextLocal "Illigal Delivery Mission!";

	_msg = format ["Illigal Delivery mission at grid: %1",mapGridPosition getmarkerpos RPP_Delivery_place];
	_color = RPP_Green;
	[_msg,_color] call RPP_MessageSystem;

	RPP_Delivery_Action = player addAction ["Cancel Current Delivery",{[] call RPP_IlligalDelivery_Cancel}];

	[] call RPP_IlligalDelivery_Finish;
}] call RPP_Function;
publicVariable "RPP_IlligalDelivery_Get";

["RPP_IlligalDelivery_Cancel", {
	if (!(RPP_Delivery_Job)) exitWith {
		_msg = "You don't have any deliverys";
		_color = RPP_Red;
		[_msg,_color] call RPP_MessageSystem;
	};

	RPP_Delivery_Job = false;
	RPP_Delivery_Pay = 0;
	deleteMarker RPP_DeliveryMarker;
	player removeAction RPP_Delivery_Action;
	["Illigal Delivery Package",1] call RPP_Inventory_Remove;

	_msg = "Illigal Delivery canceled!";
	_color = RPP_Green;
	[_msg,_color] call RPP_MessageSystem;
}] call RPP_Function;
publicVariable "RPP_IlligalDelivery_Cancel";

["RPP_IlligalDelivery_Finish", {
	while {RPP_Delivery_Job} do {
		if (player distance (getMarkerPos RPP_Delivery_place) < 15) exitWith {
			[RPP_Delivery_Pay] call RPP_AntiCheat_AddMoney;
			_msg = format ["You got paid %1$ for your Illigal delivery",RPP_Delivery_Pay];
			_color = RPP_Green;
			[_msg,_color] call RPP_MessageSystem;

			RPP_Delivery_Job = false;
			RPP_Delivery_Pay = 0;
			deleteMarker RPP_DeliveryMarker;
			player removeAction RPP_Delivery_Action;
			["Illigal Delivery Package",1] call RPP_Inventory_Remove;
		};
		sleep 0.5;
	};
}] call RPP_Function;
publicVariable "RPP_IlligalDelivery_Finish";