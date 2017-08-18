/* tort_rain by Tortuosit.

   script call example:
   0 = [0.5, 0, 1, 0.2, 0.1, 0.8] execVM "\@tort_DynamicWeather2\script\modules\tort_overcast.sqf"; // [init, min, max, weighting, turbulence, threshold]

   WITH: weighting [-1..1]: probability for more/less rain. examples: 0=equal probability, -1=move to min rain, 1 move to max rain, 0.5=75% chance of more rain
   WITH: turbulence [0..1]: from rather slow and small changes (0) to quicker and bigger changes (1)
   WITH: threshold [0..1]: rain only possible if overcast > threshold
*/

private ["_transitiontime", "_turbulence_only", "_cycleDiff", "_mincycle", "_maxcycle", "_duration", "_changeValue", "_min", "_max", "_n1", "_s1", "_n2", "_s2", "_i", "_exit"];
if isnil "tort_process_rain" then {tort_process_rain = true};
if isnil "tort_overcast_cfactor" then {tort_overcast_cfactor = 0.1};

// init variables
tort_rain_amount = _this select 0;
tort_rain_min = _this select 1; _min = tort_rain_min;
tort_rain_max = _this select 2; _max = tort_rain_max;
tort_rain_weighting = _this select 3;
tort_rain_turbulence = _this select 4;
tort_rain_threshold = _this select 5;
_mincycle = 5; _maxcycle = 150; _cyclediff = _maxcycle - _mincycle; _exit = false;

0 setrain tort_rain_amount;

tort_rain_isrunning = true;
while {tort_process_rain} do {
   _changeValue = 0;
   if (tort_rain_turbulence < 0) then {_turbulence_only = 1} else {_turbulence_only = 0};
   _duration = _maxcycle - ((0.55 max _turbulence_only) * _cyclediff * abs(tort_rain_turbulence)) - random (0.15 * _cyclediff * abs(tort_rain_turbulence) * (1 - _turbulence_only)) - (0.15 * _cyclediff * tort_overcast_cfactor * (1 - _turbulence_only)) - random (0.15 * _cyclediff * overcast * (1 - _turbulence_only));
   _transitiontime = (0.5 * _duration) + random (0.5 * _duration);
   _n1 = (_transitiontime - (_transitiontime mod 5)) / 5; _n1 = _n1 max 1; _s1 = _transitiontime / _n1;
   _n2 = ((_duration - _transitiontime) - ((_duration - _transitiontime) mod 5)) / 5; _n2 = _n2 max 1; _s2 = (_duration - _transitiontime) / _n2;

   if (overcast >= tort_rain_threshold) then {
      _changeValue = 0.1 + ((0.3 max _turbulence_only) * abs(tort_rain_turbulence)) + random (0.2 * abs(tort_rain_turbulence) * (1 - _turbulence_only)) + random (0.25 * overcast * (1 - _turbulence_only)) + random (0.15 * tort_overcast_cfactor * (1 - _turbulence_only));
      _changeValue = _changeValue * (tort_rain_max - tort_rain_min);
      if ((tort_rain_amount >= tort_rain_min) && (tort_rain_amount <= tort_rain_max)) then {
         if ((random 2) > (tort_rain_weighting + 1)) then {_changeValue = 0 - _changeValue};
      }
      else {
         if (tort_rain_amount < tort_rain_min) then {
            _changeValue = _changeValue min (tort_rain_max - tort_rain_amount);
          };
         if (tort_rain_amount > tort_rain_max) then {
            _changeValue = 0 - (_changeValue min (tort_rain_amount - tort_rain_min));
          };
      };
   };

   // first loop: transition + sleep
   _changeValue = _changeValue / _n1;
   for "_i" from 1 to _n1 do {
      tort_rain_amount = tort_rain_amount + _changeValue;
      if (tort_rain_amount < _min) then {tort_rain_amount = _min} else {if (tort_rain_amount > _max) then {tort_rain_amount = _max};};
      if (overcast < tort_rain_threshold) then {tort_rain_amount = 0};
      _s1 setrain tort_rain_amount;
      sleep _s1;
      if !isNil "tort_rain_now" exitWith {tort_rain_amount = tort_rain_now; tort_rain_now = nil; 0 setrain tort_rain_amount; _exit = true};
      if ((_max != tort_rain_max) || (_min != tort_rain_min)) exitWith {_min = tort_rain_min;_max = tort_rain_max; _exit = true};
      if (!tort_process_rain || !tort_dynamicweather2_watch) exitWith {_exit = true};
   };

   // second loop: sleep
   if !(_exit) then {
      (_duration - _transitiontime) setrain tort_rain_amount;
      for "_i" from 1 to _n2 do {
         sleep _s2;
         if !isNil "tort_rain_now" exitWith {tort_rain_amount = tort_rain_now; tort_rain_now = nil; 0 setrain tort_rain_amount};
         if ((_max != tort_rain_max) || (_min != tort_rain_min)) exitWith {_min = tort_rain_min;_max = tort_rain_max};
      };
   } else {_exit = false};
   if (!tort_process_rain || !tort_dynamicweather2_watch) exitWith {};
};

tort_rain_isrunning = false;
tort_rain = nil;