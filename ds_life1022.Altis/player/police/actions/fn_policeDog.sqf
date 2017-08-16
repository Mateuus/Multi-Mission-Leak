/*
	Darkside Life

	Author: Shawn "Huntah" Macgillivray

	Description:
	Does all the stuff for police dogs
*/

DS_myDog = objNull;

if(!isNil "DS_dogActions1")then {
	player removeAction DS_dogActions1;
	player removeAction DS_dogActions2;
	player removeAction DS_dogActions3;
	player removeAction DS_dogActions4;
	player removeAction DS_dogActions5;
	player removeAction DS_dogActions6;
	player removeAction DS_dogActions7;
	player removeAction DS_dogActions8;
};

DS_dogActions1 = player addAction ["<t color='#FF8000'>Dog: Sit</t>",{DS_myDog playMove "Dog_Sit";DS_myDog setVariable ["changeOrders",true,true];},9,1001,false,false,"",'(!isNull DS_myDog) && {(player getVariable ["policeSquad",""]) isEqualTo "Dog Handler"}'];
DS_dogActions2 = player addAction ["<t color='#FF8000'>Dog: Follow</t>",{DS_myDog playMove "Dog_Sprint";[] spawn DS_myDogFollow;},9,1001,false,false,"",'(!isNull DS_myDog) && {(player getVariable ["policeSquad",""]) isEqualTo "Dog Handler"}'];
DS_dogActions3 = player addAction ["<t color='#FF8000'>Dog: Sniff Vehicle</t>",{[] spawn DS_myDogSniffVehicle;},9,1001,false,false,"",'(!isNull DS_myDog) && {(player getVariable ["policeSquad",""]) isEqualTo "Dog Handler"}'];
DS_dogActions4 = player addAction ["<t color='#FF8000'>Dog: Search Area</t>",{[] spawn DS_myDogSearch},9,1001,false,false,"",'(!isNull DS_myDog) && {(player getVariable ["policeSquad",""]) isEqualTo "Dog Handler"}'];
DS_dogActions5 = player addAction ["<t color='#FF8000'>Dog: Attack</t>",{[] spawn DS_myDogAttack},9,1001,false,false,"",'(!isNull DS_myDog) && {(player getVariable ["policeSquad",""]) isEqualTo "Dog Handler"}'];
DS_dogActions6 = player addAction ["<t color='#FF8000'>Dog: Stand Down</t>",{[] spawn DS_myDogStandDown},9,1001,false,false,"",'(!isNull DS_myDog) && {(player getVariable ["policeSquad",""]) isEqualTo "Dog Handler"}'];
DS_dogActions7 = player addAction ["<t color='#FF8000'>Dog: Return to vehicle</t>",{[] spawn DS_myDogEnterVehicle},9,1001,false,false,"",'(!isNull DS_myDog) && {(player getVariable ["policeSquad",""]) isEqualTo "Dog Handler"}'];
DS_dogActions8 = player addAction ["<t color='#FF8000'>Dog: Retrieve From vehicle</t>",{[] spawn DS_myDogExitVehicle},9,1001,false,false,"",'(isNull DS_myDog) && {(player getVariable ["policeSquad",""]) isEqualTo "Dog Handler"}'];

DS_myDogAlive = {
	while{true}do {
		if(!alive DS_myDog)exitWith{
			deleteVehicle DS_myDog;
			DS_myDog = objNull;
			[] spawn DS_cop_policeDog;
		};

		sleep 5;
	};
};

DS_myDogExitVehicle = {
	private ["_vehicle","_targets"];
	
	_vehicle = cursorTarget;

	if(player distance _vehicle > 20)exitWith{hint "You're too far from the vehicle"};
	if(!(_vehicle getVariable ["policeVehicle",false]))exitWith{hint "You can only retrieve your dog from a police vehicle"};

	DS_myDog = createAgent ["Alsatian_Sandblack_F", getPos _vehicle, [], 5, "CAN_COLLIDE"];
	DS_myDog setVariable ["BIS_fnc_animalBehaviour_disable", true];
	[] spawn DS_myDogAlive;

	_targets = allPlayers select {(_x distance DS_myDog) < 50};
	if(!(_targets isEqualTo []))then{[DS_myDog,"dogBarkSingle"] remoteExecCall ["DS_fnc_playSounds",_targets];};
};

DS_myDogFollow = {
	DS_myDog playMove "Dog_Sprint";

	while{true}do {
		if(!alive DS_myDog)exitWith{};
		if(DS_myDog getVariable ["changeOrders",false])exitWith{};
		DS_myDog moveTo getPos player;
		sleep 10;
	};
};

DS_myDogSniffVehicle = {
	private ["_vehicle","_bootInfo","_bootItems","_illegalGoods","_vehicleName","_targets"];

	DS_myDog setVariable ["changeOrders",true,true];
	DS_myDog playMove "Dog_Sprint";

	_vehicle = cursorTarget;
	if((isNil "_vehicle")||(isNull _vehicle))exitWith{hint "You are not facing a vehicle";};
	if(!((_vehicle isKindOf "Car")||(_vehicle isKindOf "Air")||(_vehicle isKindOf "Ship")||(typeOf _vehicle == "Land_Pod_Heli_Transport_04_fuel_F")||(typeOf _vehicle == "Land_Pod_Heli_Transport_04_box_F")||(typeOf _vehicle == "Land_Pod_Heli_Transport_04_covered_F")||(typeOf _vehicle == "Land_Pod_Heli_Transport_04_medevac_F")||(typeOf _vehicle == "Land_Pod_Heli_Transport_04_repair_F")||(typeOf _vehicle == "B_Slingload_01_Cargo_F")||(typeOf _vehicle == "B_Slingload_01_Medevac_F")||(typeOf _vehicle == "B_Slingload_01_Repair_F")||(typeOf _vehicle == "B_Slingload_01_Fuel_F")))exitWith{hint "Your dog can not sniff this vehicle type"};
	_bootInfo = _vehicle getVariable ["boot",[]];
	_bootItems = _bootInfo select 0;
	_illegalGoods = false;

	if(count(_bootInventory) > 0)then {
		{
			if((_x select 0) in ["heroinu","heroinp","weedu","weedp","cocaineu","cocainep","hydroPack","hydro","sodiumPack","sodium","meth"])then {
				_illegalGoods = true;
			};
		} forEach (_bootInventory select 0);
	};

	_targets = allPlayers select {(_x distance DS_myDog) < 50};
	if(!(_targets isEqualTo []))then{[DS_myDog,"dogBarkSingle"] remoteExecCall ["DS_fnc_playSounds",_targets];};

	_vehicleName = getText(configFile >> "CfgVehicles" >> (typeOf _vehicle) >> "displayName");
	hint format ["You have told your dog to sniff this %1",_vehicleName];

	DS_myDog playMove "Dog_Sprint";
	DS_myDog moveTo (getPos _vehicle);

	waitUntil {(DS_myDog distance _vehicle < 5)};
	hint format ["Dog is now sniffing this %1",_vehicleName];
	sleep 3;

	if(_illegalGoods)then {
		DS_myDog playMove "Dog_Sit";
		hint "Your dog has discovered an unusual smell inside this vehicle";

		_targets = allPlayers select {(_x distance DS_myDog) < 50};
		if(!(_targets isEqualTo []))then{[DS_myDog,"dogBark"] remoteExecCall ["DS_fnc_playSounds",_targets];};
	} else {
		DS_myDog playMove "Dog_Sit";
		hint "Your dog does not seem bothered by this vehicle";
	};
};

DS_myDogSearch = {
	private ["_startPos","_atEnd","_posToGoY","_posToGo","_targets","_nearPlayers","_nearestUnit","_found"];

	_atEnd = false;
	_found = false;
	_posToGo = screenToWorld [0.5,0.5];

	DS_myDog setVariable ["changeOrders",true,true];
	DS_myDog moveTo _posToGo;
	DS_myDog playMove "Dog_Sprint";

	_targets = allPlayers select {(_x distance DS_myDog) < 500};
	if(!(_targets isEqualTo []))then{[DS_myDog,"dogBarkSingle"] remoteExecCall ["DS_fnc_playSounds",_targets];};

	while{true}do {
		if(DS_myDog distance _posToGo < 3)exitWith{_atEnd = true};
		if(!alive DS_myDog)exitWith{};
		{
			if((_x distance DS_myDog < 200)&&((side _x) isEqualTo civilian)&&(!(_x getVariable ["restrained",false])))then {
				_nearestUnit = _x;
			};
		} forEach allPlayers;
		if(!isNil "_nearestUnit")exitWith{_found = true;};
		DS_myDog moveTo _posToGo;
		sleep 5;
	};

	if((_atEnd)&&(!_found))exitWith {
		while{true}do {
			if(DS_myDog getVariable ["standDown",false])exitWith{};

			{
				if((_x distance DS_myDog < 20)&&((side _x) isEqualTo civilian))exitWith {
					_nearestUnit = _x;
				};
			} forEach allPlayers;

			if(!isNil "_nearestUnit")then {
				DS_myDog moveTo (getPos _nearestUnit);

				_targets = allPlayers select {(_x distance DS_myDog) < 100};
				if(!(_targets isEqualTo []))then{[DS_myDog,"dogBark"] remoteExecCall ["DS_fnc_playSounds",_targets];};
			};

			sleep 3;
		};
	};

	if(_found)then {
		while{true}do {
			if(DS_myDog getVariable ["standDown",false])exitWith{};
			if(!alive DS_myDog)exitWith{};

			DS_myDog moveTo (getPos _nearestUnit);

			_targets = allPlayers select {(_x distance DS_myDog) < 100};
			if(!(_targets isEqualTo []))then{[DS_myDog,"dogBark"] remoteExecCall ["DS_fnc_playSounds",_targets];};

			sleep 5;
		};
	};
};

DS_myDogStandDown = {
	DS_myDog playMove "Dog_Sit";
	hint "Dog standing down";
	DS_myDog setVariable ["standDown",true,true];
	sleep 5;
	DS_myDog setVariable ["standDown",false,true];

	if(player distance DS_myDog > 1000)exitWith {
		hint "Dog was too far away and is now lost";
		deleteVehicle DS_myDog;
	};
};

DS_myDogAttack = {
	private ["_person","_targets"];

	_person = cursorTarget;

	DS_myDog playMove "Dog_Sprint";

	if(!(_person isKindOf "Man"))exitWith{hint "Invalid target"};
	if(!((side _person) isEqualTo civilian))exitWith{hint "Target is not a civilian"};

	while{true}do {
		if(!alive DS_myDog)exitWith{};

		DS_myDog moveTo (getPos _person);

		if(((DS_myDog distance _person) < 3)&&(isNull objectParent _person))exitWith {
			_targets = allPlayers select {(_x distance DS_myDog) < 100};
			if(!(_targets isEqualTo []))then{[DS_myDog,"dogBite"] remoteExecCall ["DS_fnc_playSounds",_targets];};

			_person setDamage 0.9;
		};

		sleep 1;
	};
};

DS_myDogEnterVehicle = {
	_vehicle = cursorTarget;

	if(player distance _vehicle > 20)exitWith{hint "You're too far from the vehicle"};

	DS_myDog playMove "Dog_Sprint";

	while{true}do {
		if(!alive DS_myDog)exitWith{};
		if(DS_myDog distance _vehicle < 5)exitWith {
			hint "Dog is in vehicle";
			deleteVehicle DS_myDog;
		};

		DS_myDog moveTo (getPos _vehicle);
		if(DS_myDog getVariable ["standDown",false])exitWith{};

		sleep 1;
	};
};

//[] spawn DS_myDogFollow;
//[] spawn DS_myDogAlive;