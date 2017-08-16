/*
	File: fn_vehicleAnimate.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Pass what you want to be animated.
*/
private["_vehicle","_animate","_state","_parts"];
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
		case "boat_trawler":
		{
			[_vehicle] remoteExec ["TEX_FNC_AnimateTrawler", 2];
		};
	
		case "civ_littlebird":
		{
			_vehicle animate ["addDoors",1];
			_vehicle animate ["addBenches",0];
			_vehicle animate ["addTread",0];
			_vehicle animate ["AddCivilian_hide",1];
			_vehicle lockCargo [2,true];
			_vehicle lockCargo [3,true];
			_vehicle lockCargo [4,true];
			_vehicle lockCargo [5,true];
		};
		
		case "civ_cart":
        {
            _lightmidcart = "Land_FloodLight_F" createVehicle getpos _vehicle;
            _lightmidcart attachTo [_vehicle, [0.06, 1.0, -0.8]];
            _lightmidcart setDir ((getDir _vehicle)-90);

            [_vehicle, _lightmidcart] spawn {
				waitUntil{not alive (_this select 0) || isNull (_this select 0)};
				deleteVehicle (_this select 1);
            };
        };
		
		case "service_truck":
		{
			_vehicle animate ["HideServices", 0];
			_vehicle animate ["HideDoor3", 1];
		};
		
		case "cop_hemmit":
		{
			_vehicle setVariable ["Trunk",[[["spikeStrip",10],["mauer",10]],200],TRUE];
			
			_parts = _vehicle getVariable "a2";
			_parts allowDamage false;
			_parts enablesimulation false;
			_parts attachTo [_vehicle, [0.5, -1.85, -0.33]];
			_parts setVectorUp [0 , 1000000000000 , 1];
			_vehicle setVariable ["a2", _parts, TRUE];
	
			_parts = _vehicle getVariable "a3";
			_parts allowDamage false;
			_parts enablesimulation false;
			_parts attachTo [_vehicle, [-0.5, -1.85, -0.33]];
			_parts setVectorUp [0 , 1000000000000 , 1];
			_vehicle setVariable ["a3", _parts, TRUE];
	
			_parts = _vehicle getVariable "a4";
			_parts allowDamage false;
			_parts enablesimulation false;
			_parts attachTo [_vehicle, [0.0, -1.85, -0.33]];
			_parts setVectorUp [0 , 1000000000000 , 1];
			_vehicle setVariable ["a4", _parts, TRUE];
	
			_parts = _vehicle getVariable "a1";
			_parts allowDamage false;
			_parts enablesimulation false;
			_parts attachTo [_vehicle, [0, -1.1, -0.15]];
			_parts setVectorDirAndUp [[1,0,0],[0,0,1]];
			_vehicle setVariable ["a1", _parts, TRUE];
	
			_parts = _vehicle getVariable "a7";
			_parts allowDamage false;
			_parts enablesimulation false;
			_parts attachTo [_vehicle, [-1.0, -0.25, 0.8]];
			_parts setVectorDirAndUp [[1,0,0],[0,0,1]];
			_parts setvectorup [100 , -0.192 , 1];
			_vehicle setVariable ["a7", _parts, TRUE];
	
			_parts = _vehicle getVariable "a5";
			_parts allowDamage false;
			_parts enablesimulation false;
			_parts attachTo [_vehicle, [0.0, 0.0, 1.055]];
			_parts setvectorup [ 0, 4, 1];
			_vehicle setVariable ["a5", _parts, TRUE];
	
			_parts = _vehicle getVariable "a6";
			_parts allowDamage false;
			_parts enablesimulation false;
			_parts attachTo [_vehicle, [0.7, -2.0, 0.28]];
			_parts setVectorDirAndUp [[-1,-1000000000000000,0],[0,0,1]];
			_parts setvectorup [0 , -75 , -1];
			_vehicle setVariable ["a6", _parts, TRUE];
			
			_vehicle spawn {
				private["_p1","_p2","_p3","_p4","_p5","_p6","_p7"];
		
				_p1 = _this getVariable "a1";
				_p2 = _this getVariable "a2";
				_p3 = _this getVariable "a3";
				_p4 = _this getVariable "a4";
				_p5 = _this getVariable "a5";
				_p6 = _this getVariable "a6";
				_p7 = _this getVariable "a7";
		
				waitUntil{not alive _this || isNull _this || isNull _p1};
		
				if(!(isNull _p1)) then
				{
					deleteVehicle _p1;
					deleteVehicle _p2;
					deleteVehicle _p3;
					deleteVehicle _p4;
					deleteVehicle _p5;
					deleteVehicle _p6;
					deleteVehicle _p7;
				};
			};
		};
		
		case "med_offroad":
		{
			_vehicle animate ["HidePolice", 0];
			_vehicle setVariable["lights",false,true];
		};
		
		case "cop_offroad":
		{
			_vehicle animate ["HidePolice", 0];
			_vehicle animate ["HideBumper1", 0];
			_vehicle setVariable["lights",false,true];
		};
	};
};