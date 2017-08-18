/* tort_wind by Tortuosit.
   Handles wind speed and direction

   script call example:
   0 = [2, 0, 1, 0.2, 0.1, 0.8] execVM "\@tort_DynamicWeather2\script\modules\tort_wind.sqf";
   Args: [initWindStrength, initDirection, minWindStrength, maxWindStrength, DirBetweenA, DirBetweenB, weighting, turbulence]
   Strength in m/s [0..32]
   Direction [0..360]
   WITH: weighting [-1..1]: probability for more/less rain. examples: 0=equal probability, -1=move to min rain, 1 move to max rain, 0.5=75% chance of more rain
   WITH: turbulence [0..1]: from rather slow and small changes (0) to quicker and bigger changes (1)
   WITH: threshold [0..1]: rain only possible if overcast > threshold
*/

private ["_changeSpeed", "_windDir0", "_changeDir", "_duration", "_range", "_goCW", "_returnvalue", "_minS", "_maxS", "_minD", "_maxD", "_n1", "_s1", "_i"];
if isnil "tort_process_wind" then {tort_process_wind = true};
if isnil "tort_overcast_cfactor" then {tort_overcast_cfactor = 0.1};

/*
bft2ms = {
   switch (floor(_this select 0)) do {
      case 0:  {((_this select 0) - floor(_this select 0)) * 0.3};
      case 1:  {0.3 + ((_this select 0) - floor(_this select 0)) * 1.3};
      case 2:  {1.6 + ((_this select 0) - floor(_this select 0)) * 1.8};
      case 3:  {3.4 + ((_this select 0) - floor(_this select 0)) * 2.1};
      case 4:  {5.5 + ((_this select 0) - floor(_this select 0)) * 2.5};
      case 5:  {8.0 + ((_this select 0) - floor(_this select 0)) * 2.8};
      case 6:  {10.8 + ((_this select 0) - floor(_this select 0)) * 3.1};
      case 7:  {13.9 + ((_this select 0) - floor(_this select 0)) * 3.3};
      case 8:  {17.2 + ((_this select 0) - floor(_this select 0)) * 3.6};
      case 9:  {20.8 + ((_this select 0) - floor(_this select 0)) * 3.7};
      case 10: {24.5 + ((_this select 0) - floor(_this select 0)) * 4};
      case 11: {28.5 + ((_this select 0) - floor(_this select 0)) * 4.2};
      case 12: {32.7 + ((_this select 0) - floor(_this select 0)) * 4.4};
      default  {0};
   };
};
*/

azinrange = {
   if ((_this select 1) > (_this select 2)) then {
      // a outside borders b..c
      if (((_this select 0) < (_this select 1)) && ((_this select 0) > (_this select 2))) then {false} else {true};
   } else {
      // a outside borders b..c
      if (((_this select 0) < (_this select 1)) || ((_this select 0) > (_this select 2))) then {false} else {true};
   };
};

// global vars, any changes from outside change script behaviour
tort_wind_speed = _this select 0;
tort_wind_dir = _this select 1;
tort_wind_speed_min = _this select 2; _minS = tort_wind_speed_min;
tort_wind_speed_max = _this select 3; _maxS = tort_wind_speed_max;
tort_wind_dir_min = _this select 4; _minD = tort_wind_dir_min;
tort_wind_dir_max = _this select 5; _maxD = tort_wind_dir_max;
tort_wind_weighting = _this select 6;
tort_wind_turbulence = _this select 7;
if ((random 2)<1) then {_goCw = false} else {_goCw = true};

// _speedMS = [tort_wind_speed] call bft2ms;
setwind [(sin tort_wind_dir) * tort_wind_speed * -1, (cos tort_wind_dir) * tort_wind_speed * -1, true];

while {tort_process_wind} do {
   tort_wind_isrunning = true;
   _duration = 125 - (80 * tort_wind_turbulence) - random (15 * tort_wind_turbulence) - (15 * tort_overcast_cfactor) - random(10 * overcast);
   _n1 = (_duration - (_duration mod 5)) / 5; _n1 = _n1 max 1; _s1 = _duration / _n1;

   // Check speed and change values
   // _changeSpeed = 0.3 * (0.5 + 0.5 * tort_overcast_cfactor) * (random (1 + overcast) + tort_wind_turbulence);
   _changeSpeed = random 1 + 3 * tort_wind_turbulence + random (3 * tort_overcast_cfactor) + random (2 * tort_wind_turbulence) + random overcast;
   if ((tort_wind_speed <= _maxS) && (tort_wind_speed >= _minS)) then {
      if ((random 2) > (tort_wind_weighting + 1)) then {
         tort_wind_speed = tort_wind_speed - (_changeSpeed min (random(tort_wind_speed - _minS)));
      } else {
         tort_wind_speed = tort_wind_speed + (_changeSpeed min (random(_maxS - tort_wind_speed)));
      };
   } else {
      if (tort_wind_speed > _maxS) then {
         tort_wind_speed = tort_wind_speed - (_changeSpeed min (random(tort_wind_speed - _minS)));
      } else {
         tort_wind_speed = tort_wind_speed + (_changeSpeed min (random(_maxS - tort_wind_speed)));
      };
   };

   // Check direction and change values
   _windDir0 = (_minD + 0.5 * ((_maxD - _minD + 360) mod 360) + 360) mod 360;
   if ([tort_wind_dir, _minD, _maxD] call azinrange) then {
      if ((random 2)<1) then {_goCw = false} else {_goCw = true};
      //if (((_maxD - _minD) mod 360) == 0) then {_range = 360} else {_range = (_maxD - _minD + 360) mod 360};
      _changeDir = (random 5) + (15 * tort_wind_turbulence) + random (20 * tort_wind_turbulence) + (10 * tort_overcast_cfactor) + random (5 * overcast);
      // wind is already in the desired range
      if ((random 2) > 1) then {
         tort_wind_dir = (tort_wind_dir - (_changeDir min (random((tort_wind_dir - _minD + 360) mod 360))) + 360) mod 360;
      } else {
         tort_wind_dir = (tort_wind_dir + (_changeDir min (random((_maxD - tort_wind_dir + 360) mod 360))) + 360) mod 360;
      };
   } else {
      // wind is outside the desired range
      if (_goCW) then {
         tort_wind_dir = (tort_wind_dir + random ((_windDir0 - tort_wind_dir + 360) mod 360) + 360) mod 360;
      } else {
         tort_wind_dir = (tort_wind_dir - random ((tort_wind_dir - _windDir0 + 360) mod 360) + 360) mod 360;
      };
   };

   setwind [(sin (tort_wind_dir)) * tort_wind_speed * -1, (cos (tort_wind_dir)) * tort_wind_speed * -1, true];

   for "_i" from 1 to _n1 do {
      if (tort_wind_dir_min == tort_wind_dir_max) then {_minS = 0; _maxS = 360; tort_wind_dir_min = 0; tort_wind_dir_max = 360};
      sleep _s1;
      if ((_maxS != tort_wind_speed_max) || (_minS != tort_wind_speed_min) || (_maxD != tort_wind_dir_max) || (_minD != tort_wind_dir_min)) exitWith {_minS = tort_wind_speed_min;_maxS = tort_wind_speed_max; _minD = tort_wind_dir_min;_maxD = tort_wind_dir_max};
      if !isNil "tort_wind_dir_now" exitWith {setwind [(sin (tort_wind_dir_now)) * tort_wind_speed * -1, (cos (tort_wind_dir_now)) * tort_wind_speed * -1, true]; tort_wind_dir = tort_wind_dir_now; tort_wind_dir_now = nil};
      if !isNil "tort_wind_speed_now" exitWith {setwind [(sin (tort_wind_dir)) * tort_wind_speed * -1, (cos (tort_wind_dir)) * tort_wind_speed * -1, true]; tort_wind_speed = tort_wind_speed_now; tort_wind_speed_now = nil};
      if (!tort_process_wind || !tort_dynamicweather2_watch) exitWith {};
   };
   if (!tort_process_wind || !tort_dynamicweather2_watch) exitWith {};
};

tort_wind_isrunning = false;
tort_wind = nil;