#include <macro.h>
/*
	Author: Bryan "Tonic" Boardwine
	Edited by: xzg
	
	Description:
	Turns on and displays a security cam like feed via PiP to the laptop display.
*/
_laptop = SEL(_this,0);
_mode = SEL(_this,3);

if(!isPiPEnabled) exitWith {hint localize "STR_Cop_EnablePiP";};
if(isNil "life_03_scam") then {
	life_03_scam = "camera" camCreate [0,0,0];
	life_03_scam camSetFov 0.5;
	life_03_scam camCommit 0;
	"rendertarget2" setPiPEffect [0];
	life_03_scam cameraEffect ["INTERNAL", "BACK", "rendertarget2"];
	_laptop setObjectTexture [0,"#(argb,256,256,1)r2t(rendertarget2,1.0)"];
};

switch (_mode) do {
	case "a1": {
		life_03_scam camSetPos [14016.09,18735.95,6.93];
		life_03_scam camSetTarget [105954.20,-10367.67,-26430.86];
		life_03_scam camCommit 0;
	};
	
	case "a2": {
		life_03_scam camSetPos [14083.99,18776.52,6.33];
		life_03_scam camSetTarget [-76220.88,-18598.84,-21136.95];
		life_03_scam camCommit 0;
	};
	
	case "a3": {
		life_03_scam camSetPos [14121.99,18631.35,3.12] ;
		life_03_scam camSetTarget [68039.61,102693.33,-5116.81];
		life_03_scam camCommit 0;
	};
		
	case "a4": {
		life_03_scam camSetPos [13814.57,18966.22,17.16];
		life_03_scam camSetTarget [63459.49,81405.62,-60268.09];
		life_03_scam camCommit 0;
	};
		
	case "a5": {
		life_03_scam camSetPos [13850.24,18653.97,10.71];
		life_03_scam camSetTarget [-78037.98,-6186.98,-30620.49];
		life_03_scam camCommit 0;
	};
	
	case "a6": {
		life_03_scam camSetPos [14099.44,18530.18,7.33];
		life_03_scam camSetTarget [48193.88,-70704.19,-29547.67];
		life_03_scam camCommit 0;
	};
	case "k1": {
		life_03_scam camSetPos [3626.24,13131.04,12.35];
		life_03_scam camSetTarget [67059.75,-56921.37,-32670.98];
		life_03_scam camCommit 0;
	};
	
	case "k2": {
		life_03_scam camSetPos [3690.89,13124.63,7.30];
		life_03_scam camSetTarget [57556.99,95241.41,-18830.42];
		life_03_scam camCommit 0;
	};
	
	case "k3": {
		life_03_scam camSetPos [3614.86,13374.80,24.85] ;
		life_03_scam camSetTarget [83175.33,43105.44,-52753.61];
		life_03_scam camCommit 0;
	};
	
	case "k4": {
		life_03_scam camSetPos [3717.60,13038.95,6.70];
		life_03_scam camSetTarget [76388.54,-54109.45,-14467.92];
		life_03_scam camCommit 0;
	};
	
	case "k5": {
		life_03_scam camSetPos [3267.56,12957.51,17.67];
		life_03_scam camSetTarget [90316.70,6409.05,-48760.97];
		life_03_scam camCommit 0;
	};
	
	case "k6": {
		life_03_scam camSetPos [3025.64,12563.82,9.30];
		life_03_scam camSetTarget [42886.85,94867.97,-40442.09];
		life_03_scam camCommit 0;
	};
	
	case "k7": {
		life_03_scam camSetPos [3662.21,13256.57,7.17];
		life_03_scam camSetTarget [41114.84,102784.30,-24108.66];
		life_03_scam camCommit 0;
	};
	
	case "k8": {
		life_03_scam camSetPos [3554.55,12873.38,7.44];
		life_03_scam camSetTarget [-64425.70,-52754.65,-32716.58];
		life_03_scam camCommit 0;
	};
	
	case "p1": {
		life_03_scam camSetPos [16793.38,12587.80,7.38];
		life_03_scam camSetTarget [-30814.11,-64990.08,-41389.09];
		life_03_scam camCommit 0;
	};
	
	case "p2": {
		life_03_scam camSetPos [16750.96,12545.81,7.30];
		life_03_scam camSetTarget [31594.94,-77958.13,-39836.49];
		life_03_scam camCommit 0;
	};
	
	case "p3": {
		life_03_scam camSetPos [16962.30,12865.62,6.39] ;
		life_03_scam camSetTarget [-58361.45,74403.78,-23201.43];
		life_03_scam camCommit 0;
	};
	
	case "p4": {
		life_03_scam camSetPos [17506.62,13367.07,3.17];
		life_03_scam camSetTarget [611.00,-84498.98,-11679.03];
		life_03_scam camCommit 0;
	};
	
	case "p5": {
		life_03_scam camSetPos [16548.76,12764.80,16.71];
		life_03_scam camSetTarget [68825.83,-60469.13,-43605.98];
		life_03_scam camCommit 0;
	};
		
	case "p6": {
		life_03_scam camSetPos [17006.51,12844.70,11.63];
		life_03_scam camSetTarget [74196.53,89603.79,-28908.76];
		life_03_scam camCommit 0;
	};
	
	case "p7": {
		life_03_scam camSetPos [16990.61,12685.33,11.42];
		life_03_scam camSetTarget [108642.17,-18835.46,-24598.04];
		life_03_scam camCommit 0;
	};
		
	case "side": {
		life_03_scam camSetPos [17047.24,21956.66,5.87];
		life_03_scam camSetTarget [-34649.34,87382.70,-55187.89];
		life_03_scam camCommit 0;
	};
	
	case "vault": {
		life_03_scam camSetPos [17026.30,21987.94,16.42];
		life_03_scam camSetTarget [82199.77,17822.87,-75709.99];
		life_03_scam camCommit 0;
	};
	
	case "front": {
		life_03_scam camSetPos [16978.58,21970.44,11.73] ;
		life_03_scam camSetTarget [93723.45,72134.20,-39906.10];
		life_03_scam camCommit 0;
	};
	
	case "back": {
		life_03_scam camSetPos [17085.03,21988.83,5.85];
		life_03_scam camSetTarget [-75076.91,17552.19,-38544.52];
		life_03_scam camCommit 0;
	};
	
	case "s1": {
		life_03_scam camSetPos [5028.77,14449.07,3.95];
		life_03_scam camSetTarget [-20775.61,-80303.46,-18849.54];
		life_03_scam camCommit 0;
	};
	
	case "s2": {
		life_03_scam camSetPos [9001.67,15724.42,7.86];
		life_03_scam camSetTarget [101202.23,27934.33,-36623.28];
		life_03_scam camCommit 0;
	};
	
	case "s3": {
		life_03_scam camSetPos [8475.01,18238.27,3.45];
		life_03_scam camSetTarget [49150.94,105997.03,-25192.54];
		life_03_scam camCommit 0;
	};
	
	case "s4": {
		life_03_scam camSetPos [15292.30,17538.41,5.21];
		life_03_scam camSetTarget [42473.48,112955.29,-12500.34];
		life_03_scam camCommit 0;
	};
	
	case "s5": {
		life_03_scam camSetPos [5827.81,20106.59,7.42];
		life_03_scam camSetTarget [-83722.41,-23102.50,-10432.54];
		life_03_scam camCommit 0;
	};
	
	case "s6": {
		life_03_scam camSetPos [11821.26,14179.24,4.29];
		life_03_scam camSetTarget [65835.62,-68845.16,-13745.40];
		life_03_scam camCommit 0;
	};
	
	case "w1": {
		life_03_scam camSetPos [11666.23,11901.30,11.77];
		life_03_scam camSetTarget [-35482.18,-53333.70,-59306.26];
		life_03_scam camCommit 0;
	};
};
