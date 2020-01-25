/*
File: fn_shank.sqf
koils a dick head
*/
private["_sum","_breakaction"];

if(!life_is_arrested) exitWith { 
	titleText["Nie mozesz tego zrobic.","PLAIN"];
	titleFadeOut 5;
}; 

titleText["This will take some time... hold on.","PLAIN"];
titleFadeOut 360;
_cme = 1;
_myposy = getPos player;
if(!life_action_inUse) then {
	while {true} do {
		life_action_inUse = true;
		uiSleep 6;
		_cme = _cme + 1;
		if( player distance _myposy > 1.8 ) exitwith { 
				titleText["You moved to far.","PLAIN"];
					life_action_inUse = false;
		};
		if(life_istazed) exitwith {
			life_action_inUse = false;
			titleText["You have been tazed..","PLAIN"];
		};
		if(player getVariable ["restrained", false]) exitwith {
			life_action_inUse = false;
			titleText["You have been detained..","PLAIN"];
		};

		if(_cme > 60) exitwith {
			life_action_inUse = false;

			playSound3D ["cg_sndimg\sounds\repair.ogg", player, false, getPosASL player, 0.5, 2, 55];

			life_breakouton = 2;
			_veh = "Land_Screwdriver_V1_F" createvehicle (getpos player);
			_veh setVariable ["pickup",false,true];
			_veh attachto [player, [-.02,-.006,-0.02], "RightHandMiddle1"];
			_veh setVectorDirAndUp [[-0.01,0.01,0],[-0.01,0.01,0]];
			_veh setpos (getpos _veh);
			_id = player addAction ["Drop Shank", {detach (_this select 3)},_veh];
			
			[_veh,_id] spawn {
				_veh = _this select 0;
				_id = _this select 1;
				_suitcaseDeleted = false;
				while {(_veh IN (attachedObjects player)) OR (_suitcaseDeleted)} do {
					if ((!(isNull objectParent player)) && (!(_suitcaseDeleted))) then 
					{
						player removeAction _id;
						detach _veh;
						deleteVehicle _veh;
						_suitcaseDeleted = true;
					};
				
					if ((_suitcaseDeleted) && (isNull objectParent player)) then {
						_veh = "Land_Screwdriver_V1_F" createvehicle (getpos player);
						_veh setVariable ["pickup",false,true];
						_veh attachto [player, [-0.02,-.006,-0.02], "RightHandMiddle1"];
						_veh setVectorDirAndUp [[-0.01,0.01,0],[-0.01,0.01,0]];
						_veh setpos (getpos _veh);
						_id = player addAction ["Drop Shank", {detach (_this select 3)},_veh];	
						_suitcaseDeleted = false;
					};
					
					if((life_istazed) && (!(_suitcaseDeleted))) exitWith {detach _veh;};
					if((life_interrupted) && (!(_suitcaseDeleted))) exitWith {detach _veh;};
					if (!(!deadPlayer)) exitwith {detach _veh;};
					if((player getVariable["restrained",false]) && (!(_suitcaseDeleted))) exitWith {detach _veh;};
					uiSleep 0.1;
				};
				detach _veh;
				_veh setVariable ["pickup",true,true];
				player removeAction _id;
			};
			titleText["You made a shank!","PLAIN"];
		};
		life_action_inUse = false;
	};
	life_action_inUse = false;
};

