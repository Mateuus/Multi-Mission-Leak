/*
Script File Author: Repentz
Script File Mod: Life Server
Script File: RPP_Use_Seed.sqf

Description:
farm drugs
*/
["RPP_Harvest_Dialog", {
	createDialog "RPP_Harvest";
	buttonSetAction[1600,"[] call RPP_Seed_Harvest;"];

	{
		_text = _x select 0;
		lbAdd[1500,format["%1",_text]];
	} foreach RPP_HarvestObj;
}] call RPP_Function;
publicVariable "RPP_Harvest_Dialog";

["RPP_Seed_Use",{
	private ["_seed","_plantTime","_plantClass","_PlantationField","_c"];
	_PlantationField = ["RPP_Plantation1","RPP_Plantation2","RPP_Plantation3","RPP_Plantation4"];
	_c = false;
	_seed = _this select 0;
	_plantTime = "";
	_plantClass = "";
	_placement = "";
	{
		if (_seed == _x select 0) exitWith {
			_plantTime = _x select 1;
			_plantClass = _x select 2;
			_placement = _x select 4;
		};
	} count RPP_Seed_Plant;

	{
		_marker = getMarkerPos _x;
		if (player distance _marker <= 50) exitWith {
			_c = true;
		};
	} count _PlantationField;
	if (!(_c)) exitWith {
		_msg = "You are not inside a Plantation Field!";
		_color = RPP_Red;
		[_msg,_color] call RPP_MessageSystem;
		[_seed,1] call RPP_Inventory_Add;
	};
	if (vehicle player != player) exitWith {
		_msg = "You are not allowed to use this while in a vehicle.";
		_color = RPP_Red;
		[_msg,_color] call RPP_MessageSystem;
		[_seed,1] call RPP_Inventory_Add;
	};

	_plant = _plantClass createVehicle (position player);
	[_plant,_plantTime,player,_seed,_placement] remoteExec ["RPP_Seed_Create_Global"];

	_msg = format ["%1 Used.",_seed];
	_color = RPP_Red;
	[_msg,_color] call RPP_MessageSystem;
}] call RPP_Function;
publicVariable "RPP_Seed_Use";

["RPP_Seed_Create_Global", {
	private ["_plantClass","_plantTime","_player","_timeSleep","_plantHeight"];
	_plant = _this select 0;
	_plantTime = _this select 1;
	_player = _this select 2;
	_seed = _this select 3;
	_placement = _this select 4;


	_Pos = 0.0001;

	_plant setVariable ["RPP_Plant_GrowTime", _plantTime];
	_plant setVariable ["RPP_Can_Harvest", false];
	_plant setVariable ["RPP_Drug_Plant",_plant,true];
	_plant setVariable ["RPP_Plant_Seed",_seed,true];
	_plant setVariable ["RPP_Plant_Harvesting",false,true];
	_plant setVariable ["RPP_Plant_delete",false,true];
	_growTime = _plant getVariable "RPP_Plant_GrowTime";

	_G_Seed = _plant getVariable "RPP_Plant_Seed";


	_plant setpos [getpos _plant select 0,getpos _plant select 1,0];
	_plant setPos (_plant modelToWorld [0,0,_placement]);
	sleep (_plantTime);
	_plant setPos (_plant modelToWorld [0,0,_Pos]);
	sleep (_plantTime);
	_plant setPos (_plant modelToWorld [0,0,_Pos]);

	RPP_HarvestObj = RPP_HarvestObj + [ [_G_Seed,_plant] ];

	systemChat format ["%1 is now ready for harvestting.",_seed];
	_plant setVariable ["RPP_Can_Harvest",true,true];

	[_plant] spawn {
		_plant = _This select 0;
		while {true} do {
			sleep 1;
			_Status = _plant getVariable "RPP_Plant_delete";
			if (_Status) exitWith {
				deleteVehicle _plant;
			};
		};
	};
}] call RPP_Function;
publicVariable "RPP_Seed_Create_Global";

["RPP_Seed_Harvest", {
	private ["_Array","_text","_plant","_msg","_color"];
	_Array = RPP_HarvestObj select (lbCurSel 1500);
	_text = _Array select 0;
	_plant = _Array select 1;

	if (player distance _plant > 10) exitWith {
		["You are to far away from the plant.",RPP_Red] call RPP_MessageSystem;
	};

	if (!(_plant getVariable "RPP_Can_Harvest")) exitWith {
		_msg = "This plant is not ready for Harvest yet";
		_color = RPP_Red;
		[_msg,_color] call RPP_MessageSystem;
	};

	if (_plant getVariable "RPP_Can_Harvest") then {
		if (_plant getVariable "RPP_Plant_Harvesting") exitWith {
			_msg = "Someone else is already Harvesting this plant!";
			_color = RPP_Red;
			[_msg,_color] call RPP_MessageSystem;
		};
		_item = "";
		{
			if (_text == _x select 0) exitWith {
				_item = _x select 3;
			};
		} count RPP_Seed_Plant;
		_plant setVariable ["RPP_Plant_Harvesting",true,true];
		player playmove 'AinvPknlMstpSnonWnonDnon_medic_1';

		_msg = format ["Harvested one %1 plant",_item];
		_color = RPP_Yellow;
		[_msg,_color] call RPP_MessageSystem;

		[_item,1] call RPP_Inventory_Add;

		_plant setVariable ["RPP_Plant_Harvesting",false,true];
		_plant setVariable ["RPP_Plant_delete",true,true];
		deleteVehicle _plant;

		RPP_HarvestObj = RPP_HarvestObj - [_Array];
		closeDialog 1;
	} else {
		_msg = "Error 404 Object not found.";
		_color = RPP_Red;
		[_msg,_color] call RPP_MessageSystem;
	};
}] call RPP_Function;
publicVariable "RPP_Seed_Harvest";
