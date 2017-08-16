#include "..\..\script_macros.hpp"
/*
    File: fn_fedCamDisplay.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Turns on and displays a security cam like feed via PiP to the laptop display.
*/
_laptop = _this select 0;
_mode = _this select 3;

if (!isPiPEnabled) exitWith {hint localize "STR_Cop_EnablePiP";};
if (isNil "life_fed_scam") then {
    life_fed_scam = "camera" camCreate [0,0,0];
    life_fed_scam camSetFov 0.9;
    life_fed_scam camCommit 0;
    "rendertarget0" setPiPEffect [0];
    life_fed_scam cameraEffect ["INTERNAL", "RIGHT FRONT", "rendertarget0"];
    _laptop setObjectTexture [0,"#(argb,256,256,1)r2t(rendertarget0,1.0)"];
};

switch (_mode) do {
    case "sidealley": {
        life_fed_scam camSetPos [3416.85,12923.3,5];
        life_fed_scam camSetTarget [3416.85,12923.3,5];
        life_fed_scam camCommit 0;
    };

    case "front": {
        life_fed_scam camSetPos [3337.44,12980.4,5];
        life_fed_scam camSetTarget [3337.44,12980.4,5];
        life_fed_scam camCommit 0;
    };

    case "tower": {
        life_fed_scam camSetPos [3319.25,12953.2,5] ;
        life_fed_scam camSetTarget [3319.25,12953.2,5];
        life_fed_scam camCommit 0;
    };

    case "back": {
        life_fed_scam camSetPos [3235.23,12973,5];
        life_fed_scam camSetTarget [3235.23,12973,5];
        life_fed_scam camCommit 0;
    };

    case "off" :{
        life_fed_scam cameraEffect ["terminate", "back"];
        camDestroy life_fed_scam;
        _laptop setObjectTexture [0,"images\outlawed.paa"];
        life_fed_scam = nil;
    };
};
