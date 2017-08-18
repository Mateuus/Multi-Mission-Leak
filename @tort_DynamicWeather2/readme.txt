@tort_dynamicweather2
http://forums.bistudio.com/showthread.php?178674

INSTALLATION
============
Copy archive contents to ArmA3 directory. Directory structure, depending on your
OS, may look like this:
c:\Program Files (x86)\Steam\SteamApps\common\Arma 3\@tort_DynamicWeather2\addons\
c:\Program Files (x86)\Steam\SteamApps\common\Arma 3\@tort_DynamicWeather2\script\
...
DONE! No use of A3\userconfig\ any more. But you are not allowed to rename the mods folder.

CONFIGURE (MOD VERSION)
=======================
There are 2 self explanatory config files:
@tort_DynamicWeather2\script\config\config.sqf
@tort_DynamicWeather2\script\config\islands.sqf

CONTROL WHILE INGAME (MOD VERSION)
==================================
Press 0, then 8: from that menu, you may want to set weather as desired.

VARIABLES CONTROL WHILE INGAME (MOD AND SCRIPT VERSION)
=======================================================
Changing exposed global variables will affect behaviour.
Instant actions may happen after a few seconds delay.

tort_overcast_min, tort_overcast_max     // minmax overcast
tort_overcast_now                        // apply instantly
tort_fog_min, tort_fog_max               // minmax fog
tort_fog_now                             // apply instantly
tort_wind_speed_min, tort_wind_speed_max // minmax wind speed
tort_wind_speed_now                      // apply instantly
tort_wind_dir_min, tort_wind_dir_max     // wind direction between min and max
tort_wind_dir_now                        // apply instantly
tort_rain_min, tort_rain_max             // minmax overcast
tort_rain_now                            // apply instantly
tort_overcast_weighting
tort_fog_weighting
tort_wind_weighting
tort_rain_weighting
tort_overcast_turbulence
tort_fog_turbulence
tort_wind_turbulence
tort_rain_turbulence
tort_rain_threshold
tort_process_overcast                    // set to false and module will stop
tort_process_fog                         // set to false and module will stop
tort_process_wind                        // set to false and module will stop
tort_process_rain                        // set to false and module will stop

=============================================
SCRIPT CALLS ARE DOCUMENTED IN SCRIPT FILES
-> see \@tort_DynamicWeather2\script\modules\
=============================================