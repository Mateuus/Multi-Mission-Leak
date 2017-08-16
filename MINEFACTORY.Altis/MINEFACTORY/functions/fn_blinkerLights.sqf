// Variablen
Private ["_vehicle","_lightYellow","_lightLeftF","_lightLeftB","_lightRightF","_lightRightB","_blinkOnOff","_blinker"];
_vehicle = _this select 0;
_lightYellow = [20, 10, 0.1];                        
if(isNull _vehicle) exitWith {};


// Links
_lightLeftF = "#lightpoint" createVehicle getpos _vehicle; 
sleep 0.2;
_lightLeftF setLightColor _lightYellow; 
_lightLeftF setLightBrightness 0.7; 
_lightLeftF setLightAmbient [0.1,0.1,1];
_lightLeftF setLightAttenuation [0.181, 0, 1000, 130]; 
_lightLeftF setLightIntensity 15;
_lightLeftF setLightFlareSize 0.10;
_lightLeftF setLightFlareMaxDistance 150;
_lightLeftF setLightUseFlare true;
_lightLeftF setLightDayLight true;
switch (typeOf _vehicle) do {
  case "B_Quadbike_01_F": {
    _lightLeftF lightAttachObject [_vehicle, [-0.25, 1.1, -0.11]];
  };
  case "C_Offroad_01_F": {
    _lightLeftF lightAttachObject [_vehicle, [-0.88, 2.33, -0.35]];
  };
  case "B_G_Offroad_01_F": {
    _lightLeftF lightAttachObject [_vehicle, [-0.88, 2.33, -0.35]];
  };
  case "C_Hatchback_01_F": {
    _lightLeftF lightAttachObject [_vehicle, [-0.7, 1.8, -0.55]];
  };
  case "C_Hatchback_01_sport_F": {
    _lightLeftF lightAttachObject [_vehicle, [-0.7, 1.8, -0.55]];
  };
  case "C_SUV_01_F": {
    _lightLeftF lightAttachObject [_vehicle, [-0.9, 2.0, -0.55]];
  };
}; 

// Rechts
_lightRightF = "#lightpoint" createVehicle getpos _vehicle; 
sleep 0.2;
_lightRightF setLightColor _lightYellow; 
_lightRightF setLightBrightness 0.7; 
_lightRightF setLightAmbient [0.1,0.1,1]; 
_lightRightF setLightAttenuation [0.181, 0, 1000, 130]; 
_lightRightF setLightIntensity 15;
_lightRightF setLightFlareSize 0.10;
_lightRightF setLightFlareMaxDistance 150;
_lightRightF setLightUseFlare true;
_lightRightF setLightDayLight true;
switch (typeOf _vehicle) do {
  case "B_Quadbike_01_F": {
    _lightRightF lightAttachObject [_vehicle, [0.21, 1.0, -0.11]]; 
  };
  case "C_Offroad_01_F": {
    _lightRightF lightAttachObject [_vehicle, [0.85, 2.33, -0.35]]; 
  };
  case "B_G_Offroad_01_F": {
    _lightRightF lightAttachObject [_vehicle, [0.85, 2.33, -0.35]]; 
  };
  case "C_Hatchback_01_F": {
    _lightRightF lightAttachObject [_vehicle, [0.7, 1.8, -0.55]]; 
  };
  case "C_Hatchback_01_sport_F": {
    _lightRightF lightAttachObject [_vehicle, [0.7, 1.8, -0.55]]; 
  };
  case "C_SUV_01_F": {
    _lightRightF lightAttachObject [_vehicle, [0.9, 2.0, -0.55]]; 
  };
}; 

// Links Hinten
_lightLeftB = "#lightpoint" createVehicle getpos _vehicle; 
sleep 0.2;
_lightLeftB setLightColor _lightYellow; 
_lightLeftB setLightBrightness 0.7; 
_lightLeftB setLightAmbient [0.1,0.1,1];
_lightLeftB setLightAttenuation [0.181, 0, 1000, 130]; 
_lightLeftB setLightIntensity 15;
_lightLeftB setLightFlareSize 0.10;
_lightLeftB setLightFlareMaxDistance 150;
_lightLeftB setLightUseFlare true;                
_lightLeftB setLightDayLight true;
switch (typeOf _vehicle) do {
  case "B_Quadbike_01_F": {
    _lightLeftB lightAttachObject [_vehicle, [-0.4, -1.2, -0.0]];     //  Left/Right , Front/Back , Lower/Higher
  };
  case "C_Offroad_01_F": {
    _lightLeftB lightAttachObject [_vehicle, [-0.9, -2.9, -0.2]];     //  Left/Right , Front/Back , Lower/Higher
  };
  case "B_G_Offroad_01_F": {
    _lightLeftB lightAttachObject [_vehicle, [-0.9, -2.9, -0.2]];     //  Left/Right , Front/Back , Lower/Higher
  };  
  case "C_Hatchback_01_F": {
    _lightLeftB lightAttachObject [_vehicle, [-0.75, -2.36, -0.3]];   //  Left/Right , Front/Back , Lower/Higher
  };
  case "C_Hatchback_01_sport_F": {
    _lightLeftB lightAttachObject [_vehicle, [-0.75, -2.36, -0.3]];   //  Left/Right , Front/Back , Lower/Higher
  };
  case "C_SUV_01_F": {
    _lightLeftB lightAttachObject [_vehicle, [-0.9, -2.9, -0.2]];     //  Left/Right , Front/Back , Lower/Higher
  };
};  

// Rechts Hinten
_lightRightB = "#lightpoint" createVehicle getpos _vehicle; 
sleep 0.2;
_lightRightB setLightColor _lightYellow; 
_lightRightB setLightBrightness 0.7; 
_lightRightB setLightAmbient [0.1,0.1,1]; 
_lightRightB setLightAttenuation [0.181, 0, 1000, 130]; 
_lightRightB setLightIntensity 15;
_lightRightB setLightFlareSize 0.10;
_lightRightB setLightFlareMaxDistance 150;
_lightRightB setLightUseFlare true;
_lightRightB setLightDayLight true;
switch (typeOf _vehicle) do {
  case "B_Quadbike_01_F": {
    _lightRightB lightAttachObject [_vehicle, [0.4, -1.2, -0.0]];
  };
  case "C_Offroad_01_F": {
    _lightRightB lightAttachObject [_vehicle, [0.9, -2.9, -0.2]];
  };
  case "B_G_Offroad_01_F": {
    _lightRightB lightAttachObject [_vehicle, [0.9, -2.9, -0.2]];
  };
  case "C_Hatchback_01_F": {
    _lightRightB lightAttachObject [_vehicle, [0.7, -2.36, -0.3]];
  };
  case "C_Hatchback_01_sport_F": {
    _lightRightB lightAttachObject [_vehicle, [0.7, -2.36, -0.3]];
  };
  case "C_SUV_01_F": {
    _lightRightB lightAttachObject [_vehicle, [0.9, -2.9, -0.2]];
  };
};  

_blinker = _vehicle getVariable["blinker","off"];

// On/Off
_blinkOnOff = true; 
while{ (alive _vehicle)} do { 
  if(_blinkOnOff) then {
    _blinkOnOff = false;    
    _blinker = _vehicle getVariable["blinker","off"];
    if(_blinker == 'left' || _blinker == 'warning') then { 
      _lightLeftF setLightBrightness 8; 
      _lightLeftB setLightBrightness 8;
    }; 
    if(_blinker == 'right' || _blinker == 'warning') then {
      _lightRightF setLightBrightness 8; 
      _lightRightB setLightBrightness 8;  
    };
  } else {        
    _blinkOnOff = true;              
    _lightLeftF setLightBrightness 0.0; 
    _lightLeftB setLightBrightness 0.0; 
    _lightRightF setLightBrightness 0.0;
    _lightRightB setLightBrightness 0.0; 
    _blinker = _vehicle getVariable["blinker","off"];
    if(_blinker == 'off' || _blinker == '') exitWith {
      deleteVehicle _lightLeftF;
      deleteVehicle _lightLeftB;
      deleteVehicle _lightRightF;
      deleteVehicle _lightRightB;
    }; 
  }; 
  sleep 0.4;
  sleep (_this select 1); 
}; 

// löschen                  
deleteVehicle _lightLeftF;
deleteVehicle _lightLeftB;
deleteVehicle _lightRightF;
deleteVehicle _lightRightB;
