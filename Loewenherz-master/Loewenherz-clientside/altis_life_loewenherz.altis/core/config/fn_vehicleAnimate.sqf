/*
	File: fn_vehicleAnimate.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Pass what you want to be animated.
*/
private["_vehicle","_animate","_state"];
_vehicle = param [0,Objnull,[Objnull]];
if(isnull _vehicle) exitwith {}; //FUCK
_animate = param [1,"",["",[]]];
_preset = param [2,false,[false]];

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
		case "civ_littlebird":
		{
			waitUntil {!isNil {_vehicle getVariable "lhm_VEH_color"}};
			_vehicle animate ["addDoors",1];
			_vehicle animate ["addBenches",0];
			_vehicle animate ["addTread",0];
			_vehicle animate ["AddCivilian_hide",1];
			_vehicle lockCargo [2,true];
			_vehicle lockCargo [3,true];
			_vehicle lockCargo [4,true];
			_vehicle lockCargo [5,true];
		};
		// LHM START
		case "service_truck":
		{
			if(typeOf _vehicle == "I_G_Offroad_01_F") then {
				waitUntil {!isNil {_vehicle getVariable "lhm_VEH_color"}};
			};
			_vehicle animate ["HideServices", 0];
			_vehicle animate ["HideDoor3", 1];
			_vehicle animate ["HideBumper1", 1];
			_vehicle animate ["HideBumper2", 1];
			_vehicle animate ["HidePolice", 1];
			_vehicle setVariable["lights",false,true];
		};
		// LHM END
		case "med_offroad":
		{
			if(typeOf _vehicle == "C_Offroad_01_F") then {
				waitUntil {!isNil {_vehicle getVariable "lhm_VEH_color"}};
			};
			_vehicle animate ["HidePolice", 0];
			_vehicle animate ["HideBumper1",1];
       		_vehicle animate ["HideBumper2",1];
      		_vehicle animate ["HideDoor3",0];
			_vehicle setVariable["lights",false,true];
		};

		case "cop_offroad":
		{
			if(typeOf _vehicle == "C_Offroad_01_F") then {
				waitUntil {!isNil {_vehicle getVariable "lhm_VEH_color"}};
			};
			_vehicle animate ["HidePolice", 0];
			_vehicle animate ["HideBumper1", 0];
			_vehicle animate ["HideDoor3",0];
			_vehicle setVariable["lights",false,true];
		};
	};
};