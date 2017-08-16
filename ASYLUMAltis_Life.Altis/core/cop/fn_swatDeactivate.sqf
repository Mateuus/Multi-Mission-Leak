/*
	File: fn_swatDeactivate.sqf
	Author: John "Paratus" VanderZwet
	
	Description: Abandon all current SWAT action.
*/

life_activeSWAT = false;
publicVariable "life_activeSWAT";
life_summonedSWAT = false;
publicVariable "life_summonedSWAT";
life_swat_instance = 0;
publicVariableServer "life_swat_instance";
life_deploySWAT = [];
publicVariable "life_deploySWAT";