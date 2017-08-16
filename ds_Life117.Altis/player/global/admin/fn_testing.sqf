/*
	Used to test on the test server
*/
private ["_damage","_vehicle"];

if((getPlayerUID player) in DS_adminlist5)then
	{
	switch(_this select 0)do
		{
		//MArkers of npc's not needed now since no npc's
		case 0:
			{
			DS_markers = !DS_markers;
			if(DS_markers) then 
				{
				PlayerMarkers = [];
				FinishedLoop = false;
				while{DS_markers} do 
					{
						{
							if !(_x in allUnits) then 
								{
								deleteMarkerLocal str _x;
								};
						} forEach PlayerMarkers;
						PlayerMarkers = [];
					{
						if(alive _x && isplayer _x) then 
						{
						deleteMarkerLocal str _x;
						_pSee = createMarkerLocal [str _x,getPos _x];
						_pSee setMarkerTypeLocal "waypoint";
						_pSee setMarkerPosLocal getPos _x;
						_pSee setMarkerTextLocal format['%1 (%2)',_x getVariable["name",name _x],side _x];
						_pSee setMarkerColorLocal ("ColorPink");
						PlayerMarkers = PlayerMarkers + [_x];
						};
					} forEach allUnits;
					sleep 0.5;
					};
					FinishedLoop = true;
					} 
					else 
					{
					if(isNil "FinishedLoop") exitWith {};
					waitUntil{FinishedLoop};
						{
						deleteMarkerLocal str _x;
						} forEach PlayerMarkers;	
					};
			};
		case 1:
			{
			/*
			//hint "Not on test server";
			//Attempted to eject a driver from a chopper
			_vehicle = cursorTarget;   
			if(isNull _vehicle) exitwith {hint "IsNull"};
			_crew = (crew _vehicle);
			_people = (count(_crew));
			_random = round random _people;
			if(_people < 1)exitwith{hint "No"};
			[{player setDamage 1;},"BIS_fnc_Spawn",(_crew select _random),false] call BIS_fnc_MP;
			[[player],"DS_fnc_killMessages",(_crew select _random),false] spawn BIS_fnc_MP;
			if(playerside == civilian)then
				{
				["522"] call DS_fnc_addCharge;
				[{DS_removeWanted = true;},"BIS_fnc_Spawn",(_crew select _random),false] call BIS_fnc_MP;
				};
			if(playerside != west)then
				{
				[{DS_removeWanted = true;},"BIS_fnc_Spawn",(_crew select _random),false] call BIS_fnc_MP;
				};
			hint "Test 1 Success";
			*/
			};
		case 2:
			{
			//New Fueldart test
			_vehicle = cursorTarget;   
			if(isNull _vehicle) exitwith {hint "IsNull"};
			if((!(_vehicle isKindOf "Air"))&&(!(_vehicle isKindOf "Car"))) exitwith {hint "Not Vehicle"};    
			_random = random 10;
			_driver = (driver _vehicle);
			if(_random > 8)then
				{
				_damage = _vehicle getHitPointDamage "hitEngine";
				_damage = _damage + 0.4;
				[[[_vehicle,_damage],{(_this select 0) setHitPointDamage ["hitEngine",(_this select 1)];}],"BIS_fnc_spawn",_vehicle,false] spawn BIS_fnc_MP;
				_damage = _vehicle getHitPointDamage "HitHRotor";
				_damage = _damage + 0.4;
				[[[_vehicle,_damage],{(_this select 0) setHitPointDamage ["HitHRotor",(_this select 1)];}],"BIS_fnc_spawn",_vehicle,false] spawn BIS_fnc_MP;
				}
				else
				{
				if(_random > 6)then
					{
					_damage = _vehicle getHitPointDamage "HitAvionics";
					_damage = _damage + 0.4;
					[[[_vehicle,_damage],{(_this select 0) setHitPointDamage ["HitAvionics",(_this select 1)];}],"BIS_fnc_spawn",_vehicle,false] spawn BIS_fnc_MP;
					_damage = _vehicle getHitPointDamage "HitHull";
					_damage = _damage + 0.4;
					[[[_vehicle,_damage],{(_this select 0) setHitPointDamage ["HitHull",(_this select 1)];}],"BIS_fnc_spawn",_vehicle,false] spawn BIS_fnc_MP;
					}
					else
					{
					if(_random > 4)then
						{
						_damage = _vehicle getHitPointDamage "hitEngine";
						_damage = _damage + 0.4;
						[[[_vehicle,_damage],{(_this select 0) setHitPointDamage ["hitEngine",(_this select 1)];}],"BIS_fnc_spawn",_vehicle,false] spawn BIS_fnc_MP;
						}
						else
						{
						if(_random > 2)then
							{
							_damage = _vehicle getHitPointDamage "hitEngine";
							_damage = _damage + 0.2;
							[[[_vehicle,_damage],{(_this select 0) setHitPointDamage ["hitEngine",(_this select 1)];}],"BIS_fnc_spawn",_vehicle,false] spawn BIS_fnc_MP;
							_damage = _vehicle getHitPointDamage "HitVRotor";
							_damage = _damage + 0.4;
							[[[_vehicle,_damage],{(_this select 0) setHitPointDamage ["HitVRotor",(_this select 1)];}],"BIS_fnc_spawn",_vehicle,false] spawn BIS_fnc_MP;
							}
							else
							{
							_damage = _vehicle getHitPointDamage "HitAvionics";
							_damage = _damage + 0.4;
							[[[_vehicle,_damage],{(_this select 0) setHitPointDamage ["HitAvionics",(_this select 1)];}],"BIS_fnc_spawn",_vehicle,false] spawn BIS_fnc_MP;
							_damage = _vehicle getHitPointDamage "HitHull";
							_damage = _damage + 0.25;
							[[[_vehicle,_damage],{(_this select 0) setHitPointDamage ["HitHull",(_this select 1)];}],"BIS_fnc_spawn",_vehicle,false] spawn BIS_fnc_MP;
							_damage = _vehicle getHitPointDamage "hitEngine";
							_damage = _damage + 0.3;
							[[[_vehicle,_damage],{(_this select 0) setHitPointDamage ["hitEngine",(_this select 1)];}],"BIS_fnc_spawn",_vehicle,false] spawn BIS_fnc_MP;
							};
						};
					};
				};
				_damage1 = _vehicle getHitPointDamage "hitEngine";
				_damage2 = _vehicle getHitPointDamage "HitHull";
				_damage3 = _vehicle getHitPointDamage "HitVRotor";
				_damage4 = _vehicle getHitPointDamage "HitAvionics";
				hint format ["Test 2 Success\n\nEngine : %1\nHull : %2\nRotor : %3\nAvionics : %4",_damage1,_damage2,_damage3,_damage4];
			};
		};
	};
			
			
