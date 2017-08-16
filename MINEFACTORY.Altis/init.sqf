/*
	File: init.sqf
	Author: 
	
	Description: TESTTTTTT AMK
	
*/
StartProgress = false;

[] execVM "MINEFACTORY\briefing.sqf"; //Load Briefing
[] execVM "MINEFACTORY\KRON_Strings.sqf";
0 = execVM "MINEFACTORY\IgiLoad\IgiLoadInit.sqf";
[] execVM "MINEFACTORY\Scripts\SafezoneCheck.sqf";

CHVD_allowNoGrass = true; // Set 'false' if you want to disable "None" option for terrain (default: true)
CHVD_maxView = 12000; // Set maximum view distance (default: 12000)
CHVD_maxObj = 12000; // Set maximimum object view distance (default: 12000)

if (!IsServer) then {
	if (isNil "license_car_in_use") then {
		license_car_in_use = false;
		publicVariable "license_car_in_use"; };
	if (isNil "license_trucker_in_use") then {
		license_trucker_in_use = false;
		publicVariable "license_trucker_in_use"; };
	if (isNil "license_heli_in_use") then {
		license_heli_in_use = false;
		publicVariable "license_heli_in_use"; };
	if (isNil "license_waffen_in_use") then {
		license_waffen_in_use = false;
		publicVariable "license_waffen_in_use"; };
	if (isNil "license_boating_in_use") then {
		license_boating_in_use = false;
		publicVariable "license_boating_in_use"; };
};

//"Scheiß Nebel hau ab" (Warum hat jeder den selben text hier?)
[] spawn {
	while{true} do {
		sleep 10;
		200 setFog 0;
		sleep 590;
	};
};

_toHide = [1120806,1120949,1779863,1115288,1115210];
{([0,0,0] nearestObject _x) hideObject true;} forEach _toHide;

StartProgress = true;