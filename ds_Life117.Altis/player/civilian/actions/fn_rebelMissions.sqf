/*
	Author: Shawn "Huntah" Macgillivray
	
	Description:
Actives rebel missions
*/
private["_timer","_playerPos","_missionIndex","_cost","_time","_bang","_counter","_endPoint","_counterPos","_dead","_pass","_vehType","_className","_reward"];
_missionIndex = DS_className;
//General Checks
_counterPos = 0;
if(isNil "DS_rebelMission")then{DS_rebelMission = false};
if(DS_rebelMission)exitwith{hint "You already have a rebel mission active"};
if((!DSL_rebel)&&(!DSL_rebelAdv))exitwith{hint "You must have Rebel training to begin this mission"};
DS_rebelMission = true;
_playerPos = (position player);
if((DS_infoArray select 17) > 22)then
	{
	_counter = 85;
	}
	else
	{
	_counter = 170;
	};
_dead = false;
_pass = false;
//Car bombs
if(_missionIndex == "0")then
	{
	_action = [
	"Starting a Carbombing mission cost a $50k deposit, upon completion you will be paid $200k. If you use a helicopter to carry the rigged vehicle, the police may destroy your chopper. Continue?",
	"Car Bomb",
	"Continue",
	"No Thanks"
	] call BIS_fnc_guiMessage;
	if(!_action)exitwith{};
	if([50000,true] call DS_fnc_checkMoney)exitwith{hint "You do not have $50k in your bank to begin this mission"};
	[50000,true,false] call DS_fnc_handleMoney;
	_bang = false;
	_carPickupArray = [
	"carBomb1","carBomb2","carBomb3","carBomb4","carBomb5","carBomb6","carBomb7"
	];
	_carDropArray = [
	"Gas1","airshop","busAthira","police_hq_2","Gas1_1_1_2_1_1_1_1_1","busZaros"
	];
	_vehicleArray = [
	"I_G_Offroad_01_F","C_Hatchback_01_F"
	];
	deleteMarkerLocal "carbombmarker";
	_newmarker = (floor(random(count _carPickupArray)));
	_carPickUp = (_carPickupArray select _newmarker);
	_currentpoint1 = _carPickUp;
	_markerobj = createmarkerlocal ["carbombmarker",[0,0]];
	_markername = "carbombmarker";
	_markerobj setmarkershapelocal "Icon";
	"carbombmarker" setmarkertypelocal "hd_warning";
	"carbombmarker" setmarkercolorlocal "colorblack";
	"carbombmarker" setmarkersizelocal [1, 1];
	"carbombmarker" setmarkertextlocal "Rigged Vehicle";
	_markername Setmarkerposlocal (getMarkerPos _currentpoint1);
	systemchat "Your job is to go and pick up a rigged vehicle, then drive it to a location we will then give you. The Rigged vehicle is marked on your map";
	hint "Your job is to go and pick up a rigged vehicle, then drive it to a location we will then give you. The Rigged vehicle is marked on your map";
	while{true}do
		{
		if(player distance (getMarkerPos _currentpoint1) < 200) exitwith {};
		if(!alive player)exitwith{};
		sleep 10;
		};
	if(!alive player)exitwith{DS_rebelMission = false;deleteMarkerLocal "carbombmarker";};
	_sp = (getMarkerPos _currentpoint1);
	_typeOfVeh1 = (floor(random(count _vehicleArray)));
	_typeOfVeh = (_vehicleArray select _typeOfVeh1);
	_vehicle = _typeOfVeh createVehicle _sp;
	_vehicle setVariable ["carBomb",true,true];
	_vehicle lock 2;
	_vehicle setVariable ["vehicle_owners",[[getPlayerUID player,profileName,player]],true];
	DS_keyRing pushBack _vehicle;
	while {true} do
		{
		if(!alive _vehicle)exitwith{};
		if(!alive player)exitwith{};
		if(player distance _vehicle < 10)exitwith{};
		sleep 5;
		};
	deleteMarkerLocal "carbombmarker";
	if(!alive _vehicle)exitwith{hint "You failed because the rigged vehicle was destroyed";deleteMarkerLocal "carbombmarker";DS_rebelMission = false;};
	if(!alive player)exitwith{DS_rebelMission = false;};
	[[1,format["~~Special Police Warning~~\n\nIntelligence suggest there is a Rebel named %1 driving around Altis in a vehicle rigged to explode!",name player],true],"DS_fnc_globalMessage",west,false] spawn BIS_fnc_MP;
	[[0,format["~~Special Police Warning~~Intelligence suggest there is a Rebel named %1 driving around Altis in a vehicle rigged to explode!",name player],true],"DS_fnc_globalMessage",west,false] spawn BIS_fnc_MP;
	systemchat "Great there is the vehicle, now drive carefully to one of the locations marked on your map";
	hint "Great there is the vehicle, now drive carefully to one of the locations marked on your map";
	for "_i" from 0 to (count(_carDropArray))-1 do
		{
		_testVar = format ["%1",(_carDropArray select _i)];
		_testVar2 = format ["carbombendmarker%1",_i];
		deleteMarkerLocal _testVar2;
		_currentpoint = (getmarkerpos _testVar);
		_markerobj = createmarkerlocal [_testVar2,[0,0]];
		_markername = _testVar2;
		_markerobj setmarkershapelocal "Icon";
		_testVar2 setmarkertypelocal "hd_warning";
		_testVar2 setmarkercolorlocal "colorblack";
		_testVar2 setmarkersizelocal [1, 1];
		_testVar2 setmarkertextlocal "Possible Detonation Point";
		_markername Setmarkerposlocal _currentpoint;
		sleep 0.1;
		};
	sleep 30;
	while{true}do
		{
		if(!alive _vehicle)exitwith{};
		if(!alive player)exitwith{};
		if(DS_jailed)exitwith{};
		{
			if(_vehicle distance (getMarkerPos _x) < 10)then
				{
				_bang = true;
				};
		}forEach _carDropArray;
		if(_bang)exitwith{};
		sleep 10;
		};
	if(!alive _vehicle)then{hint "Mission failed because your carbomb was destroyed"};
	for "_i" from 0 to (count(_carDropArray))-1 do
		{
		_testVar = format ["%1",(_carDropArray select _i)];
		_testVar2 = format ["carbombendmarker%1",_i];
		deleteMarkerLocal _testVar2;
		};
	if(_bang)then
		{
		if((DS_infoArray select 17) > 22)then
			{
			hint "Bomb Armed! It will detonate in 1 1/2 minutes, remain in the area and dont move the vehicle otherwise you will fail the mission!";
			systemchat "Bomb Armed! It will detonate in 1 1/2 minutes, remain in the area and dont move the vehicle otherwise you will fail the mission!";
			}
			else
			{
			hint "Bomb Armed! It will detonate in 3 minutes, remain in the area and dont move the vehicle otherwise you will fail the mission!";
			systemchat "Bomb Armed! It will detonate in 3 minutes, remain in the area and dont move the vehicle otherwise you will fail the mission!";
			};
		sleep 10;
		_vehPos = (position _vehicle);
		while{true}do
			{
			hintSilent format ["Car bomb will explode in %1 seconds",_counter];
			_counter = _counter - 1;
			sleep 1;
			if(_vehPos distance (position _vehicle) > 50)exitwith{};
			if(_counter == 0)exitwith{};
			if(!alive player)exitwith{};
			if(player distance _vehicle > 100)exitwith{};
			};
		if(_vehPos distance (position _vehicle) > 50)exitwith{hint "You failed the mission because the vehicle moved";player say3D "fail";};
		if(!alive player)exitwith{};
		if(player distance _vehicle > 100)exitwith{hint "You failed the mission because you went to far from the vehicle";player say3D "fail";};
		_sp = getPos _vehicle;
		_typeOfVeh = "M_PG_AT";
		_explosion = _typeOfVeh createVehicle _sp;
		sleep 0.1;
		_sp = getPos _vehicle;
		_typeOfVeh = "M_PG_AT";
		_explosion = _typeOfVeh createVehicle _sp;
		sleep 0.1;
		_sp = getPos _vehicle;
		_typeOfVeh = "M_PG_AT";
		_explosion = _typeOfVeh createVehicle _sp;
		sleep 0.1;
		_vehicle setDamage 1;
		[[1,format["~~Altis News Broadcast~~\n\nA Car Bomb has just been activated by %1!",name player],true],"DS_fnc_globalMessage",west,false] spawn BIS_fnc_MP;
		sleep 5;
		systemchat "Good job, you will be paid $200k upon returning to the mission provider";
		hint "Good job, you will be paid $200k upon returning to the mission provider";
		while{true}do
			{
			if(player distance _playerPos < 5)exitwith{};
			if(!alive player)exitwith{};
			if(DS_jailed)exitwith{};
			sleep 10;
			};
		if(!alive player)exitwith{DS_rebelMission = false;};
		if(DS_jailed)exitwith{DS_rebelMission = false;};
		hint "Great work, here is $200k for your efforts, come back any time for another job!";
		systemchat "Great work, here is $200k for your efforts, come back any time for another job!";
		DS_rebelMission = false;
		[200000,false,true] call DS_fnc_handleMoney;
		if((DS_infoArray select 17) == 4)then
			{
			[2] call DS_fnc_questCompleted;
			};
		if((DS_infoArray select 17) == 22)then
			{
			_tempNum = (DS_infoArray select 18);
			_tempNum = _tempNum + 1;
			DS_infoArray set [18,_tempNum];
			if((DS_infoArray select 18) > 2)then
				{
				[2] call DS_fnc_questCompleted;
				};
			};
		};
	};
if(_missionIndex == "5")then
	{
	if(!([5] call DS_fnc_countPlayers))exitWith	
		{
		_str = parseText "<t color='#FF0000' size='1.5'><br/>You can not start this mission with fewer than 5 white-listed cops online!<br/></t>";
		hint _str;	
		};
	_action = [
	"Starting a terrorist mission cost $500k and involves travelling to a given destination within 30 minutes and staying in the area for 3 minutes to detonate a large bomb. You will be paid $2.5m the starting cost when it blows",
	"Terrorist Mission",
	"Continue",
	"No Thanks"
	] call BIS_fnc_guiMessage;
	if(!_action)exitwith{};
	_action = [
	"The police will be warned about this mission and its destination immediately, You will learn the location in 5 minutes. So it's the job of your group to secure the blast area before placing the bomb. Dying or being jailed will cancel the mission!",
	"Terrorist Mission",
	"Start",
	"No Thanks"
	] call BIS_fnc_guiMessage;
	if(!_action)exitwith{};
	if([500000,true] call DS_fnc_checkMoney)exitwith{hint "You do not have $500k in your bank to begin this mission"};
	[500000,true,false] call DS_fnc_handleMoney;
	_bang = false;
	_carPickupArray = [
	"Police CP_1_1_1","cop_spawn_3","cop_spawn_4","cop_spawn_5","police_hq_2","illegalRelic1_1","fed_reserve_1"
	];
	_carDropArray = [
	"Checkpoint 2","The Athira Police PD","The Police Air HQ","The Sofia Police HQ","The Pyrgos Police HQ","Fort Knox","The Bank"
	];
	deleteMarkerLocal "carbombmarker";
	_newmarker = (floor(random(count _carPickupArray)));
	_carPickUp = (_carPickupArray select _newmarker);
	_carDropArray = (_carDropArray select _newmarker);
	[[0,format["~~Special Police Warning~~Intelligence suggest there is a terrorist group lead by %2 heading towards %1 to destroy the area with explosives",_carDropArray,(name player)],true],"DS_fnc_globalMessage",west,false] spawn BIS_fnc_MP;
	[[1,format["~~Special Police Warning~~\n\nIntelligence suggest there is a terrorist group lead by %2 heading towards %1 to destroy the area with explosives",_carDropArray,(name player)],true],"DS_fnc_globalMessage",west,false] spawn BIS_fnc_MP;
	[[2,format["~~Special Police Warning~~\n\nIntelligence suggest there is a terrorist group lead by %2 heading towards %1 to destroy the area with explosives",_carDropArray,(name player)],true],"DS_fnc_globalMessage",west,false] spawn BIS_fnc_MP;
	sleep 1;
	systemchat "Your jobs location will be given to you in five minutes, prepare and wait.....";
	hint "Your jobs location will be given to you in five minutes, prepare and wait.....";
	sleep 300;
	_currentpoint1 = _carPickUp;
	_markerobj = createmarkerlocal ["carbombmarker",[0,0]];
	_markername = "carbombmarker";
	_markerobj setmarkershapelocal "Icon";
	"carbombmarker" setmarkertypelocal "hd_warning";
	"carbombmarker" setmarkercolorlocal "colorblack";
	"carbombmarker" setmarkersizelocal [1, 1];
	"carbombmarker" setmarkertextlocal "Bomb Placement Point";
	_markername Setmarkerposlocal (getMarkerPos _currentpoint1);
	systemchat "Your job is to go to the location marked on your map and remain in the area for 3 minutes, you will then have 1 minute to leave before the bombs go off";
	hint "Your job is to go to the location marked on your map and remain in the area for 3 minutes, you will then have 1 minute to leave before the bombs go off";
	sleep 30;
	_timer = 179;
	_counter = 18;
	_restrained = 0;
	while {true} do
		{
		if(_timer < 0)exitWith
			{
			[[30000,"has failed his terrorism mission",name player],"DS_fnc_copRewards",west,false] spawn BIS_fnc_MP;
			};
		if(player distance spawnIsland < 1000)exitwith
			{
			[[80000,"has been killed while doing a terrorism mission",name player],"DS_fnc_copRewards",west,false] spawn BIS_fnc_MP;
			};
		if(player getVariable ["cuffed",false])then
			{
			_restrained = _restrained + 1;
			};
		if(_restrained == 6)exitwith
			{
			[[120000,"has been restrained while doing a terrorism mission",name player],"DS_fnc_copRewards",west,false] spawn BIS_fnc_MP;
			};
		if(_counter == 0)exitwith{};
		if((_timer%6) == 0)then{systemchat format ["You have %1 minutes remaining to complete your terrorist mission",((_timer*10)/60)];hint format ["You have %1 minutes remaining to complete your terrorist mission",((_timer*10)/60)];};
		if(player distance (getMarkerPos _currentpoint1) < 20)then{systemchat format ["Stay here for another %1 seconds to arm the bomb",(_counter*10)];_counter = _counter - 1;};
		sleep 10;
		_timer = _timer - 1;
		};
	deleteMarkerLocal "carbombmarker";
	if(_timer < 0)exitWith{DS_rebelMission = false;};
	if(!alive player)exitwith{DS_rebelMission = false;};
	if(_restrained == 6)exitwith{DS_rebelMission = false;};
	if(player distance spawnIsland < 1000)exitwith{DS_rebelMission = false;};
	systemchat "The bomb is armed, RUN!";
	[[0,format["~~Special Police Warning~~ A Terrorist group has armed a bomb at %1, you have 1 minute to clear the area",_carDropArray],true],"DS_fnc_globalMessage",west,false] spawn BIS_fnc_MP;
	[[1,format["~~Special Police Warning~~\n\nA Terrorist group has armed a bomb at %1, you have 1 minute to clear the area",_carDropArray],true],"DS_fnc_globalMessage",west,false] spawn BIS_fnc_MP;
	[[2,format["~~Special Police Warning~~\n\nA Terrorist group has armed a bomb at %1, you have 1 minute to clear the area",_carDropArray],true],"DS_fnc_globalMessage",west,false] spawn BIS_fnc_MP;
	{
		if(_x distance (getMarkerPos _currentpoint1) < 500)then
			{
			[[player,"alarm"],"DS_fnc_playSounds",false,false] spawn DS_fnc_MP;
			};
	}forEach playableunits;
	sleep 60;
	[[0,format["~~Special Police Warning~~ A Terrorist group has just destroyed the area around %1",_carDropArray],true],"DS_fnc_globalMessage",west,false] spawn BIS_fnc_MP;
	[[1,format["~~Special Police Warning~~\n\nA Terrorist group has just destroyed the area around %1",_carDropArray],true],"DS_fnc_globalMessage",west,false] spawn BIS_fnc_MP;
	[[2,format["~~Special Police Warning~~\n\nA Terrorist group has just destroyed the area around %1",_carDropArray],true],"DS_fnc_globalMessage",west,false] spawn BIS_fnc_MP;
	systemchat "Great job, your payment has been deposited into your bank account";
	hint "Great job, your payment has been deposited into your bank account";
	[2500000,true,true] call DS_fnc_handleMoney;
	DS_rebelMission = false;
	while{_counter < 8}do
		{
		_sp = [(getMarkerPos _currentpoint1 select 0) + random (100), (getMarkerPos _currentpoint1 select 1) + random (100), getMarkerPos _currentpoint1 select 2];
		_veh = "M_Mo_82mm_AT_LG";
		_vehicle1 = _veh createVehicle _sp;
		sleep 0.2;
		_sp = [(getMarkerPos _currentpoint1 select 0) - random (100), (getMarkerPos _currentpoint1 select 1) - random (100), getMarkerPos _currentpoint1 select 2];
		_veh = "M_Mo_82mm_AT_LG";
		_vehicle1 = _veh createVehicle _sp;
		_counter = _counter + 1;
		};
	sleep 10;
	[[80000,"The police failed to protect the Island from Terrorist"],"DS_fnc_punishments",west,false] spawn BIS_fnc_MP;
	if((DS_infoArray select 17) == 38)then
		{
		[2] call DS_fnc_questCompleted;
		};
	};
if(_missionIndex in ["1","2","3"])then
	{
	if((DS_spawnPoint select 0) == "reb_spawn_2")then{_endPoint = ["reb_v_1","Rebel North"]}else{_endPoint = ["reb_spawn_2","Rebel South"]};
	if(!([3] call DS_fnc_countPlayers))exitWith	
		{
		_str = parseText "<t color='#FF0000' size='1.5'><br/>You can not start this mission with fewer than 3 white-listed cops online!<br/></t>";
		hint _str;	
		};
	switch(_missionIndex)do
		{
		case "1":
			{
			if((DS_infoArray select 17) < 34)then
				{
				_endPoint pushBack 2000000;
				}
				else
				{
				_endPoint pushBack 1000000;
				};
			_endPoint pushBack "Unarmed Thermal Enabled Strider";
			};
		case "2":
			{
			if((DS_infoArray select 17) < 34)then
				{
				_endPoint pushBack 2000000;
				}
				else
				{
				_endPoint pushBack 1000000;
				};
			_endPoint pushBack "Unarmed Thermal Enabled Hellcat";
			};
		case "3":
			{
			if((DS_infoArray select 17) < 34)then
				{
				_endPoint pushBack 4000000;
				}
				else
				{
				_endPoint pushBack 2000000;
				};
			_endPoint pushBack "Armed Thermal Enabled Strider";
			};
		};
	_action = [
		format ["This is a high risk mission that cost $%1 to start, The server will be informed that someone has began this mission. Upon completion you will awarded with a %2. You must drive the convoy truck to %3, Would you like to begin?",[(_endPoint select 2)] call DS_fnc_numberText,[_endPoint select 3] call DS_fnc_numberText,_endPoint select 1],
		"Rebel Convoy",
		"Yes",
		"No"
		] call BIS_fnc_guiMessage;
		if(!_action)exitwith{};	
	_action = [
		format ["Air Lifting your convoy will cause it to blow up, Understand?",[(_endPoint select 2)] call DS_fnc_numberText,(_endPoint select 3),_endPoint select 1],
		"Warning",
		"Yes",
		"No"
		] call BIS_fnc_guiMessage;
		if(!_action)exitwith{};	
	if([_endPoint select 2,true] call DS_fnc_checkMoney)exitwith{hint "You do not have enough money in your bank to begin this mission"};	
	if(count(nearestObjects[(getMarkerPos (DS_spawnPoint select 0)),["Car","Ship","Air"],15]) != 0) exitWith {hint "There is a vehicle blocking the spawn point";};
	[(_endPoint select 2),true,false] call DS_fnc_handleMoney;
	if(DS_item_convoy == 0)then
		{
		[[0,"A Rebel Convoy has been spotted moving around Altis, it's location will be travelling between the two Rebel Outpost"],"DS_fnc_globalMessage",west,false] spawn BIS_fnc_MP;
		[[1,"A Rebel Convoy has been spotted moving around Altis, it's location will be travelling between the two Rebel Outpost"],"DS_fnc_globalMessage",west,false] spawn BIS_fnc_MP;
		[[2,"A Rebel Convoy has been spotted moving around Altis, it's location will be travelling between the two Rebel Outpost"],"DS_fnc_globalMessage",west,false] spawn BIS_fnc_MP;
		}
		else
		{
		["convoy",false,1] call DS_fnc_handleInventory;
		};
	[] call DS_fnc_compileData;
	//Spawn in convoy vehicle
	_vehArray = ["O_Truck_02_transport_F"];
	_randomVeh = (floor(random(count _vehArray)));
	_veh = (_vehArray select _randomVeh);
	_vehicle = createVehicle [_veh, (getMarkerPos (DS_spawnPoint select 0)), [], 0, "NONE"];
	waitUntil {!isNil "_vehicle"};
	_vehicle allowDamage false;
	_vehicle setVariable ["vehicle_owners",[[getPlayerUID player,profileName,player]],true];
	clearWeaponCargoGlobal _vehicle;
	clearMagazineCargoGlobal _vehicle;
	clearItemCargoGlobal _vehicle;
	DS_keyRing pushBack _vehicle;
	_vehicle setVariable ["boot_open",false,true];
	_vehicle setDir (markerDir (DS_spawnPoint select 0));
	_vehicle setPos (getMarkerPos (DS_spawnPoint select 0));
	_vehicle allowDamage true;
	switch(_missionIndex)do
		{
		case "1"://Strider
			{
			_veh = "I_MRAP_03_F" createVehicle [0,0,0];
			_veh attachTo[_vehicle,[0.05,0,0]];
			_veh setVectorUp [0,0,-30];
			_veh setDamage 0.9;
			_veh setHitPointDamage["HitLFWheel",1];  
			_veh setHitPointDamage["HitLF2Wheel",1];  
			_veh setHitPointDamage["HitRFWheel",1]; 
			_veh lock 2;
			_vehType = "Car";
			_className = "I_MRAP_03_F";
			};
		case "2":
			{
			_veh = "I_Heli_light_03_unarmed_F" createVehicle [0,0,0];
			_veh attachTo[_vehicle,[0.05,0,1.2]]; 
			_veh setVectorUp [0,0,0];_veh setDamage 0.9;
			_veh setHitPointDamage["HitLFWheel",1];  
			_veh setHitPointDamage["HitLF2Wheel",1];  
			_veh setHitPointDamage["HitRFWheel",1]; 
			_veh lock 2;
			_veh setDir 180; 
			_vehType = "Air";
			_className = "I_Heli_light_03_unarmed_F";
			};
		case "3"://Strider
			{
			_veh = "I_MRAP_03_F" createVehicle [0,0,0];
			_veh attachTo[_vehicle,[0.05,0,0]];
			_veh setVectorUp [0,0,-30];
			_veh setDamage 0.9;_veh setHitPointDamage["HitLFWheel",1];  
			_veh setHitPointDamage["HitLF2Wheel",1];  
			_veh setHitPointDamage["HitRFWheel",1]; 
			_veh lock 2;
			_vehType = "Car";
			_className = "I_MRAP_03_hmg_F";
			};
		};
	while {true} do
		{
		if(_vehicle distance (getMarkerPos (_endPoint select 0)) < 50)then{_counterPos = _counterPos + 1;};
		if((_vehicle distance (getMarkerPos (_endPoint select 0)) < 50)&&(_counterPos > 6)) exitwith {_pass = true;};
		if(!alive _vehicle) exitwith {_dead = true;};
		if ((getPos (_vehicle) select 2) > 20) then {_vehicle setDamage 1};
		sleep 10;
		};
	if(_dead)exitWith
		{
		[[0,"A Rebel Convoy was destroyed, therefore their mission has failed"],"DS_fnc_globalMessage",west,false] spawn BIS_fnc_MP;
		[[1,"A Rebel Convoy was destroyed, therefore their mission has failed"],"DS_fnc_globalMessage",west,false] spawn BIS_fnc_MP;
		[[2,"A Rebel Convoy was destroyed, therefore their mission has failed"],"DS_fnc_globalMessage",west,false] spawn BIS_fnc_MP;
		_attachment = (nearestobjects [getpos _vehicle, ["I_MRAP_03_F"],  20] select 0);deleteVehicle _attachment; 
		_attachment = (nearestobjects [getpos _vehicle, ["I_Heli_light_03_unarmed_F"],  20] select 0);deleteVehicle _attachment; 
		_attachment = (nearestobjects [getpos _vehicle, ["O_APC_Wheeled_02_rcws_F"],  20] select 0);deleteVehicle _attachment; 
		sleep 15;
		deleteVehicle _vehicle;
		systemchat "You failed your mission because your convoy vehicle was destroyed";
		[[25000,"has been destroyed","A rebel convoy"],"DS_fnc_copRewards",west,false] spawn BIS_fnc_MP;
		};	
	if(_pass)then
		{
		_attachment = (nearestobjects [getpos _vehicle, ["I_MRAP_03_F"],  20] select 0);deleteVehicle _attachment; 
		_attachment = (nearestobjects [getpos _vehicle, ["I_Heli_light_03_unarmed_F"],  20] select 0);deleteVehicle _attachment; 
		_attachment = (nearestobjects [getpos _vehicle, ["O_APC_Wheeled_02_rcws_F"],  20] select 0);deleteVehicle _attachment; 
		[[0,"A Rebel has successfully escorted their convoy"],"DS_fnc_globalMessage",west,false] spawn BIS_fnc_MP;
		[[2,"A Rebel has successfully escorted their convoy"],"DS_fnc_globalMessage",west,false] spawn BIS_fnc_MP;
		[[1,"A Rebel has successfully escorted their convoy"],"DS_fnc_globalMessage",west,false] spawn BIS_fnc_MP;
		_uid = (getPlayerUID player);
		_side = "civ";
		[[(getPlayerUID player),civilian,_vehType,_className,false,true,true],"HUNT_fnc_vehicleRewards"] spawn BIS_fnc_MP;
		hint "Congratulations, you have completed your convoy and your new vehicle has been added to your garage";
		systemchat "Congratulations, you have completed your convoy and your new vehicle has been added to your garage";
		sleep 10;
		deleteVehicle _vehicle;
		if((_className == "I_MRAP_03_F")&&((DS_infoArray select 17) == 21))then
			{
			[2] call DS_fnc_questCompleted;
			};
		if((_className == "I_Heli_light_03_unarmed_F")&&((DS_infoArray select 17) == 30))then
			{
			[2] call DS_fnc_questCompleted;
			};
		if((_className == "I_MRAP_03_hmg_F")&&((DS_infoArray select 17) == 33))then
			{
			[2] call DS_fnc_questCompleted;
			};
		};
	};
if(_missionIndex in ["4"])then
	{
	if((DS_spawnPoint select 0) == "reb_spawn_2")then{_reward = [100,"100"]}else{_reward = [150,"150"]};
	_endPoint = ["asdfsa","Rebel KOS Capture point"];
	_group = shawn1 getVariable ["gangOwner",grpNull];
	if(isNull _group)exitwith{hint "You must own the rebel KOS zone to begin this convoy mission"};
	if((count playableUnits) < 20)exitwith{hint "You can not begin this mission with fewer than 20 players online"};
	if((group player) != _group)exitwith{hint "You must own the rebel KOS zone to begin this convoy mission"};
	_endPoint pushBack 100;
	_endPoint pushBack "100 Rebel Token Convoy";
	_action = [
		format ["This is a high risk mission that increases your Rebel Token amount (10 Token start cost). Upon completion you will awarded with %1 Rebel Tokens. You must drive the convoy truck to the rebel KOS capture point, Would you like to begin?",_reward select 1],
		"Rebel Token Convoy",
		"Yes",
		"No"
		] call BIS_fnc_guiMessage;
		if(!_action)exitwith{};	
	if((DS_realEstateArray select 6) < 10)exitwith{hint "You do not have enough tokens to begin this mission"};
	_tempNum = ((DS_realEstateArray select 6));
	_tempNum = _tempNum - 10;
	DS_realEstateArray set [6,_tempNum];
	if(count(nearestObjects[(getMarkerPos (DS_spawnPoint select 0)),["Car","Ship","Air"],15]) != 0) exitWith {hint "There is a vehicle blocking the spawn point";};
	[] call DS_fnc_compileData;
	//Spawn in convoy vehicle
	_vehArray = ["B_Truck_01_box_F","B_Truck_01_covered_F","B_Truck_01_transport_F","I_Truck_02_covered_F","I_Truck_02_transport_F"];
	_randomVeh = (floor(random(count _vehArray)));
	_veh = (_vehArray select _randomVeh);
	_vehicle = createVehicle [_veh, (getMarkerPos (DS_spawnPoint select 0)), [], 0, "NONE"];
	waitUntil {!isNil "_vehicle"};
	_vehicle allowDamage false;
	_vehicle setVariable ["vehicle_owners",[[getPlayerUID player,profileName,player]],true];
	_vehicle setVariable["convoy_truck",true,true];
	clearWeaponCargoGlobal _vehicle;
	clearMagazineCargoGlobal _vehicle;
	clearItemCargoGlobal _vehicle;
	DS_keyRing pushBack _vehicle;
	_vehicle setVariable ["boot_open",false,true];
	_vehicle setDir (markerDir (DS_spawnPoint select 0));
	_vehicle setPos (getMarkerPos (DS_spawnPoint select 0));
	_vehicle allowDamage true;
	_vehicle setVariable ["convoyVehicle",true,true];
	sleep 10;
	hint "Now take the vehicle to the rebel KOS capture point";
	while {true} do
		{
		if(_vehicle distance (getMarkerPos "asdfsa") < 100)then{_counterPos = _counterPos + 1;hint "Now stay here for 1 minute to complete the mission"};
		if((_vehicle distance (getMarkerPos (_endPoint select 0)) < 100)&&(_counterPos > 6)) exitwith {_pass = true;};
		if(!alive _vehicle) exitwith {_dead = true;};
		sleep 10;
		};
	if(_dead)exitWith
		{
		sleep 15;
		deleteVehicle _vehicle;
		systemchat "You failed your mission because your convoy vehicle was destroyed";
		};	
	if(_pass)then
		{
		hint "Congratulations, you have completed your convoy your tokens have been added";
		systemchat "Congratulations, you have completed your convoy your tokens have been added";
		_tempNum = (DS_realEstateArray select 6);
		_tempNum = _tempNum + (_reward select 0);
		DS_realEstateArray set [6,_tempNum];
		sleep 10;
		deleteVehicle _vehicle;
		};
	};
DS_rebelMission = false;