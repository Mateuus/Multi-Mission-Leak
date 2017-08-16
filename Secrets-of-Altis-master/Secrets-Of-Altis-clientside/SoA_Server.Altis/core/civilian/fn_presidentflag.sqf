/*
	fn_presidentflag.sqf
	Author: G00golplexian
	
	Description: Places 2 little flags with light onto a car.

*/

private["_mode"];
_mode = _this select 3;

switch(_mode) do {
	case 0: {
		_flagge = "FlagSmall_F" createVehicle [0,0,0];
		_flagge setobjecttextureglobal [0,"images\altisflaggeR_co.paa"];
		_flagge attachTo[vehicle player,[0.8,1.6,-0.6]];

		_flagge2 = "FlagSmall_F" createVehicle [0,0,0];  
		_flagge2 setobjecttextureglobal [0,"images\altisflaggeL_co.paa"]; 
		_flagge2 attachTo[vehicle player,[-0.8,1.6,-0.6]];
		
		flagsOn = true;
	};
	case 1: {
		{deletevehicle _x} foreach (nearestObjects [getpos (vehicle player),["FlagSmall_F"],3]);
		flagsOn = false;
	};
};