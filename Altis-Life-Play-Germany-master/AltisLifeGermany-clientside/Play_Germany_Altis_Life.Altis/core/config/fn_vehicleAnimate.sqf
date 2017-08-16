/*
	File: fn_vehicleAnimate.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Pass what you want to be animated.
*/
private["_vehicle","_animate","_state"];
_vehicle = [_this,0,objNull,[objNull]] call BIS_fnc_param;
if(isNull _vehicle) exitWith {}; //FUCK
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
		case "civ_littlebird":
		{
			waitUntil {!isNil {_vehicle getVariable "Life_VEH_color"}};
			
			if((_vehicle getVariable "Life_VEH_color") in [14,22,23]) then {
				//reb
				_vehicle animate ["addBenches",1];
				_vehicle animate ["addTread",1];
			} else {
				//civ
				_vehicle animate ["addBenches",0];
				_vehicle animate ["addTread",0];
				_vehicle lockCargo [2,true];
				_vehicle lockCargo [3,true];
				_vehicle lockCargo [4,true];
				_vehicle lockCargo [5,true];
				[_vehicle] spawn PG_fnc_lockCargo;
				if(!isServer) then {[_vehicle] remoteExec ["PG_fnc_lockCargo",2]};	
			};
		};
		case "twitch":
		{
			_vehicle animate ["hidedoor3",0];
			_vehicle animate ["HideBumper1", 1];
			_vehicle animate ["HideBumper2", 0];		
		};
		
		case "service_truck":
		{
			waitUntil{!isNil {_vehicle getVariable "Life_VEH_color"}};
			_vehicle animate ["HideServices", 0];
			_vehicle animate ["HideDoor3", 1];
		};
		
		case "med_offroad":
		{
			if(typeOf _vehicle == "C_Offroad_01_F") then {
				waitUntil {!isNil {_vehicle getVariable "Life_VEH_color"}};
				_vehicle animate ["HidePolice", 0];
				_vehicle animate ["HideConstruction", 0];
				_vehicle animate ["HideBumper2", 0];
			};
		};
		
		case "cop_offroad":
		{
			if(typeOf _vehicle == "C_Offroad_01_F") then {
				waitUntil {!isNil {_vehicle getVariable "Life_VEH_color"}};
				_vehicle animate ["HidePolice", 0];
				_vehicle animate ["HideBumper1", 0];
			};
		};
		
		case "jaeger_offroad":
		{
			if(typeOf _vehicle == "B_G_Offroad_01_F") then {
				waitUntil {!isNil {_vehicle getVariable "Life_VEH_color"}};
				_vehicle animate ["HidePolice", 0];
				_vehicle animate ["HideBumper1", 0];
				_vehicle animate ["HideBumper2", 0];
				_vehicle animate ["HideBackpacks", 1];
				_vehicle animate ["HideDoor1", 0];
				_vehicle animate ["HideDoor2", 0];
				_vehicle animate ["HideDoor3", 1];
				_vehicle animate ["HideConstruction", 0];
			};
		}; 
	};
};