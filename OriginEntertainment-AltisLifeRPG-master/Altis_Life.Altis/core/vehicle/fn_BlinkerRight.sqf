/*
	File: fn_Blinkerright.sqf
*/
Private ["_vehicle","_lightrightback","_lightrightfront","_lightYello","_leftRed","_lightSPOTfront","_lightSPOTback","_brightSPOT","_bright"]; 
_vehicle = _this select 0;
	
if(isNil "_vehicle" OR isNull _vehicle OR !(_vehicle getVariable "Right")) exitWith {};
_lightYello = [20, 20, 0];

_lightrightback = "#lightpoint" createVehicle getposATL _vehicle;
_lightrightfront = "#lightpoint" createVehicle getposATL _vehicle;   

_lightrightback setLightColor _lightYello; 
_lightrightfront setLightColor _lightYello; 

_lightrightback setLightBrightness 0;  
_lightrightfront setLightBrightness 0; 

_lightrightback setLightAmbient _lightYello;
_lightrightfront setLightAmbient _lightYello; 

_lightrightback setLightIntensity 0;
_lightrightfront setLightIntensity 0;

_lightrightback setLightFlareMaxDistance 150;
_lightrightfront setLightFlareMaxDistance 150;

_lightrightfront setLightUseFlare true;
_lightrightback setLightUseFlare true;

switch (typeOf _vehicle) do{
	case "C_Offroad_01_F":{	
		_lightrightback lightAttachObject [_vehicle, [0.8, -3.0, -0.35]];
		_lightrightfront lightAttachObject [_vehicle, [0.8, 2.1, -0.35]];
	};
	case "B_G_Offroad_01_F":{	
		_lightrightback lightAttachObject [_vehicle, [0.8, -3.0, -0.35]];
		_lightrightfront lightAttachObject [_vehicle, [0.8, 2.1, -0.35]];
	};
		
	case "O_G_Offroad_01_F":{
		_lightrightfront lightAttachObject [_vehicle, [-0.80, 2.1, -0.35]]; 
		_lightrightback lightAttachObject [_vehicle, [-0.80, -3.0, -0.35]];
	};
	
	case "B_G_Offroad_01_repair_F":{	
		_lightrightback lightAttachObject [_vehicle, [0.8, -3.0, -0.35]];
		_lightrightfront lightAttachObject [_vehicle, [0.8, 2.1, -0.35]];
	};		
	case "C_Offroad_01_repair_F":{			
		_lightrightback lightAttachObject [_vehicle, [0.8, -3.0, -0.35]];
		_lightrightfront lightAttachObject [_vehicle, [0.8, 2.1, -0.35]];
	};
	case "B_MRAP_01_F":{
		_lightrightback lightAttachObject [_vehicle, [1.0, 1.40, -0.7]]; 
		_lightrightfront lightAttachObject [_vehicle, [0.90, -4.3, -0.7]];
	};	
	case "C_SUV_01_F":{
		_lightrightback lightAttachObject [_vehicle, [0.87, -2.75, -0.185]]; 
		_lightrightfront lightAttachObject [_vehicle, [0.85, 1.9, -0.45]];
	};
	case "B_Quadbike_01_F":{
		_lightrightback lightAttachObject [_vehicle, [0.45, -1.09, -0.55]]; 
		_lightrightfront lightAttachObject [_vehicle, [0.35, 0.85, -0.63]];
	};	
	
	case "C_Hatchback_01_F":{
		_lightrightback lightAttachObject [_vehicle, [0.7, -2.25, -0.3]]; 
		_lightrightfront lightAttachObject [_vehicle, [0.76, 1.6, -0.5]];
	};
	case "C_Hatchback_01_sport_F":{
		_lightrightback lightAttachObject [_vehicle, [0.7, -2.25, -0.3]]; 
		_lightrightfront lightAttachObject [_vehicle, [0.76, 1.6, -0.5]];
	};
	case "O_MRAP_02_F":{ // ifrit
		_lightrightback lightAttachObject [_vehicle, [0.77,1.6,-0.7]];
		_lightrightfront lightAttachObject [_vehicle, [0.7,-4.5,-0.9]];
	};
	case "I_MRAP_03_F":{
		_lightrightback lightAttachObject [_vehicle, [1,2.25,-0.5]];  
		_lightrightfront lightAttachObject [_vehicle, [1,-3.2,0.3]];
	};
	case "C_Van_01_transport_F":{
		_lightrightback lightAttachObject [_vehicle, [0.7, -3.15, -0.85]];
		_lightrightfront lightAttachObject [_vehicle, [0.8, 1.8, -0.25]];
	};
	
	case "C_Van_01_box_F":{
		_lightrightback lightAttachObject [_vehicle, [0.7, -3.15, -0.85]];
		_lightrightfront lightAttachObject [_vehicle, [0.8, 1.8, -0.25]];
	};
	
	case "C_Van_01_fuel_F":{
		_lightrightback lightAttachObject [_vehicle, [0.7, -3.15, -0.85]];
		_lightrightfront lightAttachObject [_vehicle, [0.8, 1.8, -0.25]];
	};
	case "O_Truck_03_transport_F":{
		_lightrightback lightAttachObject [_vehicle, [1.15, -4.7, -1.2]];
		_lightrightfront lightAttachObject [_vehicle, [0.9, 3.3, -1.05]];
	};
	case "O_Truck_03_covered_F":{
		_lightrightback lightAttachObject [_vehicle, [1.15, -4.7, -1.2]];
		_lightrightfront lightAttachObject [_vehicle, [0.9, 3.3, -1.05]];
	};
	case "O_Truck_02_fuel_F":{
		_lightrightback lightAttachObject [_vehicle, [1.15, -4.7, -1.2]];
		_lightrightfront lightAttachObject [_vehicle, [0.9, 3.3, -1.05]];
	};
	case "O_Truck_03_fuel_F":{
		_lightrightback lightAttachObject [_vehicle, [1.15, -4.7, -1.2]];
		_lightrightfront lightAttachObject [_vehicle, [0.9, 3.3, -1.05]];
	};
	case "I_Truck_02_covered_F":{
		_lightrightback lightAttachObject [_vehicle, [0.86, -3.35, -1.22]];
		_lightrightfront lightAttachObject [_vehicle, [0.91, 4.05, -1.22]];
	};	
	case "I_Truck_02_transport_F":{
		_lightrightback lightAttachObject [_vehicle, [0.86, -3.35, -1.22]];
		_lightrightfront lightAttachObject [_vehicle, [0.91, 4.05, -1.22]];
	}; 
	// HEMMT###################
	case"B_Truck_01_transport_F":{
		_lightrightback lightAttachObject [_vehicle, [1.18, -5.05, -0.66]]; 
		_lightrightfront lightAttachObject [_vehicle, [0.82, 5.05, -0.45]];
	};
	case "B_Truck_01_covered_F":{
		_lightrightback lightAttachObject [_vehicle, [1.18, -5.05, -0.66]]; 
		_lightrightfront lightAttachObject [_vehicle, [0.82, 5.05, -0.45]];
	};
	case "B_Truck_01_box_F":{
		_lightrightback lightAttachObject [_vehicle, [0.26, -4.33, -1.17]]; 
		_lightrightfront lightAttachObject [_vehicle, [0.78, 5.15, -0.55]];
	};	
		case "B_Truck_01_mover_F":{ // hemit ohne alles (NEVS)
		_lightrightback lightAttachObject [_vehicle, [0.28, -4.25, -0.78]];
		_lightrightfront lightAttachObject [_vehicle, [0.8, 4.65, -0.16]];
	};
};

_lightrightback setLightFlareSize 1;
_lightrightfront setLightFlareSize 1;

_lightrightback setLightDayLight true;
_lightrightfront setLightDayLight true;

if (sunOrMoon < 1) then {
	_lightrightback setLightAttenuation [0.1, 100, 100, 1000]; 
	_lightrightfront setLightAttenuation [0.1, 100, 100, 1000]; 
} else {
	_lightrightback setLightAttenuation [0.1, 0, 0.1, 1300];
	_lightrightfront setLightAttenuation [0.1, 0, 0.1, 1300];
};

_leftRed = true;  
while{ (alive _vehicle)} do{ 	
	_bright = (0.1 + sunOrMoon) * 3;
	if((!(_vehicle getVariable "Right"))) exitWith {};	
	if((_vehicle getVariable "Left") OR (_vehicle getVariable "Warn")) exitWith {};	
	if(_leftRed) then{  
		_leftRed = false; 
		
		_lightrightfront setLightBrightness _bright;
		_lightrightback setLightBrightness _bright;  
	}else{  
		_leftRed = true;  

		_lightrightback setLightBrightness 0.0;  
		_lightrightfront setLightBrightness 0.0; 
	};  
	sleep (_this select 1);  
};  
deleteVehicle _lightrightback;
deleteVehicle _lightrightfront;