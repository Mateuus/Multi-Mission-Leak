
private ["_unit"];
_unit = [_this,0,player,[player]] call BIS_fnc_param;
if (!(life_inv_flashlight > 0)) exitWith { hint "You do not have a flashlight" };
if (_unit getVariable["restrained", false]) exitWith { hint "You can not turn on your headlight while you're restrained!"; };
if (vehicle _unit != _unit) exitWith { hint "You can not turn on your headlight while you are sitting in a vehicle."};
if (!(alive vehicle _unit)) exitWith {}; 
if(life_flashlight) then
{ 
	deleteVehicle light; 
	deleteVehicle flashlight; 
	life_flashlight = false; 
}
else
{ 
/*	flashLight = "Item_acc_flashlight" createVehicleLocal position player; 
	flashlight attachTo [player, [0.33,-0.04,-0.05], "Pelvis"]; 
	flashlight setVectorDirAndUp [ [1,0.01,0.44], [1,0,0] ]; */
	lightpos = [0.33,-0.04,-0.05]; //Position des #lightpoints
	light = "#lightpoint" createVehicleLocal lightpos; 
	light setLightBrightness 0.25; //Helligkeit 
	light setLightAmbient [1,0.99,0.88]; 
	light setLightColor [1,0.99,0.88]; 
	light attachTo [_unit, [0.025,0.25,1.727], "Pelvis"]; 
	light setDir 60; 
	life_flashlight = true; 
};

