/*
Script File Author: Repentz
Script File Mod: Life Server
Script File: RPP_CarJack.sqf

Description:
For unflipping vehicles
*/
["RPP_CarJack_Use", {
	private ["_car","_msg","_color"];
	_car = cursorTarget;
	if (!(_car isKindOf "LandVehicle")) exitWith {
		_msg = "This is not a vehicle.";
		_color = RPP_Red;
		[_msg,_color] call RPP_MessageSystem;
	};
	if (player distance _car > 5) exitWith {
		_msg = "You need to be closer.";
		_color = RPP_Red;
		[_msg,_color] call RPP_MessageSystem;
	};

	_car setVectorUp [0,0,1];
	["Vehicle Jack",1] call RPP_Inventory_Add;

	_msg = "Vehicle unflipped.";
	_color = RPP_Green;
	[_msg,_color] call RPP_MessageSystem;
}] call RPP_Function;
publicVariable "RPP_CarJack_Use";
