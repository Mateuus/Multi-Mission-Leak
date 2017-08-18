WEATHERMENU_MAIN = [
  ["Dynamic Weather 2", false],
  ["Toggle weather info screen", [2],"", -5, [["expression","[100000] execVM '\@tort_DynamicWeather2\script\mnu\startstop_Infoboard.sqf'"]],"1","1"],
  ["Machine room...", [3], "#USER:SUBMENU_MACHINEROOM", -5, [],"1","1"],
  ["Templates..", [4], "#USER:SUBMENU_TEMPLATES", -5, [], "1", tort_mnuTemplates],
  ["Control Overcast..", [5], "#USER:SUBMENU_OVERCAST", -5, [], "1", tort_mnuOvercast],
  ["Control Fog..", [6], "#USER:SUBMENU_FOG", -5, [], "1", tort_mnuFog],
  ["Control Wind speed..", [7], "#USER:SUBMENU_WINDSPEED", -5, [], "1", tort_mnuWind],
  ["Control Wind direction..", [8], "#USER:SUBMENU_WINDDIR", -5, [], "1", tort_mnuWind],
  ["Control Rain..", [9], "#USER:SUBMENU_RAIN", -5, [], "1", tort_mnuRain]
];

SUBMENU_MACHINEROOM = [
  ["Settings", false],
  ["START weather processing", [2],"", -5, [["expression",'if !tort_dynamicweather2_watch then {tort_dynamicweather2_watch = true; tort_watcher = [] execVM "\@tort_DynamicWeather2\script\modules\watcher.sqf"}']],"1","1"],
  ["STOP weather processing", [3],"", -5, [["expression","terminate tort_watcher; tort_dynamicweather2_watch = false"]],"1","1"],
  ["START overcast processing", [4], "", -5, [["expression", "tort_process_overcast = true"]], "1", "1"],
  ["STOP overcast processing", [5], "", -5, [["expression", "tort_process_overcast = false"]], "1", "1"],
  ["START fog processing", [6], "", -5, [["expression", "tort_process_fog = true"]], "1", "1"],
  ["STOP fog processing", [7], "", -5, [["expression", "tort_process_fog = false"]], "1", "1"],
  ["START wind processing", [8], "", -5, [["expression", "tort_process_wind = true"]], "1", "1"],
  ["STOP wind processing", [9], "", -5, [["expression", "tort_process_wind = false"]], "1", "1"],
  ["START rain processing", [10], "", -5, [["expression", "tort_process_rain = true"]], "1", "1"],
  ["STOP rain processing", [11], "", -5, [["expression", "tort_process_rain = false"]], "1", "1"]
];

SUBMENU_OVERCAST = [
  ["Overcast", false],
  ["Now: Clear", [2], "", -5, [["expression", "tort_overcast_now = 0"]], "1", "1"],
  ["Now: Sunny", [3],"", -5, [["expression", "tort_overcast_now = 0.35"]],"1","1"],
  ["Now: Cloudy", [4],"", -5, [["expression", "tort_overcast_now = 0.45"]],"1","1"],
  ["Now: Very clouded", [5],"", -5, [["expression", "tort_overcast_now = 0.75"]],"1","1"],
  ["Now: Full overcast", [6],"", -5, [["expression", "tort_overcast_now = 1"]],"1","1"],
  ["Range: Sunny", [7], "", -5, [["expression", "tort_overcast_min = 0, tort_overcast_max = 0.45"]], "1", "1"],
  ["Range: Cloudy", [8], "", -5, [["expression", "tort_overcast_min = 0.45, tort_overcast_max = 0.65"]], "1", "1"],
  ["Range: Very cloudy", [9], "", -5, [["expression", "tort_overcast_min = 0.65, tort_overcast_max = 1"]], "1", "1"],
  ["Range: Full spectrum", [10], "", -5, [["expression", "tort_overcast_min = 0, tort_overcast_max = 1"]], "1", "1"],
  ["More settings...", [11], "#USER:SUBMENU_OVERCAST_WT", -5, [], "1", "1"]
];

SUBMENU_OVERCAST_WT = [
  ["Overcast, more...", false],
  ["Weighting: ++", [2], "", -5, [["expression", "tort_overcast_weighting = 0.66"]], "1", "1"],
  ["Weighting: +", [3],"", -5, [["expression", "tort_overcast_weighting = 0.33"]],"1","1"],
  ["Weighting: Even", [4],"", -5, [["expression", "tort_overcast_weighting = 0"]],"1","1"],
  ["Weighting: -", [5],"", -5, [["expression", "tort_overcast_weighting = -0.33"]],"1","1"],
  ["Weighting: --", [6],"", -5, [["expression", "tort_overcast_weighting = -0.66"]],"1","1"],
  ["Turbulence: 0", [7], "", -5, [["expression", "tort_overcast_turbulence = 0"]], "1", "1"],
  ["Turbulence: 0.33", [8], "", -5, [["expression", "tort_overcast_turbulence = 0.33"]], "1", "1"],
  ["Turbulence: 0.66", [9], "", -5, [["expression", "tort_overcast_turbulence = 0.66"]], "1", "1"],
  ["Turbulence: 1", [10], "", -5, [["expression", "tort_overcast_turbulence = 1"]], "1", "1"]
];

SUBMENU_FOG = [
  ["Fog", false],
  ["Now: Clear", [2], "", -5, [["expression", "tort_fog_now = 0"]], "1", "1"],
  ["Now: Light fog", [3],"", -5, [["expression", "tort_fog_now = 0.05"]],"1","1"],
  ["Now: Medium fog", [4],"", -5, [["expression", "tort_fog_now = 0.2"]],"1","1"],
  ["Now: Thick fog", [5],"", -5, [["expression", "tort_fog_now = 0.7"]],"1","1"],
  ["Range: Always clear", [6], "", -5, [["expression", "tort_fog_min = 0, tort_fog_max = 0"]], "1", "1"],
  ["Range: Zero to minumum fog", [7], "", -5, [["expression", "tort_fog_min = 0, tort_fog_max = 0.1"]], "1", "1"],
  ["Range: Always light fog", [8], "", -5, [["expression", "tort_fog_min = 0.05, tort_fog_max = 0.15"]], "1", "1"],
  ["Range: Always medium fog", [9], "", -5, [["expression", "tort_fog_min = 0.15, tort_fog_max = 0.3"]], "1", "1"],
  ["Range: Always thick fog", [10], "", -5, [["expression", "tort_fog_min = 0.5, tort_fog_max = 1"]], "1", "1"],
  ["Range: Full spectrum", [11], "", -5, [["expression", "tort_fog_min = 0, tort_fog_max = 1"]], "1", "1"],
  ["More settings...", [12], "#USER:SUBMENU_FOG_WT", -5, [], "1", "1"]
];

SUBMENU_FOG_WT = [
  ["Fog, more...", false],
  ["Weighting: ++", [2], "", -5, [["expression", "tort_fog_weighting = 0.66"]], "1", "1"],
  ["Weighting: +", [3],"", -5, [["expression", "tort_fog_weighting = 0.33"]],"1","1"],
  ["Weighting: Even", [4],"", -5, [["expression", "tort_fog_weighting = 0"]],"1","1"],
  ["Weighting: -", [5],"", -5, [["expression", "tort_fog_weighting = -0.33"]],"1","1"],
  ["Weighting: --", [6],"", -5, [["expression", "tort_fog_weighting = -0.66"]],"1","1"],
  ["Turbulence: 0", [7], "", -5, [["expression", "tort_fog_turbulence = 0"]], "1", "1"],
  ["Turbulence: 0.33", [8], "", -5, [["expression", "tort_fog_turbulence = 0.33"]], "1", "1"],
  ["Turbulence: 0.66", [9], "", -5, [["expression", "tort_fog_turbulence = 0.66"]], "1", "1"],
  ["Turbulence: 1", [10], "", -5, [["expression", "tort_fog_turbulence = 1"]], "1", "1"]
];

SUBMENU_WINDSPEED = [
  ["Wind speed", false],
  ["Now: No wind 0 - 0.3 m/s | 0 Beaufort", [2], "", -5, [["expression", "tort_wind_speed_min = 0; tort_wind_speed_max = 0.3; tort_wind_speed_now = tort_wind_speed_min + random (tort_wind_speed_max - tort_wind_speed_min)"]], "1", "1"],
  ["Now: Calm 0.3 - 3.3 m/s | 1-2 Beaufort", [3],"", -5, [["expression", "tort_wind_speed_min = 0.3; tort_wind_speed_max = 3.3; tort_wind_speed_now = tort_wind_speed_min + random (tort_wind_speed_max - tort_wind_speed_min)"]],"1","1"],
  ["Now: Medium 3.4 - 7.9 m/s | 3-4 Beaufort", [4],"", -5, [["expression", "tort_wind_speed_min = 3.4; tort_wind_speed_max = 7.9; tort_wind_speed_now = tort_wind_speed_min + random (tort_wind_speed_max - tort_wind_speed_min)"]],"1","1"],
  ["Now: Strong | 8 - 17.1 m/s | 5-7 Beaufort", [5], "", -5, [["expression", "expression", "tort_wind_speed_min = 8; tort_wind_speed_max = 17.1; tort_wind_speed_now = tort_wind_speed_min + random (tort_wind_speed_max - tort_wind_speed_min)"]], "1", "1"],
  ["Now: Storm | 17.2 - 24.4 m/s | 8-9 Beaufort", [6], "", -5, [["expression", "tort_wind_speed_min = 17.2; tort_wind_speed_max = 24.4; tort_wind_speed_now = tort_wind_speed_min + random (tort_wind_speed_max - tort_wind_speed_min)"]], "1", "1"],
  ["Now: Heavy storm | 24.5 - >32.6 m/s | 10- >12 Beaufort", [7], "", -5, [["expression", "tort_wind_speed_min = 24.5; tort_wind_speed_max = 32.6; tort_wind_speed_now = tort_wind_speed_min + random (tort_wind_speed_max - tort_wind_speed_min)"]], "1", "1"],
  ["Range: 0-3 Beaufort", [7], "", -5, [["expression", "tort_wind_speed_min = 0; tort_wind_speed_max = 3.5"]], "1", "1"],
  ["Range: 0-6 Beaufort", [8], "", -5, [["expression", "tort_wind_speed_min = 0; tort_wind_speed_max = 12"]], "1", "1"],
  ["Range: 0-12 Beaufort (full)", [9], "", -5, [["expression", "tort_wind_speed_min = 0; tort_wind_speed_max = 32"]], "1", "1"],
  ["Range: 6-12 Beaufort", [10], "", -5, [["expression", "tort_wind_speed_min = 12; tort_wind_speed_max = 32"]], "1", "1"],
  ["More settings...", [11], "#USER:SUBMENU_WINDSPEED_WT", -5, [], "1", "1"]
];

SUBMENU_WINDSPEED_WT = [
  ["Wind speed, more...", false],
  ["Weighting: ++", [2], "", -5, [["expression", "tort_wind_weighting = 0.66"]], "1", "1"],
  ["Weighting: +", [3],"", -5, [["expression", "tort_wind_weighting = 0.33"]],"1","1"],
  ["Weighting: Even", [4],"", -5, [["expression", "tort_wind_weighting = 0"]],"1","1"],
  ["Weighting: -", [5],"", -5, [["expression", "tort_wind_weighting = -0.33"]],"1","1"],
  ["Weighting: --", [6],"", -5, [["expression", "tort_wind_weighting = -0.66"]],"1","1"],
  ["Turbulence: 0", [7], "", -5, [["expression", "tort_wind_turbulence = 0"]], "1", "1"],
  ["Turbulence: 0.33", [8], "", -5, [["expression", "tort_wind_turbulence = 0.33"]], "1", "1"],
  ["Turbulence: 0.66", [9], "", -5, [["expression", "tort_wind_turbulence = 0.66"]], "1", "1"],
  ["Turbulence: 1", [10], "", -5, [["expression", "tort_wind_turbulence = 1"]], "1", "1"]
];

SUBMENU_WINDDIR = [
  ["Wind direction", false],
  ["N", [2], "", -5, [["expression", "tort_wind_dir_min = 337.5; tort_wind_dir_max = 22.5; tort_wind_dir_now = 0"]], "1", "1"],
  ["NE", [3],"", -5, [["expression","tort_wind_dir_min = 22.5; tort_wind_dir_max = 67.5; tort_wind_dir_now = 45"]],"1","1"],
  ["E", [4], "", -5, [["expression", "tort_wind_dir_min = 67.5; tort_wind_dir_max = 112.5; tort_wind_dir_now = 90"]], "1", "1"],
  ["SE", [5], "", -5, [["expression", "tort_wind_dir_min = 112.5; tort_wind_dir_max = 157.5; tort_wind_dir_now = 135"]], "1", "1"],
  ["S", [6], "", -5, [["expression", "tort_wind_dir_min = 157.5; tort_wind_dir_max = 202.5; tort_wind_dir_now = 180"]], "1", "1"],
  ["SW", [7], "", -5, [["expression", "tort_wind_dir_min = 202.5; tort_wind_dir_max = 247.5; tort_wind_dir_now = 225"]], "1", "1"],
  ["W", [8], "", -5, [["expression", "tort_wind_dir_min = 247.5; tort_wind_dir_max = 292.5; tort_wind_dir_now = 270"]], "1", "1"],
  ["NW", [9], "", -5, [["expression", "tort_wind_dir_min = 292.5; tort_wind_dir_max = 337.5; tort_wind_dir_now = 315"]], "1", "1"],
  ["RND", [10], "", -5, [["expression", "tort_wind_dir_min = random 360; tort_wind_dir_max = random 360"]], "1", "1"],
  ["FULL RANGE", [11], "", -5, [["expression", "tort_wind_dir_min = 0; tort_wind_dir_max = 360"]], "1", "1"]
];

SUBMENU_RAIN = [
  ["Rain", false],
  ["Now: No rain", [2], "", -5, [["expression", "tort_rain_now = 0"]], "1", "1"],
  ["Now: Light rain", [3],"", -5, [["expression", "tort_rain_now = 0.25"]],"1","1"],
  ["Now: Medium rain", [4],"", -5, [["expression", "tort_rain_now = 0.5"]],"1","1"],
  ["Now: Strong rain", [5],"", -5, [["expression", "tort_rain_now = 0.75"]],"1","1"],
  ["Now: Full rain", [6],"", -5, [["expression", "tort_rain_now = 1"]],"1","1"],
  ["Range: Always supress rain", [7], "", -5, [["expression", "tort_rain_min = 0, tort_rain_max = 0"]], "1", "1"],
  ["Range: Zero to medium rain", [8], "", -5, [["expression", "tort_rain_min = 0, tort_rain_max = 0.45"]], "1", "1"],
  ["Range: Always light rain", [9], "", -5, [["expression", "tort_rain_min = 0.1, tort_rain_max = 0.3"]], "1", "1"],
  ["Range: Medium to full rain", [10], "", -5, [["expression", "tort_rain_min = 0.45, tort_rain_max = 1"]], "1", "1"],
  ["Range: Full spectrum", [11], "", -5, [["expression", "tort_rain_min = 0, tort_rain_max = 1"]], "1", "1"],
  ["More settings...", [12], "#USER:SUBMENU_RAIN_WT", -5, [], "1", "1"]
];

SUBMENU_RAIN_WT = [
  ["Rain, more...", false],
  ["Weighting: ++", [2], "", -5, [["expression", "tort_rain_weighting = 0.66"]], "1", "1"],
  ["Weighting: +", [3],"", -5, [["expression", "tort_rain_weighting = 0.33"]],"1","1"],
  ["Weighting: Even", [4],"", -5, [["expression", "tort_rain_weighting = 0"]],"1","1"],
  ["Weighting: -", [5],"", -5, [["expression", "tort_rain_weighting = -0.33"]],"1","1"],
  ["Weighting: --", [6],"", -5, [["expression", "tort_rain_weighting = -0.66"]],"1","1"],
  ["Turbulence: 0", [7], "", -5, [["expression", "tort_rain_turbulence = 0"]], "1", "1"],
  ["Turbulence: 0.33", [8], "", -5, [["expression", "tort_rain_turbulence = 0.33"]], "1", "1"],
  ["Turbulence: 0.66", [9], "", -5, [["expression", "tort_rain_turbulence = 0.66"]], "1", "1"],
  ["Turbulence: 1", [10], "", -5, [["expression", "tort_rain_turbulence = 1"]], "1", "1"]
];

SUBMENU_TEMPLATES = [
  ["Templates", false],
  ["Mostly clear and calm", [2], "", -5, [["expression", "
      tort_overcast_now = random 0.2;
      tort_overcast_min = 0.2;
      tort_overcast_max = 0.4;
      tort_overcast_weighting = -0.5;
      tort_overcast_turbulence = 0;
      tort_fog_now = 0;
      tort_fog_min = 0;
      tort_fog_max = 0.01;
      tort_fog_weighting = -0.7;
      tort_fog_turbulence = 0;
      tort_wind_speed_now = random 2;
      tort_wind_speed_min = 0;
      tort_wind_speed_max = 4;
      tort_wind_weighting = -0.5;
      tort_wind_turbulence = 0;
      tort_rain_now = 0;
      tort_rain_threshold = 0.75;
      "]], "1", "1"],
  ["Decent", [3], "", -5, [["expression", "
      tort_overcast_now = random 0.5;
      tort_overcast_min = 0.25;
      tort_overcast_max = 0.7;
      tort_overcast_weighting = 0;
      tort_overcast_turbulence = 0.2;
      tort_fog_now = 0;
      tort_fog_min = 0;
      tort_fog_max = 0.05;
      tort_fog_weighting = -0.2;
      tort_fog_turbulence = 0.2;
      tort_wind_speed_now = random 3;
      tort_wind_speed_min = 0;
      tort_wind_speed_max = 5;
      tort_wind_weighting = -0.3;
      tort_wind_turbulence = 0.5;
      tort_rain_now = 0;
      tort_rain_threshold = 0.75;
      "]], "1", "1"],
  ["Variable", [4], "", -5, [["expression", "
      tort_overcast_now = 0.5;
      tort_overcast_min = 0.3;
      tort_overcast_max = 1;
      tort_overcast_weighting = 0;
      tort_overcast_turbulence = 0.2;
      tort_fog_now = 0;
      tort_fog_min = 0;
      tort_fog_max = 0.2;
      tort_fog_weighting = 0;
      tort_fog_turbulence = 0;
      tort_wind_speed_now = 2;
      tort_wind_speed_min = 0;
      tort_wind_speed_max = 12;
      tort_wind_weighting = -0.2;
      tort_wind_turbulence = 0.2;
      tort_rain_now = 0;
      tort_rain_min = 0;
      tort_rain_max = 1;
      tort_rain_weighting = -0.5;
      tort_rain_turbulence = 0.1;
      tort_rain_threshold = 0.75;
      "]], "1", "1"],
  ["England", [5], "", -5, [["expression", "
      tort_overcast_now = 0.6 + random 0.4;
      tort_overcast_min = 0.45;
      tort_overcast_max = 1;
      tort_overcast_weighting = 0.3;
      tort_overcast_turbulence = 0.3;
      tort_fog_now = random 0.2;
      tort_fog_min = 0;
      tort_fog_max = 0.2;
      tort_fog_weighting = 0;
      tort_fog_turbulence = 0.2;
      tort_wind_speed_now = 4;
      tort_wind_speed_min = 0;
      tort_wind_speed_max = 20;
      tort_wind_weighting = -0.2;
      tort_wind_turbulence = 0.2;
      tort_rain_now = 0.5;
      tort_rain_min = 0;
      tort_rain_max = 1;
      tort_rain_weighting = 0.3;
      tort_rain_turbulence = 0.2;
      tort_rain_threshold = 0.75;
      "]], "1", "1"],
  ["Sunny to cloudy, not much rain", [6], "", -5, [["expression", "
      tort_overcast_now = 0.35 + random 0.2;
      tort_overcast_min = 0.35;
      tort_overcast_max = 0.9;
      tort_overcast_weighting = 0;
      tort_overcast_turbulence = 0;
      tort_fog_now = 0.1 + random 0.1;
      tort_fog_min = 0;
      tort_fog_max = 0.2;
      tort_fog_weighting = -0.2;
      tort_fog_turbulence = 0.2;
      tort_wind_speed_now = random 3;
      tort_wind_speed_min = 0;
      tort_wind_speed_max = 8;
      tort_wind_weighting = -0.2;
      tort_wind_turbulence = 0.5;
      tort_rain_now = 0;
      tort_rain_min = 0;
      tort_rain_max = 0.25;
      tort_rain_weighting = -0.5;
      tort_rain_turbulence = 0.1;
      tort_rain_threshold = 0.8;
      "]], "1", "1"],
  ["Permanent clouds, no rain", [7], "", -5, [["expression", "
      tort_overcast_now = 0.7 + random 0.3;
      tort_overcast_min = 0.65;
      tort_overcast_max = 1;
      tort_overcast_weighting = 0;
      tort_overcast_turbulence = 0;
      tort_fog_now = 0.04;
      tort_fog_min = 0;
      tort_fog_max = 0.15;
      tort_fog_weighting = -0.5;
      tort_fog_turbulence = 0.1;
      tort_wind_speed_now = random 1;
      tort_wind_speed_min = 0;
      tort_wind_speed_max = 2;
      tort_wind_weighting = -0.2;
      tort_wind_turbulence = 0;
      tort_rain_now = 0;
      tort_rain_min = 0;
      tort_rain_max = 0;
      tort_rain_threshold = 1;
      "]], "1", "1"],
  ["Disgusting", [8], "", -5, [["expression", "
      tort_overcast_now = 1;
      tort_overcast_min = 0.8;
      tort_overcast_max = 1;
      tort_overcast_weighting = 0.5;
      tort_overcast_turbulence = 1;
      tort_fog_now = 0.1 + random 0.1;
      tort_fog_min = 0.05;
      tort_fog_max = 0.5;
      tort_fog_weighting = -0.2;
      tort_fog_turbulence = 0.5;
      tort_wind_speed_now = 10;
      tort_wind_speed_min = 10;
      tort_wind_speed_max = 32;
      tort_wind_weighting = 0;
      tort_wind_turbulence = 1;
      tort_rain_now = 0.75;
      tort_rain_min = 0.5;
      tort_rain_max = 1;
      tort_rain_weighting = 0.5;
      tort_rain_turbulence = 1;
      tort_rain_threshold = 0.7;
      "]], "1", "1"],
  ["Unknown", [9], "", -5, [["expression", "
      tort_overcast_now = random 1;
      tort_overcast_min = random 0.5;
      tort_overcast_max = 0.5 + random 0.5;
      tort_overcast_weighting = -0.9 + random 1.8;
      tort_overcast_turbulence = random 1;
      tort_fog_now = random 0.05;
      tort_fog_min = random 0.05;
      tort_fog_max = 0.05 + random 0.4;
      tort_fog_weighting = -0.9 + random 1.8;
      tort_fog_turbulence = random 1;
      tort_wind_speed_now = random 6;
      tort_wind_speed_min = random 2;
      tort_wind_speed_max = 5 + random 15;
      tort_wind_weighting =  -0.9 + random 1.8;
      tort_wind_turbulence = random 1;
      tort_rain_now = random 1;
      tort_rain_min = 0;
      tort_rain_max = 1;
      tort_rain_weighting =  -0.9 + random 1.8;
      tort_rain_turbulence = random 1;
      tort_rain_threshold = 0.7 + random 0.25;
      "]], "1", "1"]
];