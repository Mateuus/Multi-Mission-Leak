/*
	File: fn_blinkerleft.sqf

*/
Private ["_vehicle","_lightleftBack","_lightleftFront","_lightYello","_leftRed","_lightSPOTfront","_lightSPOTback","_brightSPOT","_bright"]; 
_vehicle = _this select 0;
	
if(isNil "_vehicle" OR isNull _vehicle OR !(_vehicle getVariable "Left")) exitWith {};
_lightYello = [20, 20, 0];

_lightleftBack = "#lightpoint" createVehicle getposATL _vehicle; 
_lightleftFront = "#lightpoint" createVehicle getposATL _vehicle; 
  
_lightleftBack setLightColor _lightYello; 
_lightleftFront setLightColor _lightYello;

_lightleftBack setLightBrightness 0;
_lightleftFront setLightBrightness 0;

_lightleftBack setLightAmbient _lightYello;
_lightleftFront setLightAmbient _lightYello; 

_lightleftBack setLightAttenuation 	[0, 0, 1000, 1300];
_lightleftFront setLightAttenuation [0, 0, 1000, 1300]; 

_lightleftBack setLightIntensity 0;
_lightleftFront setLightIntensity 0;

_lightleftBack setLightFlareMaxDistance 150;
_lightleftFront setLightFlareMaxDistance 150;

_lightleftFront setLightUseFlare true;
_lightleftBack setLightUseFlare true;

switch (typeOf _vehicle) do{
	case "C_Offroad_01_F":{
		_lightleftFront lightAttachObject [_vehicle, [-0.80, 2.15, -0.35]]; 
		_lightleftBack lightAttachObject [_vehicle, [-0.80, -2.95, -0.35]]; 
	};	
	case "B_G_Offroad_01_F":{
		_lightleftFront lightAttachObject [_vehicle, [-0.80, 2.1, -0.35]]; 
		_lightleftBack lightAttachObject [_vehicle, [-0.80, -3.0, -0.35]]; 
	};	
	
	case "O_G_Offroad_01_F":{
		_lightleftFront lightAttachObject [_vehicle, [-0.80, 2.1, -0.35]]; 
		_lightleftBack lightAttachObject [_vehicle, [-0.80, -3.0, -0.35]];
	};
	
	case "B_G_Offroad_01_repair_F":{
		_lightleftFront lightAttachObject [_vehicle, [-0.80, 2.1, -0.35]]; 
		_lightleftBack lightAttachObject [_vehicle, [-0.80, -3.0, -0.35]]; 
	};	
	case "C_Offroad_01_repair_F":{
		_lightleftFront lightAttachObject [_vehicle, [-0.80, 2.1, -0.35]]; 
		_lightleftBack lightAttachObject [_vehicle, [-0.80, -3.0, -0.35]]; 
	};	
	case "B_MRAP_01_F":{
		_lightleftBack lightAttachObject [_vehicle, [-0.90, -4.3, -0.7]];
		_lightleftFront lightAttachObject [_vehicle, [-1.05, 1.4, -0.75]]; 
	};	
	case "C_SUV_01_F":{
		_lightleftFront lightAttachObject [_vehicle, [-0.85, 1.9, -0.45]];
		_lightleftBack lightAttachObject [_vehicle, [-0.87, -2.75, -0.185]]; 
	};
	case "B_Quadbike_01_F":{
		_lightleftFront lightAttachObject [_vehicle, [-0.37, 0.85, -0.63]];
		_lightleftBack lightAttachObject [_vehicle, [-0.45, -1.09, -0.55]]; 
	};	
	case "C_Hatchback_01_F":{
		_lightleftFront lightAttachObject [_vehicle, [-0.8, 1.6, -0.5]]; 
		_lightleftBack lightAttachObject [_vehicle, [-0.77, -2.25, -0.3]];
	};
	case "C_Hatchback_01_sport_F":{
		_lightleftFront lightAttachObject [_vehicle, [-0.8, 1.6, -0.5]]; 
		_lightleftBack lightAttachObject [_vehicle, [-0.77, -2.25, -0.3]];
	};	
	case "O_MRAP_02_F":{ // ifrit
		_lightleftFront lightAttachObject [_vehicle, [-0.77,1.6,-0.7]]; 
		_lightleftBack lightAttachObject [_vehicle, [-0.7,-4.5,-0.9]];
	};
	case "I_MRAP_03_F":{
		_lightleftFront lightAttachObject [_vehicle, [-1,2.25,-0.5]]; 
		_lightleftBack lightAttachObject [_vehicle, [-1,-3.2,0.3]];
	};
	case "C_Van_01_transport_F":{
		_lightleftFront lightAttachObject [_vehicle, [-0.8, 1.8, -0.25]];
		_lightleftBack lightAttachObject [_vehicle, [-0.7, -3.15, -0.85]];
	};
	case "C_Van_01_box_F":{
		_lightleftFront lightAttachObject [_vehicle, [-0.8, 1.8, -0.25]];
		_lightleftBack lightAttachObject [_vehicle, [-0.7, -3.15, -0.85]];
	};
	case "C_Van_01_fuel_F":{
		_lightleftFront lightAttachObject [_vehicle, [-0.8, 1.8, -0.25]];
		_lightleftBack lightAttachObject [_vehicle, [-0.7, -3.15, -0.85]];
	};
	case "O_Truck_03_transport_F":{
		_lightleftBack lightAttachObject [_vehicle, [-1, -4.7, -1.2]];
		_lightleftFront lightAttachObject [_vehicle, [-0.75, 3.325, -1.05]];
	};
	case "O_Truck_03_covered_F":{
		_lightleftBack lightAttachObject [_vehicle, [-1, -4.7, -1.2]];
		_lightleftFront lightAttachObject [_vehicle, [-0.75, 3.325, -1.05]];
	};
	case "O_Truck_02_fuel_F":{
		_lightleftBack lightAttachObject [_vehicle, [-1, -4.7, -1.2]];
		_lightleftFront lightAttachObject [_vehicle, [-0.75, 3.325, -1.05]];
	};
	case "O_Truck_03_fuel_F":{
		_lightleftBack lightAttachObject [_vehicle, [-1, -4.7, -1.2]];
		_lightleftFront lightAttachObject [_vehicle, [-0.75, 3.325, -1.05]];
	};
	case "I_Truck_02_covered_F":{
		_lightleftBack lightAttachObject [_vehicle, [-0.72, -3.35, -1.22]];
		_lightleftFront lightAttachObject [_vehicle, [-0.76, 4.05, -1.22]];
	};
	case "I_Truck_02_transport_F":{
		_lightleftBack lightAttachObject [_vehicle, [-0.72, -3.35, -1.22]];
		_lightleftFront lightAttachObject [_vehicle, [-0.76, 4.05, -1.22]];
	}; 
	// Hemmt#######################
	case "B_Truck_01_transport_F":{
		_lightleftFront lightAttachObject [_vehicle, [-0.73, 5.05, -0.45]];
		_lightleftBack lightAttachObject [_vehicle, [-1.08, -5.05, -0.66]]; 

	};
	case "B_Truck_01_covered_F":{
		_lightleftFront lightAttachObject [_vehicle, [-0.73, 5.05, -0.45]];
		_lightleftBack lightAttachObject [_vehicle, [-1.08, -5.05, -0.66]]; 

	};
	case "B_Truck_01_box_F":{
		_lightleftFront lightAttachObject [_vehicle, [-0.78, 5.15, -0.55]];
		_lightleftBack lightAttachObject [_vehicle, [-0.26, -4.33, -1.17]]; 

	};
	case "B_Truck_01_mover_F":{
		_lightleftFront lightAttachObject [_vehicle, [-0.76, 4.65, -0.16]];
		_lightleftBack lightAttachObject [_vehicle, [-0.24, -4.25, -0.78]];	
	};
};

_lightleftBack setLightFlareSize 1;
_lightleftFront setLightFlareSize 1;

_lightleftBack  setLightDayLight true;
_lightleftFront setLightDayLight true;

if (sunOrMoon < 1) then { 
	_lightleftFront setLightAttenuation [0.1, 100, 100, 1000]; 
	_lightleftBack setLightAttenuation [0.1, 100, 100, 1000]; 
} else {
	_lightleftFront setLightAttenuation [0.1, 0, 0.1, 1300];
	_lightleftBack setLightAttenuation [0.1, 0, 0.1, 1300];
};

_leftRed = true;  
while{ (alive _vehicle)} do{  
	_bright = (0.1 + sunOrMoon) * 3;
	if((!(_vehicle getVariable "Left"))) exitWith {};
	if((_vehicle getVariable "Right") OR (_vehicle getVariable "Warn")) exitWith {};
	if(_leftRed) then{  
		_leftRed = false; 

		_lightleftFront setLightBrightness _bright;    		
		_lightleftBack setLightBrightness _bright; 
	}else{  
		_leftRed = true; 

		_lightleftBack setLightBrightness 0.0;  
		_lightleftFront setLightBrightness 0.0;  	
	};  
	sleep (_this select 1);  
};  
deleteVehicle _lightleftBack;
deleteVehicle _lightleftFront;
