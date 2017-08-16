/*
    File: fn_copLights.sqf
    Author: Basti
*/

_vehicle = (_this select 0);

if (isNil "_vehicle" || isNull _vehicle || !(_vehicle getVariable "lights")) exitWith {};
_lightRed = [0.1, 0.1, 20];
_lightBlue = [0.1, 0.1, 20];
_time = [dayTime, "HH"] call BIS_fnc_timeToString;
_sun = _time in ["19","20","21","22","23","00","01","02","03","04","05","06"];
_intensity = 0.5;
_attenuation = [0,0,0,0,0,0];
_bright = 0.8;
if(_sun)then {
  _intensity = 0.25;
  _attenuation = [0,0,0,0,50,100];
  _bright = 0.4;
} else {
  _intensity = 50;
  _attenuation = [0,3,3,0,100,300];
  _bright = 6;
};

_lightleft = "#lightpoint" createVehicleLocal getPos _vehicle;
sleep 0.2;
_lightleft setLightColor _lightRed;
_lightleft setLightBrightness 1;
_lightleft setLightAmbient [0.1,0.1,1];

switch (typeOf _vehicle) do
{
    case "C_Offroad_01_F":
    {
        _lightleft lightAttachObject [_vehicle, [-0.37, 0.0, 0.56]];
    };

    case "B_MRAP_01_F":
    {
        _lightleft lightAttachObject [_vehicle, [-0.8,-0.95,0.6]];
    };

    case "I_MRAP_03_F":
    {
        _lightleft lightAttachObject [_vehicle, [-0.8,2.25,-0.3]];
    };

    case "B_MRAP_01_hmg_F":
    {
        _lightleft lightAttachObject [_vehicle, [-0.8,-0.95,0.6]];
    };

    case "I_Truck_02_covered_F":
    {
        _lightleft lightAttachObject [_vehicle, [-0.8,3.65,-0.9]];
    };

    case "C_SUV_01_F":
    {
        _lightleft lightAttachObject [_vehicle, [-0.7,1.85,-0.5]];
    };

    case "C_Hatchback_01_sport_F":
    {
        _lightleft lightAttachObject [_vehicle, [-0.5,1.85,-0.9]];
    };

    case "C_Hatchback_01_F":
    {
        _lightleft lightAttachObject [_vehicle, [-0.5,1.85,-0.9]];
    };

    case "B_Heli_Light_01_F":
    {
        _lightleft lightAttachObject [_vehicle,[-0.4,-0.15,0.5]];
    };

    case "B_Heli_Transport_01_F":
    {
        _lightleft lightAttachObject [_vehicle, [-0.5, 0.0, 0.81]];
     };

     case "B_Heli_Transport_03_unarmed_F":
     {
       _lightleft lightAttachObject [_vehicle, [-1.8,3.65,-1.6]];
     };

     case "O_Heli_Light_02_unarmed_F":
     {
       _lightleft lightAttachObject [_vehicle, [-0.7,-0.55,0.9]];
     };
     case "B_Heli_Transport_01_camo_F":
     {
       _lightleft lightAttachObject [_vehicle, [-0.8,-0.35,0.5]];
     };
     case "B_Heli_Transport_01_F":
     {
       _lightleft lightAttachObject [_vehicle, [-0.8,-0.35,0.5]];
     };
     case "B_Heli_Transport_04_ammo_black_F":
     {
       _lightleft lightAttachObject [_vehicle,[-3.5,0.25,-0.9]];
     };
     case "B_Heli_Transport_04_black_F":
     {
       _lightleft lightAttachObject [_vehicle,[-3.5,0.25,-0.9]];
     };
     case "I_Heli_light_03_unarmed_F":
     {
       _lightleft lightAttachObject [_vehicle,[-0.6,-0.25,0.8]];
     };
     case "O_Truck_03_repair_F":
     {
       _lightleft lightAttachObject [_vehicle,[-0.7,3.05,1.05]];
     };
     case "O_Truck_03_covered_F":
     {
       _lightleft lightAttachObject [_vehicle,[-0.7,3.25,0.75]];
     };
     case "B_Quadbike_01_F":
     {
       _lightleft lightAttachObject [_vehicle,[-0.07, 1, -0.7]];
     };
	 case "C_Offroad_02_unarmed_F":
     {
       _lightleft lightAttachObject [_vehicle,[-0.5,1.8,-0.4]];
     };
	 case "":
     {
       _lightleft lightAttachObject [_vehicle,[-0.5,1.8,-0.4]];
     };
	 case "B_T_LSV_01_unarmed_F":
     {
       _lightleft lightAttachObject [_vehicle,[-0.5,2,-0.9]];
     };
	 case "O_MRAP_02_F":
     {
       _lightleft lightAttachObject [_vehicle,[-1.15,-1.6,0.35]];
     };
	 case "C_Plane_Civil_01_racing_F":
     {
       _lightleft lightAttachObject [_vehicle,[-1.85,1.2,-0.75]];
     };
	 case "B_Heli_Attack_01_F":
     {
       _lightleft lightAttachObject [_vehicle,[-0.75,-0.6,0.25]];
     };
	 case "B_T_VTOL_01_infantry_F":
     {
       _lightleft lightAttachObject [_vehicle,[-12.65,5.1,-1.35]];
     };
	 case "B_T_VTOL_01_vehicle_F":
     {
       _lightleft lightAttachObject [_vehicle,[-12.65,5.1,-1.35]];
     };
     default {_lightleft lightAttachObject [_vehicle, [0, 0.0, 0]];};
};

_lightleft setLightAttenuation _attenuation;
_lightleft setLightIntensity _intensity;
_lightleft setLightFlareSize 0.38;
_lightleft setLightFlareMaxDistance 150;
_lightleft setLightUseFlare true;

_lightright = "#lightpoint" createVehicle getPos _vehicle;
sleep 0.2;
_lightright setLightColor _lightBlue;
_lightright setLightBrightness 1;
_lightright setLightAmbient [0.1,0.1,1];

switch (typeOf _vehicle) do
{
    case "C_Offroad_01_F":
    {
        _lightright lightAttachObject [_vehicle, [0.37, 0.0, 0.56]];
    };

    case "B_MRAP_01_F":
    {
        _lightright lightAttachObject [_vehicle, [0.85,-0.95,0.6]];
    };

    case "B_MRAP_01_hmg_F":
    {
        _lightright lightAttachObject [_vehicle, [0.85,-0.95,0.6]];
    };

    case "I_MRAP_03_F":
    {
        _lightright lightAttachObject [_vehicle, [0.8,2.25,-0.3]];
    };

    case "I_Truck_02_covered_F":
    {
        _lightright lightAttachObject [_vehicle, [0.8,3.65,-0.9]];
    };

    case "C_SUV_01_F":
    {
        _lightright lightAttachObject [_vehicle, [0.7,1.85,-0.5]];
    };

    case "C_Hatchback_01_sport_F":
    {
        _lightright lightAttachObject [_vehicle, [0.5,1.85,-0.9]];
    };

    case "C_Hatchback_01_F":
    {
        _lightright lightAttachObject [_vehicle, [0.5,1.85,-0.9]];
    };

    case "B_Heli_Light_01_F":
    {
        _lightright lightAttachObject [_vehicle,[0.4,-0.15,0.5]];
    };

    case "B_Heli_Transport_01_F":
    {
        _lightright lightAttachObject [_vehicle, [0.5, 0.0, 0.81]];
     };

     case "B_Heli_Transport_03_unarmed_F":
     {
       _lightright lightAttachObject [_vehicle, [1.8,3.65,-1.6]];
     };

     case "O_Heli_Light_02_unarmed_F":
     {
       _lightright lightAttachObject [_vehicle, [0.7,-0.55,0.9]];
     };
     case "B_Heli_Transport_01_camo_F":
     {
       _lightright lightAttachObject [_vehicle, [0.8,-0.35,0.5]];
     };
     case "B_Heli_Transport_01_F":
     {
       _lightright lightAttachObject [_vehicle, [0.8,-0.35,0.5]];
     };
     case "B_Heli_Transport_04_ammo_black_F":
     {
       _lightright lightAttachObject [_vehicle,[-3.5,0.25,-0.9]];
     };
     case "B_Heli_Transport_04_black_F":
     {
       _lightright lightAttachObject [_vehicle,[-3.5,0.25,-0.9]];
     };
     case "I_Heli_light_03_unarmed_F":
     {
       _lightright lightAttachObject [_vehicle,[0.6,-0.25,0.8]];
     };
     case "O_Truck_03_repair_F":
     {
       _lightright lightAttachObject [_vehicle,[0.7,3.05,1.05]];
     };
     case "O_Truck_03_covered_F":
     {
       _lightright lightAttachObject [_vehicle,[0.7,3.25,0.75]];
     };
     case "B_Quadbike_01_F":
     {
       _lightright lightAttachObject [_vehicle,[0.07, 1, -0.7]];
     };
	 case "C_Offroad_02_unarmed_F":
     {
       _lightright lightAttachObject [_vehicle,[0.5,1.8,-0.4]];
     };
	 case "B_T_LSV_01_unarmed_F":
     {
       _lightright lightAttachObject [_vehicle,[0.5,2,-0.9]];
     };
	 case "O_MRAP_02_F":
     {
       _lightright lightAttachObject [_vehicle,[1.15,-1.6,0.35]];
     };
	 case "C_Plane_Civil_01_racing_F":
     {
       _lightright lightAttachObject [_vehicle,[1.85,1.2,-0.75]];
     };
	 case "B_Heli_Attack_01_F":
     {
       _lightright lightAttachObject [_vehicle,[0.75,-0.6,0.25]];
     };
	 case "B_T_VTOL_01_infantry_F":
     {
       _lightright lightAttachObject [_vehicle,[12.65,5.1,-1.35]];
     };
	 case "B_T_VTOL_01_vehicle_F":
     {
       _lightright lightAttachObject [_vehicle,[12.65,5.1,-1.35]];
     };
    default {_lightright lightAttachObject [_vehicle, [0, 0.0, 0]];};
};

_lightright setLightAttenuation _attenuation;
_lightright setLightIntensity _intensity;
_lightright setLightFlareSize 0.38;
_lightright setLightFlareMaxDistance 150;
_lightright setLightUseFlare true;

_lightleft setLightDayLight true;
_lightright setLightDayLight true;

_leftRed = true;

while{ (alive _vehicle)} do
{
    if (!(_vehicle getVariable "lights")) exitWith {};
    if (_leftRed) then
    {
        _leftRed = false;
        _lightright setLightBrightness 0.0;
        sleep 0.04;
        _lightleft setLightBrightness _bright;
    }
        else
    {
        _leftRed = true;
        _lightleft setLightBrightness 0.0;
        sleep 0.04;
        _lightright setLightBrightness _bright;
    };
    sleep 0.4;
};
deleteVehicle _lightleft;
deleteVehicle _lightright;