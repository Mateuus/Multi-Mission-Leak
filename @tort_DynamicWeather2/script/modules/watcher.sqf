while {tort_dynamicweather2_watch} do
{
   if (!tort_overcast_isrunning && tort_process_overcast) then {
      tort_overcast = [tort_island_overcast select 0,tort_island_overcast select 1,tort_island_overcast select 2,tort_island_overcast select 3,tort_island_overcast select 4] execVM "\@tort_DynamicWeather2\script\modules\tort_overcast.sqf";
   };

   if (!tort_fog_isrunning && tort_process_fog) then {
      tort_fog = [tort_island_fog select 0,tort_island_fog select 1,tort_island_fog select 2,tort_island_fog select 3,tort_island_fog select 4] execVM "\@tort_DynamicWeather2\script\modules\tort_fog.sqf";
   };
   if (!tort_wind_isrunning && tort_process_wind) then {
      tort_wind = [tort_island_wind select 0,tort_island_wind select 1,tort_island_wind select 2,tort_island_wind select 3,tort_island_wind select 4,tort_island_wind select 5,tort_island_wind select 6,tort_island_wind select 7] execVM "\@tort_DynamicWeather2\script\modules\tort_wind.sqf";
   };

   if (!tort_rain_isrunning && tort_process_rain) then {
         tort_rain = [tort_island_rain select 0,tort_island_rain select 1,tort_island_rain select 2,tort_island_rain select 3,tort_island_rain select 4,tort_island_rain select 5] execVM "\@tort_DynamicWeather2\script\modules\tort_rain.sqf";
   };
   sleep 42.42;
};

tort_watcher = nil;