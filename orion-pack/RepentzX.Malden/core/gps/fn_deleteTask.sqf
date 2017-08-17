/*
    File: deletetask.sqf
    Author: Walker,FeindflugLP


    Description:
    Deletes the GPS task when player arrived
*/
	[] spawn
	{
		_taskID = "GPSPoint";
		waitUntil{sleep 0.1; !(isNil "life_gps_point")};
		
		while{true} do
		{
			_exists = [_taskID] call BIS_fnc_taskExists;
			
			if(_exists) then
			{
				waitUntil{sleep 0.1; player distance (getMarkerPos life_lastgps_point) < 11};
				
				
				_taskVar = _taskID call bis_fnc_taskVar;

				_task = player getvariable [_taskVar,tasknull];
				player removesimpletask _task;
				player setvariable [_taskVar,nil];

				//remove task from the unit's tasks
				_tasks = player getvariable ["BIS_fnc_setTaskLocal_tasks",[]];
				_tasks = _tasks - [_taskID];
				player setvariable ["BIS_fnc_setTaskLocal_tasks",_tasks];

				//clean variables storing individual task parameters
				for "_i" from 0 to 10 do 
				{
					missionNamespace setVariable [format["%1.%2",_taskVar,_i],nil];
				};
				[localize "STR_GPS_Finish",true,"slow"] call life_fnc_notificationSystem;
			} else {
				sleep 1;
			};
		};
	};
	