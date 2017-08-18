if(strobe1) exitWith
{
	hint "Flashing Light is Now Off!";
	sleep 2;
	hint "";
	strobe1 = false;
};


private["_vehicle", "_pos"];
_vehicle = _this select 0;
_pos = this select 1;
if (isNil "_vehicle" || isNull _vehicle || !(_vehicle getVariable "flashing")) exitWith {};


strobe1 = true;
sleep 0.5;
while {strobe1} do 
{
	if (!(_vehicle getVariable "flashing")) exitWith {};
	
	sleep 0.01;
	_pos setVariable["#lightpoint",FALSE,TRUE] spawn life_fnc_MP;
	_pos = lightsource6;
	flash = createVehicle ["#lightpoint", getPos _pos, [], 0, "CAN_COLLIDE"];
	flash setLightBrightness 0.06; 
	//COLOR #0AF9B4
	flash setLightColor[255,255,255]; 
	flash lightAttachObject [_lightsource6, [0,0,2]];
	sleep 0.1;
	deleteVehicle  flash;
};