
/*
Script File Author: Repentz
Script File Mod: Life Server
Script File: RPP_DMV.sqf

Description:
DMV
*/
["RPP_DMV_Dialog", {
	createDialog "RPP_DMV";
	buttonSetAction [1600,"[] call RPP_DMV_TakeTest;"];
	{
		lbAdd [1500, format ["%1 ($%2)",_x select 0, _x select 1]];
	} foreach RPP_DMV_Licenses;
	{
		lbAdd [1501, format ["%1",_x]];
	} foreach RPP_License;
}] call RPP_Function;
publicVariable "RPP_DMV_Dialog";

["RPP_DMV_TakeTest", {
	if (lbCurSel 1500 == -1) exitWith {
		hint "Please select a license first.";
		
		
	};
	private ["_Array","_Licenses","_Price","_Spawnpoint","_Time","_needTest","_call"];
	_Array = RPP_DMV_Licenses select (lbCurSel 1500);
	_Licenses = _array select 0;
	_Price = _array select 1;
	_Spawnpoint = _array select 2;
	_Time = _array select 3;
	_needTest = _array select 4;
	_call = _array select 5;

	if (_Licenses in RPP_License) exitWith {
		hint "You already got this Licenses.";
		
		
	};
	if (RPP_Cash < _Price) exitWith {
		hint "You don't have enough cash for this License.";
		
		
	};

	if (_needTest) then {
		[_Price,_Spawnpoint,_Time,_Licenses] call compile format ["call %1",_call];
		hint format ["You are now taking the %1 test, Follow the waypoints!",_Licenses];
		
		
	} else {
		RPP_License = RPP_License + [_Licenses];
		hint format ["You Bought the %1 for $%2",_Licenses,_Price];
		
		
	};
	[_Price] call RPP_AntiCheat_RemoveMoney;
	closeDialog 1;
}] call RPP_Function;
publicVariable "RPP_DMV_TakeTest";

["RPP_DMV_StartTest_Driver", {
	[_this select 0,_this select 1,_this select 2,_this select 3] spawn {
		_Price = _this select 0;
		_Spawnpoint = _this select 1;
		_Time = _this select 2;
		_Licenses = _this select 3;

		_RPP_DMV_Vehicle = "red_genesis_16_black" createVehicle (position _Spawnpoint);
		_dir = getdir(_Spawnpoint);
		_RPP_DMV_Vehicle setDir _dir;
		player setpos (position _Spawnpoint);
		player moveIndriver _RPP_DMV_Vehicle;
		player setVariable ["RPP_DMV_Test",true,true];

		_wp = (group player) addWaypoint [ getMarkerPos "RPP_DriverLic_Test_Point1", 0 ];
		_wp setWaypointType "MOVE";
        _wp setWaypointBehaviour "AWARE";
        _wp setWaypointSpeed "FULL";
        _wp setWaypointCombatMode "RED";
        _waypoint = "RPP_DriverLic_Test_Point1";

		while {player getVariable "RPP_DMV_Test"} do {
			titleText [format ["DMV Timer: %1",_Time], "PLAIN"];
			sleep 0.5;
			if (player distance (getMarkerpos "RPP_DriverLic_Test_Finish") <= 15) exitWith {
				hint "You finished the test!";
				
				
				deleteWaypoint _wp;
				player allowDamage false;
				player setVariable ["RPP_DMV_Test",false,true];
				player setpos (getMarkerPos "RPP_Civ_Spawn");
				deleteVehicle _RPP_DMV_Vehicle;
				RPP_License = RPP_License + [_Licenses];
				player setpos (getMarkerPos "RPP_Civ_Spawn");
				player allowDamage false;
				sleep 1;
				player allowDamage true;
				player setDamage 0;
			};
			if (player distance (getMarkerPos _waypoint) <= 50) then {
				if (_waypoint == "RPP_DriverLic_Test_Point4") then {
					deleteWaypoint _wp;
					_wp = (group player) addWaypoint [ getMarkerPos "RPP_DriverLic_Test_Finish", 0 ];
					_waypoint = "RPP_DriverLic_Test_Finish";
					_wp setWaypointType "MOVE";
        			_wp setWaypointBehaviour "AWARE";
       				_wp setWaypointSpeed "FULL";
        			_wp setWaypointCombatMode "RED";
				};
				if (_waypoint == "RPP_DriverLic_Test_Point3") then {
					deleteWaypoint _wp;
					_wp = (group player) addWaypoint [ getMarkerPos "RPP_DriverLic_Test_Point4", 0 ];
					_waypoint = "RPP_DriverLic_Test_Point4";
					_wp setWaypointType "MOVE";
        			_wp setWaypointBehaviour "AWARE";
       				_wp setWaypointSpeed "FULL";
        			_wp setWaypointCombatMode "RED";
				};
				if (_waypoint == "RPP_DriverLic_Test_Point2") then {
					deleteWaypoint _wp;
					_wp = (group player) addWaypoint [ getMarkerPos "RPP_DriverLic_Test_Point3", 0 ];
					_waypoint = "RPP_DriverLic_Test_Point3";
					_wp setWaypointType "MOVE";
        			_wp setWaypointBehaviour "AWARE";
       				_wp setWaypointSpeed "FULL";
        			_wp setWaypointCombatMode "RED";
				};
				if (_waypoint == "RPP_DriverLic_Test_Point1") then {
					deleteWaypoint _wp;
					_wp = (group player) addWaypoint [ getMarkerPos "RPP_DriverLic_Test_Point2", 0 ];
					_waypoint = "RPP_DriverLic_Test_Point2";
					_wp setWaypointType "MOVE";
        			_wp setWaypointBehaviour "AWARE";
       				_wp setWaypointSpeed "FULL";
        			_wp setWaypointCombatMode "RED";
				};
			};

			if (vehicle player == player) exitWith {
				hint "You failed the test because you left the vehicle.";
				
				
				player setVariable ["RPP_DMV_Test",false,true];
				player setpos (getMarkerPos "RPP_Civ_Spawn");
				deleteVehicle _RPP_DMV_Vehicle;
				player allowDamage false;
				sleep 1;
				player allowDamage true;
				player setDamage 0;
			};
			if (_Time <= 0) exitWith {
				hint "You failed the test because the timer ran out";
				
				
				player setVariable ["RPP_DMV_Test",false,true];
				player setpos (getMarkerPos "RPP_Civ_Spawn");
				deleteVehicle _RPP_DMV_Vehicle;
				player allowDamage false;
				sleep 1;
				player allowDamage true;
				player setDamage 0;
			};
			if (!Alive player) exitWith {
				hint "You failed the test because you died";
				
				
				player setVariable ["RPP_DMV_Test",false,true];
				player setpos (getMarkerPos "RPP_Civ_Spawn");
				deleteVehicle _RPP_DMV_Vehicle;
				player allowDamage false;
				sleep 1;
				player allowDamage true;
				player setDamage 0;
			};
			if (player getVariable "RPP_Revive") exitWith {
				hint "You failed the test because you died";
				
				
				player setVariable ["RPP_DMV_Test",false,true];
				player setpos (getMarkerPos "RPP_Civ_Spawn");
				deleteVehicle _RPP_DMV_Vehicle;
				player allowDamage false;
				sleep 1;
				player allowDamage true;
				player setDamage 0;
			};
			if (player getVariable "RPP_Handcuff") exitWith {
				hint "You failed the test because you got handcuffed";
				
				
				player setVariable ["RPP_DMV_Test",false,true];
				player setpos (getMarkerPos "RPP_Civ_Spawn");
				deleteVehicle _RPP_DMV_Vehicle;
				player allowDamage false;
				sleep 1;
				player allowDamage true;
				player setDamage 0;
			};

			sleep 0.5;
			deleteWaypoint _wp;

			_wp = (group player) addWaypoint [ getMarkerPos _waypoint, 0 ];
			_wp setWaypointType "MOVE";
       		_wp setWaypointBehaviour "AWARE";
       		_wp setWaypointSpeed "FULL";
       		_wp setWaypointCombatMode "RED";
			_Time = _Time - 1;
		};
	};
}] call RPP_Function;
publicVariable "RPP_DMV_StartTest_Driver";

["RPP_DMV_StartTest_Boat", {
	[_this select 0,_this select 1,_this select 2,_this select 3] spawn {
		_Price = _this select 0;
		_Spawnpoint = _this select 1;
		_Time = _this select 2;
		_Licenses = _this select 3;

		_RPP_DMV_Vehicle = "I_G_Boat_Transport_01_F" createVehicle (position _Spawnpoint);
		_dir = getdir(_Spawnpoint);
		_RPP_DMV_Vehicle setDir _dir;
		player setpos (position _Spawnpoint);
		player moveIndriver _RPP_DMV_Vehicle;
		player setVariable ["RPP_DMV_Test",true,true];

		_wp = (group player) addWaypoint [ getMarkerPos "RPP_BoatLic_test_End", 0 ];
		_wp setWaypointType "MOVE";
        _wp setWaypointBehaviour "AWARE";
        _wp setWaypointSpeed "FULL";
        _wp setWaypointCombatMode "RED";
        _waypoint = "RPP_BoatLic_test_End";

		while {player getVariable "RPP_DMV_Test"} do {
			titleText [format ["DMV Timer: %1",_Time], "PLAIN"];
			sleep 0.5;
			if (player distance (getMarkerpos "RPP_BoatLic_test_End") <= 15) exitWith {
				hint "You finished the test!";
				
				
				deleteWaypoint _wp;
				player setVariable ["RPP_DMV_Test",false,true];
				deleteVehicle _RPP_DMV_Vehicle;
				player setpos (getMarkerPos "RPP_Civ_Spawn");
				RPP_License = RPP_License + [_Licenses];
				player allowDamage false;
				sleep 1;
				player allowDamage true;
				player setDamage 0;
			};

			if (vehicle player == player) exitWith {
				hint "You failed the test because you jumped out of the vehicle.";
				
				
				player setVariable ["RPP_DMV_Test",false,true];
				player setpos (getMarkerPos "RPP_Civ_Spawn");
				deleteVehicle _RPP_DMV_Vehicle;
				player allowDamage false;
				sleep 1;
				player allowDamage true;
				player setDamage 0;
			};
			if (_Time <= 0) exitWith {
				hint "You failed the test because the timer ran out";
				
				
				player setVariable ["RPP_DMV_Test",false,true];
				player setpos (getMarkerPos "RPP_Civ_Spawn");
				deleteVehicle _RPP_DMV_Vehicle;
				player allowDamage false;
				sleep 1;
				player allowDamage true;
				player setDamage 0;
			};
			if (!Alive player) exitWith {
				hint "You failed the test because you died";
				
				
				player setVariable ["RPP_DMV_Test",false,true];
				player setpos (getMarkerPos "RPP_Civ_Spawn");
				deleteVehicle _RPP_DMV_Vehicle;
				player allowDamage false;
				sleep 1;
				player allowDamage true;
				player setDamage 0;
			};
			if (player getVariable "RPP_Revive") exitWith {
				hint "You failed the test because you died";
				
				
				player setVariable ["RPP_DMV_Test",false,true];
				player setpos (getMarkerPos "RPP_Civ_Spawn");
				deleteVehicle _RPP_DMV_Vehicle;
				player allowDamage false;
				sleep 1;
				player allowDamage true;
				player setDamage 0;
			};
			if (player getVariable "RPP_Handcuff") exitWith {
				hint "You failed the test because you got handcuffed";
				
				
				player setVariable ["RPP_DMV_Test",false,true];
				player setpos (getMarkerPos "RPP_Civ_Spawn");
				deleteVehicle _RPP_DMV_Vehicle;
				player allowDamage false;
				sleep 1;
				player allowDamage true;
				player setDamage 0;
			};

			sleep 0.5;
			deleteWaypoint _wp;

			_wp = (group player) addWaypoint [ getMarkerPos _waypoint, 0 ];
			_wp setWaypointType "MOVE";
       		_wp setWaypointBehaviour "AWARE";
       		_wp setWaypointSpeed "FULL";
       		_wp setWaypointCombatMode "RED";
			_Time = _Time - 1;
		};
	};
}] call RPP_Function;
/*
publicVariable "RPP_DMV_StartTest_Boat";

["RPP_DMV_StartTest_Pilot", {
	[_this select 0,_this select 1,_this select 2,_this select 3] spawn {
		_Price = _this select 0;
		_Spawnpoint = _this select 1;
		_Time = _this select 2;
		_Licenses = _this select 3;

		_RPP_DMV_Vehicle = "B_Heli_Light_01_stripped_F" createVehicle (position _Spawnpoint);
		_dir = getdir(_Spawnpoint);
		_RPP_DMV_Vehicle setDir _dir;
		player setpos (position _Spawnpoint);
		player moveIndriver _RPP_DMV_Vehicle;
		player setVariable ["RPP_DMV_Test",true,true];

		_wp = (group player) addWaypoint [ getMarkerPos "RPP_HeliLic_TestPoint_End", 0 ];
		_wp setWaypointType "MOVE";
        _wp setWaypointBehaviour "AWARE";
        _wp setWaypointSpeed "FULL";
        _wp setWaypointCombatMode "RED";
        _waypoint = "RPP_HeliLic_TestPoint_End";

		while {player getVariable "RPP_DMV_Test"} do {
			titleText [format ["DMV Timer: %1",_Time], "PLAIN"];
			sleep 0.5;
			if (player distance (getMarkerpos "RPP_HeliLic_TestPoint_EndLic") <= 15) exitWith {
				hint "You finished the test!";
				
				
				deleteWaypoint _wp;
				player setVariable ["RPP_DMV_Test",false,true];
				deleteVehicle _RPP_DMV_Vehicle;
				player setpos (getMarkerPos "RPP_Civ_Spawn");
				RPP_License = RPP_License + [_Licenses];
				player allowDamage false;
				sleep 1;
				player allowDamage true;
				player setDamage 0;
			};
			if (player distance (getMarkerPos _waypoint) <= 50) then {
				if (_waypoint == "RPP_HeliLic_TestPoint_EndLic") then {
					deleteWaypoint _wp;
					_wp = (group player) addWaypoint [ getMarkerPos "RPP_HeliLic_TestPoint_EndLic", 0 ];
					_waypoint = "RPP_HeliLic_TestPoint_EndLic";
					_wp setWaypointType "MOVE";
        			_wp setWaypointBehaviour "AWARE";
       				_wp setWaypointSpeed "FULL";
        			_wp setWaypointCombatMode "RED";
				};
				if (_waypoint == "RPP_HeliLic_TestPoint_End") then {
					deleteWaypoint _wp;
					_wp = (group player) addWaypoint [ getMarkerPos "RPP_HeliLic_TestPoint_EndLic", 0 ];
					_waypoint = "RPP_HeliLic_TestPoint_EndLic";
					_wp setWaypointType "MOVE";
        			_wp setWaypointBehaviour "AWARE";
       				_wp setWaypointSpeed "FULL";
        			_wp setWaypointCombatMode "RED";
				};
			};

			if (vehicle player == player) exitWith {
				hint "You failed the test because you jumped out of the vehicle.";
				
				
				player setVariable ["RPP_DMV_Test",false,true];
				player setpos (getMarkerPos "RPP_Civ_Spawn");
				deleteVehicle _RPP_DMV_Vehicle;
				player allowDamage false;
				sleep 1;
				player allowDamage true;
				player setDamage 0;
			};
			if (_Time <= 0) exitWith {
				hint "You failed the test because the timer ran out";
				
				
				player setVariable ["RPP_DMV_Test",false,true];
				player setpos (getMarkerPos "RPP_Civ_Spawn");
				deleteVehicle _RPP_DMV_Vehicle;
				player allowDamage false;
				sleep 1;
				player allowDamage true;
				player setDamage 0;
			};
			if (!Alive player) exitWith {
				hint "You failed the test because you died";
				
				
				player setVariable ["RPP_DMV_Test",false,true];
				player setpos (getMarkerPos "RPP_Civ_Spawn");
				deleteVehicle _RPP_DMV_Vehicle;
				player allowDamage false;
				sleep 1;
				player allowDamage true;
				player setDamage 0;
			};
			if (player getVariable "RPP_Revive") exitWith {
				hint "You failed the test because you died";
				
				
				player setVariable ["RPP_DMV_Test",false,true];
				player setpos (getMarkerPos "RPP_Civ_Spawn");
				deleteVehicle _RPP_DMV_Vehicle;
				player allowDamage false;
				sleep 1;
				player allowDamage true;
				player setDamage 0;
			};
			if (player getVariable "RPP_Handcuff") exitWith {
				hint "You failed the test because you got handcuffed";
				
				
				player setVariable ["RPP_DMV_Test",false,true];
				player setpos (getMarkerPos "RPP_Civ_Spawn");
				deleteVehicle _RPP_DMV_Vehicle;
				player allowDamage false;
				sleep 1;
				player allowDamage true;
				player setDamage 0;
			};

			sleep 0.5;
			deleteWaypoint _wp;

			_wp = (group player) addWaypoint [ getMarkerPos _waypoint, 0 ];
			_wp setWaypointType "MOVE";
       		_wp setWaypointBehaviour "AWARE";
       		_wp setWaypointSpeed "FULL";
       		_wp setWaypointCombatMode "RED";
			_Time = _Time - 1;
		};
	};
}] call RPP_Function;
publicVariable "RPP_DMV_StartTest_Pilot";

["RPP_DMV_StartTest_Truck", {
	[_this select 0,_this select 1,_this select 2,_this select 3] spawn {
		_Price = _this select 0;
		_Spawnpoint = _this select 1;
		_Time = _this select 2;
		_Licenses = _this select 3;

		_RPP_DMV_Vehicle = "red_genesis_16_black" createVehicle (position _Spawnpoint);
		_dir = getdir(_Spawnpoint);
		_RPP_DMV_Vehicle setDir _dir;
		player setpos (position _Spawnpoint);
		player moveIndriver _RPP_DMV_Vehicle;
		player setVariable ["RPP_DMV_Test",true,true];

		_wp = (group player) addWaypoint [ getMarkerPos "RPP_TruckLic_test_Point1", 0 ];
		_wp setWaypointType "MOVE";
        _wp setWaypointBehaviour "AWARE";
        _wp setWaypointSpeed "FULL";
        _wp setWaypointCombatMode "RED";
        _waypoint = "RPP_TruckLic_test_Point1";

		while {player getVariable "RPP_DMV_Test"} do {
			titleText [format ["DMV Timer: %1",_Time], "PLAIN"];
			sleep 0.5;
			if (player distance (getMarkerpos "RPP_TruckLic_test_End") <= 15) exitWith {
				hint "You finished the test!";
				
				
				deleteWaypoint _wp;
				player setVariable ["RPP_DMV_Test",false,true];
				deleteVehicle _RPP_DMV_Vehicle;
				player setpos (getMarkerPos "RPP_Civ_Spawn");
				RPP_License = RPP_License + [_Licenses];
				player allowDamage false;
				sleep 1;
				player allowDamage true;
				player setDamage 0;
			};
			if (player distance (getMarkerPos _waypoint) <= 50) then {
				if (_waypoint == "RPP_TruckLic_test_Point4") then {
					deleteWaypoint _wp;
					_wp = (group player) addWaypoint [ getMarkerPos "RPP_TruckLic_test_End", 0 ];
					_waypoint = "RPP_TruckLic_test_End";
					_wp setWaypointType "MOVE";
        			_wp setWaypointBehaviour "AWARE";
       				_wp setWaypointSpeed "FULL";
        			_wp setWaypointCombatMode "RED";
				};
				if (_waypoint == "RPP_TruckLic_test_Point3") then {
					deleteWaypoint _wp;
					_wp = (group player) addWaypoint [ getMarkerPos "RPP_TruckLic_test_Point4", 0 ];
					_waypoint = "RPP_TruckLic_test_Point4";
					_wp setWaypointType "MOVE";
        			_wp setWaypointBehaviour "AWARE";
       				_wp setWaypointSpeed "FULL";
        			_wp setWaypointCombatMode "RED";
				};
				if (_waypoint == "RPP_TruckLic_test_Point2") then {
					deleteWaypoint _wp;
					_wp = (group player) addWaypoint [ getMarkerPos "RPP_TruckLic_test_Point3", 0 ];
					_waypoint = "RPP_TruckLic_test_Point3";
					_wp setWaypointType "MOVE";
        			_wp setWaypointBehaviour "AWARE";
       				_wp setWaypointSpeed "FULL";
        			_wp setWaypointCombatMode "RED";
				};
				if (_waypoint == "RPP_TruckLic_test_Point1") then {
					deleteWaypoint _wp;
					_wp = (group player) addWaypoint [ getMarkerPos "RPP_TruckLic_test_Point2", 0 ];
					_waypoint = "RPP_TruckLic_test_Point2";
					_wp setWaypointType "MOVE";
        			_wp setWaypointBehaviour "AWARE";
       				_wp setWaypointSpeed "FULL";
        			_wp setWaypointCombatMode "RED";
				};
			};

			if (vehicle player == player) exitWith {
				hint "You failed the test because you jumped out of the vehicle.";
				
				
				player setVariable ["RPP_DMV_Test",false,true];
				player setpos (getMarkerPos "RPP_Civ_Spawn");
				deleteVehicle _RPP_DMV_Vehicle;
				player allowDamage false;
				sleep 1;
				player allowDamage true;
				player setDamage 0;
			};
			if (_Time <= 0) exitWith {
				hint "You failed the test because the timer ran out";
				
				
				player setVariable ["RPP_DMV_Test",false,true];
				player setpos (getMarkerPos "RPP_Civ_Spawn");
				deleteVehicle _RPP_DMV_Vehicle;
				player allowDamage false;
				sleep 1;
				player allowDamage true;
				player setDamage 0;
			};
			if (!Alive player) exitWith {
				hint "You failed the test because you died";
				
				
				player setVariable ["RPP_DMV_Test",false,true];
				player setpos (getMarkerPos "RPP_Civ_Spawn");
				deleteVehicle _RPP_DMV_Vehicle;
				player allowDamage false;
				sleep 1;
				player allowDamage true;
				player setDamage 0;
			};
			if (player getVariable "RPP_Revive") exitWith {
				hint "You failed the test because you died";
				
				
				player setVariable ["RPP_DMV_Test",false,true];
				player setpos (getMarkerPos "RPP_Civ_Spawn");
				deleteVehicle _RPP_DMV_Vehicle;
				player allowDamage false;
				sleep 1;
				player allowDamage true;
				player setDamage 0;
			};
			if (player getVariable "RPP_Handcuff") exitWith {
				hint "You failed the test because you got handcuffed";
				
				
				player setVariable ["RPP_DMV_Test",false,true];
				player setpos (getMarkerPos "RPP_Civ_Spawn");
				deleteVehicle _RPP_DMV_Vehicle;
				player allowDamage false;
				sleep 1;
				player allowDamage true;
				player setDamage 0;
			};

			sleep 0.5;
			deleteWaypoint _wp;

			_wp = (group player) addWaypoint [ getMarkerPos _waypoint, 0 ];
			_wp setWaypointType "MOVE";
       		_wp setWaypointBehaviour "AWARE";
       		_wp setWaypointSpeed "FULL";
       		_wp setWaypointCombatMode "RED";
			_Time = _Time - 1;
		};
	};
}] call RPP_Function;
publicVariable "RPP_DMV_StartTest_Truck";

["RPP_DMV_StartTest_Bus", {
	[_this select 0,_this select 1,_this select 2,_this select 3] spawn {
		_Price = _this select 0;
		_Spawnpoint = _this select 1;
		_Time = _this select 2;
		_Licenses = _this select 3;

		_RPP_DMV_Vehicle = "Skyline_Bus_03_F" createVehicle (position _Spawnpoint);
		_dir = getdir(_Spawnpoint);
		_RPP_DMV_Vehicle setDir _dir;
		player setpos (position _Spawnpoint);
		player moveIndriver _RPP_DMV_Vehicle;
		player setVariable ["RPP_DMV_Test",true,true];

		_wp = (group player) addWaypoint [ getMarkerPos "RPP_TruckLic_test_Point1", 0 ];
		_wp setWaypointType "MOVE";
        _wp setWaypointBehaviour "AWARE";
        _wp setWaypointSpeed "FULL";
        _wp setWaypointCombatMode "RED";
        _waypoint = "RPP_TruckLic_test_Point1";

		while {player getVariable "RPP_DMV_Test"} do {
			titleText [format ["DMV Timer: %1",_Time], "PLAIN"];
			sleep 0.5;
			if (player distance (getMarkerpos "RPP_TruckLic_test_End") <= 15) exitWith {
				hint "You finished the test!";
				
				
				deleteWaypoint _wp;
				player setVariable ["RPP_DMV_Test",false,true];
				deleteVehicle _RPP_DMV_Vehicle;
				player setpos (getMarkerPos "RPP_Civ_Spawn");
				RPP_License = RPP_License + [_Licenses];
				player allowDamage false;
				sleep 1;
				player allowDamage true;
				player setDamage 0;
			};
			if (player distance (getMarkerPos _waypoint) <= 50) then {
				if (_waypoint == "RPP_TruckLic_test_Point4") then {
					deleteWaypoint _wp;
					_wp = (group player) addWaypoint [ getMarkerPos "RPP_TruckLic_test_End", 0 ];
					_waypoint = "RPP_TruckLic_test_End";
					_wp setWaypointType "MOVE";
        			_wp setWaypointBehaviour "AWARE";
       				_wp setWaypointSpeed "FULL";
        			_wp setWaypointCombatMode "RED";
				};
				if (_waypoint == "RPP_TruckLic_test_Point3") then {
					deleteWaypoint _wp;
					_wp = (group player) addWaypoint [ getMarkerPos "RPP_TruckLic_test_Point4", 0 ];
					_waypoint = "RPP_TruckLic_test_Point4";
					_wp setWaypointType "MOVE";
        			_wp setWaypointBehaviour "AWARE";
       				_wp setWaypointSpeed "FULL";
        			_wp setWaypointCombatMode "RED";
				};
				if (_waypoint == "RPP_TruckLic_test_Point2") then {
					deleteWaypoint _wp;
					_wp = (group player) addWaypoint [ getMarkerPos "RPP_TruckLic_test_Point3", 0 ];
					_waypoint = "RPP_TruckLic_test_Point3";
					_wp setWaypointType "MOVE";
        			_wp setWaypointBehaviour "AWARE";
       				_wp setWaypointSpeed "FULL";
        			_wp setWaypointCombatMode "RED";
				};
				if (_waypoint == "RPP_TruckLic_test_Point1") then {
					deleteWaypoint _wp;
					_wp = (group player) addWaypoint [ getMarkerPos "RPP_TruckLic_test_Point2", 0 ];
					_waypoint = "RPP_TruckLic_test_Point2";
					_wp setWaypointType "MOVE";
        			_wp setWaypointBehaviour "AWARE";
       				_wp setWaypointSpeed "FULL";
        			_wp setWaypointCombatMode "RED";
				};
			};

			if (vehicle player == player) exitWith {
				hint "You failed the test because you jumped out of the vehicle.";
				
				
				player setVariable ["RPP_DMV_Test",false,true];
				player setpos (getMarkerPos "RPP_Civ_Spawn");
				deleteVehicle _RPP_DMV_Vehicle;
				player allowDamage false;
				sleep 1;
				player allowDamage true;
				player setDamage 0;
			};
			if (_Time <= 0) exitWith {
				hint "You failed the test because the timer ran out";
				
				
				player setVariable ["RPP_DMV_Test",false,true];
				player setpos (getMarkerPos "RPP_Civ_Spawn");
				deleteVehicle _RPP_DMV_Vehicle;
				player allowDamage false;
				sleep 1;
				player allowDamage true;
				player setDamage 0;
			};
			if (!Alive player) exitWith {
				hint "You failed the test because you died";
				
				
				player setVariable ["RPP_DMV_Test",false,true];
				player setpos (getMarkerPos "RPP_Civ_Spawn");
				deleteVehicle _RPP_DMV_Vehicle;
				player allowDamage false;
				sleep 1;
				player allowDamage true;
				player setDamage 0;
			};
			if (player getVariable "RPP_Revive") exitWith {
				hint "You failed the test because you died";
				
				
				player setVariable ["RPP_DMV_Test",false,true];
				player setpos (getMarkerPos "RPP_Civ_Spawn");
				deleteVehicle _RPP_DMV_Vehicle;
				player allowDamage false;
				sleep 1;
				player allowDamage true;
				player setDamage 0;
			};
			if (player getVariable "RPP_Handcuff") exitWith {
				hint "You failed the test because you got handcuffed";
				
				
				player setVariable ["RPP_DMV_Test",false,true];
				player setpos (getMarkerPos "RPP_Civ_Spawn");
				deleteVehicle _RPP_DMV_Vehicle;
				player allowDamage false;
				sleep 1;
				player allowDamage true;
				player setDamage 0;
			};

			sleep 0.5;
			deleteWaypoint _wp;

			_wp = (group player) addWaypoint [ getMarkerPos _waypoint, 0 ];
			_wp setWaypointType "MOVE";
       		_wp setWaypointBehaviour "AWARE";
       		_wp setWaypointSpeed "FULL";
       		_wp setWaypointCombatMode "RED";
			_Time = _Time - 1;
		};
	};
}] call RPP_Function;
publicVariable "RPP_DMV_StartTest_Bus";*/