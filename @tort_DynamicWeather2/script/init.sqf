if (!isServer) exitWith {};

tort_dynamicweather_running = false;
tort_overcast_isrunning = false;
tort_fog_isrunning = false;
tort_wind_isrunning = false;
tort_rain_isrunning = false;
tort_dynamicweather2_watch = true;

[] spawn
{
   #include "\@TORT_DYNAMICWEATHER2\script\config\config.sqf"
   if (tort_mnuTemplates) then {tort_mnuTemplates = "1"} else {tort_mnuTemplates = "0"};
   if (tort_mnuOvercast) then {tort_mnuOvercast = "1"} else {tort_mnuOvercast = "0"};
   if (tort_mnuFog) then {tort_mnuFog = "1"} else {tort_mnuFog = "0"};
   if (tort_mnuWind) then {tort_mnuWind = "1"} else {tort_mnuWind = "0"};
   if (tort_mnuRain) then {tort_mnuRain = "1"} else {tort_mnuRain = "0"};

   waitUntil {!isNil "BIS_fnc_init"};
   tort_dynamicweather_running = true;
   tort_infoboard_permanent = 0;
   call compile  preprocessfile "\@tort_DynamicWeather2\script\mnu\supportmenu.sqf";
   call compile  preprocessfile "\@tort_DynamicWeather2\script\mnu\DiaryRecord_init.sqf";
   if (tort_mnu08) then {_wmenuinit = [player,"WeatherMenu_main"] call BIS_fnc_addCommMenuItem};
  // if (tort_processIslandTemplates) then {
      switch (toLower(worldName)) do {
         #include "\@tort_DynamicWeather2\script\config\islands.sqf"
      };
 //  };

// default breakout params
   tort_breakout_p1 = tort_island_breakout select 0;  // probability of shifting extrema inside user defined range
   tort_breakout_p2 = tort_island_breakout select 1;    // if above happens, probability of shifting extrema inside full range
   tort_breakout_s1 = tort_island_breakout select 2;  // re-evaluate after somewhere between [s1..s2] seconds
   tort_breakout_s2 = tort_island_breakout select 3;

   if !isNil "tort_dynamicweather2_delay_seconds" then {sleep tort_dynamicweather2_delay_seconds};
   tort_watcher = [] execVM "\@tort_DynamicWeather2\script\modules\watcher.sqf";
   if (tort_process_breakout) then {tort_breakout = [] execVM "\@tort_DynamicWeather2\script\modules\tort_breakout.sqf"};
};