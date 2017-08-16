/*
Script File Author: Repentz
Script File Mod: Life Server
Script File: RPP_Repo.sqf

Description:
Tow Trucking
*/
["RPP_Repo_TakeJob", {
	if (!(RPP_Job_Type isEqualTo "")) exitWith {
		_msg = "Please leave your current Job first.";
		_color = RPP_Red;
		[_msg,_color] call RPP_MessageSystem;
	};
	if (!(RPP_IsCiv)) exitWith {
		_msg = "You have to be Off-Duty before you are able to become a Repo Driver.";
		_color = RPP_Red;
		[_msg,_color] call RPP_MessageSystem;
	};
	if (!(["Job Contract"] call RPP_Inventory_Count == 0)) exitWith {
		["Job Contract",1] call RPP_Inventory_Remove;
	};

	RPP_Job_Type = "Repo Driver";
	
	["Impound lot Remote Key",1] call RPP_Inventory_Add;
	["Job Contract",1] call RPP_Inventory_Add;
	["Towing",1] call RPP_Inventory_Add;

	_msg = format ["%1 Your Current Job Is Now A %2, You Are Now Able To Open The Impound Lot By Using The Impound Lot Remote Key You Have Got In Your Inventory",name player,RPP_Job_Type];
	_color = RPP_Green;
	[_msg,_color] call RPP_MessageSystem;
}] call RPP_Function;
publicVariable "RPP_Repo_TakeJob";

["RPP_Job_Leave", {
	private ["_JobType"];
	_JobType = RPP_Job_Type;

	if (_JobType == "") exitWith {
		_msg = "You Don't Work For Anything, You Are Not Able To Leave The Job";
		_color = RPP_Red;
		[_msg,_color] call RPP_MessageSystem;
	};

	switch (_JobType) do { 
		case "Repo Driver": {
			["Impound lot Remote Key",1] call RPP_Inventory_Remove;
			["Job Contract",1] call RPP_Inventory_Remove;
			["Towing",1] call RPP_Inventory_Remove;

			_msg = format ["You Left Your Job As A %1",RPP_Job_Type];
			_color = RPP_Red;
			[_msg,_color] call RPP_MessageSystem;
			RPP_Job_Type = "";
		}; 
		default {
			_msg = format ["You Left Your Job As A %1",RPP_Job_Type];
			_color = RPP_Red;
			[_msg,_color] call RPP_MessageSystem;
			RPP_Job_Type = "";
		}; 
	};
}] call RPP_Function;
publicVariable "RPP_Job_Leave";

["RPP_Repo_TowVehicle", {
	private ["_target"];
	["Towing",1] call RPP_Inventory_Add;
	if (!(RPP_Repo_Towing)) then {
		_target = cursorTarget;

		if (!(_target isKindOf "Car")) exitWith {
			_msg = "You Are Not Able To Tow This Vehicle";
			_color = RPP_Red;
			[_msg,_color] call RPP_MessageSystem;
		};
		if (player distance _target > 15) exitWith {
			_msg = "You Are To Far Away From The Vehicle";
			_color = RPP_Red;
			[_msg,_color] call RPP_MessageSystem;
		};
		if ((locked _target) == 2) exitWith {
			_msg = "You Are Not Allowed To Tow Locked Vehicles!";
			_color = RPP_Red;
			[_msg,_Color] call RPP_MessageSystem;
		};

		RPP_Repo_TowCar = _target;
		RPP_Repo_TowCar setVariable ["RPP_Repo",_target,true];
		RPP_Repo_TowCar setVariable ["RPP_Repo_By",getPlayerUID player,true];

		_msg = "Successfully Selected The Vehicle To Tow, Please Select Your Tow Truck Now";
		_color = RPP_Yellow;
		[_msg,_color] call RPP_MessageSystem;

		RPP_Repo_Towing = true;
	} else {
		[] call RPP_Repo_TowVehicle_Tow;
	};
}] call RPP_Function;
publicVariable "RPP_Repo_TowVehicle";

["RPP_Repo_TowVehicle_Tow", {
	private ["_TowTrucks","_TowTruck","_Type","_RepoCar"];
	_TowTrucks = ["shounka_a3_dafxf_euro6_f"];
	_TowTruck = cursorTarget;
	_Type = typeof _TowTruck;
	_RepoCar = RPP_Repo_TowCar getVariable "RPP_Repo";

	if (!(RPP_Repo_Towing)) exitWith {
		_msg = "Failed to Tow Vehicle, Please Try Again.";
		_color = RPP_Red;
		[_msg,_color] call RPP_MessageSystem;
	};
	if (!(_TowTruck isKindOf "Car")) exitWith {
		_msg = "That Is Not A Tow Truck";
		_color = RPP_Red;
		[_msg,_color] call RPP_MessageSystem;
	};
	if (!(_Type in _TowTrucks)) exitWith {
		_msg = "That Is Not A Tow Truck";
		_color = RPP_Red;
		[_msg,_color] call RPP_MessageSystem;
	};
	if (RPP_Repo_CarOn) exitWith {
		switch (_Type) do { 
			case "shounka_a3_dafxf_euro6_f": {
				RPP_Repo_TowCar attachto [cursorTarget,[0,-10,-1.2]]; 
			}; 
		};
		detach RPP_Repo_TowCar;
		RPP_Repo_CarOn = false;
		RPP_Repo_Towing = false;
		_TowTruck setVariable ["RPP_IsTowingVehicle",false,true];
	};
	if (_RepoCar == _TowTruck) exitWith {
		_msg = "You May Not Tow The Same Vehicle.";
		_color = RPP_Red;
		[_msg,_color] call RPP_MessageSystem;
	};
	if (player distance _TowTruck > 15) exitWith {
		_msg = "You Are To Far Away From The Tow Truck";
		_color = RPP_Red;
		[_msg,_color] call RPP_MessageSystem;
	};
	if (_TowTruck distance RPP_Repo_TowCar > 15) exitWith {
		_msg = "Your Tow Truck Is To far Away From The Vehicle";
		_color = RPP_Red;
		[_msg,_color] call RPP_MessageSystem;
	};
	if (_TowTruck getVariable "RPP_IsTowingVehicle") exitWith {
		_msg = "This Tow Truck Is Already Towing A Vehicle";
		_color = RPP_Red;
		[_msg,_color] call RPP_MessageSystem;
	};

	_TowTruck setVariable ["RPP_IsTowingVehicle",true,true];
	RPP_Repo_CarOn = true;
	switch (_Type) do { 
		case "shounka_a3_dafxf_euro6_f": {
			RPP_Repo_TowCar attachto [_TowTruck,[0,-2,-1]];
		}; 
	};
	RPP_Repo_TowCar setVariable ["RPP_Repo_isTowing",true,true];

	_msg = "Towing Vehicle Successfully";
	_color = RPP_Green;
	[_msg,_color] call RPP_MessageSystem;
}] call RPP_Function;
publicVariable "RPP_Repo_TowVehicle_Tow";
