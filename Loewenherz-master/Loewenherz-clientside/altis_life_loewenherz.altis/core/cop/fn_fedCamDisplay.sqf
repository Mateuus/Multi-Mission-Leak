/*
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Turns on and displays a security cam like feed via PiP to the laptop display.
*/
_laptop = _this select 0;
_mode = _this select 3;

if(!isPiPEnabled) exitWith {hint localize "STR_Cop_EnablePiP";};
if(isNil "lhm_fed_scam") then {
	lhm_fed_scam = "camera" camCreate [0,0,0];
	lhm_fed_scam camSetFov 0.5;
	lhm_fed_scam camCommit 0;
	"rendertarget0" setPiPEffect [0];
	lhm_fed_scam cameraEffect ["INTERNAL", "BACK", "rendertarget0"];
	_laptop setObjectTexture [0,"#(argb,256,256,1)r2t(rendertarget0,1.0)"];
};

switch (_mode) do {
	case "side": {
		lhm_fed_scam camSetPos [11636.2,11748.6,14.8603];
		lhm_fed_scam camSetTarget [11659,11799.5,5];
		lhm_fed_scam camCommit 0;
	};
	
	case "vault": {
		lhm_fed_scam camSetPos [11662.2,11843.3,10.0048];
		lhm_fed_scam camSetTarget [11681.6,11835.9,0.00143433];
		lhm_fed_scam camCommit 0;
	};
	
	case "front": {
		lhm_fed_scam camSetPos [11726.1,11905.5,9.92623] ;
		lhm_fed_scam camSetTarget [11698.7,11863.5,0.00143051];
		lhm_fed_scam camCommit 0;
	};
	
	case "back": {
		lhm_fed_scam camSetPos [11647,11855.6,2.95464];
		lhm_fed_scam camSetTarget [11665.4,11843.8,0.00143433];
		lhm_fed_scam camCommit 0;
	};
	
	case "off" :{
		lhm_fed_scam cameraEffect ["terminate", "back"];
		camDestroy lhm_fed_scam;
		_laptop setObjectTexture [0,""];
		lhm_fed_scam = nil;
	};
};
