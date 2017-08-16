/*
	File: fn_drugRunner.sqf
	Author: John "Paratus" VanderZwet
	
	Description:
	Selects a random DP point for a drug delivery mission.
*/
private["_dp","_target"];
_type = [_this select 3,0,0,[0]] call BIS_fnc_param;
_start = [_this select 3,1,0,[0]] call BIS_fnc_param;

if (_type < 1 || _start < 1) exitWith {};
if (playerSide != civilian) exitWith { hint "Only civilians can perform drug delivery missions!" };

switch (_type) do
{
	case 1: // Receive plane
	{
		_result = ["We'll supply you with the plane and drugs, but if you fail you'll be held liable for $15,000! Are you up for it?", "Drug Runner", "I'll do it!", "No, I'm afraid."] call BIS_fnc_guiMessage;
		if (!_result) exitWith {};
		_nearby = nearestObjects[getMarkerPos format["drug_spawn_%1", _start],["Car","Ship","Air"],5];
		if (count _nearby > 0) exitWith {hint "Unable to continue as there's another vehicle on the plane spawn point!"};
		life_drug_stage = _type;
		if (!isNil "life_drug_vehicle") then { if (!isNull life_drug_vehicle) then { deleteVehicle life_drug_vehicle }; };
		life_drug_vehicle = "C_Plane_Civil_01_F" createVehicle (getMarkerPos format["drug_spawn_%1", _start]);
		life_drug_vehicle setDir (markerDir format["drug_spawn_%1", _start]);
		life_drug_vehicle setHitPointDamage ["HitHull", 0.5];
		life_drug_vehicle setFuel 0.5;
		life_drug_vehicle addEventHandler["Killed", {_this spawn ASY_fnc_vehicleDead;}];
		life_drug_vehicle addEventHandler["GetOut", {_this call life_fnc_vehicleExit;}];
		life_drug_vehicle addEventHandler["GetIn", {_this call life_fnc_vehicleEnter;}];
		life_drug_vehicle setVariable ["Trunk", [[],0], true];
		life_drug_vehicle setVariable ["drugrunner", getPlayerUID player];
		life_drug_vehicle setVariable ["vehicle_info_owners",[[getPlayerUID player,name player]],true];
		[life_drug_vehicle,"ASY_fnc_setIdleTime",false,false] spawn life_fnc_MP;
		
		life_drug_runner = true;
		life_drug_start_id = _start;
		life_drug_target = 0;
		while {life_drug_target == 0 || life_drug_target == _start} do { life_drug_target = ceil (random 5) };
		life_drug_start = call compile format["drugrunner_%1", _start];
		life_drug_end = call compile format["drugrunner_%1", life_drug_target];
		life_delivery_expire = time + (floor ((((getPos life_drug_start) distance (getPos life_drug_end)) * (0.7 / 1000)) * 60)) + 120; // 1/2 mins per metre + 2 min
		if (life_delivery_expire < (time + 180)) then { life_delivery_expire = time + 180; };
				
		life_cur_task = player createSimpleTask [format["Delivery_%1",_start]];
		_notice = format["Bring the plane to the drug runner at location %1 and load it with the drugs. You have %2 minutes.", life_drug_target, floor ((life_delivery_expire - time) / 60)];
		life_cur_task setSimpleTaskDescription [_notice,"Drug Running","Drug Running"];
		life_cur_task setSimpleTaskDestination (getPos life_drug_end);
		life_cur_task setTaskState "Assigned";
		player setCurrentTask life_cur_task;
		hint _notice; systemChat _notice;
		["DeliveryAssigned",["Load drugs into plane."]] call BIS_fnc_showNotification;
		
		[] spawn
		{
			_upp = "Time to collect";
			//Setup our progress bar.
			disableSerialization;
			5 cutRsc ["life_progress","PLAIN"];
			_ui = uiNameSpace getVariable "life_progress";
			_progress = _ui displayCtrl 38201;
			_pgText = _ui displayCtrl 38202;
			_pgText ctrlSetText format["%1...",_upp];
			_progress progressSetPosition 1;
			_cP = 1;
			_success=false;
			_started = time;
				
			(findDisplay 12 displayCtrl 51) ctrlAddEventHandler ["Draw","
				(_this select 0) drawLine [
					getPos player,
					getPos life_drug_end,
					[0,0,1,1]
				];
			"];
			
			while {life_drug_runner && alive player && time <= life_delivery_expire && life_drug_stage == 1 && !isNull life_drug_vehicle && {alive life_drug_vehicle}} do
			{
				_cP = 1 - ((time - _started) / (life_delivery_expire - _started));
				_progress progressSetPosition _cP;
				_pgText ctrlSetText format["%2 (%1 min(s))...",floor((life_delivery_expire - time) / 60),_upp];
			};
			5 cutText ["","PLAIN"];
			(findDisplay 12 displayCtrl 51) ctrlRemoveAllEventHandlers "Draw";
			
			if (life_drug_runner && life_drug_stage == 1) then
			{
				life_cur_task setTaskState "Failed";
				player removeSimpleTask life_cur_task;
				life_drug_runner = false;
				life_drug_end = nil;
				life_drug_stage = 0;
				
				switch (true) do
				{
					case (!alive player):
					{
						["DeliveryFailed",["You failed to collect the drugs because you died."]] call BIS_fnc_showNotification;
						[[931, player, format["Failed a drug delivery mission (died) and was charged $15,000."]],"ASY_fnc_logIt",false,false] spawn life_fnc_MP;
					};
					case (time > life_delivery_expire):
					{
						["DeliveryFailed",["You've taken too long to get the drugs. You've failed!"]] call BIS_fnc_showNotification;
						[[931, player, format["Failed a drug delivery mission (time) and was charged $15,000."]],"ASY_fnc_logIt",false,false] spawn life_fnc_MP;
					};
					case (isNull life_drug_vehicle):
					{
						["DeliveryFailed",["Your vehicle has been lost. You've failed!"]] call BIS_fnc_showNotification;
						[[931, player, format["Failed a drug delivery mission (plane destroyed) and was charged $15,000."]],"ASY_fnc_logIt",false,false] spawn life_fnc_MP;
					};
					default
					{
						["DeliveryFailed",["You've failed to collect the drugs!"]] call BIS_fnc_showNotification;
						[[931, player, format["Failed a drug delivery mission (misc) and was charged $15,000."]],"ASY_fnc_logIt",false,false] spawn life_fnc_MP;
					};
				};
				
				["atm","take",15000] call life_fnc_uC;
				systemChat "Drug running failed; smugglers took $15,000 from your account to cover their expenses.";
				if (!isNull life_drug_vehicle) then
				{
					while {!isNull life_drug_vehicle} do
					{
						if (count (crew life_drug_vehicle) == 0) exitWith { deleteVehicle life_drug_vehicle };
					};
				};
			};			
		};
	};
	
	case 2: // Collect drugs
	{
		sleep 0.5;
		if (!life_drug_runner) exitWith {};
		if (_this select 0 != life_drug_end) exitWith { hint "This is not the pickup location!" };
		if (isNull life_drug_vehicle) exitwith { hint "Your plane could not be found!" };
		if (life_drug_vehicle distance life_drug_end > 50) exitWith { hint "The supplied plane must be within 50 meters to load drugs." };
		
		life_drug_stage = _type;
		
		life_delivery_expire = time + (floor ((((getPos life_drug_start) distance (getPos life_drug_end)) * (0.7 / 1000)) * 60)) + 120; // 1/2 mins per metre + 2 min
		if (life_delivery_expire < (time + 180)) then { life_delivery_expire = time + 180; };
				
		life_cur_task setTaskState "Succeeded";
		player removeSimpleTask life_cur_task;
		life_cur_task = player createSimpleTask [format["Delivery_%1",life_drug_start_id]];
		_notice = format["Return the plane, with the drugs, to %1. You have %2 minutes.", life_drug_start_id, floor ((life_delivery_expire - time) / 60)];
		life_cur_task setSimpleTaskDescription [_notice,"Drug Running","Drug Running"];
		life_cur_task setSimpleTaskDestination (getPos life_drug_start);
		life_cur_task setTaskState "Assigned";
		player setCurrentTask life_cur_task;
		hint _notice; systemChat _notice;
		["DeliveryAssigned",["Deliver drugs to smuggler."]] call BIS_fnc_showNotification;
		life_drug_vehicle setVariable ["drugrunning", true, true];
		systemChat "The aircraft is now loaded with drugs. Don't get caught!";
		
		[] spawn
		{
			_upp = "Time to deliver";
			//Setup our progress bar.
			disableSerialization;
			5 cutRsc ["life_progress","PLAIN"];
			_ui = uiNameSpace getVariable "life_progress";
			_progress = _ui displayCtrl 38201;
			_pgText = _ui displayCtrl 38202;
			_pgText ctrlSetText format["%1...",_upp];
			_progress progressSetPosition 1;
			_cP = 1;
			_success=false;
			_started = time;
				
			(findDisplay 12 displayCtrl 51) ctrlAddEventHandler ["Draw","
				(_this select 0) drawLine [
					getPos player,
					getPos life_drug_start,
					[0,0,1,1]
				];
			"];
			
			while {life_drug_runner && alive player && time <= life_delivery_expire && life_drug_stage == 2 && !isNull life_drug_vehicle && {alive life_drug_vehicle}} do
			{
				_cP = 1 - ((time - _started) / (life_delivery_expire - _started));
				_progress progressSetPosition _cP;
				_pgText ctrlSetText format["%2 (%1 min(s))...",floor((life_delivery_expire - time) / 60),_upp];
			};
			5 cutText ["","PLAIN"];
			(findDisplay 12 displayCtrl 51) ctrlRemoveAllEventHandlers "Draw";
			
			if (life_drug_runner && life_drug_stage == 2) then
			{
				life_cur_task setTaskState "Failed";
				player removeSimpleTask life_cur_task;
				life_drug_runner = false;
				life_drug_end = nil;
				life_drug_stage = 0;
				
				switch (true) do
				{
					case (!alive player):
					{
						["DeliveryFailed",["You failed to deliver the drugs because you died."]] call BIS_fnc_showNotification;
					};
					case (time > life_delivery_expire):
					{
						["DeliveryFailed",["You've taken too long to deliver the drugs. You've failed!"]] call BIS_fnc_showNotification;
					};
					case (isNull life_drug_vehicle):
					{
						["DeliveryFailed",["Your vehicle has been lost. You've failed!"]] call BIS_fnc_showNotification;
					};
					default
					{
						["DeliveryFailed",["You've failed to deliver the drugs!"]] call BIS_fnc_showNotification;
					};
				};
				
				["atm","take",15000] call life_fnc_uC;
				systemChat "Drug running failed; smugglers took $15,000 from your account to cover their expenses.";
				if (!isNull life_drug_vehicle) then
				{
					while {!isNull life_drug_vehicle} do
					{
						if (count (crew life_drug_vehicle) == 0) exitWith { deleteVehicle life_drug_vehicle };
					};
				};
			};			
		};
	};
	
	case 3: // Delivered!
	{
		sleep 0.5;
		if (!life_drug_runner) exitWith {};
		if (_this select 0 != life_drug_start) exitWith { hint "This is not the delivery location!" };
		if (isNull life_drug_vehicle) exitwith { hint "Your plane could not be found!" };
		if (life_drug_vehicle distance life_drug_start > 50) exitWith { hint "The supplied plane must be within 50 meters to deliver drugs." };
		
		life_drug_stage = _type;
		
		_distance = ((getPos life_drug_start) distance (getPos life_drug_end)) * 2;
		_reward = floor(_distance * 1); // $1,000 per kilometer
		
		["cash","add",_reward] call life_fnc_uC;
		deleteVehicle life_drug_vehicle;
		life_cur_task setTaskState "Succeeded";
		player removeSimpleTask life_cur_task;
		life_drug_runner = false;
		life_drug_end = nil;
		life_drug_stage = 0;
		
		[[getPlayerUID player, "drugtrace", time],"ASY_fnc_varPersist",false,false] spawn life_fnc_MP;
		
		[[0,1,2], format["You've run the drugs without getting caught, receiving $%1 as payment!", [_reward] call life_fnc_numberText]] call life_fnc_broadcast;
		[[932, player, format["%3 delivered drugs %1 km for a payout of %2.", _distance, _reward, name player]],"ASY_fnc_logIt",false,false] spawn life_fnc_MP;
	};
	
	case 4: // Abandon
	{
		life_drug_stage = _type;
		sleep 0.5;
		if (!life_drug_runner) exitWith {};
		if (isNull life_drug_vehicle) exitwith { hint "Your plane could not be found!" };
		if (life_drug_vehicle distance (_this select 0) > 50) exitWith { hint "The supplied plane must be within 50 meters to return the plane." };
		
		_result = ["Are you sure you want to abandon the job? The smugglers will take $3,000 for their troubles.", "Drug Runner", "Yes, I'm sure!", "No, keep going."] call BIS_fnc_guiMessage;
		if (!_result) exitWith {};
		
		life_drug_runner = false;
		life_drug_end = nil;
		life_drug_stage = 0;
		deleteVehicle life_drug_vehicle;
		[[0,1,2], "You've abandoned the job! The smugglers take $3,000."] call life_fnc_broadcast;
		["atm","take",3000] call life_fnc_uC;
	};
};