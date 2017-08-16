private["_vehicle","_type","_blinker"];
_vehicle = _this select 0;
_type    = _this select 1;

_blinker = _vehicle getVariable["blinker","off"];

if(isNull _vehicle) exitWith {};
if(!(typeOf _vehicle in ["B_Quadbike_01_F","C_Offroad_01_F","B_G_Offroad_01_F","C_Hatchback_01_F","C_Hatchback_01_sport_F","C_SUV_01_F"])) exitWith {};

if(_blinker != _type) then {
  if(_blinker == 'off' || _blinker == '') then {   
    _vehicle setVariable["blinker",_type,TRUE];    
    [_vehicle,0.22] remoteExecCall ["life_fnc_blinkerLights",0];
  } else {
    _vehicle setVariable["blinker",_type,TRUE]; 
  };  
  switch(_type) do {
    case "left": {           
      hint "Linken Blinker eingeschaltet";
    };
    case "right": {  
      hint "Rechten Blinker eingeschaltet";
    };
    case "warning": { 
      hint "Warnblinker eingeschaltet";
    };
  }; 
} else {
  _vehicle setVariable["blinker","off",TRUE];    
  switch(_type) do {
    case "left": {
      hint "Linken Blinker ausgeschaltet";
    };
    case "right": {  
      hint "Rechten Blinker ausgeschaltet";
    };
    case "warning": { 
      hint "Warnblinker ausgeschaltet";
    };
  }; 
};