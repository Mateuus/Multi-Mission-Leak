/*
	Author: Bryan "Tonic" Boardwine, Blackd0g
	
	Description:
	Turns on and displays a security cam like feed via PiP to the wall display.
*/
private["_wall","_mode"];
_wall = _this select 0;
_mode = _this select 3;

if(!isPiPEnabled) exitWith {hint localize "STR_Cop_EnablePiP";};
if(isNil "lhm_scam") then {
	lhm_scam = "camera" camCreate [0,0,0];
	lhm_scam camSetFov 0.5;
	lhm_scam camCommit 0;
	"rendertarget0" setPiPEffect [0];
	lhm_scam cameraEffect ["INTERNAL", "BACK", "rendertarget0"];
	_wall setObjectTexture [0,"#(argb,256,256,1)r2t(rendertarget0,1.0)"];
};

switch (_mode) do {
	case "market": {
		lhm_scam camSetPos [3684.84,13114.5,20.34];
		lhm_scam camSetTarget [3647.71,13113,-0.00357819];
		lhm_scam camCommit 0;
	};
	
	case "hwp": {
		lhm_scam camSetPos [23571.3,19885,18.0583];
		lhm_scam camSetTarget [23553.8,19908.3,0.00141144];
		lhm_scam camCommit 0;
	};
	
	case "athira": {
		lhm_scam camSetPos [13833.6,18991,9.4827];
		lhm_scam camSetTarget [13826.4,18974.9,0.00144577];
		lhm_scam camCommit 0;
	};
	
	case "jail": {
		lhm_scam camSetPos [22141.5,14523.8,13.1177];
		lhm_scam camSetTarget [22129.1,14500.9,0.00144362];
		lhm_scam camCommit 0;
	};
	
	case "off" :{
		lhm_scam cameraEffect ["terminate", "back"];
		camDestroy lhm_scam;
		_wall setObjectTexture [0,"#(rgb,8,8,3)color(0,0,0,1)"];
		lhm_scam = nil;
	};
};
