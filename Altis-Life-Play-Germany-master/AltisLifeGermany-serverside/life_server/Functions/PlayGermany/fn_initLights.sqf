/* 
 File: fn_initLights.sqf 
 Author: RafiQuak 
 For: PlayGermany 
   http://play-germany.de 
  
 Description: 
 Initialises the light effects at Cop, Medic, ALAC cars... 
 Edit: Ok maybe it does a little more ^^ 
  
 @Params: 
 0: vehicle 
 1: undercover 
  
 @MP-Packet: 
 Let the client create the light sources 
*/ 
private ["_vehicle","_undercover","_side", "_brightness", "_color","_lampPosition","_lightPosition","_lamp","_lampSet","_animated"]; 
 
_vehicle = _this select 0; 
_undercover = _this select 1; 
_side = (_vehicle getVariable ["dbInfo", ["","",west]]) select 2; 
_brightness = 8; 
_lampType = "Land_runway_edgelight_blue_F"; 
 
/* 
 Get the right color and adapt the brightness if necessary 
*/ 
if (_side == east) then { 
  _color = [255, 209, 1]; 
  _brightness = 3; 
  _lampType = "Land_runway_edgelight"; 
} else { 
 if (typeOf _vehicle == "B_G_Offroad_01_repair_F") then { 
  //adminmobil => red 
  _color = [200, 0.1, 0.1]; 
 } else { 
  //blue 
  _color = [0.1, 0.1, 20]; 
 }; 
}; 
 
 
/* 
 Get the positions for the client 
 
  [x, y, z] 
  
       ^      <--------- y -------->       _ 
    |            ___________             | 
    |           /           \          / 
    z     _____/             \       x 
    |    |                    \     / 
    |    |____________________|   |_ 
       v 
*/ 
 
switch (typeOf _vehicle) do 
{ 
 //Offroad 
 case "C_Offroad_01_F": 
 { 
  if(_vehicle getVariable ["undercover",false]) then { 
   _lightPosition = [-0.59,-0.2,0.48]; 
   _lampPosition  = [-0.59,-0.2,0.38]; 
  } else { 
   _lightPosition = [0.0, 1.3, -0.3]; 
  }; 
 }; 
  
 //Feldjäger/Rebel Offroad 
 case "B_G_Offroad_01_F": 
 { 
  if(_vehicle getVariable ["undercover",false]) then { 
   _lightPosition = [-0.59,-0.2,0.48]; 
   _lampPosition  = [-0.59,-0.2,0.38]; 
  } else { 
   _lightPosition = [0.0, 1.3, -0.3]; 
  }; 
 }; 
  
 //ALAC Offroad 
 case "C_Offroad_01_repair_F": 
 { 
  _lightPosition = [0.0, 0.0, 0.56]; 
 }; 
  
 //Adminmobil 
 case "B_G_Offroad_01_repair_F": 
 { 
  if(_vehicle getVariable ["undercover",false]) then { 
   _lightPosition = [-0.59,-0.2,0.48]; 
   _lampPosition  = [-0.59,-0.2,0.38]; 
  } else { 
   _lightPosition = [0.0, 0.0, 0.56]; 
  }; 
 }; 
  
 case "C_SUV_01_F": 
 { 
  _lightPosition = [-0.61,-0.6,0.55]; 
  _lampPosition  = [-0.61,-0.6,0.32]; 
 }; 
  
 case "C_Van_01_box_F": 
 { 
  _lightPosition = [0.0, 2.05, -0.5]; 
 }; 
  
 case "C_Hatchback_01_sport_F": 
 { 
  _lightPosition =  [-0.55,-0.6,0.4]; 
  _lampPosition  =  [-0.52,0.0,0.1]; 
 }; 
  
 case "C_Hatchback_01_F": 
 { 
  _lightPosition =  [-0.55,-0.6,0.4]; 
  _lampPosition  =  [-0.52,0.0,0.1]; 
 }; 
  
 case "B_Truck_01_transport_F": 
 { 
  _lightPosition =  [0.0,3.65,0.81]; 
 }; 
  
 case "B_MRAP_01_F": 
 { 
  _lightPosition =  [0, -0.9, 0.55]; 
 }; 
  
 case "B_MRAP_01_hmg_F": 
 { 
  _lightPosition =  [0, -0.9, 0.55]; 
 }; 
  
 case "I_MRAP_03_F": 
 { 
  _lightPosition =  [0.0, 0.0, 0.56]; 
 }; 
  
 case "I_MRAP_03_hmg_F": 
 { 
  _lightPosition =  [0.0, 0.0, 0.56]; 
 }; 
    
 case "B_Heli_Light_01_F": 
 { 
  _lightPosition =  [0.0, 0.0, -0.95]; 
 }; 
  
 case "B_Heli_Transport_01_F": 
 { 
  _lightPosition =  [0.0, 0.6, -1.0]; 
 }; 
  
 case "O_Heli_Light_02_unarmed_F": 
 { 
  _lightPosition =  [0.0, 0.0,-0.95]; 
 }; 
  
 case "I_Heli_light_03_unarmed_F": 
 { 
  _lightPosition =  [0.0, 0.0,-0.95]; 
 }; 
  
 case "I_Truck_02_box_F": 
 { 
  _lightPosition = [-0.02,3.3,0.5]; 
 }; 
  
 default { 
  _lightPosition =  [0.0, 0.0,0.0]; 
 }; 
}; 
 
/* 
 Create the temp lamp and attach it or switch the lightbar on at the Offroad 
*/ 
 
if( _undercover && {typeOf _vehicle in ["C_Offroad_01_F","B_G_Offroad_01_F","C_Hatchback_01_F","C_Hatchback_01_sport_F","C_SUV_01_F"]}) then { 
 _lamp = (_lampType createVehicle [0,0,0]); 
 _lamp attachTo [_vehicle, _lampPosition]; 
 _lampSet = true; 
} else { 
 //top secret animations ^^ 
 if (typeOf _vehicle in ["C_Offroad_01_F","C_Offroad_01_repair_F","B_G_Offroad_01_F","B_G_Offroad_01_repair_F"]) then { 
  _vehicle animate ["BeaconsStart", 1]; 
  _vehicle animate ["BeaconsServicesStart", 1]; 
  _animated = true; 
 } else { 
  _animated = false; 
  _lamp = _vehicle getVariable ["lamp",objNull]; 
  if(_lamp getVariable ["hidden",false]) then { 
   [[_lamp, false], "PG_fnc_hideObject", true] spawn life_fnc_MP; 
   _lamp setVariable ["hidden",false,true]; 
  }; 
 }; 
 _lampSet = false; 
}; 
 
/* 
 Make all the clients create wunderfull desyncing lightpoints 
  
 Params: [vehicle, speed, color, lightpoint pos, brightness] 
*/ 
 
[[_vehicle,0.22, _color, _lightPosition, _brightness],"PG_fnc_lights",true,false] call life_fnc_MP; 
 
/* 
 Wait for it... 
  
 (sleepUntil has bad performance) 
*/ 
 
while {(_vehicle getVariable ["lights", false]) && (alive _vehicle)} do { 
 sleep 0.2; 
}; 
 
/* 
 Make sure to delete the temp lamp or to stop the animations 
*/ 
 
if (_lampSet) then { 
 deleteVehicle _lamp; 
} else { 
 //top secret animations ^^ 
 if (_animated) then { 
  _vehicle animate ["BeaconsStart", 0]; 
  _vehicle animate ["BeaconsServicesStart", 0]; 
 }; 
}; 
