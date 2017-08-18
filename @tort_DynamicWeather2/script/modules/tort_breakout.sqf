/* tort_breakout */

private ["_duration", "_n1", "_s1",
   "_tort_overcast_min", "_tort_overcast_max", "_tort_overcast_weighting", "_tort_overcast_turbulence",
   "_tort_fog_min", "_tort_fog_max", "_tort_fog_weighting", "_tort_fog_turbulence",
   "_tort_wind_speed_min" ,"_tort_wind_speed_max", "_tort_wind_weighting", "_tort_wind_turbulence",
   "_tort_wind_dir_min" ,"_tort_wind_dir_max",
   "_tort_rain_min", "_tort_rain_max", "_tort_rain_weighting", "_tort_rain_turbulence"];

sleep (20 + random 10);

_tort_overcast_min = tort_overcast_min; _tort_overcast_max = tort_overcast_max;
_tort_overcast_weighting = tort_overcast_weighting; _tort_overcast_turbulence = tort_overcast_turbulence;
_tort_fog_min = tort_fog_min; _tort_fog_max = tort_fog_max;
_tort_fog_weighting = tort_fog_weighting; _tort_fog_turbulence = tort_fog_turbulence;
_tort_wind_speed_min = tort_wind_speed_min; _tort_wind_speed_max = tort_wind_speed_max;
_tort_wind_weighting = tort_wind_weighting; _tort_wind_turbulence = tort_wind_turbulence;
_tort_wind_dir_min = tort_wind_dir_min; _tort_wind_dir_max = tort_wind_dir_max;
_tort_rain_min = tort_rain_min; _tort_rain_max = tort_rain_max;
_tort_rain_weighting = tort_rain_weighting; _tort_rain_turbulence = tort_rain_turbulence;
tort_breakout_changenow = false;

while {true} do
{
   _duration = tort_breakout_s1 + random (tort_breakout_s2 - tort_breakout_s1);
   _n1 = (_duration - (_duration mod 20)) / 20; _n1 = _n1 max 1; _s1 = _duration / _n1;

   if (tort_breakout_p1 > (random 1)) then
   {
      if (tort_breakout_p2 < (random 1)) then
      {  //in range
         tort_overcast_min = _tort_overcast_min + random (_tort_overcast_max - _tort_overcast_min);
         tort_overcast_max = tort_overcast_min + random (_tort_overcast_max - tort_overcast_min);
         tort_fog_min = _tort_fog_min + random (_tort_fog_max - _tort_fog_min);
         tort_fog_max = tort_fog_min + random (_tort_fog_max - tort_fog_min);
         tort_wind_speed_min = _tort_wind_speed_min + random (_tort_wind_speed_max - _tort_wind_speed_min);
         tort_wind_speed_max = tort_wind_speed_min + random (_tort_wind_speed_max - tort_wind_speed_min);
         tort_rain_min = _tort_rain_min + random (_tort_rain_max - _tort_rain_min);
         tort_rain_max = tort_rain_min + random (_tort_rain_max - tort_rain_min);
      }
      else
      {  // out of range
         tort_overcast_min = random 1;
         tort_overcast_max = tort_overcast_min + random (1 - tort_overcast_min);
         tort_overcast_weighting = -1 + random 2;
         tort_overcast_turbulence = -0.5 + random 1.5;
         tort_fog_min = random 1;
         tort_fog_max = tort_fog_min + random (1 - tort_fog_min);
         tort_fog_weighting = -1 + random 2;
         tort_fog_turbulence = -0.5 + random 1.5;
         tort_wind_speed_min = random 30;
         tort_wind_speed_max = tort_wind_speed_min + random (30 - tort_wind_speed_min);
         tort_wind_dir_min = floor(random 360);
         tort_wind_dir_max = floor(random 360);
         tort_wind_weighting = -1 + random 2;
         tort_wind_turbulence = -0.5 + random 1.5;
         tort_rain_min = random 1;
         tort_rain_max = tort_rain_min + random (1 - tort_rain_min);
         tort_rain_weighting = -1 + random 2;
         tort_rain_turbulence = -0.7 + random 1.7;
      };
   }
   else
   {
      tort_overcast_min = _tort_overcast_min;
      tort_overcast_max = _tort_overcast_max;
      tort_overcast_weighting = _tort_overcast_weighting;
      tort_overcast_turbulence = _tort_overcast_turbulence;
      tort_fog_min = _tort_fog_min;
      tort_fog_max = _tort_fog_max;
      tort_fog_weighting = _tort_fog_weighting;
      tort_fog_turbulence = _tort_fog_turbulence;
      tort_wind_speed_min = _tort_wind_speed_min;
      tort_wind_speed_max = _tort_wind_speed_max;
      tort_wind_dir_min = _tort_wind_dir_min;
      tort_wind_dir_max = _tort_wind_dir_max;
      tort_wind_weighting = _tort_wind_weighting;
      tort_wind_turbulence = _tort_wind_turbulence;
      tort_rain_min = _tort_rain_min;
      tort_rain_max = _tort_rain_max;
      tort_rain_weighting = _tort_rain_weighting;
      tort_rain_turbulence = _tort_rain_turbulence;
   };
   for "_i" from 1 to _n1 do {
      sleep _s1;
      if (tort_breakout_changenow) exitWith
      {
         tort_breakout_changenow = false;
         _tort_overcast_min = tort_overcast_min;
         _tort_overcast_max = tort_overcast_max;
         _tort_overcast_weighting = tort_overcast_weighting;
         _tort_overcast_turbulence = tort_overcast_turbulence;
         _tort_fog_min = tort_fog_min;
         _tort_fog_max = tort_fog_max;
         _tort_fog_weighting = tort_fog_weighting;
         _tort_fog_turbulence = tort_fog_turbulence;
         _tort_wind_speed_min = tort_wind_speed_min;
         _tort_wind_speed_max = tort_wind_speed_max;
         _tort_wind_dir_min = tort_wind_dir_min;
         _tort_wind_dir_max = tort_wind_dir_max;
         _tort_wind_weighting = tort_wind_weighting;
         _tort_wind_turbulence = tort_wind_turbulence;
         _tort_rain_min = tort_rain_min;
         _tort_rain_max = tort_rain_max;
         _tort_rain_weighting = tort_rain_weighting;
         _tort_rain_turbulence = tort_rain_turbulence;
      };
   };
};