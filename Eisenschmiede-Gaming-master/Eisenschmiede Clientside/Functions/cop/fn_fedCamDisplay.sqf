#include "..\script_macros.hpp"
/*
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Turns on and displays a security cam like feed via PiP to the laptop display.
*/
_laptop = SEL(_this,0);
_mode = SEL(_this,3);

if(!isPiPEnabled) exitWith {hint localize "STR_Cop_EnablePiP";};
if(isNil "ES_fed_scam") then {
	ES_fed_scam = "camera" camCreate [0,0,0];
	ES_fed_scam camSetFov 0.5;
	ES_fed_scam camCommit 0;
	"rendertarget0" setPiPEffect [0];
	ES_fed_scam cameraEffect ["INTERNAL", "BACK", "rendertarget0"];
	_laptop setObjectTexture [0,"#(argb,256,256,1)r2t(rendertarget0,1.0)"];
};

switch (_mode) do {
	case "side": {
		ES_fed_scam camSetPos [16029.1,16938.9,3.08817];
		ES_fed_scam camSetTarget [16034.9,16930.6,0.00146008];
		ES_fed_scam camCommit 0;
	};
	
	case "vault": {
		ES_fed_scam camSetPos [16031.1,16936.6,10.287];
		ES_fed_scam camSetTarget [16017.1,16957.3,0.597221];
		ES_fed_scam camCommit 0;
	};
	
	case "front": {
		ES_fed_scam camSetPos [16084.3,16997.8,23.6492] ;
		ES_fed_scam camSetTarget [16037.8,16966.7,0.00145817];
		ES_fed_scam camCommit 0;
	};
	
	case "back": {
		ES_fed_scam camSetPos [16002,16904.9,5.71753];
		ES_fed_scam camSetTarget [15998.7,16939.7,0.00146866];
		ES_fed_scam camCommit 0;
	};
	
	case "off" :{
		ES_fed_scam cameraEffect ["terminate", "back"];
		camDestroy ES_fed_scam;
		_laptop setObjectTexture [0,""];
		ES_fed_scam = nil;
	};
};
