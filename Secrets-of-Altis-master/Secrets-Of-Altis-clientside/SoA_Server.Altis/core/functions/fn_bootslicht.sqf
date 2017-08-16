/*
		fn_bootslicht.sqf
		Author: G00golplexian
		
		Description: Adds light to the boat.
*/

_mode = _this select 3;

switch(_mode) do {
	case 0: {
		lightboot = "#lightpoint" createVehicle (getpos vehicle player); 
		lightboot setLightBrightness 1; 
		lightboot setLightAmbient [0.5, 0.5, 0.5];  
		lightboot setLightColor [0.5, 0.5, 0.5];  
		lightboot lightAttachObject [vehicle player, [0,0,5]];
		
		lightOn = true;
	};
	
	case 1:	{
		deletevehicle lightboot;
		lightOn = false;
	};
};