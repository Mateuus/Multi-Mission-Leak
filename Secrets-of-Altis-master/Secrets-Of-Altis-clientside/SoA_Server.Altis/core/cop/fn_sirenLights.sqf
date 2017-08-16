/*
	File: fn_sirenLights.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Lets play a game! Can you guess what it does? I have faith in you, if you can't
	then you have failed me and therefor I lose all faith in humanity.. No pressure.
*/
private["_vehicle","_lights"];
_vehicle = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
if(isNull _vehicle) exitWith {}; //Bad entry!
if(!(typeOf _vehicle in ["C_Offroad_02_unarmed_F","C_Quadbike_01_F","C_Offroad_01_F","C_SUV_01_F","B_MRAP_01_F","C_Hatchback_01_F","C_Hatchback_01_sport_F","I_MRAP_03_F","I_Truck_02_covered_F"])) exitWith {};

_trueorfalse = _vehicle getVariable["lights",false];
_lights = nearestObjects[getpos _vehicle,["PortableHelipadLight_01_blue_F"],8];

if(_trueorfalse) then {

	_vehicle setVariable["lights",false,true];
	_vehicle animate ["BeaconsStart", 0];
	{[_x,false] remoteexecCall ["setCollisionLight",0]} foreach _lights;
	
} else {
	_vehicle setVariable["lights",true,true];
	_vehicle animate ["BeaconsStart", 1];

	switch(typeOf _vehicle) do {

		case "C_SUV_01_F": 
		{
			if(_vehicle getVariable "life_VEH_color" == 4) then {
				(_lights select 0) setCollisionLight true;
			} else {
				[_lights] spawn {
				_lights = _this select 0;
					[(_lights select 0),true] remoteexecCall ["setCollisionLight",0];
					[(_lights select 3),true] remoteexecCall ["setCollisionLight",0];
					sleep 1;
					[(_lights select 1),true] remoteexecCall ["setCollisionLight",0];
					[(_lights select 2),true] remoteexecCall ["setCollisionLight",0];
				};
			};
		};

		case "C_Offroad_02_unarmed_F": 
		{
			[_lights] spawn {
			_lights = _this select 0;
				[(_lights select 0),true] remoteexecCall ["setCollisionLight",0];
				sleep 1;
				[(_lights select 1),true] remoteexecCall ["setCollisionLight",0];
			};
		};
		
		case "C_Hatchback_01_sport_F": 
		{
			[_lights] spawn {
			_lights = _this select 0;
				[(_lights select 1),true] remoteexecCall ["setCollisionLight",0];
				[(_lights select 2),true] remoteexecCall ["setCollisionLight",0];
				sleep 1;
				[(_lights select 0),true] remoteexecCall ["setCollisionLight",0];
				[(_lights select 3),true] remoteexecCall ["setCollisionLight",0];
			};
		};

		case "C_Hatchback_01_F": 
		{
			[_lights] spawn {
			_lights = _this select 0;
				[(_lights select 1),true] remoteexecCall ["setCollisionLight",0];
				[(_lights select 2),true] remoteexecCall ["setCollisionLight",0];
				sleep 1;
				[(_lights select 0),true] remoteexecCall ["setCollisionLight",0];
				[(_lights select 3),true] remoteexecCall ["setCollisionLight",0];
			};
		};

		case "I_MRAP_03_F": 
		{
			[_lights] spawn {
			_lights = _this select 0;
				[(_lights select 0),true] remoteexecCall ["setCollisionLight",0];
				[(_lights select 1),true] remoteexecCall ["setCollisionLight",0];
				sleep 1;
				[(_lights select 2),true] remoteexecCall ["setCollisionLight",0];
				[(_lights select 3),true] remoteexecCall ["setCollisionLight",0];
			};
		};

		case "B_MRAP_01_F": 
		{
			[_lights] spawn {
			_lights = _this select 0;
				[(_lights select 0),true] remoteexecCall ["setCollisionLight",0];
				sleep 1;
				[(_lights select 1),true] remoteexecCall ["setCollisionLight",0];
			};
		};

		case "C_Quadbike_01_F": 
		{
			[_lights] spawn {
			_lights = _this select 0;
				[(_lights select 2),true] remoteexecCall ["setCollisionLight",0];
				[(_lights select 3),true] remoteexecCall ["setCollisionLight",0];
				[(_lights select 5),true] remoteexecCall ["setCollisionLight",0];
				sleep 1;
				[(_lights select 0),true] remoteexecCall ["setCollisionLight",0];
				[(_lights select 1),true] remoteexecCall ["setCollisionLight",0];
				[(_lights select 4),true] remoteexecCall ["setCollisionLight",0];
			};
		};

		case "I_Truck_02_covered_F": 
		{
			[_lights] spawn {
			_lights = _this select 0;
				[(_lights select 0),true] remoteexecCall ["setCollisionLight",0];
				sleep 1;
				[(_lights select 1),true] remoteexecCall ["setCollisionLight",0];
			};
		};
		default {};
	};

	//[_vehicle,0.22] remoteExec ["life_fnc_copLights",0];
};