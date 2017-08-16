/*
	Darkside Life

	Author: Shawn "Huntah" Macgillivray

	Description:
	Actives rebel missions
*/

private ["_missionIndex","_counterPos","_playerPos","_dead","_pass","_payment","_action","_bang","_carPickupArray","_carDropArray","_vehicleArray","_sp","_typeOfVeh","_vehicle","_vehPos","_counter","_explosion","_str","_tempNum","_vehType","_className","_endPoint","_group","_reward"];

_missionIndex = DS_className;

if(isNil "DS_rebelMission")then{DS_rebelMission = false};
if(DS_rebelMission)exitWith{hint "You already have a rebel mission active";};
if((!DSL_rebel)&&(!DSL_rebelAdv))exitWith{hint "You must have Rebel training to begin this mission";};

DS_rebelMission = true;

_counterPos = 0;
_playerPos = (getPos player);
_dead = false;
_pass = false;
_counter = if((DS_infoArray select 17) > 22)then{85}else{170};

//Car bombs
if(_missionIndex isEqualTo "0")then {
	_payment = 200000;
	if(DS_realMode)then{_payment = (_payment*1.5);};

	_action = [
		format ["Starting a car bomb mission cost a $50k deposit, upon completion you will be paid $%1. If you use a helicopter to carry the rigged vehicle, the police may destroy your chopper. Continue?",[_payment] call DS_fnc_numberText],
		"Car Bomb",
		"Continue",
		"No Thanks"
	] call BIS_fnc_guiMessage;
	if(!_action)exitWith{};

	if([50000,true] call DS_fnc_checkMoney)exitWith{hint "You do not have $50k in your bank to begin this mission";};
	[50000,true,false] call DS_fnc_handleMoney;

	_bang = false;
	_carPickupArray = ["jobMarker7","jobMarker9","jobMarker30","jobMarker1","jobMarker54","jobMarker2","jobMarker14","jobMarker15","wlJob9","jobMarker24","jobMarker16","jobMarker18","jobMarker19","jobMarker33","jobMarker20","jobMarker22","jobMarker23"];
	_carDropArray = ["Gas1_1_1_2_1_1_1_1_1","Police CP_1_1_1_1","Gas1_1_1_2_1","skydiving_2","Gas1_1_1_2","Gas1","Police CP_1_1","Gas1_1_1"];
	_vehicleArray = ["I_G_Offroad_01_F","C_Offroad_01_F"];
	_markerPos = getMarkerPos (selectRandom _carPickupArray);

	player removeSimpleTask DS_carBombTask;
	DS_carBombTask = player createSimpleTask ["carBombTask"];
	DS_carBombTask setSimpleTaskDescription ["Pick up your rigged vehicle from the marked location","Rigged Vehicle","Pick up rigged vehicle"];
	DS_carBombTask setSimpleTaskDestination _markerPos;
	DS_carBombTask setTaskState "Assigned";
	player setCurrentTask DS_carBombTask;

	systemChat "Your job is to go and pick up a rigged vehicle, then drive it to a location we will then give you. The rigged vehicle is marked on your map";
	hint "Your job is to go and pick up a rigged vehicle, then drive it to a location we will then give you. The rigged vehicle is marked on your map";

	DS_currentTask1 = "Car Bomb - Phase One";
	DS_currentTask2 = "You must travel to the rigged vehicle marked on your map. You may either then drive it, or air lift it";

	while{true}do {
		if(player distance _markerPos < 200)exitWith{};
		if(!alive player)exitWith{};
		sleep 10;
	};

	if(!alive player)exitWith{DS_rebelMission = false;player removeSimpleTask DS_carBombTask;DS_currentTask1 = "";};

	_sp = _markerPos;
	_typeOfVeh = (selectRandom _vehicleArray);
	_vehicle = _typeOfVeh createVehicle _sp;
	_vehicle setVariable ["carBomb",true,true];
	_vehicle lock 2;
	_vehicle setVariable ["vehicle_owners",[[getPlayerUID player,profileName,player]],true];
	DS_keyRing pushBack _vehicle;

	while{true}do {
		if(!alive _vehicle)exitWith{};
		if(!alive player)exitWith{};
		if(player distance _vehicle < 10)exitWith{};
		sleep 5;
	};

	player removeSimpleTask DS_carBombTask;

	if(!alive player)exitWith{DS_rebelMission = false;DS_currentTask1 = "";};
	if(!alive _vehicle)exitWith{hint "You failed because the rigged vehicle was destroyed";player say3D "fail";DS_rebelMission = false;DS_currentTask1 = "";};

	[0,format ["~~Special Police Warning~~ Intelligence suggests there is a Rebel named %1 driving around Altis in a vehicle rigged to explode!",name player],false,0] remoteExecCall ["DS_fnc_globalMessage",west];
	systemChat "Great there is the vehicle, now drive carefully to one of the locations marked on your map";
	hint "Great there is the vehicle, now drive carefully to one of the locations marked on your map";

	DS_currentTask1 = "Car Bomb - Phase Two";
	DS_currentTask2 = "You must take the rigged vehicle to the marked detonation point on your map. Once there you will need to leave the vehicle close the marker and stay near it until the countdown ends";

	_markerPos = getMarkerPos (selectRandom _carDropArray);
	player removeSimpleTask DS_carBombTask;
	DS_carBombTask = player createSimpleTask ["carBombTask"];
	DS_carBombTask setSimpleTaskDescription ["Take the rigged vehicle to the marked detonation point","Detonation Point",""];
	DS_carBombTask setSimpleTaskDestination _markerPos;
	DS_carBombTask setTaskState "Assigned";
	player setCurrentTask DS_carBombTask;

	sleep 30;

	while{true}do {
		if(!alive _vehicle)exitWith{};
		if(!alive player)exitWith{};
		if(DS_jailed)exitWith{};
		if(_vehicle distance _markerPos < 10)then{_bang = true;};
		if(_bang)exitWith{};
		sleep 10;
	};

	player removeSimpleTask DS_carBombTask;

	if(!alive player)exitWith{DS_rebelMission = false;DS_currentTask1 = "";};
	if(!alive _vehicle)exitWith{hint "You failed because the rigged vehicle was destroyed";player say3D "fail";DS_rebelMission = false;DS_currentTask1 = "";};

	if(_bang)then {
		if((DS_infoArray select 17) > 22)then {
			hint "Bomb Armed! It will detonate in 1 1/2 minutes, remain in the area and dont move the vehicle otherwise you will fail the mission!\n\nYou must remain within 100m of the car bomb during this time";
			systemChat "Bomb Armed! It will detonate in 1 1/2 minutes, remain in the area and dont move the vehicle otherwise you will fail the mission! You must remain within 100m of the car bomb during this time";
			DS_currentTask1 = "Car Bomb - Phase Three";
			DS_currentTask2 = "You must remain close to the car bomb until the explosion";
		} else {
			hint "Bomb Armed! It will detonate in 3 minutes, remain in the area and dont move the vehicle otherwise you will fail the mission!\n\nYou must remain within 100m of the car bomb during this time";
			systemChat "Bomb Armed! It will detonate in 3 minutes, remain in the area and dont move the vehicle otherwise you will fail the mission!You must remain within 100m of the car bomb during this time";
			DS_currentTask1 = "Car Bomb - Phase Three";
			DS_currentTask2 = "You must remain close to the car bomb until the explosion";
		};

		sleep 10;

		_vehPos = (getPos _vehicle);

		while{true}do {
			hintSilent format ["Car bomb will explode in %1 seconds",_counter];
			_counter = _counter - 1;
			sleep 1;
			if(_vehPos distance (getPos _vehicle) > 50)exitWith{};
			if(_counter isEqualTo 0)exitWith{};
			if(!alive player)exitWith{};
			if(player distance _vehicle > 100)exitWith{};
		};

		if(!alive player)exitWith{DS_rebelMission = false;DS_currentTask1 = "";};
		if(_vehPos distance (getPos _vehicle) > 50)exitWith{hint "You failed the mission because the vehicle moved";player say3D "fail";DS_rebelMission = false;DS_currentTask1 = "";};
		if(player distance _vehicle > 100)exitWith{hint "You failed the mission because you went too far from the vehicle";player say3D "fail";DS_rebelMission = false;DS_currentTask1 = "";};

		_sp = (getPos _vehicle);
		_explosion = "M_PG_AT" createVehicle _sp;
		sleep 0.1;
		_explosion = "M_PG_AT" createVehicle _sp;
		sleep 0.1;
		_explosion = "M_PG_AT" createVehicle _sp;
		sleep 0.1;
		_vehicle setDamage 1;

		[1,format ["~~Altis News Broadcast~~ A Car Bomb has just been activated by %1!",name player]] remoteExecCall ["DS_fnc_globalMessage",west];
		sleep 5;

		if((DS_infoArray select 17) > 39)then{_payment = (_payment*2);};
		systemChat format ["Good job, you will be paid $%1 upon returning to the mission provider",[_payment] call DS_fnc_numberText];
		hint format ["Good job, you will be paid $%1 upon returning to the mission provider",[_payment] call DS_fnc_numberText];

		DS_currentTask1 = "Car Bomb - Final Phase";
		DS_currentTask2 = "You must return to the outpost where you began this job to receive payment";

		while{true}do {
			if(player distance _playerPos < 5)exitWith{};
			if(!alive player)exitWith{};
			if(DS_jailed)exitWith{};
			sleep 10;
		};

		if(!alive player)exitWith{DS_rebelMission = false;DS_currentTask1 = "";};
		if(DS_jailed)exitWith{DS_rebelMission = false;DS_currentTask1 = "";};

		hint format ["Great work, here is $%1 for your efforts, come back any time for another job!",[_payment] call DS_fnc_numberText];
		systemChat format ["Great work, here is $%1 for your efforts, come back any time for another job!",[_payment] call DS_fnc_numberText];
		[_payment,false,true] call DS_fnc_handleMoney;
		DS_rebelMission = false;

		if(DS_tokenMission == 5)then {
			DS_tokenMission = -1;
			[60,name player,false] spawn DS_civ_payTokens;
			DS_rebelMissionToken = false;
		};

		sleep 10;
		if((DS_infoArray select 17) == 4)then{[2] call DS_fnc_questCompleted};
		if((DS_infoArray select 17) == 39)then {
			_tempNum = (DS_infoArray select 18) + 1;
			if(_tempNum > 4)then {
				[2] call DS_fnc_questCompleted;
			} else {
				DS_infoArray set [18,_tempNum];
			};
		};
	};
};

if(_missionIndex isEqualTo "5")then {
	if(DS_policeBusy)exitWith{hint "Can not begin this at this time, too many other rebel activities are currently active, please try again in 5 minutes";};
	if(!([5] call DS_fnc_countPlayers))exitWith {
		_str = parseText "<t color='#FF0000' size='1.5'><br/>You can not start this mission with fewer than 5 white-listed cops online!<br/></t>";
		hint _str;
	};

	_action = [
		"Starting a terrorist mission cost $1.5m and involves travelling to a given destination within 30 minutes and staying in the area for 3 minutes to detonate a large bomb. You will be paid $5m when it blows",
		"Terrorist Mission",
		"Continue",
		"No Thanks"
	] call BIS_fnc_guiMessage;
	if(!_action)exitWith{};

	_action = [
		"The police will be warned about this mission and its destination immediately, You will learn the location in 5 minutes. So it's the job of your group to secure the blast area before placing the bomb. Dying or being jailed will cancel the mission!",
		"Terrorist Mission",
		"Start",
		"No Thanks"
	] call BIS_fnc_guiMessage;
	if(!_action)exitWith{};

	sleep (random 3);

	if(DS_policeBusy)exitWith{hint "Can not begin this at this time, too many other rebel activities are currently active, please try again in 5 minutes";};
	if([1500000,true] call DS_fnc_checkMoney)exitWith{hint "You do not have $1.5 in your bank to begin this mission";};
	[1500000,true,false] call DS_fnc_handleMoney;

	[player] remoteExec ["HUNT_fnc_terrorist",2];

	systemChat "Your jobs location will be given to you in approximately five minutes, prepare and wait...";
	hint "Your jobs location will be given to you in approximately five minutes, prepare and wait...";

	DS_currentTask1 = "Terrorist Mission - Phase One";
	DS_currentTask2 = "You must wait until the location of your terrorist mission is available, the police already know the location and will be setting up their defence now";

	[] call DS_fnc_compileData;
};

if(_missionIndex in ["1","2","3"])then {
	if(!([3] call DS_fnc_countPlayers))exitWith {
		_str = parseText "<t color='#FF0000' size='1.5'><br/>You can not start this mission with fewer than 3 white-listed cops online!<br/></t>";
		hint _str;
	};

	_endPoint = if((DS_spawnPoint select 0) == "reb_v_1")then{["Rebelop_2_1","Rebel South"]}else{["Rebelop_2_2","Rebel North"]};

	switch(_missionIndex)do {
		case "1": {
			if((DS_infoArray select 17) < 34)then {
				_endPoint pushBack 2000000;
			} else {
				_endPoint pushBack 1000000;
			};

			_endPoint pushBack "Unarmed Thermal Enabled Strider";
		};
		case "2": {
			if((DS_infoArray select 17) < 34)then {
				_endPoint pushBack 2000000;
			} else {
				_endPoint pushBack 1000000;
			};

			_endPoint pushBack "Unarmed Thermal Enabled Hellcat";
		};
		case "3": {
			if((DS_infoArray select 17) < 34)then {
				_endPoint pushBack 4000000;
			} else {
				_endPoint pushBack 2000000;
			};

			_endPoint pushBack "Armed Strider";
		};
	};

	_action = [
		format ["This is a high risk mission that cost $%1 to start, the server will be informed that someone has began this mission. Upon completion you will awarded with a %2. You must drive the convoy truck to %3, Would you like to begin?",[_endPoint select 2] call DS_fnc_numberText,_endPoint select 3,_endPoint select 1],
		"Rebel Convoy",
		"Yes",
		"No"
		] call BIS_fnc_guiMessage;
	if(!_action)exitWith{};

	_action = [
		"Air Lifting your convoy will cause it to blow up. Understand?",
		"Warning",
		"Yes",
		"No"
		] call BIS_fnc_guiMessage;
	if(!_action)exitWith{};

	if([(_endPoint select 2),true] call DS_fnc_checkMoney)exitWith{hint "You do not have enough money in your bank to begin this mission";};
	if(count (nearestObjects [(getMarkerPos (DS_spawnPoint select 0)),["Car","Ship","Air"],15]) != 0)exitWith{hint "There is a vehicle blocking the spawn point";};
	[(_endPoint select 2),true,false] call DS_fnc_handleMoney;

	if(DS_item_convoy == 0)then {
		[0,"A Rebel Convoy has been spotted moving around Altis, it's location will be travelling between the two Rebel Outpost",false,1] remoteExecCall ["DS_fnc_globalMessage",west];
	} else {
		["convoy",false,1] call DS_fnc_handleInventory;
	};

	[] call DS_fnc_compileData;

	systemChat format ["You must now drive your convoy vehicle to %1 and keep it there for 1 minute for the mission to complete",(_endPoint select 1)];
	hint format ["You must now drive your convoy vehicle to %1 and keep it there for 1 minute for the mission to complete",(_endPoint select 1)];

	//Spawn in convoy vehicle
	_vehicle = createVehicle ["O_Truck_02_transport_F",(getMarkerPos (DS_spawnPoint select 0)),[],0,"NONE"];
	waitUntil {!isNil "_vehicle";};
	_vehicle allowDamage false;
	_vehicle setDir (markerDir (DS_spawnPoint select 0));
	_vehicle setPos (getMarkerPos (DS_spawnPoint select 0));
	_vehicle allowDamage true;

	clearWeaponCargoGlobal _vehicle;
	clearMagazineCargoGlobal _vehicle;
	clearItemCargoGlobal _vehicle;

	_vehicle setVariable ["vehicle_owners",[[getPlayerUID player,profileName,player]],true];
	DS_keyRing pushBack _vehicle;

	_vehicle setVariable ["boot_open",false,true];
	_vehicle setVariable ["convoy_truck",true,true];

	switch(_missionIndex)do {
		case "1": { //Unarmed Strider
			_veh = "I_MRAP_03_F" createVehicle [0,0,0];
			_veh attachTo [_vehicle,[0,-0.92,0]];
			_veh setVectorUp [0,0,-30];
			_veh setDamage 0.9;
			_veh setHitPointDamage ["HitLFWheel",1];
			_veh setHitPointDamage ["HitLF2Wheel",1];
			_veh setHitPointDamage ["HitRFWheel",1];
			_veh lock 2;
			_veh setVariable ["convoyCargo",true,true];

			_vehType = "Car";
			_className = "I_MRAP_03_F";
		};
		case "2": { //Thermal Hellcat
			_veh = "I_Heli_light_03_unarmed_F" createVehicle [0,0,0];
			_veh attachTo [_vehicle,[0,0,1.2]];
			_veh setVectorUp [0,0,0];
			_veh setDamage 0.9;
			_veh setHitPointDamage ["HitLFWheel",1];
			_veh setHitPointDamage ["HitLF2Wheel",1];
			_veh setHitPointDamage ["HitRFWheel",1];
			_veh lock 2;
			_veh setDir 180;
			_veh setVariable ["convoyCargo",true,true];

			_vehType = "Air";
			_className = "I_Heli_light_03_unarmed_F";
		};
		case "3": { //Armed Strider
			_veh = "I_MRAP_03_F" createVehicle [0,0,0];
			_veh attachTo [_vehicle,[0,-0.92,0]];
			_veh setVectorUp [0,0,-30];
			_veh setDamage 0.9;
			_veh setHitPointDamage ["HitLFWheel",1];
			_veh setHitPointDamage ["HitLF2Wheel",1];
			_veh setHitPointDamage ["HitRFWheel",1];
			_veh lock 2;
			_veh setVariable ["convoyCargo",true,true];

			_vehType = "Car";
			_className = "I_MRAP_03_hmg_F";
		};
	};

	DS_currentTask1 = "Rebel Convoy";
	DS_currentTask2 = format ["You must drive the convoy truck to %1 and hold it there for 1 minute to receive your reward",_endPoint select 1];

	while{true}do {
		if(_vehicle distance (getMarkerPos (_endPoint select 0)) < 50)then{_counterPos = _counterPos + 1;systemChat "You're in the area. Keep your convoy truck here to complete the mission";hint "You're in the area. Keep your convoy truck here to complete the mission";};
		if((_vehicle distance (getMarkerPos (_endPoint select 0)) < 50)&&(_counterPos > 6))exitWith{_pass = true;};
		if(!alive _vehicle)exitWith{_dead = true;};
		if (((getPos _vehicle) select 2) > 20)then{_vehicle setDamage 1;};
		sleep 10;
	};

	if(_dead)exitWith {
		DS_currentTask1 = "";
		[0,"A Rebel Convoy was destroyed, therefore their mission has failed",false,1] remoteExecCall ["DS_fnc_globalMessage",west];
		{
			deleteVehicle _x;
		} forEach attachedObjects _vehicle;
		sleep 15;
		deleteVehicle _vehicle;
		systemChat "You failed your mission because your convoy vehicle was destroyed";
		[25000,"has been destroyed","A rebel convoy"] remoteExec ["DS_fnc_copRewards",west];
	};

	if(_pass)then {
		{
			deleteVehicle _x;
		} forEach attachedObjects _vehicle;

		[0,"A Rebel has successfully escorted their convoy",false,1] remoteExecCall ["DS_fnc_globalMessage",west];

		[(getPlayerUID player),civilian,_vehType,_className,false,true,true] remoteExec ["HUNT_fnc_vehicleRewards",2];

		hint "Congratulations, you have completed your convoy and your new vehicle has been added to your garage";
		systemChat "Congratulations, you have completed your convoy and your new vehicle has been added to your garage";

		sleep 10;

		deleteVehicle _vehicle;

		if(DS_tokenMission == 6)then {
			DS_tokenMission = -1;
			[300,name player,false] spawn DS_civ_payTokens;
			DS_rebelMissionToken = false;
		};

		if((_className isEqualTo "I_MRAP_03_F")&&((DS_infoArray select 17) == 21))then{[2] call DS_fnc_questCompleted};
		if((_className isEqualTo "I_Heli_light_03_unarmed_F")&&((DS_infoArray select 17) == 30))then{[2] call DS_fnc_questCompleted};
		if((_className isEqualTo "I_MRAP_03_hmg_F")&&((DS_infoArray select 17) == 33))then{[2] call DS_fnc_questCompleted};
	};

	DS_currentTask1 = "";
};

if(_missionIndex isEqualTo "4")then {
	_reward = if((DS_spawnPoint select 0) == "reb_spawn_2")then{[150,"150"]}else{[100,"100"]};
	_group = shawn1 getVariable ["gangOwner",grpNull];
	if(isNull _group)exitWith{hint "You must own the rebel KOS zone to begin this convoy mission";};
	if(!((group player) isEqualTo _group))exitWith{hint "You must own the rebel KOS zone to begin this convoy mission";};

	_action = [
		format ["This is a high risk mission that increases your Rebel Token amount (10 Token start cost). Upon completion you will awarded with %1 Rebel Tokens. You must drive the convoy truck to the rebel KOS capture point, Would you like to begin?",_reward select 1],
		"Rebel Token Convoy",
		"Yes",
		"No"
		] call BIS_fnc_guiMessage;
	if(!_action)exitWith{};

	if((DS_realEstateArray select 6) < 10)exitWith{hint "You do not have enough tokens to begin this mission";};

	_tempNum = (DS_realEstateArray select 6);
	_tempNum = _tempNum - 10;
	DS_realEstateArray set [6,_tempNum];

	if(count (nearestObjects [(getMarkerPos (DS_spawnPoint select 0)),["Car","Ship","Air"],15]) != 0) exitWith {hint "There is a vehicle blocking the spawn point";};

	[] call DS_fnc_compileData;

	//Spawn in convoy vehicle
	_vehArray = ["B_Truck_01_box_F","B_Truck_01_covered_F","B_Truck_01_transport_F","I_Truck_02_covered_F","I_Truck_02_transport_F"];
	_veh = (selectRandom _vehArray);
	_vehicle = createVehicle [_veh,(getMarkerPos (DS_spawnPoint select 0)),[],0,"NONE"];
	waitUntil {!isNil "_vehicle";};
	_vehicle allowDamage false;
	_vehicle setDir (markerDir (DS_spawnPoint select 0));
	_vehicle setPos (getMarkerPos (DS_spawnPoint select 0));
	_vehicle allowDamage true;

	_vehicle setVariable ["vehicle_owners",[[getPlayerUID player,profileName,player]],true];
	DS_keyRing pushBack _vehicle;

	clearWeaponCargoGlobal _vehicle;
	clearMagazineCargoGlobal _vehicle;
	clearItemCargoGlobal _vehicle;

	_vehicle setVariable ["boot_open",false,true];
	_vehicle setVariable ["convoy_truck",true,true];
	_vehicle setVariable ["convoyVehicle",true,true];

	sleep 10;
	hint "Now take the vehicle to the rebel KOS capture point";

	DS_currentTask1 = "Token Convoy - Final Phase";
	DS_currentTask2 = "You must drive the convoy truck the KOS cap point and keep it there for 1 minute to complete this mission";

	while{true}do {
		if(((getPos _vehicle) select 2) > 20)exitWith{_dead = true;_vehicle setDamage 1;};
		if(_vehicle distance (getMarkerPos "asdfsa") < 100)then{_counterPos = _counterPos + 1;hint "Now stay here for 1 minute to complete the mission";};
		if((_vehicle distance (getMarkerPos "asdfsa") < 100)&&(_counterPos > 6))exitWith{_pass = true;};
		if(!alive _vehicle)exitWith{_dead = true;};
		sleep 10;
	};

	if(_dead)exitWith {
		DS_currentTask1 = "";
		sleep 15;
		deleteVehicle _vehicle;
		systemChat "You failed your mission because your convoy vehicle was destroyed";
	};

	if(_pass)then {
		DS_currentTask1 = "";

		hint "Congratulations, you have completed your convoy your tokens have been added";
		systemChat "Congratulations, you have completed your convoy your tokens have been added";

		_tempNum = (DS_realEstateArray select 6);
		_tempNum = _tempNum + (_reward select 0);
		DS_realEstateArray set [6,_tempNum];

		sleep 10;
		deleteVehicle _vehicle;

		if(DS_tokenMission == 8)then {
			DS_tokenMission = -1;
			[90,name player,false] spawn DS_civ_payTokens;
			DS_rebelMissionToken = false;
		};
	};
};

DS_rebelMission = false;
if(!(_missionIndex isEqualTo "5"))then{DS_currentTask1 = "";};