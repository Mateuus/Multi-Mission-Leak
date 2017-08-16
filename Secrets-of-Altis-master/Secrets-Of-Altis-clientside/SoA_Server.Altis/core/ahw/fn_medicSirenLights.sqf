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
if(!(typeOf _vehicle in ["C_Offroad_02_unarmed_F","C_SUV_01_F","C_Offroad_01_F","C_Van_01_box_F","I_Truck_02_box_F","I_G_Offroad_01_F","I_Truck_02_covered_F","B_Truck_01_mover_F"])) exitWith {};

_trueorfalse = _vehicle getVariable["lights",FALSE];
_lights = (nearestObjects[getpos vehicle player,["PortableHelipadLight_01_blue_F","PortableHelipadLight_01_yellow_F"],15]);

if(_trueorfalse) then {
	
	_vehicle setVariable["lights",FALSE,TRUE];
	_vehicle animate ["BeaconsStart", 0];
	_vehicle animate ["BeaconsServicesStart", 0];
	{[_x,false] remoteexecCall ["setCollisionLight",0]} foreach _lights;

} else {
	_vehicle setVariable["lights",TRUE,TRUE];
	_vehicle animate ["BeaconsStart", 1];
	_vehicle animate ["BeaconsServicesStart", 1];	

		switch(typeOf _vehicle) do {

			case "C_Van_01_box_F": {
				[_lights] spawn {
				_lights = _this select 0;
					[(_lights select 4),true] remoteexecCall ["setCollisionLight",0]; sleep 1;
					[(_lights select 5),true] remoteexecCall ["setCollisionLight",0];
					[(_lights select 0),true] remoteexecCall ["setCollisionLight",0]; sleep 1;
					[(_lights select 1),true] remoteexecCall ["setCollisionLight",0]; sleep 2;
					[(_lights select 2),true] remoteexecCall ["setCollisionLight",0]; sleep 1;
					[(_lights select 3),true] remoteexecCall ["setCollisionLight",0];
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

			case "C_SUV_01_F": {
				[_lights] spawn {
				_lights = _this select 0;
					[(_lights select 0),true] remoteexecCall ["setCollisionLight",0];
					[(_lights select 3),true] remoteexecCall ["setCollisionLight",0];
					sleep 1;
					[(_lights select 1),true] remoteexecCall ["setCollisionLight",0];
					[(_lights select 2),true] remoteexecCall ["setCollisionLight",0];
				};
			};

			case "I_Truck_02_box_F": {
				[_lights] spawn {
				_lights = _this select 0;
					[(_lights select 4),true] remoteexecCall ["setCollisionLight",0]; sleep 1;
					[(_lights select 5),true] remoteexecCall ["setCollisionLight",0];
					[(_lights select 0),true] remoteexecCall ["setCollisionLight",0]; sleep 1;
					[(_lights select 1),true] remoteexecCall ["setCollisionLight",0]; sleep 2;
					[(_lights select 2),true] remoteexecCall ["setCollisionLight",0]; sleep 1;
					[(_lights select 3),true] remoteexecCall ["setCollisionLight",0];
				};
			};

			case "I_Truck_02_covered_F": {
				[_lights] spawn {
				_lights = _this select 0;
					[(_lights select 0),true] remoteexecCall ["setCollisionLight",0];
					sleep 1; 
					[(_lights select 1),true] remoteexecCall ["setCollisionLight",0];
				};
			};

			case "B_Truck_01_mover_F": {
				{[_x,true] remoteexecCall ["setCollisionLight",0]} foreach _lights;
			};
			default {};
		};

	//[_vehicle,0.22] remoteExec ["life_fnc_medicLights",0];
};