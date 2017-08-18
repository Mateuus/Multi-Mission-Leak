/*
	File: fn_BlinkerInit.sqf
	Shift + Q /E  or just Tab ore Shift + Tab.	
*/
Private ["_veh","_indicator"];
_veh = _this select 0;
_indicator = _this select 1;

if(isNil "_veh" OR isNull _veh ) exitWith {}; 	
if(!(alive _veh )) exitWith {}; 			
if((driver _veh) != player) exitWith {};		
if( !(_veh isKindOf "LandVehicle"))exitWith{};
if!(typeOf _veh in [
"B_Truck_01_transport_F",
"B_Truck_01_covered_F",
"B_Truck_01_box_F",
"I_MRAP_03_F",
"O_MRAP_02_F",
"B_Truck_01_mover_F",
"C_Hatchback_01_sport_F",
"C_Hatchback_01_F",
"B_Quadbike_01_F",
"C_Quadbike_01_F",
"C_SUV_01_F",
"B_MRAP_01_F",
"B_G_Offroad_01_repair_F",
"B_G_Offroad_01_F",
"C_Offroad_01_repair_F",
"C_Offroad_01_F",
"O_G_Offroad_01_F",
"C_Van_01_transport_F",
"C_Van_01_box_F",
"C_Van_01_fuel_F",
"O_Truck_03_transport_F",
"O_Truck_03_covered_F",
"O_Truck_02_fuel_F",
"O_Truck_03_fuel_F",
"I_Truck_02_transport_F",
"I_Truck_02_covered_F"
])exitWith{};

// presets.
if(isNil {_veh getVariable"Left"})then{_veh setVariable["Left",FALSE,TRUE];};
if(isNil {_veh getVariable"Right"})then{_veh setVariable["Right",FALSE,TRUE];};
if(isNil {_veh getVariable"Warn"})then{_veh setVariable["Warn",FALSE,TRUE];};

switch(_indicator)do{
	case "left":{;	
		if(_veh getVariable"Left") then{	
			_veh setVariable["Left",FALSE,TRUE];
		} else {
			_veh say3D "blinker";
			_veh setVariable["Left",TRUE,TRUE];
			_veh setVariable["Warn",FALSE,TRUE];		
			_veh setVariable["Right",FALSE,TRUE];	
			[[_veh,0.45],"life_fnc_BlinkerLeft",true,false] call life_fnc_MP;
		};
	};	
	case "right":{;	
		if(_veh getVariable"Right") then{	
			_veh setVariable["Right",FALSE,TRUE];
		} else {	
			_veh say3D "blinker";
			_veh setVariable["Right",TRUE,TRUE];	
			_veh setVariable["Left",FALSE,TRUE];	
			_veh setVariable["Warn",FALSE,TRUE];		
			[[_veh,0.45],"life_fnc_BlinkerRight",true,false] call life_fnc_MP;
		};
	};
	case "warning":{;	
		if(_veh getVariable"Warn") then {
		_veh setVariable["Warn",FALSE,TRUE];		
		}else{		
			_veh say3D "blinker";
			_veh setVariable["Warn",TRUE,TRUE];	
			_veh setVariable["Right",FALSE,TRUE];
			_veh setVariable["Left",FALSE,TRUE];
			[[_veh,0.45],"life_fnc_WarnBlinker",true,false] call life_fnc_MP;			
		};
	};
	default{hint" You have loaded blinker init.";};
};