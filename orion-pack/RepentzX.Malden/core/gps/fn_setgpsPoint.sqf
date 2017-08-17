/*
    File: fn_setgpsPoint.sqf

    Description:
    Sorts out the gps point selected and create a task.
*/
if (!isNil "life_gps_point") then 
{
	if (typename life_gps_point == "STRING") then
	{
		if (life_gps_point != "") then
		{	
			_exists = ["GPSPoint"] call BIS_fnc_taskExists; 
			
			if (_exists && life_gps_point != life_lastgps_point) then 
			{
				["GPSPoint",player] call BIS_fnc_deleteTask;
			};		
		
			if (life_gps_point != life_lastgps_point) then 
			{
				_taskID =
				[
					"GPSPoint",  //task ID
					player,		//Target
					["Location of your GPS Point","GPS Destination","start_txt"],	//Taskdescription
					(getMarkerPos life_gps_point), //Task Position
					"ASSIGNED",	//Task Status
					1,	//Priority
					true,	//Shownotification
					false,	//Global?
					"",		//Tasktype
					true	//Shared
				] call BIS_fnc_setTask;
				
				life_lastgps_point = life_gps_point;
			};
			playSound "confirmedGPS";
		};
	};
} else  { 
	["GPS Point Variable not defined",false,"slow"] call life_fnc_notificationSystem;
};
