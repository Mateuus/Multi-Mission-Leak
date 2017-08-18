/*
	File: fn_WarnBlinker.sqf	
	
*/
Private ["_leftRed","_vehicle","_lightYello","_leftBack","_leftSPOTback","_leftFront","_leftSPOTfront","_rightBack","_rightSPOTback","_rightFront","_rightSPOTfront","_brightSPOT","_bright"]; 
_vehicle = _this select 0;
if(isNil "_vehicle" OR isNull _vehicle OR !(_vehicle getVariable "Warn")) exitWith {};
_lightYello = [20, 20, 0.1];
_pos = getposATL _vehicle;
_leftBack = "#lightpoint" createVehicle _pos;
_leftFront = "#lightpoint" createVehicle _pos;
_rightBack = "#lightpoint" createVehicle _pos;
_rightFront = "#lightpoint" createVehicle _pos;


_leftBack setLightColor _lightYello; 
_leftFront setLightColor _lightYello; 
_rightBack setLightColor _lightYello; 
_rightFront setLightColor _lightYello; 

_leftBack setLightBrightness 0;
_leftFront setLightBrightness 0;
_rightBack setLightBrightness 0;
_rightFront setLightBrightness 0;

_leftBack setLightAmbient _lightYello;
_leftFront setLightAmbient _lightYello;
_rightBack setLightAmbient _lightYello;
_rightFront setLightAmbient _lightYello;

_leftBack setLightIntensity 0;
_leftFront setLightIntensity 0;
_rightBack setLightIntensity 0;
_rightFront setLightIntensity 0;

_leftBack  setLightFlareMaxDistance 150;
_leftFront setLightFlareMaxDistance 150;
_rightBack setLightFlareMaxDistance 150;
_rightFront setLightFlareMaxDistance 150;

_leftBack  setLightUseFlare true;  
_leftFront setLightUseFlare true;
_rightBack setLightUseFlare true;
_rightFront setLightUseFlare true;

_leftBack  setLightDayLight true;
_leftFront setLightDayLight true;
_rightBack setLightDayLight true;
_rightFront setLightDayLight true;


switch (typeOf _vehicle) do{
	case "C_Offroad_01_F":{	
		_leftFront 		lightAttachObject [_vehicle, [-0.80, 2.1, -0.35]]; 
		_leftBack  		lightAttachObject [_vehicle, [-0.80, -3.05, -0.35]];
		_rightFront 	lightAttachObject [_vehicle, [0.8, 2.15, -0.35]];
		_rightBack 		lightAttachObject [_vehicle, [0.8, -3.0, -0.35]];		
	};
	case "C_Offroad_01_repair_F":{
		_leftFront 		lightAttachObject [_vehicle, [-0.80, 2.1, -0.35]]; 
		_leftBack  		lightAttachObject [_vehicle, [-0.80, -3.05, -0.35]];
		_rightFront 	lightAttachObject [_vehicle, [0.8, 2.1, -0.35]];
		_rightBack 		lightAttachObject [_vehicle, [0.8, -3.0, -0.35]];		
	};
	case "B_G_Offroad_01_F":{		
		_leftFront 		lightAttachObject [_vehicle, [-0.80, 2.1, -0.35]]; 
		_leftBack  		lightAttachObject [_vehicle, [-0.80, -3.0, -0.35]];
		_rightFront 	lightAttachObject [_vehicle, [0.8, 2.1, -0.35]];
		_rightBack 		lightAttachObject [_vehicle, [0.8, -3.0, -0.35]];			
	};
		
	case "O_G_Offroad_01_F":{
		_leftFront 		lightAttachObject [_vehicle, [-0.80, 2.1, -0.35]]; 
		_leftBack  		lightAttachObject [_vehicle, [-0.80, -3.0, -0.35]];
		_rightFront 	lightAttachObject [_vehicle, [0.8, 2.1, -0.35]];
		_rightBack 		lightAttachObject [_vehicle, [0.8, -3.0, -0.35]];
	};
	
	case "B_G_Offroad_01_repair_F":{		
		_leftFront 		lightAttachObject [_vehicle, [-0.80, 2.1, -0.35]]; 
		_leftBack  		lightAttachObject [_vehicle, [-0.80, -3.0, -0.35]];
		_rightFront 	lightAttachObject [_vehicle, [0.8, 2.1, -0.35]];
		_rightBack 		lightAttachObject [_vehicle, [0.8, -3.0, -0.35]];				
	};	
	case "B_MRAP_01_F":{		 
		_leftFront 		lightAttachObject [_vehicle, [-1.0, 1.40, -0.7]]; 
		_leftBack  		lightAttachObject [_vehicle, [-0.90, -4.3, -0.7]];
		_rightFront 	lightAttachObject [_vehicle, [0.8, 2.1, -0.4]];
		_rightBack 		lightAttachObject [_vehicle, [0.8, -3.0, -0.4]];		
	};	
	case "C_SUV_01_F":{		
		_leftFront 		lightAttachObject [_vehicle, [-0.85, 1.9, -0.45]]; 
		_leftBack  		lightAttachObject [_vehicle, [-0.87, -2.75, -0.185]];
		_rightFront 	lightAttachObject [_vehicle, [0.85, 1.9, -0.45]];
		_rightBack 		lightAttachObject [_vehicle, [0.87, -2.75, -0.185]];
	};	
	case "B_Quadbike_01_F":{		 
		_leftFront 		lightAttachObject [_vehicle, [-0.37, 0.85, -0.63]]; 
		_leftBack  		lightAttachObject [_vehicle, [-0.45, -1.09, -0.55]];
		_rightFront 	lightAttachObject [_vehicle, [0.35, 0.85, -0.63]];
		_rightBack 		lightAttachObject [_vehicle, [0.45, -1.09, -0.55]];		
	};	
	case "C_Hatchback_01_F":{		 
		_leftFront 		lightAttachObject [_vehicle, [-0.8, 1.6, -0.5]]; 
		_leftBack  		lightAttachObject [_vehicle, [-0.77, -2.25, -0.3]];
		_rightFront 	lightAttachObject [_vehicle, [0.76, 1.6, -0.5]];
		_rightBack 		lightAttachObject [_vehicle, [0.7, -2.25, -0.3]];		
	};
	case "C_Hatchback_01_sport_F":{		
		_leftFront 		lightAttachObject [_vehicle, [-0.75,1.7,-0.3]]; 
		_leftBack  		lightAttachObject [_vehicle, [-0.77, -2.25, -0.3]];
		_rightFront 	lightAttachObject [_vehicle, [0.76, 1.6, -0.5]];
		_rightBack 		lightAttachObject [_vehicle, [0.7, -2.25, -0.3]];		
	};	
	case "O_MRAP_02_F":{ // ifrit		 
		_leftFront 		lightAttachObject [_vehicle, [-0.77,1.6,-0.7]]; 
		_leftBack  		lightAttachObject [_vehicle, [-0.7,-4.5,-0.9]];
		_rightFront 	lightAttachObject [_vehicle, [0.77,1.6,-0.7]];
		_rightBack 		lightAttachObject [_vehicle, [0.7,-4.5,-0.9]];		
	};	
	case "I_MRAP_03_F":{ 	 
		_leftFront 		lightAttachObject [_vehicle, [-1,2.25,-0.5]]; 
		_leftBack  		lightAttachObject [_vehicle, [-1,-3.2,0.3]];
		_rightFront 	lightAttachObject [_vehicle, [1,2.25,-0.5]];
		_rightBack 		lightAttachObject [_vehicle, [1,-3.2,0.3]];		
	};		
	
	case "C_Van_01_transport_F":{
		_rightBack lightAttachObject [_vehicle, [0.7, -3.15, -0.85]];
		_rightFront lightAttachObject [_vehicle, [0.8, 1.8, -0.25]];
		_leftFront lightAttachObject [_vehicle, [-0.8, 1.8, -0.25]];
		_leftBack lightAttachObject [_vehicle, [-0.7, -3.15, -0.85]];
	};
	
	case "C_Van_01_box_F":{
		_rightBack lightAttachObject [_vehicle, [0.7, -3.15, -0.85]];
		_rightFront lightAttachObject [_vehicle, [0.8, 1.8, -0.25]];
		_leftFront lightAttachObject [_vehicle, [-0.8, 1.8, -0.25]];
		_leftBack lightAttachObject [_vehicle, [-0.7, -3.15, -0.85]];
	};
	
	case "C_Van_01_fuel_F":{
		_rightBack lightAttachObject [_vehicle, [0.7, -3.15, -0.85]];
		_rightFront lightAttachObject [_vehicle, [0.8, 1.8, -0.25]];
		_leftFront lightAttachObject [_vehicle, [-0.8, 1.8, -0.25]];
		_leftBack lightAttachObject [_vehicle, [-0.7, -3.15, -0.85]];
	};
	case "O_Truck_03_transport_F":{
		_rightBack lightAttachObject [_vehicle, [1.15, -4.7, -1.2]];
		_rightFront lightAttachObject [_vehicle, [0.9, 3.3, -1.05]];
		_leftBack lightAttachObject [_vehicle, [-1, -4.7, -1.2]];
		_leftFront lightAttachObject [_vehicle, [-0.75, 3.325, -1.05]];
	};
	case "O_Truck_03_covered_F":{
		_rightBack lightAttachObject [_vehicle, [1.15, -4.7, -1.2]];
		_rightFront lightAttachObject [_vehicle, [0.9, 3.3, -1.05]];
		_leftBack lightAttachObject [_vehicle, [-1, -4.7, -1.2]];
		_leftFront lightAttachObject [_vehicle, [-0.75, 3.325, -1.05]];
	};
	case "O_Truck_02_fuel_F":{
		_rightBack lightAttachObject [_vehicle, [1.15, -4.7, -1.2]];
		_rightFront lightAttachObject [_vehicle, [0.9, 3.3, -1.05]];
		_leftBack lightAttachObject [_vehicle, [-1, -4.7, -1.2]];
		_leftFront lightAttachObject [_vehicle, [-0.75, 3.325, -1.05]];
	};
	case "O_Truck_03_fuel_F":{
		_rightBack lightAttachObject [_vehicle, [1.15, -4.7, -1.2]];
		_rightFront lightAttachObject [_vehicle, [0.9, 3.3, -1.05]];
		_leftBack lightAttachObject [_vehicle, [-1, -4.7, -1.2]];
		_leftFront lightAttachObject [_vehicle, [-0.75, 3.325, -1.05]];
	};
	case "I_Truck_02_covered_F":{
		_rightBack lightAttachObject [_vehicle, [0.86, -3.35, -1.22]];
		_rightFront lightAttachObject [_vehicle, [0.91, 4.05, -1.22]];
		_leftBack lightAttachObject [_vehicle, [-0.72, -3.35, -1.22]];
		_leftFront lightAttachObject [_vehicle, [-0.76, 4.05, -1.22]];
	};	
	case "I_Truck_02_transport_F":{
		_rightBack lightAttachObject [_vehicle, [0.86, -3.35, -1.22]];
		_rightFront lightAttachObject [_vehicle, [0.91, 4.05, -1.22]];
		_leftBack lightAttachObject [_vehicle, [-0.72, -3.35, -1.22]];
		_leftFront lightAttachObject [_vehicle, [-0.76, 4.05, -1.22]];
	};
	case "B_Truck_01_covered_F":{		
		_rightBack lightAttachObject [_vehicle, [1.18, -5.05, -0.66]];
		_rightFront lightAttachObject [_vehicle, [0.82, 5.05, -0.45]];
		_leftBack lightAttachObject [_vehicle, [-1.08, -5.05, -0.66]];
		_leftFront lightAttachObject [_vehicle, [-0.73, 5.05, -0.45]];
	};
	case "B_Truck_01_box_F":{			
		_rightBack lightAttachObject [_vehicle, [0.26, -4.33, -1.17]];
		_rightFront lightAttachObject [_vehicle, [0.78, 5.15, -0.55]];
		_leftBack lightAttachObject [_vehicle, [-0.26, -4.33, -1.17]];
		_leftFront lightAttachObject [_vehicle, [-0.78, 5.15, -0.55]];
	};
	case "B_Truck_01_transport_F":{  	
		_leftFront 		lightAttachObject [_vehicle, [-0.73, 5.05, -0.45]];
		_leftBack  		lightAttachObject [_vehicle, [-1.08, -5.05, -0.66]];
		_rightFront 	lightAttachObject [_vehicle, [0.82, 5.05, -0.45]];
		_rightBack 		lightAttachObject [_vehicle, [1.18, -5.05, -0.66]];	
	};
	case "B_Truck_01_mover_F":{			// NEVS 	  
		_leftFront 		lightAttachObject [_vehicle, [-0.76, 4.65, -0.16]];
		_leftBack  		lightAttachObject [_vehicle, [-0.24, -4.25, -0.78]];
		_rightFront 	lightAttachObject [_vehicle, [0.8, 4.65, -0.16]];
		_rightBack 		lightAttachObject [_vehicle, [0.28, -4.25, -0.78]];		
	};	
};
	
_leftBack setLightFlareSize 1;
_leftFront setLightFlareSize 1;
_rightBack setLightFlareSize 1;
_rightFront setLightFlareSize 1;

if (sunOrMoon < 1) then {
	_leftBack setLightAttenuation [0.1, 100, 100, 1000]; 
	_leftFront setLightAttenuation [0.1, 100, 100, 1000]; 
	_rightBack setLightAttenuation [0.1, 100, 100, 1000]; 
	_rightFront setLightAttenuation [0.1, 100, 100, 1000]; 
}else{
	_leftBack setLightAttenuation [0.1, 0, 0.1, 1300];
	_leftFront setLightAttenuation [0.1, 0, 0.1, 1300]; 
	_rightBack setLightAttenuation [0.1, 0, 0.1, 1300];
	_rightFront setLightAttenuation [0.1, 0, 0.1, 1300];
};

_leftRed = true;  
while{ (alive _vehicle)} do{  
	_bright = (0.1 + sunOrMoon) * 3;
	if((!(_vehicle getVariable "Warn"))) exitWith {};
	if((_vehicle getVariable "Right") OR (_vehicle getVariable "Left")) exitWith {};
	if(_leftRed) then{  
		_leftRed = false;				
		
		_leftFront 		setLightBrightness _bright;  
		_leftBack  		setLightBrightness _bright;		
		_rightFront 	setLightBrightness _bright;  
		_rightBack 		setLightBrightness _bright;  
	}else{  
		_leftRed = true; 				
		_leftFront 		setLightBrightness 0.0;  
		_leftBack  		setLightBrightness 0.0;  
		_rightFront 	setLightBrightness 0.0;  
		_rightBack 		setLightBrightness 0.0;  
	};  
	sleep (_this select 1);  
};	

deleteVehicle _leftFront; 		
deleteVehicle _leftBack;  		
deleteVehicle _rightFront; 	
deleteVehicle _rightBack; 	