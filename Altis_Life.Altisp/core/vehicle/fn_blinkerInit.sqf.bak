#include "..\..\script_macros.hpp"
/*
	File: fn_blinkerInit.sqf
	Description: Zakaz używania/modyfikowania/kopiowania tego pliku bez zgody właściciela.
	Shift + Q /E  or just Tab ore Shift + Tab.	
*/
Private ["_vehicle","_trueorfalse"];
_vehicle = param [0,ObjNull,[ObjNull]];
_trueorfalse =  _this select 1;

if(isNil "_vehicle" OR isNull _vehicle ) exitWith {}; 	
if(!(alive _vehicle )) exitWith {}; 			
if((driver _vehicle) != player) exitWith {};		
if( !(_vehicle isKindOf "LandVehicle"))exitWith{};
if!(typeOf _vehicle in [
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
if(isNil {_vehicle GVAR "Left"})then{_vehicle SVAR ["Left",FALSE,TRUE];};
if(isNil {_vehicle GVAR "Right"})then{_vehicle SVAR ["Right",FALSE,TRUE];};
if(isNil {_vehicle GVAR "Warn"})then{_vehicle SVAR ["Warn",FALSE,TRUE];};

switch(_trueorfalse)do{
	case "left":{;	
		if(_vehicle GVAR "Left") then{	
			_vehicle SVAR ["Left",FALSE,TRUE];
		} else {
			_vehicle say3D "blinker";
			_vehicle SVAR ["Left",TRUE,TRUE];
			_vehicle SVAR ["Warn",FALSE,TRUE];		
			_vehicle SVAR ["Right",FALSE,TRUE];	
			[_vehicle,0.45] remoteExec ["life_fnc_BlinkerLeft",RCLIENT];
		};
	};	
	case "right":{;	
		if(_vehicle GVAR "Right") then{	
			_vehicle SVAR ["Right",FALSE,TRUE];
		} else {	
			_vehicle say3D "blinker";
			_vehicle SVAR ["Right",TRUE,TRUE];	
			_vehicle SVAR ["Left",FALSE,TRUE];	
			_vehicle SVAR ["Warn",FALSE,TRUE];		
			[_vehicle,0.45] remoteExec ["life_fnc_BlinkerRight",RCLIENT];
		};
	};
	case "warning":{;	
		if(_vehicle GVAR "Warn") then {
		_vehicle SVAR ["Warn",FALSE,TRUE];		
		}else{		
			_vehicle say3D "blinker";
			_vehicle SVAR ["Warn",TRUE,TRUE];	
			_vehicle SVAR ["Right",FALSE,TRUE];
			_vehicle SVAR ["Left",FALSE,TRUE];
			[_vehicle,0.45] remoteExec ["life_fnc_blinkerWarn",RCLIENT];
		};
	};
	default{hint" You have loaded blinker init.";};
};
