StartProgress = false;
enableSaving[false,false];

life_versionInfo = "Altis Life RPG v4.0";
[] execVM "briefing.sqf"; //Load Briefing
[] execVM "KRON_Strings.sqf";

StartProgress = true;

PG_weatherSystemEnabled = true;

//Start Dynamic Weather
execVM "DynamicWeatherEffects.sqf";
//Start stationary Radar Traps
[] execVM "core\PlayGermany\radar50.sqf";

// fuelstations
[] execVM "core\PlayGermany\fuelstations\init_fuelstations.sqf";

// unit cameras
//null=[[monitor1,monitor2][cop_1]]execVM "core\PlayGermany\unitCameras\livefeed.sqf";