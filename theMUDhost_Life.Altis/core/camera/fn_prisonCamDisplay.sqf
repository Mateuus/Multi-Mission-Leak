/*
	File: fn_prisonCamDisplay.sqf
	Author: Michael Francis (Amras86)
	
	Description:
	Allows guards to view certain cameras around the prison.
*/
_laptop = _this select 0;
_mode = _this select 3;

if(!isPiPEnabled) exitWith {hint localize "STR_Cop_EnablePiP";};

if(isNil "life_prison_cam") then {
	life_prison_cam = "camera" camCreate [0,0,0];
	life_prison_cam camSetFov 0.5;
	life_prison_cam camCommit 0;
	"rendertarget0" setPiPEffect [0];
	life_prison_cam cameraEffect ["INTERNAL", "BACK", "rendertarget0"];
	_laptop setObjectTexture [0,"#(argb,256,256,1)r2t(rendertarget0,1.0)"];
};

switch (_mode) do {
	case "camera_1": {
		life_prison_cam camSetPos [23663.4,18522.9,10.00152111];
		life_prison_cam camSetTarget [23665.7,18546,0.00143886];
		life_prison_cam camCommit 0;
	};
	
	case "camera_2": {
		life_prison_cam camSetPos [23663.4,18522.9,10.00152111];
		life_prison_cam camSetTarget [23634.1,18533.9,0.00143886];
		life_prison_cam camCommit 0;
	};
	
	case "camera_3": {
		life_prison_cam camSetPos [23631.6,18543.3,8.00143886] ;
		life_prison_cam camSetTarget [23659.3,18556.7,0.00143886];
		life_prison_cam camCommit 0;
	};
	
	case "camera_4": {
		life_prison_cam camSetPos [23605.1,18535.3,8.00144196];
		life_prison_cam camSetTarget [23585.6,18524.9,0.00143886];
		life_prison_cam camCommit 0;
	};
	
	case "off" :{
		life_prison_cam cameraEffect ["terminate", "back"];
		camDestroy life_prison_cam;
		_laptop setObjectTexture [0,""];
		life_prison_cam = nil;
	};
};
