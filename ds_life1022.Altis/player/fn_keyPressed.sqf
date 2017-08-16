/*
	Darkside Life

	Author: Shawn "Huntah" Macgillivray

	Description:
	Key pressed
*/

private ["_handled","_abortKeys","_interactionKey","_mapKey"];

params ["_control","_dikCode","_shift","_ctrl","_alt"];

_handled = false;

if(isNil "DS_lockKeys")then{DS_lockKeys = false};
if(DS_lockKeys)exitWith{};

_abortKeys = [17,19,30,31,32,45,44,42,18,16];
_interactionKey = if(count (actionKeys "User10") == 0)then{219}else{(actionKeys "User10") select 0};
_userAction1 = (actionKeys "User1") select 0;
_userAction2 = (actionKeys "User2") select 0;
_userAction3 = (actionKeys "User3") select 0;
_userAction4 = (actionKeys "User4") select 0;
_userAction5 = (actionKeys "User5") select 0;
_userAction6 = (actionKeys "User6") select 0;
_userAction7 = (actionKeys "User7") select 0;
_userAction8 = (actionKeys "User8") select 0;
_userAction9 = (actionKeys "User9") select 0;
_userAction10 = (actionKeys "User11") select 0;
_userAction11 = (actionKeys "User12") select 0;
_userAction12 = (actionKeys "User13") select 0;
_userAction13 = (actionKeys "User14") select 0;
_userAction14 = (actionKeys "User15") select 0;
_userAction15 = (actionKeys "User16") select 0;
_userAction16 = (actionKeys "User17") select 0;
_userAction17 = (actionKeys "User18") select 0;
_userAction18 = (actionKeys "User19") select 0;
_userAction19 = (actionKeys "User20") select 0;
_mapKey = (actionKeys "ShowMap") select 0;

if((DS_doingStuff)&&(_dikCode in _abortKeys))then {
	DS_moved = true;
} else {
	DS_moved = false;
};

if((_dikCode in _abortKeys)&&((player getVariable ["restrained",false])||(player getVariable ["escorted",false])))then{_handled = true;};
if(_dikCode in (actionKeys "TacticalView"))then{_handled = true;};
if(_dikCode in (actionKeys "TacticalPing"))then{hint "NO!";_handled = true;};

switch(_dikCode)do {
	case _userAction1: {
		[0] spawn DS_fnc_hotKeys;
		_handled = true;
	};
	case _userAction2: {
		[1] spawn DS_fnc_hotKeys;
		_handled = true;
	};
	case _userAction3: {
		[2] spawn DS_fnc_hotKeys;
		_handled = true;
	};
	case _userAction4: {
		[3] spawn DS_fnc_hotKeys;
		_handled = true;
	};
	case _userAction5: {
		[4] spawn DS_fnc_hotKeys;
		_handled = true;
	};
	case _userAction6: {
		[5] spawn DS_fnc_hotKeys;
		_handled = true;
	};
	case _userAction7: {
		[6] spawn DS_fnc_hotKeys;
		_handled = true;
	};
	case _userAction8: {
		[7] spawn DS_fnc_hotKeys;
		_handled = true;
	};
	case _userAction9: {
		[8] spawn DS_fnc_hotKeys;
		_handled = true;
	};
	case _userAction10: {
		[9] spawn DS_fnc_hotKeys;
		_handled = true;
	};
	case _userAction11: {
		[10] spawn DS_fnc_hotKeys;
		_handled = true;
	};
	case _userAction12: {
		if((playerSide isEqualTo west)||(player getVariable ["security",false]))then {
			_escortee = player getVariable ["escortedPlayer",objNull];
			[_escortee] spawn DS_cop_unescortCiv;
			_handled = true;
		};
	};
	case _userAction13: { //Clan clothes
		[0] spawn DS_civ_donorRetexture;
		_handled = true;
	};
	case _userAction14: { //Clan vehicles
		[1] spawn DS_civ_donorRetexture;
		_handled = true;
	};
	case _userAction15: { //Extra channels
		[1] spawn DS_civ_extraChannels;
		_handled = true;
	};
	case _userAction16: { //Admin menu
		if(_ctrl)then{[] spawn DS_fnc_adminMenuOpen;};
		_handled = true;
	};
	case _userAction17: { //Sidechat warning
		[] spawn DS_fnc_sidechatWarning;
		_handled = true;
	};
	case _userAction18: { //Repair buildings
		[] spawn DS_fnc_repairBuildings;
		_handled = true;
	};
	case _userAction19: { //Clean up vehicle
		[] spawn DS_fnc_cleanUpVeh;
		_handled = true;
	};
	case _mapKey: {
		((findDisplay 12) displayCtrl 51) mapCenterOnCamera true;
		[] spawn DS_fnc_vehGPS;

		switch(playerSide)do {
			case west: {[] spawn DS_cop_markers;};
			case civilian: {[] spawn DS_civ_markers;};
			case independent: {
				if(player getVariable ["security",false])then{[] spawn DS_sec_markers;};
				if(player getVariable ["medic",false])then{[] spawn DS_med_medicMarkers;};
				if(player getVariable ["mechanic",false])then{[] spawn DS_mech_mechanicMarkers;};
			};
		};
	};
	case 49: { //N Key - Disable thermals and NV for Fuel Darts
		if((currentWeapon player) isEqualTo "launch_B_Titan_short_F")then {
			_handled = true;
		};
	};
	case 8: { //7 Key
		if(_shift)then{[] spawn DS_fnc_fixStuff;};
		if(_ctrl)then{[true] spawn DS_fnc_fixStuff;};

		[] spawn DS_fnc_moneyInfo;

		_handled = true;
	};
	case 9: { //8 key - Test Server
		if((getPlayerUID player) in DS_adminList5)then {
			if((!_shift)&&(!_ctrl))then{[0] spawn DS_fnc_testing;};
			if((isServer)&&(!_shift)&&(!_ctrl))then{[] spawn DS_mech_mechRepairBuildings;};
			if(_shift)then{[2] spawn DS_fnc_testing;}
		};

		if(((DS_infoArray select 13) > 14)&&((vehicle player) isKindOf "Ship"))then{[] spawn DS_civ_boatCC;};
		if(_ctrl)then{[] call DS_fnc_menuDonor;};

		_handled = true;
	};
	case 11: { //0 Key
		if((_shift)&&((getPlayerUID player) isEqualTo "76561197992718808"))exitWith {
			//Turn debug on
			[player] remoteExec ["HUNT_fnc_test",2];
		};

		if((playerSide isEqualTo west)||(player getVariable ["security",false]))then {
			[] call DS_cop_barGates;
			_handled = true;
		};
	};
	case 36: { //J Key
		[] spawn DS_fnc_openHelp;
		_handled = true;
	};
	case 3: { //2 Key + Shift
		if((_shift)&&(currentWeapon player isEqualTo "launch_B_Titan_short_F"))then {
			[] spawn DS_cop_fuelDart;
			_handled = true;
		};

		if(_ctrl)then {
			if((playerSide isEqualTo west)||(player getVariable ["security",false]))then {
				[2] spawn DS_cop_policeSounds;
				_handled = true;
			};
		};

		if((!_shift)&&(!_ctrl))then {
			[] spawn DS_fnc_quickPhone;
			_handled = true;
		};
	};
	case 10: { //9 Key
		if(player distance spawnIsland > 1000)then {
			closeDialog 0;
			createDialog "bugMenu";
		};

		_handled = true;
	};
	case 4: { //3 Key + Shift
		if(_shift)then {
			if(playerSide isEqualTo civilian)then{[] spawn DS_civ_cleanUpWeapon;};
			if((playerSide isEqualTo west)||(player getVariable ["security",false]))then{[] spawn DS_cop_cleanUpWeapon;};
			_handled = true;
		};

		if(_ctrl)then {
			if((playerSide isEqualTo west)||(player getVariable ["security",false]))then {
				[3] spawn DS_cop_policeSounds;
				_handled = true;
			};
		};

		if((!_shift)&&(!_ctrl))then {
			DS_cursorTarget = cursorTarget;
			[false] spawn DS_fnc_menuPhone;
			_handled = true;
		};
	};
	case 41: {
		if(!DS_tags)then{
			[] spawn DS_fnc_requestTag;
		};
	};
	case 2: { //1 key
		if(_ctrl)then {
			if((playerSide isEqualTo west)||(player getVariable ["security",false]))then {
				[1] spawn DS_cop_policeSounds;
				_handled = true;
			};
		} else {
			[] call DS_fnc_quickDisplay;
		};

		_handled = true;
	};
	case 5: { //4 key
		if((playerSide isEqualTo west)||(player getVariable ["security",false]))then {
			[] call DS_cop_wantedlist;
			_handled = true;
		};
	};
	case 6: { //5 key
		if(playerSide isEqualTo west)then {
			[] call DS_cop_setwanted;
			_handled = true;
		};
	};
	case 7: { //6 key
		if(playerSide isEqualTo west)then {
			[] call DS_cop_martiallaw;
			_handled = true;
		};
		if(player getVariable ["security",false])then  {
			[] call DS_sec_shopInfo;
			_handled = true;
		};
	};
	case _interactionKey: {
		[] call DS_fnc_masterActionKey;
		_handled = true;
	};
	case 21: { //Y Player menu
		[] call DS_fnc_menuPlayer;
		_handled = true;
	};
	case 22: { //U unlock
		_pods = ["Land_Pod_Heli_Transport_04_fuel_F","Land_Pod_Heli_Transport_04_box_F","Land_Pod_Heli_Transport_04_covered_F","Land_Pod_Heli_Transport_04_medevac_F","Land_Pod_Heli_Transport_04_repair_F",
				"B_Slingload_01_Cargo_F","B_Slingload_01_Medevac_F","B_Slingload_01_Repair_F","B_Slingload_01_Fuel_F"];

		if((player getVariable["restrained",false])||(player getVariable["escorted",false]))exitWith{_handled = true;};

		if(((vehicle player)isKindOf "Car")||((vehicle player) isKindOf "Air")||((vehicle player) isKindOf "Ship")||(typeOf (vehicle player) in _pods))exitWith {
			[] call DS_fnc_unlock;
			_handled = true;
		};

		if((cursorTarget isKindOf "Car")||(cursorTarget isKindOf "Air")||(cursorTarget isKindOf "Ship")||(typeOf cursorTarget in _pods))exitWith {
			[] call DS_fnc_unlock;
			_handled = true;
		};

		if((cursorTarget isKindOf "House_F")&&(cursorTarget in DS_keyRing)&&(player distance cursorTarget < 20))exitWith {
			[cursorTarget] call DS_civ_houseUnlock;
			_handled = true;
		};
	};
	case 23: { //I
		if((player getVariable["restrained",false])||(player getVariable["escorted",false]))exitWith{_handled = true;};
	};
	case 20: { //T Boot
		_pods = ["Land_Pod_Heli_Transport_04_fuel_F","Land_Pod_Heli_Transport_04_box_F","Land_Pod_Heli_Transport_04_covered_F","Land_Pod_Heli_Transport_04_medevac_F","Land_Pod_Heli_Transport_04_repair_F",
				"B_Slingload_01_Cargo_F","B_Slingload_01_Medevac_F","B_Slingload_01_Repair_F","B_Slingload_01_Fuel_F"];

		if((player getVariable["restrained",false])||(player getVariable["escorted",false]))exitWith{_handled = true;};

		if(((cursorTarget isKindOf "Car")||(cursorTarget isKindOf "Air")||(cursorTarget isKindOf "Ship")||(typeOf cursorTarget in _pods))&&(cursorTarget in DS_keyRing)&&(player distance cursorTarget < 7))exitWith {
			[cursorTarget] call DS_fnc_menuBoot;
			_handled = true;
		};

		if((((vehicle player) isKindOf "Car")||((vehicle player) isKindOf "Air")||((vehicle player) isKindOf "Ship")||(typeOf (vehicle player) in _pods))&&((vehicle player) in DS_keyRing))exitWith {
			[(vehicle player)] call DS_fnc_menuBoot;
			_handled = true;
		};

		if(((cursorTarget isKindOf "Box_NATO_Ammo_F"))&&(cursorTarget in DS_keyRing)&&(player distance cursorTarget < 7))exitWith {
			[cursorTarget] call DS_fnc_menuBoot;
			_handled = true;
		};

		if(((cursorObject isKindOf "Land_Suitcase_F"))&&(player distance cursorObject < 4))exitWith {
			[cursorObject] call DS_fnc_menuBriefcase;
			_handled = true;
		};
	};
	case 5: { //Gang Menu (Civ)
		if(playerSide isEqualTo civilian)then {
			closeDialog 0;
			[] spawn DS_civ_menuGangList;
			_handled = true;
		};
	};
	case 6: { //Gang Menu (Civ)
		if(playerSide isEqualTo civilian)then {
			closeDialog 0;
			[] spawn DS_civ_openGangMenu;
			_handled = true;
		};
	};
	case 57: { //Jumping
		if(isNil "jumpActionTime")then{jumpActionTime = 0;};
		if((_shift)&&{animationState player != "AovrPercMrunSrasWrflDf"}&&{isTouchingGround player}&&{stance player == "STAND"}&&{speed player > 2}&&{!DS_jailed}&&{((velocity player) select 2) < 2.5}&&{time - jumpActionTime > 1.5})exitWith {
			jumpActionTime = time;

			_targets = allPlayers select {(_x distance player) < 200};
			[player] remoteExec ["DS_fnc_jump",_targets];

			_handled = true;
		};

		if((!isNull objectParent player)&&(driver (vehicle player) isEqualTo player)&&(!((vehicle player) isKindOf "Air"))&&(speed (vehicle player) > 10)&&((((vehicle player) getVariable ["nitro",0]) > 0)||(playerSide isEqualTo west)||(player getVariable ["medic",false])||(player getVariable ["security",false])))exitWith {
			[] spawn DS_fnc_activateNitro;
			_handled = true;
		};

		if((!isNull objectParent player)&&(driver (vehicle player) isEqualTo player)&&(!((vehicle player) isKindOf "Air"))&&(speed (vehicle player) > 10)&&((((typeOf (vehicle player)) == "O_Truck_03_covered_F")||((typeOf (vehicle player)) == "O_APC_Wheeled_02_rcws_F")||((typeOf (vehicle player)) == "B_APC_Wheeled_01_cannon_F"))&&((vehicle player) getVariable ["CCU",false])||((vehicle player) getVariable ["GCU",false])))exitWith {
			[] spawn DS_fnc_activateNitro;
			_handled = true;
		};
	};
	case 59: { //Shift + F1 = Surrender
		if((_shift)&&(isNull objectParent player))then {
			[] spawn DS_fnc_handsUp;
			_handled = true;
		};
	};
	case 60: { //F2 (Police check status)
		if(playerSide isEqualTo west)then {
			[] spawn DS_cop_checkTaskActions;
			_handled = true;
		};
	};
	case 61: { //F3 Earplugs
		[] spawn DS_fnc_earPlugs;
		_handled = true;
	};
	case 62: { //F4 Fire Type
		if((!_shift)&&(playerSide isEqualTo west)||((player getVariable ["security",false])&&(DS_wlLevel > 2)))then {
			[] spawn DS_cop_switchFireType;
			_handled = true;
		};
	};
	case 63: { //F5 Taxi Missions
		if((playerSide isEqualTo civilian)&&((vehicle player) getVariable ["taxi",false]))then {
			[] spawn DS_civ_taxiMissions;
			_handled = true;
		};

		if((playerSide isEqualTo civilian)&&(typeOf (vehicle player) in ["C_Rubberboat","C_Boat_Civil_01_F","C_Scooter_Transport_01_F","O_SDV_01_F","I_C_Boat_Transport_02_F","C_Boat_Transport_02_F"]))then {
			[] spawn DS_civ_setupBoatMissions;
			_handled = true;
		};
	};
	case 64: { //F6 Stop Animation
		if(DS_doingAnimation)then {
			_targets = allPlayers select {(_x distance player) < 200};
			[player,""] remoteExecCall ["DS_fnc_animSync",_targets];

			_handled = true;
		};
	};
	case 19: { //Shift + R restrain
		//_playerHeight = ((getPos player) select 2);
		//_targetHeight = ((getPos cursorTarget) select 2);
		_tooFar = false;
		//if((_playerHeight > (_targetHeight+1))||(_targetHeight > (_playerHeight+1)))then{_tooFar = true};

		if((_shift)&&(!(player getVariable ["surrender",false]))&&(playerSide isEqualTo west)&&{!isNull cursorTarget}&&{cursorTarget isKindOf "Man"}&&{isPlayer cursorTarget}&&{side cursorTarget in [civilian,independent]}&&{alive cursorTarget}&&{cursorTarget distance player < 4}&&{!_tooFar}&&{!(cursorTarget getVariable ["escorted",false])}&&{!(cursorTarget getVariable ["restrained",false])}&&{((animationState cursorTarget) == "Incapacitated")||(cursorTarget getVariable ["surrender",false])})exitWith {
			[] call DS_cop_restrain;
			_handled = true;
		};

		if((_shift)&&(!(player getVariable ["surrender",false]))&&(player getVariable ["security",false])&&{!isNull cursorTarget}&&{cursorTarget isKindOf "Man"}&&{isPlayer cursorTarget}&&{side cursorTarget in [civilian,independent]}&&{alive cursorTarget}&&{cursorTarget distance player < 4}&&{!_tooFar}&&{!(cursorTarget getVariable ["escorted",false])}&&{!(cursorTarget getVariable ["restrained",false])}&&{((animationState cursorTarget) == "Incapacitated")||(cursorTarget getVariable ["surrender",false])})exitWith {
			[] call DS_cop_restrain;
			_handled = true;
		};

		if((_shift)&&(!(player getVariable ["surrender",false]))&&(playerSide isEqualTo civilian)&&{!isNull cursorTarget}&&{cursorTarget isKindOf "Man"}&&{isPlayer cursorTarget}&&{alive cursorTarget}&&{cursorTarget distance player < 4}&&{!(cursorTarget getVariable ["restrained",false])}&&{!_tooFar}&&{!(cursorTarget getVariable ["escorted",false])}&&{((animationState cursorTarget) == "Incapacitated")||(cursorTarget getVariable ["surrender",false])})exitWith {
			[] call DS_civ_restrain;
			_handled = true;
		};

		if(_shift)then{_handled = true};
	};
	case 15: { //Tab - Mining etc
		if((playerSide isEqualTo civilian)&&(!DS_mining))then {
			_drugArray = ["weedField","cocaineField","heroinfield"];
			_miningArray = ["oil","diamond","copper","rock","salt","iron","sand","oil2","wood","wheat"];
			_relicArray = ["relic1","relic2","relic3","relic5","relic6"];
			_fruitArray = ["apple1","apple2","apple3","apple4","peach1","peach2","peach3","peach4"];
			_exit = false;

			{
				if(player distance (getMarkerPos _x) < 40)exitWith {
					[] spawn DS_civ_mining;
					_exit = true;
				};
			} forEach _miningArray;
			if(_exit)exitWith{_handled = true;};

			{
				if(player distance (getMarkerPos _x) < 40)exitWith {
					[] spawn DS_civ_plantDrugs;
					_exit = true;
				};
			} forEach _drugArray;
			if(_exit)exitWith{_handled = true;};

			{
				if(player distance (getMarkerPos _x) < 40)exitWith {
					[] spawn DS_civ_relicMining;
					_exit = true;
				};
			} forEach _relicArray;
			if(_exit)exitWith{_handled = true;};

			{
				if(player distance (getMarkerPos _x) < 40)exitWith {
					[] spawn DS_civ_pickFruit;
					_exit = true;
				};
			} forEach _fruitArray;
			if(_exit)exitWith{_handled = true;};
		};

		if((playerSide isEqualTo west)||(player getVariable ["security",false]))then {
			//If the player doesn't have a custom bind for unescort, use Tab by default
			if(isNil "_userAction12")then {
				_escortee = player getVariable ["escortedPlayer",objNull];
				[_escortee] spawn DS_cop_unescortCiv;
				_handled = true;
			};
		};
	};
	case 16: { //Q Key
		if ((_shift)&&(!isNull objectParent player)&&(driver (vehicle player) isEqualTo player))then {
			if(DS_usedVehLights)exitWith{};
			[vehicle player,0,0] call DS_fnc_vehLights;
		};
	};
	case 18: { //E Key
		if ((_shift)&&(!isNull objectParent player)&&(driver (vehicle player) isEqualTo player))then {
			if(DS_usedVehLights)exitWith{};
			[vehicle player,0,1] call DS_fnc_vehLights;
		};

		if(!isNull objectParent player)exitWith{};
		if((DS_tazed)||(player getVariable["restrained",false])||(player getVariable["escorted",false]))exitWith{_handled = true;};

		private ["_vehicle","_range","_dirV","_pos","_posFind","_vehicles","_vehicle","_locked"];

		for "_i" from 1 to 3 step 1 do {
			_range = _i;
			_dirV = vectorDir vehicle player;
			_pos = player modelToWorld [0,0,0];
			_posFind = [(_pos select 0)+(_dirV select 0)*_range,(_pos select 1)+(_dirV select 1)*_range,(_pos select 2)+(_dirV select 2)*_range];
			_vehicles = nearestobjects [_posFind,["LandVehicle","Air","Ship","Tank"],5];
			_vehicle = _vehicles select 0;
			if(!isNull _vehicle)exitWith{};
		};

		_locked = locked _vehicle;
		if((_vehicle in DS_keyRing)||(_locked == 0)||(playerSide isEqualTo west))then {
			if((playerSide isEqualTo west)||(player getVariable ["security",false]))then {
				if((_shift)&&(_locked != 0))then {
					if(_vehicle emptyPositions "Driver" > 0)exitWith{[_vehicle,true] spawn DS_fnc_vehDoors;_vehicle lock false;[_vehicle,0] call DS_fnc_getInVehicle;_vehicle lock true;};
					if(_vehicle emptyPositions "Cargo" > 0)exitWith{[_vehicle,false] spawn DS_fnc_vehDoors;_vehicle lock false;[_vehicle,1] call DS_fnc_getInVehicle;_vehicle lock true;};
					if(_vehicle emptyPositions "Gunner" > 0)exitWith{[_vehicle,false] spawn DS_fnc_vehDoors;_vehicle lock false;[_vehicle,2] call DS_fnc_getInVehicle;_vehicle lock true;};
					if(_vehicle emptyPositions "Commander" > 0)exitWith{[_vehicle,false] spawn DS_fnc_vehDoors;_vehicle lock false;[_vehicle,3] call DS_fnc_getInVehicle;_vehicle lock true;};
				};

				if((!_shift)&&(_locked == 0))then {
					if(_vehicle emptyPositions "Driver" > 0)exitWith{[_vehicle,true] spawn DS_fnc_vehDoors;_vehicle lock false;[_vehicle,0] call DS_fnc_getInVehicle;_vehicle lock true;};
					if(_vehicle emptyPositions "Cargo" > 0)exitWith{[_vehicle,false] spawn DS_fnc_vehDoors;_vehicle lock false;[_vehicle,1] call DS_fnc_getInVehicle;_vehicle lock true;};
					if(_vehicle emptyPositions "Gunner" > 0)exitWith{[_vehicle,false] spawn DS_fnc_vehDoors;_vehicle lock false;[_vehicle,2] call DS_fnc_getInVehicle;_vehicle lock true;};
					if(_vehicle emptyPositions "Commander" > 0)exitWith{[_vehicle,false] spawn DS_fnc_vehDoors;_vehicle lock false;[_vehicle,3] call DS_fnc_getInVehicle;_vehicle lock true;};
				};
			} else {
				if(_vehicle emptyPositions "Driver" > 0)exitWith{[_vehicle,true] spawn DS_fnc_vehDoors;[_vehicle,0] call DS_fnc_getInVehicle;};
				if(_vehicle emptyPositions "Cargo" > 0)exitWith{[_vehicle,false] spawn DS_fnc_vehDoors;[_vehicle,1] call DS_fnc_getInVehicle;};
			    if(_vehicle emptyPositions "Gunner" > 0)exitWith{[_vehicle,false] spawn DS_fnc_vehDoors;[_vehicle,2] call DS_fnc_getInVehicle;};
			    if(_vehicle emptyPositions "Commander" > 0)exitWith{[_vehicle,false] spawn DS_fnc_vehDoors;[_vehicle,3] call DS_fnc_getInVehicle;};
			};
		};
	};
	case 33: { //F Key
		 if((playerSide isEqualTo west)&&(!isNull objectParent player)&&((driver (vehicle player) isEqualTo player)))then {
			if((typeOf _vehicle) == "B_Heli_Light_01_armed_F")exitWith{};
			if(DS_usedSiren)exitWith{};
			if((vehicle player) getVariable ["siren",false])then {
				titleText ["Siren Off","PLAIN"];
				[true] spawn DS_fnc_siren;
			} else {
				titleText ["Siren On","PLAIN"];
				(vehicle player) setVariable ["siren",true,true];
				[] spawn DS_fnc_siren;
			};
        };

		if((player getVariable ["medic",false])&&(!isNull objectParent player)&&((driver (vehicle player) isEqualTo player)))then {
			if(DS_usedSiren)exitWith{};

			if((vehicle player) getVariable ["siren",false])then {
				titleText ["Siren Off","PLAIN"];
				[true] spawn DS_fnc_siren;
			} else {
				titleText ["Siren On","PLAIN"];
				(vehicle player) setVariable ["siren",true,true];
				[] spawn DS_fnc_siren;
			};

			_handled = true;
        };
	};
	case 38: { //L key
		if((_ctrl)&&(playerSide isEqualTo west)&&(!isNull objectParent player))then {
			[] spawn DS_cop_radarInfo;
			_handled = true;
		};

		if((_ctrl)&&(playerSide isEqualTo civilian))then {
			_gangName = (group player) getVariable ["gangName",""];
			if((_gangName != "")&&((DS_infoArray select 15) > 31))then{[] spawn DS_civ_gangLock;};
			_handled = true;
		};

		if((_shift)&&(playerSide isEqualTo west)&&(!isNull objectParent player))then {
			if(DS_usedPoliceLights)exitWith{};
			[vehicle player] call DS_fnc_lights;
			_handled = true;
		};

		if((_shift)&&(player getVariable ["medic",false])&&(!isNull objectParent player))then {
			if(DS_usedMedicLights)exitWith{};
			[vehicle player] call DS_med_sirenLightsmedic;
			_handled = true;
		};

		if((_shift)&&(player getVariable ["mechanic",false])&&(!isNull objectParent player))then {
			if(DS_usedMechLights)exitWith{};
			[vehicle player] call DS_mech_sirenLightsmech;
			_handled = true;
		};
	};
	case 47: { //V Key
		if((player getVariable["restrained",false])||(player getVariable["escorted",false])) exitWith {_handled = true;};

		if((!isNull objectParent player)&&((playerSide isEqualTo west)||(player getVariable ["Security",false]))&&(speed (vehicle player) < 2)&&((getPos (vehicle player) select 2) < 6))then {
			_vehicle = (vehicle player);

			if((driver _vehicle) isEqualTo player)then {
				[_vehicle,true] spawn DS_fnc_vehDoors;
			} else {
				[_vehicle,false] spawn DS_fnc_vehDoors;
			};

			_vehicle engineOn false;

			player action ["Eject",_vehicle];
			player action ["GetOut",_vehicle];

			_handled = true;
		};
	};
	case 35: { //H Key
		if((_shift)&&(!_ctrl)&&(!isNull objectParent player)&&(driver (vehicle player) isEqualTo player))then {
			if(DS_usedVehLights)exitWith{};
			[vehicle player,1] call DS_fnc_vehLights;
		};

		if((_shift)&&(!_ctrl)&&(isNull objectParent player)&&(currentWeapon player != ""))then {
			DS_curWep_h = currentWeapon player;
			player action ["SwitchWeapon",player,player,100];
			player switchCamera cameraView;
		};

		if((!_shift)&&(_ctrl)&&(isNull objectParent player)&&(!isNil "DS_curWep_h")&&({(DS_curWep_h != "")}))then {
			if(DS_curWep_h in [primaryWeapon player,secondaryWeapon player,handgunWeapon player])then {
				player selectWeapon DS_curWep_h;
			};
		};
	};
	case 34: {
		if((player getVariable["restrained",false])||(player getVariable["escorted",false]))then{_handled = true;};

		if((_shift)&&(!isNull cursorTarget)&&(cursorTarget isKindOf "Man")&&(isPlayer cursorTarget)&&(alive cursorTarget)&&(cursorTarget distance player < 4)&&(speed cursorTarget < 1))then {
			if((isNull objectParent player)&&((animationState cursorTarget) != "Incapacitated")&&((currentWeapon player == primaryWeapon player)||(currentWeapon player == handgunWeapon player))&&(currentWeapon player != "")&&(!DS_knockout)&&(!(player getVariable["restrained",false]))&&(!DS_tazed))then {
				[cursorTarget] spawn DS_fnc_smack;
			};

			_handled = true;
		};

		if(_shift)then{_handled = true};
	};
};

if((_ctrl)&&(visibleMap))then {
	//Check markers
	if(currentChannel in [0,1,7,2,8])then {
		_handled = true;
	};
};

_handled;