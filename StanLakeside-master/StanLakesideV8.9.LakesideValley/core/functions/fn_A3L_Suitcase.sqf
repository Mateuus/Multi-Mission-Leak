		private ["_veh","_id"];
		_veh = "Land_Sleeping_bag_blue_folded_F" createvehicle (getpos player);
		{_veh disableCollisionWith _x} foreach playableUnits;
		_veh setVariable ["pickup",false,true];
		_veh attachto [player, [0.035,-.055,-0.22], "RightHandMiddle1"];
		_veh setdir (getdir player + 180);
		_veh setpos (getpos _veh);
		_id = player addAction ["Drop Bag of Cash", {detach (_this select 3)},_veh];
		
		[_veh,_id] spawn {
			_veh = _this select 0;
			_id = _this select 1;
			_suitcaseDeleted = false;
			while {(_veh IN (attachedObjects player)) OR (_suitcaseDeleted)} do {
				if ((!(isNull objectParent player)) && (!(_suitcaseDeleted))) then 
				{
					player removeAction _id;
					deleteVehicle _veh;
					_suitcaseDeleted = true;
				};
				
				if ((_suitcaseDeleted) && (isNull objectParent player)) then {
					_veh = "Land_Sleeping_bag_blue_folded_F" createvehicle (getpos player);
					{_veh disableCollisionWith _x} foreach playableUnits;
					_veh setVariable ["pickup",false,true];
					_veh attachto [player, [0.1,-0.18,0], "rfemur"];
					_veh setVectorDirAndUp [[0.5,0.5,0],[-0.5,0.5,0]];
					_veh setpos (getpos _veh);
					_id = player addAction ["Drop Bag of Cash", {detach (_this select 3)},_veh];
					_suitcaseDeleted = false;
				};
				
				if(life_istazed) exitWith {detach _veh;};
				if(life_interrupted) exitWith {detach _veh;};
				if((player getVariable["restrained",false])) exitWith {detach _veh;};
				uiSleep 0.1;
			};
			
			["deleted", false] spawn domsg;
			detach _veh;
			_veh setVariable ["pickup",true,true];
			player removeAction _id;
		};