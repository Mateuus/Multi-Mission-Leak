/*
	File: fn_Nos.sqf
	
	Description:
	Nos by Koil Pasta
*/
		_vehicle = (vehicle player);

if(life_nos_count > 0 && _vehicle isKindOf "Car") then {

	if(life_nos_active == 2) then {
		[player,"nos"] spawn life_fnc_nearestSound;

		life_nos_active = 1;

		life_nos_count = life_nos_count - 1;


	_lightRed = [15, 0.1, 5];

	_lightleft = "#lightpoint" createVehicle getpos _vehicle;   
	uiSleep 0.2;
	_lightleft setLightColor _lightRed; 
	_lightleft setLightBrightness 0.2;  
	_lightleft setLightAmbient [20, 0.1, 0.1];
	_lightleft lightAttachObject [_vehicle, [-0.02, -1, -2.82]];
	_lightleft setLightAttenuation [0.1, 0, 1000, 130]; 
	_lightleft setLightIntensity 5;
	_lightleft setLightFlareSize 0.38;
	_lightleft setLightFlareMaxDistance 120;
	_lightleft setLightUseFlare true;
	_lightleft setLightDayLight true;
	_lightleft setLightBrightness 2;  





		_vel = velocity _vehicle;
		_dir = direction _vehicle;
		_speed = 3;
		_vehicle setVelocity [(_vel select 0)+(sin _dir*_speed),(_vel select 1)+(cos _dir*_speed),(_vel select 2)];
		uiSleep 0.1;
		_vel = velocity _vehicle;
		_dir = direction _vehicle;
		_speed = 6;
		_vehicle setVelocity [(_vel select 0)+(sin _dir*_speed),(_vel select 1)+(cos _dir*_speed),(_vel select 2)];
		uiSleep 0.1;
		_vel = velocity _vehicle;
		_dir = direction _vehicle;
		_speed = 7;
		_vehicle setVelocity [(_vel select 0)+(sin _dir*_speed),(_vel select 1)+(cos _dir*_speed),(_vel select 2)];
		uiSleep 0.1;
		_vel = velocity _vehicle;
		_dir = direction _vehicle;
		_speed = 9;
		_vehicle setVelocity [(_vel select 0)+(sin _dir*_speed),(_vel select 1)+(cos _dir*_speed),(_vel select 2)];
		uiSleep 0.1;
		_vel = velocity _vehicle;
		_dir = direction _vehicle;
		_speed = 5;
		_vehicle setVelocity [(_vel select 0)+(sin _dir*_speed),(_vel select 1)+(cos _dir*_speed),(_vel select 2)];

		uiSleep 0.1;
		deleteVehicle _lightleft;
		uiSleep 3;

		life_nos_active = 2;

	};

} else {

	["Skonczylo Ci sie nitro!", false] spawn domsg;

};