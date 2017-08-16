/*
Script File Author: Repentz
Script File Mod: Life Server
Script File: RPP_Use_Seed.sqf

Description:
farm drugs
*/
["RPP_Seed_Use",{
	private ["_seed","_plantTime","_plantClass","_PlantationField","_c"];
	_PlantationField = ["RPP_Plantation1","RPP_Plantation2","RPP_Plantation3","RPP_Plantation4"];
	_c = false;
	_seed = _this select 0;
	_plantTime = "";
	_plantClass = "";
	{
		if (_seed == _x select 0) exitWith {
			_plantTime = _x select 1;
			_plantClass = _x select 2;
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

	[[_plantClass,_plantTime,player,_seed], "RPP_Seed_Create_Global", true] call BIS_FNC_MP;

	_msg = format ["%1 Used.",_seed];
	_color = RPP_Red;
	[_msg,_color] call RPP_MessageSystem;
}] call RPP_Function;
publicVariable "RPP_Seed_Use";

["RPP_Seed_Create_Global", {
	private ["_plantClass","_plantTime","_player","_timeSleep","_plantHeight"];
	_plantClass = _this select 0; //class name
	_plantTime = _this select 1; //Plant grow time
	_player = _this select 2; //the player who plant it
	_seed = _this select 3; //Get the seed from the config to give the playe the right item
	/*
	*	Spawn plant and set the variables
	*/

	_Pos = 0.0001;
	_plant = createVehicle [ _plantClass, [ getPosATL _player, 2, getDir _player] call BIS_fnc_relPos, [], 0, 'CAN_COLLIDE' ];

	_plant setVariable ["RPP_Plant_GrowTime", _plantTime];
	_plant setVariable ["RPP_Can_Harvest", false];
	_plant setVariable ["RPP_Drug_Plant",_plant,true];
	_plant setVariable ["RPP_Plant_Seed",_seed,true];
	_plant setVariable ["RPP_Plant_Harvesting",false,true];
	_growTime = _plant getVariable "RPP_Plant_GrowTime";

	/*
		Start growing here :D
	*/

	_plant setpos [getpos _plant select 0,getpos _plant select 1,0];
	_plant setPos (_plant modelToWorld [0,0,-4]);
	sleep (_plantTime);
	_plant setPos (_plant modelToWorld [0,0,_Pos]);
	sleep (_plantTime);
	_plant setPos (_plant modelToWorld [0,0,_Pos]);

	/*
		Finished!
	*/
	_plant setVariable ["RPP_Can_Harvest",true,true];
	_plant addAction [ format ["Harvest %1",_seed], { [] call RPP_Seed_Harvest }];
}] call RPP_Function;
publicVariable "RPP_Seed_Create_Global";

["RPP_Seed_Harvest", {
	_plant = cursorTarget;
	_Seed = _plant getVariable "RPP_Plant_Seed";
	if (vehicle player != player) exitWith {
		_msg = "You are not allowed to use this while in a vehicle.";
		_color = RPP_Red;
		[_msg,_color] call RPP_MessageSystem;
		[_seed,1] call RPP_Inventory_Add;
	};
	if (!(_plant getVariable "RPP_Can_Harvest")) exitWith {
		_msg = "This plant is not ready for Harvest yet";
		_color = RPP_Red;
		[_msg,_color] call RPP_MessageSystem;
	};

	_item = ""; //define the variable so we get no error

	{
		if (_Seed == _x select 0) exitWith {
			_item = _x select 3; //item that will get added
		};
	} count RPP_Seed_Plant;
	if (player distance _plant < 5) exitWith {
		systemChat "Please get closer..";
	};
	if (_plant getVariable "RPP_Can_Harvest") then {
		//pick up the item
		if (_plant getVariable "RPP_Plant_Harvesting") exitWith {
			_msg = "Someone else is already Harvesting this plant!";
			_color = RPP_Red;
			[_msg,_color] call RPP_MessageSystem;
		};
		_obj = getPos player nearestObject "xcam_b_FicusC1s_F";
		deleteVehicle _obj;


		_plant setVariable ["RPP_Plant_Harvesting",true,true];
		player playmove 'AinvPknlMstpSnonWnonDnon_medic_1';
		[_item,1] call RPP_Inventory_Add;
		_msg = format ["Harvested one %1 plant",_item];
		_color = RPP_Yellow;
		[_msg,_color] call RPP_MessageSystem;
	} else {
		_msg = "Error 404 Object not found.";
		_color = RPP_Red;
		[_msg,_color] call RPP_MessageSystem;
	};
}] call RPP_Function;
publicVariable "RPP_Seed_Harvest";

["RPP_Obj_RemoveHarvest", {
	private ["_obj"];
	_obj = _this select 0;
	deleteVehicle _obj;
}] call RPP_Function;
publicVariable "RPP_Obj_RemoveHarvest";