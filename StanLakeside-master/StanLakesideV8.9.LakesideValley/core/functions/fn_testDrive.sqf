/*
	fn_testDrive.sqf
	Pennyworth
*/

params [["_isPassenger", false, [true]], ["_person", objNull, [objNull]], ["_vehicle", objNull, [objNull]]];

if(_isPassenger) then {
	life_onTestDrive = true;
	player moveInCargo _vehicle;
	[format ["Your test drive with %1 has begun, they will have 5 minutes to drive the vehicle and then you will be returned to the dealer.",name _person], false] spawn domsg;
	waitUntil {sleep 1; isNull _vehicle};
	if!(player getVariable ["restrained",false] && !deadPlayer) then {
		if(player distance [8547.99,6770.71,0.759686] > 50) then {
			player setPosATL [8547.99,6770.71,0.759686];
		};
	};
	life_onTestDrive = false;
} else {
	_trackPoints = ["start_race_1","start_race_2","start_race_3","start_race_4","start_race_5","start_race_6","start_race_7","start_race_8"];
	_spawnPoint = "";
	
	{
		if(count(nearestObjects[getMarkerPos _x,["Car","Motorcycle","Ship","Air"],5]) isEqualTo 0) exitWith {
			_spawnPoint = _x
		};
	} foreach _trackPoints;

	if(_spawnPoint isEqualTo "") exitWith {["There are no available places to test drive from.", false] spawn domsg};
	
	[] spawn {
		waitUntil {closeDialog 0; (isNull findDisplay 2700 && isNull findDisplay 2700)};
	};
	
	_availableAnims = [0,life_showRoomVehicle] call life_fnc_animateJonzies; 
	_currentAnims = [];
	if!(_availableAnims isEqualTo []) then {
		_currentAnims = [1,life_showRoomVehicle,_availableAnims] call life_fnc_animateJonzies;
	};
	if!(_availableAnims isEqualTo []) then {
		[2,_vehicle,_currentAnims] call life_fnc_animateJonzies;
	};	

	_red = life_showRoomVehicle getVariable "Red";
	_green = life_showRoomVehicle getVariable "Green";
	_blue = life_showRoomVehicle getVariable "Blue";
	
	life_onTestDrive = true;

	_vehicle = createVehicle [typeOf life_showRoomVehicle, getMarkerPos _spawnPoint, [], 0, "NONE"];
	waitUntil {!isNil "_vehicle" && {!isNull _vehicle}};
	if!(_availableAnims isEqualTo []) then {
		[2,_vehicle,_currentAnims] call life_fnc_animateJonzies;
	};	
	_vehicle setVariable ["Red",_red,true];
	_vehicle setVariable ["Green",_green,true];
	_vehicle setVariable ["Blue",_blue,true];
	_vehicle allowDamage false;
	_vehicle setVectorUp [0,0,1];
	_vehicle setDir (markerDir _spawnPoint);
	_vehicle setPosATL getMarkerPos _spawnPoint;
	_vehicle allowDamage true;
	waitUntil {!isNull _vehicle};
	player moveInDriver _vehicle;
	[true,player,_vehicle] remoteExec ["life_fnc_testDrive",_person];
	["Your test drive has begun, you will have 5 minutes to drive the vehicle and then you will be returned to the dealer.", false] spawn domsg;
	["You can use your scroll wheel to cancel the test drive at any time.", false] spawn domsg;
	life_testDriveTime = time;
	life_exitTestDrive = false;
	_testDriveAction = player addAction ["End Test Drive",{life_exitTestDrive = true}, nil, 1.5, true, true, "", "life_onTestDrive"];	
	player setVariable ["testDriving", _vehicle, true];
		
	waitUntil {uiSleep 1; (time - life_testDriveTime > 60 || life_exitTestDrive)};
	if!(life_exitTestDrive) then {
		["You have 4 minutes left on your test drive.", false] spawn domsg;
		["The test drive has 4 minutes left.", false] remoteExec ["domsg",_person];
	};
	waitUntil {uiSleep 1; (time - life_testDriveTime > 120 || life_exitTestDrive)};
	if!(life_exitTestDrive) then {
		["You have 3 minutes left on your test drive.", false] spawn domsg;
		["The test drive has 3 minutes left.", false] remoteExec ["domsg",_person];
	};
	waitUntil {uiSleep 1; (time - life_testDriveTime > 180 || life_exitTestDrive)};
	if!(life_exitTestDrive) then {
		["You have 2 minutes left on your test drive.", false] spawn domsg;
		["The test drive has 2 minutes left.", false] remoteExec ["domsg",_person];
	};
	waitUntil {uiSleep 1; (time - life_testDriveTime > 240 || life_exitTestDrive)};
	if!(life_exitTestDrive) then {
		["You have 1 minute1 left on your test drive.", false] spawn domsg;
		["The test drive has 1 minute1 left.", false] remoteExec ["domsg",_person];
	};
	waitUntil {uiSleep 1; (time - life_testDriveTime > 300 || life_exitTestDrive)};	
	["Your test drive has ended.", false] spawn domsg;
	_vehicle setFuel 0;
	waitUntil {speed _vehicle < 8};
	if(typeOf _vehicle isEqualTo "Jonzie_Raptor") then {
		{
			detach _x;
			deleteVehicle _x;
		} foreach (_vehicle getVariable ["spotlights",[]]);
	};			
	deleteVehicle _vehicle;
	if!(player getVariable ["restrained",false] && !deadPlayer) then {
		if(player distance [8547.99,6770.71,0.759686] > 50) then {
			player setPosATL [8547.99,6770.71,0.759686];
		};
	};
	player removeAction _testDriveAction;
	player setVariable ["testDriving", nil, true];
	life_testDriveTime = nil;
	life_exitTestDrive = nil;
	life_onTestDrive = false;
};
