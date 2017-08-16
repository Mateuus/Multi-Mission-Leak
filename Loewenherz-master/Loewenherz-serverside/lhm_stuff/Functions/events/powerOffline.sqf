private ["_types","_state","_marker","_lamps"];
//diag_log str (_this);
_args = _this select 0; // [["powerOffline","safezone_kavala"]]
_event = _args select 0; // Eventname
_marker = _args select 1; // markername

	if (isNil "powerOffline") then
	{
		powerOffline = 0;
		publicVariable "powerOffline";
	};

	if (powerOffline == 0) then
	{
		powerOffline = 1;
		publicVariable "powerOffline";
		_msg = "Warning Malfunction at the Powerplant. Energy Shutdown in few Seconds!";
		[[_msg,"The Government of Altis",4],"TON_fnc_clientMessage",true,false] call lhm_fnc_mp;
	}
	else
	{
		powerOffline = 0;
		publicVariable "powerOffline";
		_msg = "The Powerplant Malfunction was solved. Power should be back online in few Seconds!";
		[[_msg,"The Government of Altis",4],"TON_fnc_clientMessage",true,false] call lhm_fnc_mp;
	};  
		
_types = 
[
 "Land_PowerPoleWooden_F",
 "Land_LampHarbour_F",
 "Land_LampHalogen_F",
 "Land_LampShabby_F",
 "Land_runway_edgelight_blue_F",
 "Land_PowerPoleWooden_L_F",
 "Land_LampDecor_F",
 "Land_LampSolar_F",
 "Land_LampStreet_small_F",
 "Land_LampStreet_F",
 "Land_LampAirport_F",
 "Lamps_Base_F",
 "Land_ts_roof_F",
 "PowerLines_base_F",
 "Land_PowLines_WoodL",
 "Land_PowLines_ConcL",
 "Land_lampa_ind_zebr",
 "Land_lampa_sidl_3",
 "Land_lampa_vysoka",
 "Land_lampa_ind",
 "Land_lampa_ind_b",
 "Land_lampa_sidl"
];

sleep 1;

/*
for [{_i=0},{_i < (count _types)},{_i=_i+1}] do
{
_lamps = getMarkerPos _marker nearObjects [_types select _i, 3000]; // Kavalla Mitte

	if((powerOffline) == 1) then
	{
		{_x allowDamage true} forEach _lamps;

	} else {
		{_x allowDamage false} forEach _lamps;

	};
sleep 0.1;
};
*/

sleep 1;

for [{_i=0},{_i < (count _types)},{_i=_i+1}] do
{
_lamps = getMarkerPos _marker nearObjects [_types select _i, 2100]; // Kavalla Mitte

	if((powerOffline) == 1) then
	{
		{_x allowDamage true} forEach _lamps;
		//{_x setHit ["light_1_hitpoint", 0.97]} forEach _lamps; // off
		{_x setDamage 0.95} forEach _lamps; // offline
	} else {
		{_x allowDamage false} forEach _lamps;
		//{_x setHit ["light_1_hitpoint", 0]} forEach _lamps; // on
		{_x setDamage 0} forEach _lamps; // online
	};
sleep 0.1;
};

emergencyLightsHQ = {

	if (isNil "powerOffline") then
	{
		powerOffline = 0;
		publicVariable "powerOffline";
	};

	if (powerOffline == 0) then
	{
		powerOffline = 1;
		publicVariable "powerOffline";

	}
	else
	{
		powerOffline = 0;
		publicVariable "powerOffline";

	};  

	if((powerOffline) == 1) then {
	emlight1 = "#lightpoint" createVehicle getPos hqlight1;
	emlight1 setLightBrightness 1;
	emlight1 setLightColor[1, 1, 0];
	emlight1 lightAttachObject [hqlight1, [0,0,0]]; 
	
	emlight2 = "#lightpoint" createVehicle getPos hqlight2;
	emlight2 setLightBrightness 1;
	emlight2 setLightColor[1, 1, 0];
	emlight2 lightAttachObject [hqlight2, [0,0,0]]; 
	
	emlight3 = "#lightpoint" createVehicle getPos hqlight3;
	emlight3 setLightBrightness 1; 
	emlight3 setLightColor[1, 1, 0];
	emlight3 lightAttachObject [hqlight3, [0,0,0]]; 
	
	emlight4 = "#lightpoint" createVehicle getPos hqlight4;
	emlight4 setLightBrightness 1;
	emlight4 setLightColor[1, 1, 0];
	emlight4 lightAttachObject [hqlight4, [0,0,0]]; 
	
	emlight5 = "#lightpoint" createVehicle getPos hqlight5;
	emlight5 setLightBrightness 1;
	emlight5 setLightColor[1, 1, 0];
	emlight5 lightAttachObject [hqlight5, [0,0,0]]; 
	
	} else {
	deleteVehicle emlight1;
	deleteVehicle emlight2;
	deleteVehicle emlight3;
	deleteVehicle emlight4;
	deleteVehicle emlight5;
	};
	
};
sleep 30;
[[emergencyLightsHQ],"BIS_fnc_spawn",nil,true] call lhm_fnc_mp;