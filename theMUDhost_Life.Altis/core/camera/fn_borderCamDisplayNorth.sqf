/*
	File: fn_borderCamDisplaySouth.sqf
	Author: Michael Francis (Amras86)
	
	Description:
	Allows border guards to view any camera located at the border checks.
*/
_laptop = _this select 0;
_mode = _this select 3;

if(!isPiPEnabled) exitWith {hint localize "STR_Cop_EnablePiP";};

if(isNil "life_border_ncam") then {
	life_border_ncam = "camera" camCreate [0,0,0];
	life_border_ncam camSetFov 0.5;
	life_border_ncam camCommit 0;
	"rendertarget0" setPiPEffect [0];
	life_border_ncam cameraEffect ["INTERNAL", "BACK", "rendertarget0"];
	_laptop setObjectTexture [0,"#(argb,256,256,1)r2t(rendertarget0,1.0)"];
};

switch (_mode) do {
	case "s_border_ngate": {
		life_border_ncam camSetPos [16893.3,15442.8,14.00143814];
		life_border_ncam camSetTarget [16875.5,15503.4,0.00129318];
		life_border_ncam camCommit 0;
	};
	
	case "s_border_sgate": {
		life_border_ncam camSetPos [16866,15493.2,14.00143814];
		life_border_ncam camSetTarget [16907.1,15443.8,0.00139999];
		life_border_ncam camCommit 0;
	};
	
	case "n_border_ngate": {
		life_border_ncam camSetPos [18178.4,17600.7,14.00143814] ;
		life_border_ncam camSetTarget [18152.4,17658.9,0.00143814];
		life_border_ncam camCommit 0;
	};
	
	case "n_border_sgate": {
		life_border_ncam camSetPos [18144,17647.2,14.00143814];
		life_border_ncam camSetTarget [18191.7,17605.4,0.00141525];
		life_border_ncam camCommit 0;
	};
	
	case "off" :{
		life_border_ncam cameraEffect ["terminate", "back"];
		camDestroy life_border_ncam;
		_laptop setObjectTexture [0,""];
		life_border_ncam = nil;
	};
};
