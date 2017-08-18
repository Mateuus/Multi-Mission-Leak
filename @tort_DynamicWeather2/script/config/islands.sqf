/* Island specific initial weather for tort_dynamicweather2
   EXAMPLE:
   case "altis": {
      tort_island_overcast = [0.5, 0, 1, -0.5, 0.05];        //init, min, max, weighting, turbulence
      tort_island_fog =   [0.05, 0, 0.2, -0.7, 0];           //init, min, max, weighting, turbulence
      tort_island_wind =  [1, 150, 0, 3, 0, 360, -0.5, 0.2]; //initSpeed, initDir, minSpeed, maxSpeed, minDir, maxDir, weighting, turbulence
      tort_island_rain =  [0, 0, 1, -0.5, 0, 0.8];           //init, min, max, weighting, turbulence, overcastthreshold
   };

   RANGES:
   - weighting [-1..1]
   - turbulence [0..1]
   - wind speed in m/s
   - wind dir [0..360]
   - everything else [0..1]
*/

case "aliabad": {
   tort_island_overcast = [0.45, 0, 1, -0.5, 0.2];
   tort_island_fog =   [0.02, 0, 0.1, -0.5, 0.2];
   tort_island_wind =  [random 5, random 360, 0, 12, 0, 360, -0.3, 0.2];
   tort_island_rain =  [0, 0, 1, -0.5, 0, 0.75];
   tort_island_breakout = [0.2, 0.2, 300, 1500];
};
case "altis": {
   tort_island_overcast = [0.5, 0, 1, -0.5, 0.05];
   tort_island_fog =   [0.05, 0, 0.2, -0.7, 0];
   tort_island_wind =  [random 5, random 360, 0, 12, 0, 360, -0.3, 0.2];
   tort_island_rain =  [0, 0, 1, -0.5, 0, 0.8];
   tort_island_breakout = [0.2, 0.2, 300, 1500];
};
case "bornholm": {
   tort_island_overcast = [0.5, 0, 1, -0.5, 0.2];
   tort_island_fog =   [0.02, 0, 0.1, -0.5, 0.2];
   tort_island_wind =  [random 5, random 360, 0, 12, 0, 360, -0.3, 0.2];
   tort_island_rain =  [0, 0, 1, -0.5, 0, 0.75];
   tort_island_breakout = [0.2, 0.2, 300, 1500];
};
case "bukovina": {
   //Bukovina from ArmA 2: ACR
   tort_island_overcast = [0.45, 0, 1, -0.5, 0.2];
   tort_island_fog =   [0.02, 0, 0.1, -0.5, 0.2];
   tort_island_wind =  [random 5, random 360, 0, 12, 0, 360, -0.3, 0.2];
   tort_island_rain =  [0, 0, 1, -0.5, 0, 0.75];
   tort_island_breakout = [0.2, 0.2, 300, 1500];
};
case "woodland_acr": {
   //Bystrica from ArmA 2: ACR
   tort_island_overcast = [0.45, 0, 1, -0.5, 0.2];
   tort_island_fog =   [0.02, 0, 0.1, -0.5, 0.2];
   tort_island_wind =  [random 5, random 360, 0, 12, 0, 360, -0.3, 0.2];
   tort_island_rain =  [0, 0, 1, -0.5, 0, 0.75];
   tort_island_breakout = [0.2, 0.2, 300, 1500];
};
case "chernarus": {
   tort_island_overcast = [0.45, 0, 1, -0.5, 0.2];
   tort_island_fog =   [0.02, 0, 0.1, -0.5, 0.2];
   tort_island_wind =  [random 5, random 360, 0, 12, 0, 360, -0.3, 0.2];
   tort_island_rain =  [0, 0, 1, -0.5, 0, 0.75];
   tort_island_breakout = [0.2, 0.2, 300, 1500];
};
case "chernarus_summer": {
   tort_island_overcast = [0.45, 0, 1, -0.5, 0.2];
   tort_island_fog =   [0.02, 0, 0.1, -0.5, 0.2];
   tort_island_wind =  [random 5, random 360, 0, 12, 0, 360, -0.3, 0.2];
   tort_island_rain =  [0, 0, 1, -0.5, 0, 0.75];
   tort_island_breakout = [0.2, 0.2, 300, 1500];
};
case "desert_e": {
   //Desert from ArmA 2
   tort_island_overcast = [0.45, 0, 1, -0.5, 0.2];
   tort_island_fog =   [0.02, 0, 0.1, -0.5, 0.2];
   tort_island_wind =  [random 5, random 360, 0, 12, 0, 360, -0.3, 0.2];
   tort_island_rain =  [0, 0, 1, -0.5, 0, 0.75];
   tort_island_breakout = [0.2, 0.2, 300, 1500];
};
case "eden": {
   // CRW2: Everon
   tort_island_overcast = [0.45, 0, 1, -0.5, 0.2];
   tort_island_fog =   [0.02, 0, 0.1, -0.5, 0.2];
   tort_island_wind =  [random 5, random 360, 0, 12, 0, 360, -0.3, 0.2];
   tort_island_rain =  [0, 0, 1, -0.5, 0, 0.75];
   tort_island_breakout = [0.2, 0.2, 300, 1500];
};
case "vt5": {
   tort_island_overcast = [0.45, 0.3, 0.7, 0.2, 0.1];
   tort_island_fog =   [0.01, 0, 0.1, -0.5, 0];
   tort_island_wind =  [random 3, random 360, 0, 8, 180, 360, -0.4, 0];
   tort_island_rain =  [0, 0, 1, -0.2, 0, 0.7];
   tort_island_breakout = [0.1, 0.2, 150, 400];
};
case "hazarkot": {
   tort_island_overcast = [0.45, 0, 1, -0.5, 0.2];
   tort_island_fog =   [0.02, 0, 0.1, -0.5, 0.2];
   tort_island_wind =  [random 5, random 360, 0, 12, 0, 360, -0.3, 0.2];
   tort_island_rain =  [0, 0, 1, -0.5, 0, 0.75];
   tort_island_breakout = [0.2, 0.2, 300, 1500];
};
case "imrali": {
   tort_island_overcast = [0.45, 0, 1, -0.5, 0.2];
   tort_island_fog =   [0.02, 0, 0.1, -0.5, 0.2];
   tort_island_wind =  [random 5, random 360, 0, 12, 0, 360, -0.3, 0.2];
   tort_island_rain =  [0, 0, 1, -0.5, 0, 0.75];
   tort_island_breakout = [0.2, 0.2, 300, 1500];
};
case "af_kandahar_province": {
   tort_island_overcast = [0.2 + random 0.2, 0, 0.6, -0.5, 0];
   tort_island_fog =   [0, 0, 0.07, -0.7, 0];
   tort_island_wind =  [random 3, random 360, 0, 8, 0, 360, -0.3, 0.2];
   tort_island_rain =  [0, 0, 1, -0.2, 0, 0.78];
   tort_island_breakout = [0.1, 0.1, 400, 900];
};
case "cain": {
   // CRW2: Kolgujew
   tort_island_overcast = [0.45, 0, 1, -0.5, 0.2];
   tort_island_fog =   [0.02, 0, 0.1, -0.5, 0.2];
   tort_island_wind =  [random 5, random 360, 0, 12, 0, 360, -0.3, 0.2];
   tort_island_rain =  [0, 0, 1, -0.5, 0, 0.75];
   tort_island_breakout = [0.1, 0.1, 400, 900];
};
case "abel": {
   // CRW2: Malden
   tort_island_overcast = [0.45, 0, 1, -0.5, 0.2];
   tort_island_fog =   [0.02, 0, 0.1, -0.5, 0.2];
   tort_island_wind =  [random 5, random 360, 0, 12, 0, 360, -0.3, 0.2];
   tort_island_rain =  [0, 0, 1, -0.5, 0, 0.75];
   tort_island_breakout = [0.1, 0.1, 400, 900];
};
case "namalsk": {
   tort_island_overcast = [0.8, 0.5, 1, 0.3, 0.5];
   tort_island_fog =   [0.05, 0.02, 0.5, -0.4, 0.2];
   tort_island_wind =  [random 5, random 360, 0, 10, 0, 360, -0.3, 0.5];
   tort_island_rain =  [0, 0, 1, -0.5, 0, 0.75];
   tort_island_breakout = [0.2, 0.3, 180, 600];
};
case "napf": {
   tort_island_overcast = [0.45, 0, 1, -0.5, 0.2];
   tort_island_fog =   [0.02, 0, 0.1, -0.5, 0.2];
   tort_island_wind =  [random 5, random 360, 0, 12, 0, 360, -0.3, 0.2];
   tort_island_rain =  [0, 0, 1, -0.5, 0, 0.75];
   tort_island_breakout = [0.2, 0.2, 300, 1500];
};
case "noe": {
   // CRW2: Nogova
   tort_island_overcast = [0.45, 0, 1, -0.5, 0.2];
   tort_island_fog =   [0.02, 0, 0.1, -0.5, 0.2];
   tort_island_wind =  [random 5, random 360, 0, 12, 0, 360, -0.3, 0.2];
   tort_island_rain =  [0, 0, 1, -0.5, 0, 0.75];
   tort_island_breakout = [0.2, 0.2, 300, 1500];
};
case "cst_orshanets": {
   tort_island_overcast = [0.45, 0, 1, 0, 0.1];
   tort_island_fog =   [0.02, 0, 0.1, -0.5, 0.2];
   tort_island_wind =  [random 5, random 360, 0, 8, 160, 20, -0.8, 0.4];
   tort_island_rain =  [0, 0, 1, 0, 0, 0.75];
   tort_island_breakout = [0.2, 0.2, 300, 700];
};
case "porto": {
   tort_island_overcast = [0.45, 0, 1, -0.5, 0.2];
   tort_island_fog =   [0.02, 0, 0.1, -0.5, 0.2];
   tort_island_wind =  [random 5, random 360, 0, 12, 0, 360, -0.3, 0.2];
   tort_island_rain =  [0, 0, 1, -0.5, 0, 0.75];
   tort_island_breakout = [0.2, 0.2, 300, 1500];
};
case "rahmadi": {
   tort_island_overcast = [0.45, 0, 1, -0.5, 0.2];
   tort_island_fog =   [0.02, 0, 0.1, -0.5, 0.2];
   tort_island_wind =  [random 5, random 360, 0, 12, 0, 360, -0.3, 0.2];
   tort_island_rain =  [0, 0, 1, -0.5, 0, 0.75];
   tort_island_breakout = [0.2, 0.2, 300, 1500];
};
case "ios_st_agnes": {
   // Scilly
   tort_island_overcast = [0.45, 0, 1, -0.5, 0.2];
   tort_island_fog =   [0.02, 0, 0.1, -0.5, 0.2];
   tort_island_wind =  [random 5, random 360, 0, 12, 0, 360, -0.3, 0.2];
   tort_island_rain =  [0, 0, 1, -0.5, 0, 0.75];
   tort_island_breakout = [0.2, 0.2, 300, 1500];
};
case "smd_sahrani_a3": {
   tort_island_overcast = [0.45, 0, 1, -0.5, 0.2];
   tort_island_fog =   [0.02, 0, 0.1, -0.5, 0.2];
   tort_island_wind =  [random 5, random 360, 0, 12, 0, 360, -0.3, 0.2];
   tort_island_rain =  [0, 0, 1, -0.5, 0, 0.75];
   tort_island_breakout = [0.2, 0.2, 300, 1500];
};
case "sangin": {
   tort_island_overcast = [0.45, 0, 1, -0.5, 0.2];
   tort_island_fog =   [0.02, 0, 0.1, -0.5, 0.2];
   tort_island_wind =  [random 5, random 360, 0, 12, 0, 360, -0.3, 0.2];
   tort_island_rain =  [0, 0, 1, -0.5, 0, 0.75];
   tort_island_breakout = [0.2, 0.2, 300, 1500];
};
case "shapur_baf": {
   tort_island_overcast = [0.45, 0, 1, -0.5, 0.2];
   tort_island_fog =   [0.02, 0, 0.1, -0.5, 0.2];
   tort_island_wind =  [random 5, random 360, 0, 12, 0, 360, -0.3, 0.2];
   tort_island_rain =  [0, 0, 1, -0.5, 0, 0.75];
   tort_island_breakout = [0.2, 0.2, 300, 1500];
};
case "stratis": {
   tort_island_overcast = [0.45, 0, 1, -0.5, 0.2];
   tort_island_fog =   [0.02, 0, 0.1, -0.5, 0.2];
   tort_island_wind =  [random 5, random 360, 0, 12, 0, 360, -0.3, 0.2];
   tort_island_rain =  [0, 0, 1, -0.5, 0, 0.75];
   tort_island_breakout = [0.2, 0.2, 300, 1500];
};
case "takistan": {
   tort_island_overcast = [0.45, 0, 1, -0.5, 0.2];
   tort_island_fog =   [0.02, 0, 0.1, -0.5, 0.2];
   tort_island_wind =  [random 5, random 360, 0, 12, 0, 360, -0.3, 0.2];
   tort_island_rain =  [0, 0, 1, -0.5, 0, 0.75];
   tort_island_breakout = [0.2, 0.2, 300, 1500];
};
case "wake": {
   tort_island_overcast = [0.45, 0, 1, -0.5, 0.2];
   tort_island_fog =   [0.02, 0, 0.1, -0.5, 0.2];
   tort_island_wind =  [random 5, random 360, 0, 12, 0, 360, -0.3, 0.2];
   tort_island_rain =  [0, 0, 1, -0.5, 0, 0.75];
};
case "zargabad": {
   tort_island_overcast = [0.45, 0, 1, -0.5, 0.2];
   tort_island_fog =   [0.02, 0, 0.1, -0.5, 0.2];
   tort_island_wind =  [random 5, random 360, 0, 12, 0, 360, -0.3, 0.2];
   tort_island_rain =  [0, 0, 1, -0.5, 0, 0.75];
   tort_island_breakout = [0.2, 0.2, 300, 1500];
};

default {
   tort_island_overcast = [0.45, 0, 1, -0.5, 0.2];
   tort_island_fog =   [0.02, 0, 0.1, -0.5, 0.2];
   tort_island_wind =  [random 5, random 360, 0, 12, 0, 360, -0.3, 0.2];
   tort_island_rain =  [0, 0, 1, -0.5, 0, 0.75];
   tort_island_breakout = [0.2, 0.2, 300, 1500];
   player sideChat format ["TORT_DYNAMICWEATHER2 - Weather not defined for island: %1 - you may want to add a section to \@tort_dynamicweather2\script\config\islands.sqf", worldname];
   diag_log format ["TORT_DYNAMICWEATHER2 - Weather not defined for island: %1 - you may want to add a section to \@tort_dynamicweather2\script\config\islands.sqf", worldname];
};