/* tort_fog by Tortuosit
 ***********************
   script call example:
   0 = [0.1, 0, 0.4, 0, 0] execVM "\@tort_DynamicWeather2\script\modules\tort_fog.sqf"; // [initfog, minfog, maxfog, weighting, turbulence]

   WITH: weighting [-1..1]: probability for more/less fog. examples: 0=equal probability, -1=move to min fog, +1 move to max fog, 0.5=75% chance of more fog
   WITH: turbulence [0..1]: from rather calm (0) to quicker and bigger changes (1)
*/

private ["_fogDecay", "_fogBase", "_turbulence_only", "_mincycle", "_maxcycle", "_cycleDiff", "_changefog", "_changeValue", "_maxcycle", "_transitiontime", "_duration", "_min", "_max", "_n1", "_s1", "_i"];
if isnil "tort_process_fog" then {tort_process_fog = true};
if isnil "tort_overcast_cfactor" then {tort_overcast_cfactor = 0.1};

// set variables
tort_fog_amount = _this select 0;
tort_fog_min = _this select 1; _min = tort_fog_min;
tort_fog_max = _this select 2; _max = tort_fog_max;
tort_fog_weighting = _this select 3;
tort_fog_turbulence = _this select 4;
_mincycle = 5; _maxcycle = 150; _cyclediff = _maxcycle - _mincycle;

1 setfog [tort_fog_amount, 0.001, 0]; sleep 1;

tort_fog_isrunning = true;
while {tort_process_fog} do
{
   _changeFog = true;
   if (tort_fog_turbulence < 0) then {_turbulence_only = 1} else {_turbulence_only = 0};
   _duration = _maxcycle - ((0.55 max _turbulence_only) * _cyclediff * abs(tort_fog_turbulence)) - random (0.25 * _cyclediff * abs(tort_fog_turbulence) * (1 - _turbulence_only)) - (0.25 * _cyclediff * tort_overcast_cfactor * (1 - _turbulence_only));
   _transitiontime = (0.5 * _duration) + random (0.5 * _duration);
   if ((random 6) > (abs(daytime - 14))) then {tort_fog_amount = _min max (0.75 * tort_fog_amount); _changefog = false}; //8-20h: Probability of fog being 75%, 14h:peak
   if ((random 1) < 0.05) then {tort_fog_amount = _min max (0.5 * tort_fog_amount); _changeFog = false}; //5% chance of fog falling to min
   if ((random 1) < 0.05) then {_changeFog = false}; // 5% chance of no change
   if (_changeFog) then
   {
      _changeValue = random 0.05 + (0.1 * tort_fog_turbulence) + random (0.1 * tort_fog_turbulence) + random (0.15 * tort_overcast_cfactor);
      _changeValue = _changeValue * (tort_fog_max - tort_fog_min);
      if ((tort_fog_amount >= _min) && (tort_fog_amount <= _max)) then
      {
         if ((random 2) > (tort_fog_weighting + 1)) then {_changeValue = 0 - _changeValue};
         tort_fog_amount = tort_fog_amount + _changeValue;
         if (tort_fog_amount < 0) then {tort_fog_amount = 0} else {if (tort_fog_amount > 1) then {tort_fog_amount = 1};};
      }
      else
      {
         if (tort_fog_amount <= _min) then
         {
            tort_fog_amount = tort_fog_amount + _changeValue;
         };
         if (tort_fog_amount >= _max) then
         {
            tort_fog_amount = tort_fog_amount - _changeValue;
         };
      };
   };
   _fogDecay = 0.001 + random 0.01; _fogBase = random 50;
   _transitiontime setfog [tort_fog_amount, _fogDecay, _fogBase];
   _n1 = (_duration - (_duration mod 5)) / 5; _n1 = _n1 max 1; _s1 = _duration / _n1;
   for "_i" from 1 to _n1 do
   {
      sleep _s1;
      if ((_max != tort_fog_max) || (_min != tort_fog_min)) exitWith {_min = tort_fog_min;_max = tort_fog_max};
      if !isNil "tort_fog_now" exitWith {0.5 setfog tort_fog_now; sleep 0.5; tort_fog_amount = tort_fog_now; tort_fog_now = nil};
      if (!tort_process_fog || !tort_dynamicweather2_watch) exitWith {};
   };
   if (!tort_process_fog || !tort_dynamicweather2_watch) exitWith {};
};

tort_fog_isrunning = false;
tort_fog = nil;