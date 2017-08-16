#include <macro.h>
/*
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Turns on and displays a security cam like feed via PiP to the laptop display.
*/
_laptop = SEL(_this,0);
_mode = SEL(_this,3);

if(!isPiPEnabled) exitWith {hint localize "STR_Cop_EnablePiP";};
if(isNil "life_fed_scam") then {
	life_fed_scam = "camera" camCreate [0,0,0];
	life_fed_scam camSetFov 0.5;
	life_fed_scam camCommit 0;
	"rendertarget0" setPiPEffect [0];
	life_fed_scam cameraEffect ["INTERNAL", "BACK", "rendertarget0"];
	_laptop setObjectTexture [0,"#(argb,256,256,1)r2t(rendertarget0,1.0)"];
};

switch (_mode) do {
	case "side": {
		life_fed_scam camSetPos [16773.9,13587.1,11.9509];
		life_fed_scam camSetTarget [16764,13627.6,0];
		life_fed_scam camCommit 0;
	};
	
	case "vault": {
		life_fed_scam camSetPos [16747.6,13633.1,3.96898];
		life_fed_scam camSetTarget [16755.6,13641.6,1.28785];
		life_fed_scam camCommit 0;
	};
	
	
	case "front": {
		life_fed_scam camSetPos [16788.6,13560.8,12.8932] ;
		life_fed_scam camSetTarget [16807.2,13570.5,3.00063];
		life_fed_scam camCommit 0;
	};
	
	case "back": {
		life_fed_scam camSetPos [16761.3,13676.2,7.62712];
		life_fed_scam camSetTarget [16752.5,13669.5,3.19639];
		life_fed_scam camCommit 0;
	};
	
	case "jail": {
		life_fed_scam camSetPos [6320.43,18246.5,15];
		life_fed_scam camSetTarget [6321.43,18247.5,0];
		life_fed_scam camCommit 0;
	};
	
	case "jail_hack": {
		life_fed_scam camSetPos [6326.9,18202.5,43];
		life_fed_scam camSetTarget [6352.45,18253.1,0];
		life_fed_scam camCommit 0;
	};
	
	case "off" :{
		life_fed_scam cameraEffect ["terminate", "back"];
		camDestroy life_fed_scam;
		_laptop setObjectTexture [0,""];
		life_fed_scam = nil;
	};
};
