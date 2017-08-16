/*
	File: init.sqf
	Author: 
	
	Description:
	
*/
StartProgress = false;

[] execVM "briefing.sqf"; //Load Briefing
[] execVM "KRON_Strings.sqf";

[] execVM "scripts\safezone\safezone.sqf";
[] execVM "scripts\tool\HUD\liveAnzeige.sqf";
[] execVM "scripts\sidechat\nosidechat.sqf";
[] execVM "scripts\gas\gasmask.sqf";
[] execVM "scripts\screwpeta.sqf";
[] execVM "scripts\gas\teargasGL.sqf";
[] execVM "scripts\gas\teargas.sqf";
[] execVM "DynamicWeatherEffects.sqf";

StartProgress = true;

	
// MArker Menu Polizei
marker_Cop_Zones = [];