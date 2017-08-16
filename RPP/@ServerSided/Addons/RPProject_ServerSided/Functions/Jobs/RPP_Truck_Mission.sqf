/*
*	Truck Mission Get
*   Takes 2 parmas
*  	_type == leagl/illeagl.
*   _spawn == a marker point to spawn the car on and to act as the starting yard.
*   [_type, _spawn] call RPP_TruckMissionGet;
*/
["RPP_TruckMissionGet", {
	private["_spawnMarker","_type","_spawn","_drops","_validDrops","_selectedDrop","_nearVehicles","_canStore","_deliveryTruck","_task"];
	_type =  _this select 0; /* Leagl / Illegal */
	_spawnMarker = _this select 1;
	_spawn = getMarkerPos _spawnMarker;

	/* Can the player store this vehicle? */
	_canStore = false;

	/* If they allready have a mission in progress exit */
	if (player getVariable "RPP_TruckMissionActive") exitWith {};
	if (!(RPP_IsCiv)) exitWith{ 			
		_msg = "You need to be off duty!";
		_color = RPP_Red;
		[_msg,_color] call RPP_MessageSystem;
	};

	/* Array of all possible delivery points (markers)*/
	_drops = ["A_Marker","B_Marker","C_Marker","D_Marker","E_Marker","F_Marker","G_Marker"];

	/* Remove the point where they got this mission from the list */
	_validDrops = _drops - [str(_spawnMarker)];

	/* Select an item from the list */
	_selectedDrop = _validDrops call BIS_fnc_selectRandom;

	player setVariable ["RPP_TruckMissionActive", true];
	player setVariable ["RPP_TruckMission_Task", call compile format ["%1", _selectedDrop]];

	_nearVehicles = nearestObjects[getPos (_this select 0),["Car","Air"],30];
	if(count _nearVehicles > 0) then
	{
		{
			private["_vehOwners"];
			_vehOwners = _x getVariable "RPP_Vehicle_Owners";
			if(count _vehOwners  > 0) then
			{
				{
					if (_x == getPlayerUID player) exitWith {
						_canStore = true;	
					};
				} count _vehOwners;
			};
		} foreach _nearVehicles;
	};

	if (_canStore) then {
		// I dont know your car storage code but this is where it would go.
	};

	sleep 2;

	/* Setup the truck */
	_deliveryTruck = "SOME CLASS NAME" createVehicle _spawn;
	_deliveryTruck setVectorUp (surfaceNormal _spawn);
	_deliveryTruck setPos _spawn;
	clearWeaponCargo _deliveryTruck;

	_deliveryTruck setVariable ["RPP_TruckMission_Start", _spawnMarker];
	_deliveryTruck setVariable ["RPP_TruckMission_Finsih", _selectedDrop];
	_deliveryTruck setVariable ["RPP_TruckMission_Driver", getPlayerUID player];

	/*
	* TODO: assign veh number plate
	* [_deliveryTruck, player, 0] call RPP_Licenseplate_Create;
	*/

	switch (_type) do {
		case "legal": {
			_deliveryTruck setVariable ["RPP_TruckMission_Type", "legal"];
		};
		case "illegal": {
			_deliveryTruck setVariable ["RPP_TruckMission_Type", "illegal"];

			_msg = "You have an illegal cargo make sure the cops dont catch you other wise this load is worthless!";
			_color = RPP_Red;
			[_msg,_color] call RPP_MessageSystem;

			//Add code here to add a criminal record to the player until they have deliver the truck
		};
	};

	/* Setup the task */
	_task = player createSimpleTask [format["RPP_TruckMission_%1_Dest_%2",_type,_selectedDrop]];
	_task setSimpleTaskDescription [format["Deliver this truck to the %1 truck depot.",toUpper _selectedDrop],"Truck Delivery","Truck Delivery"];
	_task setTaskState "Assigned";
	_task setSimpleTaskDestination (getPos _selectedDrop);
	player setCurrentTask _task;

	[_deliveryTruck] spawn {
		_watchTruck = _this select 0;
		waitUntil {!(getVariable "RPP_TruckMissionActive") OR !alive player OR !alive _watchTruck};
		if(getVariable "RPP_TruckMissionActive" == false) then
		{
			if(!alive player) then
			{
				_mission = currentTask player;
				_mission setTaskState "Failed";
				player removeSimpleTask _mission;
				["DeliveryFailed",["You failed to deliver the truck because you died."]] call BIS_fnc_showNotification; //TODO: change to rpp message system
				player setVariable ["RPP_TruckMissionActive", false];
				player setVariable ["RPP_TruckMission_Task", nil];
			};

			if(!alive _truckToWatch) then
			{
				_mission = currentTask player;
				_mission setTaskState "Failed";
				player removeSimpleTask _mission;
				["DeliveryFailed",["Truck was destroyed or impounded by the police. Mission Failed!"]] call BIS_fnc_showNotification; //TODO: change to rpp message system
				player setVariable ["RPP_TruckMissionActive", false];
				player setVariable ["RPP_TruckMission_Task", nil];
			};
		};
	};
}] call RPP_Function;
publicVariable "RPP_TruckMissionGet";

/*
*	Truck Mission Finish
*   Takes 1 parma
*   _spawn == a marker point of where the truck is being delivered.
*   [_spawn] call RPP_TruckMissionFin;
*/
["RPP_TruckMissionFin", {
	private ["_finishMarker","_nearVehicles","_truck","_distance"];
	_finishMarker = _this select 0;

	_nearVehicles = nearestObjects[getPos (_this select 0),["Car","Air"],30];
	if(count _nearVehicles > 0) then
	{
		{
			if (_x getVariable "RPP_TruckMission_Driver" isEqualTo getPlayerUID player) then {
				_truck = _x;
			};
		} foreach _nearVehicles;
	};

	if (!isNil _truck) {
		/* Get the variables from the truck */
		_startPos = _truck getVariable "RPP_TruckMission_Start";
		_finishPos = _truck getVariable "RPP_TruckMission_Finsih";
		_missionType = _truck getVariable "RPP_TruckMission_Type";
		_distance = round((getMarkerPos _startPos) distance (getMarkerPos _finishPos));

		if (_finishMarker != _finishPos) exitWith { 
			_msg = "Sorry this isnt the place this truck was ment to be delivered to!";
			_color = RPP_Red;
			[_msg,_color] call RPP_MessageSystem;
		}; 

		switch (_missionType) do {
			case "leagl": {
				_reward = round (2.5 * _distance);
			};

			case "illeagl": {
				_reward = round (4 * _distance);
				//If they had a criminal record added for this remove it?
			};
		};
		deleteVehicle _truck;

		[_reward] call RPP_AntiCheat_AddMoney;
		player setVariable ["RPP_TruckMissionActive", false];
		player setVariable ["RPP_TruckMission_Task", nil];		
	} else {
		hint "ERROR MESSAGE HERE";
	};
}] call RPP_Function;
publicVariable "RPP_TruckMissionFin";