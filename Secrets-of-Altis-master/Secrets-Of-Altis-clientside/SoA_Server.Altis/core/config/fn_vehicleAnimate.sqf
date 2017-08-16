/*
	File: fn_vehicleAnimate.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Pass what you want to be animated.
*/
private["_vehicle","_animate","_state"];
_vehicle = [_this,0,Objnull,[Objnull]] call BIS_fnc_param;
if(isnull _vehicle) exitwith {}; //FUCK
_animate = [_this,1,"",["",[]]] call BIS_fnc_param;
_preset = [_this,2,false,[false]] call BIS_fnc_param;

if(!_preset) then
{
	if(count _animate > 1) then
	{
		{
			_vehicle animate[_x select 0,_x select 1];
		} foreach _animate;
	}
		else
	{
		_vehicle animate[_animate select 0,_animate select 1];
	};
}
	else
{
	switch (_animate) do
	{
		case "civ_offroad":
		{
			waitUntil {!isNil {_vehicle getVariable "Life_VEH_color"}};
			_vehicle animate ["HideDoor1", 0];
			_vehicle animate ["HideBumper1", 1];
			_vehicle animate ["HideBumper2", 1];
			_vehicle animate ["HideDoor2", 0];
			_vehicle animate ["HideDoor3", 0];
			_vehicle animate ["HideConstruction", 1];
		};
		
		case "adac_offroad":
		{
			waitUntil {!isNil {_vehicle getVariable "Life_VEH_color"}};
			_vehicle animate ["HideServices", 0];
			_vehicle animate ["HideBumper1", 1];
			_vehicle animate ["HideBumper2", 1];
			_vehicle animate ["HideBackpacks", 1];
			_vehicle animate ["HideConstruction", 1];
			_vehicle animate ["HidePolice", 1];
			_vehicle animate ["BeaconsServicesStart", 0];
			_vehicle animate ["HideDoor1", 0];
			_vehicle animate ["HideDoor2", 0];
			_vehicle animate ["HideDoor3", 0];
			_vehicle setVariable["lights",false,true];
		};
		
		case "med_offroad":
		{
			waitUntil {!isNil {_vehicle getVariable "Life_VEH_color"}};
			_vehicle animate ["HideBumper1", 1];
			_vehicle animate ["HideBumper2", 1];
			_vehicle animate ["HidePolice", 0];
			_vehicle animate ["BeaconsStart",0];
			_vehicle setVariable["lights",false,true];
		};
		
		case "cop_offroad":
		{
			waitUntil {!isNil {_vehicle getVariable "Life_VEH_color"}};
			_vehicle animate ["HidePolice", 0];
			_vehicle animate ["BeaconsStart",0];
			_vehicle animate ["HideBumper1", 1];
			_vehicle animate ["HideBumper2", 1];
			_vehicle setVariable["lights",false,true];
		};

		case "ahw_van": 
		{	
			waitUntil {!isNil {_vehicle getVariable "Life_VEH_color"}};
			_vehicle setVariable["lights",false,true];		
			_ahw_vanlight_1 = "PortableHelipadLight_01_blue_F" createVehicle [0,0,0];
			_ahw_vanlight_2 = "PortableHelipadLight_01_blue_F" createVehicle [0,0,0];
			_ahw_vanlight_3 = "PortableHelipadLight_01_blue_F" createVehicle [0,0,0];
			_ahw_vanlight_4 = "PortableHelipadLight_01_blue_F" createVehicle [0,0,0];
			_ahw_vanlight_5 = "PortableHelipadLight_01_blue_F" createVehicle [0,0,0];
			_ahw_vanlight_6 = "PortableHelipadLight_01_blue_F" createVehicle [0,0,0];

			_ahw_vanlight_1 attachto [_vehicle,[0.7,0,0.75]];
			_ahw_vanlight_2 attachto [_vehicle,[0.7,0.4,0.75]];
			_ahw_vanlight_3 attachto [_vehicle,[-0.7,0,0.75]];
			_ahw_vanlight_4 attachto [_vehicle,[-0.7,0.4,0.75]];
			_ahw_vanlight_5 attachto [_vehicle,[0.85,-3.35,1.5]];
			_ahw_vanlight_6 attachto [_vehicle,[-0.85,-3.35,1.5]];

			{_x setCollisionLight false} foreach [_ahw_vanlight_1,_ahw_vanlight_2,_ahw_vanlight_3,_ahw_vanlight_4,_ahw_vanlight_5,_ahw_vanlight_6];
		};

		case "cop_suv": 
		{
			waitUntil {!isNil {_vehicle getVariable "Life_VEH_color"}};		
			_vehicle setVariable["lights",false,true];		
			_cop_suvlight_1 = "PortableHelipadLight_01_blue_F" createVehicle [0,0,0];
			_cop_suvlight_2 = "PortableHelipadLight_01_blue_F" createVehicle [0,0,0];
			_cop_suvlight_3 = "PortableHelipadLight_01_blue_F" createVehicle [0,0,0];
			_cop_suvlight_4 = "PortableHelipadLight_01_blue_F" createVehicle [0,0,0];

			_cop_suvlight_1 attachto [_vehicle,[0.58,-2.5,0]];
			_cop_suvlight_2 attachto [_vehicle,[-0.58,-2.5,0]];
			_cop_suvlight_3 attachto [_vehicle,[0.58,-0.3,0.3]];
			_cop_suvlight_4 attachto [_vehicle,[-0.58,-0.3,0.3]];

			{_x setCollisionLight false} foreach [_cop_suvlight_1,_cop_suvlight_2,_cop_suvlight_3,_cop_suvlight_4];
		};

		case "cop_suv_bund": 
		{
			waitUntil {!isNil {_vehicle getVariable "Life_VEH_color"}};		
			_vehicle setVariable["lights",false,true];		
			_cop_suvbundlight_1 = "PortableHelipadLight_01_blue_F" createVehicle [0,0,0];
			_cop_suvbundlight_1 attachto [_vehicle,[0.58,-0.38,0.33]];
			_cop_suvbundlight_1 setCollisionLight false;
		};

		case "cop_jeep": 
		{
			waitUntil {!isNil {_vehicle getVariable "Life_VEH_color"}};		
			_vehicle setVariable["lights",false,true];		
			_vehicle animate ["hideSpareWheel",1];

			_cop_mb4wdlight_1 = "PortableHelipadLight_01_blue_F" createVehicle [0,0,0]; 
			_cop_mb4wdlight_2 = "PortableHelipadLight_01_blue_F" createVehicle [0,0,0]; 
			_cop_mb4wdlight_1 attachto [_vehicle,[-0.65,0.45,0.43]]; 
			_cop_mb4wdlight_2 attachto [_vehicle,[0.58,0.45,0.43]];

			{_x setCollisionLight false} foreach [_cop_mb4wdlight_1,_cop_mb4wdlight_2];
		};

		case "cop_limo": 
		{
			waitUntil {!isNil {_vehicle getVariable "Life_VEH_color"}};		
			_vehicle setVariable["lights",false,true];
			_cop_limolight_1 = "PortableHelipadLight_01_blue_F" createVehicle [0,0,0];
			_cop_limolight_2 = "PortableHelipadLight_01_blue_F" createVehicle [0,0,0];
			_cop_limolight_3 = "PortableHelipadLight_01_blue_F" createVehicle [0,0,0];
			_cop_limolight_4 = "PortableHelipadLight_01_blue_F" createVehicle [0,0,0];

		 	_cop_limolight_1 attachto [_vehicle,[0.57,1.85,-1]];
			_cop_limolight_2 attachto [_vehicle,[-0.59,1.85,-1.03]];
			_cop_limolight_3 attachto [_vehicle,[0.4,-2.2,-0.15]];
			_cop_limolight_4 attachto [_vehicle,[-0.4,-2.2,-0.15]];

			{_x setCollisionLight false} foreach [_cop_limolight_1,_cop_limolight_2,_cop_limolight_3,_cop_limolight_4];
		};

		case "ahw_zamak":
		{	
			waitUntil {!isNil {_vehicle getVariable "Life_VEH_color"}};		
			_vehicle setVariable["lights",false,true];
			_ahw_zamaklight_1 = "PortableHelipadLight_01_blue_F" createVehicle [0,0,0];
			_ahw_zamaklight_2 = "PortableHelipadLight_01_blue_F" createVehicle [0,0,0];
			_ahw_zamaklight_3 = "PortableHelipadLight_01_blue_F" createVehicle [0,0,0];
			_ahw_zamaklight_4 = "PortableHelipadLight_01_blue_F" createVehicle [0,0,0];
			_ahw_zamaklight_5 = "PortableHelipadLight_01_blue_F" createVehicle [0,0,0];
			_ahw_zamaklight_6 = "PortableHelipadLight_01_blue_F" createVehicle [0,0,0];

			_ahw_zamaklight_1 attachto [_vehicle,[0.8,3,0.5]];
			_ahw_zamaklight_2 attachto [_vehicle,[-0.8,3,0.5]];
			_ahw_zamaklight_3 attachto [_vehicle,[-0.8,2.25,0.55]];
			_ahw_zamaklight_4 attachto [_vehicle,[0.8,2.25,0.55]];
			_ahw_zamaklight_5 attachto [_vehicle,[0.75,-3.45,0.95]];
			_ahw_zamaklight_6 attachto [_vehicle,[-0.75,-3.45,0.95]];

			{_x setCollisionLight false} foreach [_ahw_zamaklight_1,_ahw_zamaklight_2,_ahw_zamaklight_3,_ahw_zamaklight_4,_ahw_zamaklight_5,_ahw_zamaklight_6];
		};

		case "ahw_suv": 
		{
			waitUntil {!isNil {_vehicle getVariable "Life_VEH_color"}};		
			_vehicle setVariable["lights",false,true];		
			_ahw_suvlight_1 = "PortableHelipadLight_01_blue_F" createVehicle [0,0,0];
			_ahw_suvlight_2 = "PortableHelipadLight_01_blue_F" createVehicle [0,0,0];
			_ahw_suvlight_3 = "PortableHelipadLight_01_blue_F" createVehicle [0,0,0];
			_ahw_suvlight_4 = "PortableHelipadLight_01_blue_F" createVehicle [0,0,0];

			_ahw_suvlight_1 attachto [_vehicle,[0.58,-2.5,0]];
			_ahw_suvlight_2 attachto [_vehicle,[-0.58,-2.5,0]];
			_ahw_suvlight_3 attachto [_vehicle,[0.58,-0.3,0.3]];
			_ahw_suvlight_4 attachto [_vehicle,[-0.58,-0.3,0.3]];

			{_x setCollisionLight false} foreach [_ahw_suvlight_1,_ahw_suvlight_2,_ahw_suvlight_3,_ahw_suvlight_4];
		};

		case "ahw_jeep": 
		{
			waitUntil {!isNil {_vehicle getVariable "Life_VEH_color"}};		
			_vehicle setVariable["lights",false,true];
			_vehicle animate ["hideSpareWheel",1];
			_vehicle animate ["hideBullbar",1];

			_ahw_mb4wdlight_1 = "PortableHelipadLight_01_blue_F" createVehicle [0,0,0]; 
			_ahw_mb4wdlight_2 = "PortableHelipadLight_01_blue_F" createVehicle [0,0,0]; 
			_ahw_mb4wdlight_1 attachto [_vehicle,[-0.65,0.45,0.43]]; 
			_ahw_mb4wdlight_2 attachto [_vehicle,[0.58,0.45,0.43]]; 

			{_x setCollisionLight false} foreach [_ahw_mb4wdlight_1,_ahw_mb4wdlight_2];
		};

		case "ahw_zamaktransport": 
		{
			waitUntil {!isNil {_vehicle getVariable "Life_VEH_color"}};		
			_vehicle setVariable["lights",false,true];
			_ahw_zamaktranslight_1 = "PortableHelipadLight_01_blue_F" createVehicle [0,0,0];
			_ahw_zamaktranslight_2 = "PortableHelipadLight_01_blue_F" createVehicle [0,0,0];

			_ahw_zamaktranslight_1 attachto [_vehicle,[0.8,3,0.5]];
			_ahw_zamaktranslight_2 attachto [_vehicle,[-0.8,3,0.5]];

			{_x setCollisionLight false} foreach [_ahw_zamaktranslight_1,_ahw_zamaktranslight_2];
		};

		case "ahw_hemtt": 
		{
			waitUntil {!isNil {_vehicle getVariable "Life_VEH_color"}};		
			_vehicle setVariable["lights",false,true];
			_ahw_hemttlight_1 = "PortableHelipadLight_01_yellow_F" createVehicle [0,0,0];
			_ahw_hemttlight_2 = "PortableHelipadLight_01_yellow_F" createVehicle [0,0,0];
			_ahw_hemttlight_3 = "PortableHelipadLight_01_yellow_F" createVehicle [0,0,0];
			_ahw_hemttlight_4 = "PortableHelipadLight_01_yellow_F" createVehicle [0,0,0];

			_ahw_hemttlight_1 attachto [_vehicle,[0.525,0.585,0.8]];
			_ahw_hemttlight_2 attachto [_vehicle,[-0.95,0.585,0.8]];
			_ahw_hemttlight_3 attachto [_vehicle,[-0.95,3.25,0.8]];
			_ahw_hemttlight_4 attachto [_vehicle,[0.95,3.25,0.8]];

			{_x setCollisionLight false} foreach [_ahw_hemttlight_1,_ahw_hemttlight_2,_ahw_hemttlight_3,_ahw_hemttlight_4];		
		};

		case "cop_strider": 
		{
			waitUntil {!isNil {_vehicle getVariable "Life_VEH_color"}};		
			_vehicle setVariable["lights",false,true];
			_cop_striderlight1 = "PortableHelipadLight_01_blue_F" createVehicle [0,0,0];
			_cop_striderlight2 = "PortableHelipadLight_01_blue_F" createVehicle [0,0,0];
			_cop_striderlight3 = "PortableHelipadLight_01_blue_F" createVehicle [0,0,0];
			_cop_striderlight4 = "PortableHelipadLight_01_blue_F" createVehicle [0,0,0];

			_cop_striderlight1 attachto [_vehicle,[-0.7,-3.08,0.1]];
			_cop_striderlight2 attachto [_vehicle,[0.6,1,0.4]];
            _cop_striderlight3 attachto [_vehicle,[-0.6,1,0.4]];
            _cop_striderlight4 attachto [_vehicle,[0.7,-3.08,0.1]];

            {_x setCollisionLight false} foreach [_cop_striderlight1,_cop_striderlight2,_cop_striderlight3,_cop_striderlight4];
		};

		case "cop_hunter":
		{
			waitUntil {!isNil {_vehicle getVariable "Life_VEH_color"}};		
			_vehicle setVariable["lights",false,true];
			_cop_hunterlight1 = "PortableHelipadLight_01_blue_F" createVehicle [0,0,0];
			_cop_hunterlight2 = "PortableHelipadLight_01_blue_F" createVehicle [0,0,0];

			_cop_hunterlight1 attachto [_vehicle,[0.95,-2.69,0.6]];
			_cop_hunterlight2 attachto [_vehicle,[-0.95,-2.69,0.6]];

			{_x setCollisionLight false} foreach [_cop_hunterlight1,_cop_hunterlight2];
		};

		case "cop_quad":
		{
			waitUntil {!isNil {_vehicle getVariable "Life_VEH_color"}};		
			_vehicle setVariable["lights",false,true];
			_cop_quadlight1 = "PortableHelipadLight_01_blue_F" createVehicle [0,0,0];
			_cop_quadlight2 = "PortableHelipadLight_01_blue_F" createVehicle [0,0,0];
			_cop_quadlight3 = "PortableHelipadLight_01_blue_F" createVehicle [0,0,0];
			_cop_quadlight4 = "PortableHelipadLight_01_blue_F" createVehicle [0,0,0];
			_cop_quadlight5 = "PortableHelipadLight_01_blue_F" createVehicle [0,0,0];
			_cop_quadlight6 = "PortableHelipadLight_01_blue_F" createVehicle [0,0,0];

			_cop_quadlight1 attachto [_vehicle,[0.4,-0.65,-0.45]];
			_cop_quadlight2 attachto [_vehicle,[-0.4,-0.65,-0.45]];
			_cop_quadlight3 attachto [_vehicle,[-0.2,-0.9,-0.45]];
			_cop_quadlight4 attachto [_vehicle,[0.2,-0.9,-0.45]];
			_cop_quadlight5 attachto [_vehicle,[0.2,0.93,-0.78]];
			_cop_quadlight6 attachto [_vehicle,[-0.225,0.93,-0.78]];

			{_x setCollisionLight false} foreach [_cop_quadlight1,_cop_quadlight2,_cop_quadlight3,_cop_quadlight4,_cop_quadlight5,_cop_quadlight6];
		};

		case "cop_zamak": 
		{
			waitUntil {!isNil {_vehicle getVariable "Life_VEH_color"}};		
			_vehicle setVariable["lights",false,true];
			_cop_zamaklight1 = "PortableHelipadLight_01_blue_F" createVehicle [0,0,0];
			_cop_zamaklight2 = "PortableHelipadLight_01_blue_F" createVehicle [0,0,0];

			_cop_zamaklight1 attachto [_vehicle,[0.8,3,0.5]];
			_cop_zamaklight2 attachto [_vehicle,[-0.8,3,0.5]];

			{_x setCollisionLight false} foreach [_cop_zamaklight1,_cop_zamaklight2];
		};
	};
};