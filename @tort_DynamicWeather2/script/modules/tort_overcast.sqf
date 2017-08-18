/* tort_overcast by Tortuosit.

   script call example:
   0 = [0.5, 0, 0.8, 0, 1] execVM "\@tort_DynamicWeather2\script\modules\tort_overcast.sqf"; // [init, min, max, weighting, turbulence]

   WITH: weighting [-1..1]: probability for more/less clouds. examples: 0=equal probability, -1=move to min overcast, 1 move to max overcast, 0.5=75% chance of more overcast
   WITH: turbulence [0..1]: from rather slow and small changes (0) to quicker and bigger changes (1)
*/

private ["_changeValue", "_turbulence_only", "_mincycle", "_maxcycle", "_cycleDiff", "_duration", "_min", "_max", "_n1", "_s1", "_i"];
if isnil "tort_process_overcast" then {tort_process_overcast = true};
_exit = false;

// set variables
tort_overcast_amount = _this select 0;
tort_overcast_min = _this select 1; _min = tort_overcast_min;
tort_overcast_max = _this select 2; _max = tort_overcast_max;
tort_overcast_weighting = _this select 3;
tort_overcast_turbulence = _this select 4;
_mincycle = 100; _maxcycle = 360; _cyclediff = _maxcycle - _mincycle;

0 setovercast tort_overcast_amount;
sleep 1; forceweatherchange;

tort_overcast_isrunning = true;
while {tort_process_overcast} do
{
   if (tort_overcast_turbulence < 0) then {_turbulence_only = 1} else {_turbulence_only = 0};
   _duration = _maxcycle - ((0.34 max _turbulence_only) * _cyclediff * abs(tort_overcast_turbulence)) - random (0.33 * _cyclediff * abs(tort_overcast_turbulence) * (1 - _turbulence_only)) - random (0.33 * _cyclediff * (1 - _turbulence_only));
   _n1 = (_duration - (_duration mod 5)) / 5; _n1 = _n1 max 1; _s1 = _duration / _n1;
   _changeValue = 0.02 + random 0.03 + random (0.07 * tort_overcast_turbulence);
   _changeValue = _changeValue * (tort_overcast_max - tort_overcast_min);
   // dur min 110 max 360 // change per cycle min 0.01 max 0.11 // overall: min 0.1 change/h max 3.6 change/h
   tort_overcast_cfactor = (_changeValue / _duration) * 1000; // 0..1
   if ((tort_overcast_amount >= tort_overcast_min) && (tort_overcast_amount <= tort_overcast_max)) then
   {
      if ((random 2) > (tort_overcast_weighting + 1)) then {_changeValue = 0 - _changeValue};
      tort_overcast_amount = tort_overcast_amount + _changeValue;
      if (tort_overcast_amount < tort_overcast_min) then {tort_overcast_amount = tort_overcast_min} else {if (tort_overcast_amount > tort_overcast_max) then {tort_overcast_amount = tort_overcast_max};};
   }
   else
   {
      if (tort_overcast_amount <= tort_overcast_min) then
      {
         _changeValue = _changeValue min (tort_overcast_max - tort_overcast_amount);
         tort_overcast_amount = tort_overcast_amount + _changeValue;
      };
      if (tort_overcast_amount >= tort_overcast_max) then
      {
         _changeValue = _changeValue min (tort_overcast_amount - tort_overcast_min);
         tort_overcast_amount = tort_overcast_amount - _changeValue;
      };
   };

   0 setovercast tort_overcast_amount;

   for "_i" from 1 to _n1 do
   {
      sleep _s1;
      if !isNil "tort_overcast_now" exitWith
      {
         if !isNil "tort_rain" then {terminate tort_rain};
         tort_overcast_amount = tort_overcast_now; tort_overcast_now = nil;
         if !isNil "tort_rain_now" then {tort_rain_amount = tort_rain_now; tort_rain_now = nil};
         0 setovercast tort_overcast_amount;
         sleep 0.5; forceweatherchange; sleep 0.5; 0 setrain tort_rain_amount;
         //re-init of rain module necessary, as otherwise ArmA may control rain temporarily
         if (tort_process_fog) then {tort_rain = [tort_rain_amount, tort_rain_min, tort_rain_max, tort_rain_weighting, tort_rain_turbulence, tort_rain_threshold] execVM "\@tort_DynamicWeather2\script\modules\tort_rain.sqf"};
      };
      if (!tort_process_overcast || !tort_dynamicweather2_watch) exitWith {};
      if ((_max != tort_overcast_max) || (_min != tort_overcast_min)) exitWith {_min = tort_overcast_min;_max = tort_overcast_max};
   };
   if (!tort_process_overcast || !tort_dynamicweather2_watch) exitWith {};
};
tort_overcast_isrunning = false;
tort_overcast = nil;