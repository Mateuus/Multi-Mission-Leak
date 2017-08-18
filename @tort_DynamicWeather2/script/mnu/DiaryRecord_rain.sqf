here_setrain = {
   private "_rain_now";
   _rain_now = _this select 0;
   if (overcast < tort_rain_threshold) then
   {
      hint format ["Not enough clouds. Set overcast to %1 or higher, then come back.", tort_rain_threshold];
   }
   else
   {
      tort_rain_now = _rain_now;
   };
};

// ----------------- RAIN -------------------- //
player createDiaryRecord ["tort_DiaryWeatherMenu", ["Rain","<br/>
<execute expression = '[] call infoboard_on; tort_process_rain = true'>[RAIN processing ON]</execute> -
 <execute expression = '[] call infoboard_on; tort_process_rain = false'>[RAIN processing OFF]</execute><br/>
<br/>
Apply rain NOW:<br/>
 <execute expression = 'tort_process_rain = true; tort_rain_now = 0'>0.0</execute>
 <execute expression = 'tort_process_rain = true;[0.1] call here_setrain'>0.1</execute>
 <execute expression = 'tort_process_rain = true;[0.2] call here_setrain'>0.2</execute>
 <execute expression = 'tort_process_rain = true;[0.3] call here_setrain'>0.3</execute>
 <execute expression = 'tort_process_rain = true;[0.4] call here_setrain'>0.4</execute>
 <execute expression = 'tort_process_rain = true;[0.5] call here_setrain'>0.5</execute>
 <execute expression = 'tort_process_rain = true;[0.6] call here_setrain'>0.6</execute>
 <execute expression = 'tort_process_rain = true;[0.7] call here_setrain'>0.7</execute>
 <execute expression = 'tort_process_rain = true;[0.8] call here_setrain'>0.8</execute>
 <execute expression = 'tort_process_rain = true;[0.9] call here_setrain'>0.9</execute>
 <execute expression = 'tort_process_rain = true;[1] call here_setrain'>1.0</execute>
<br/><br/>
Rain details:<br/>
Minimum:
 <execute expression = 'tort_rain_min = 0'>0.0</execute>
 <execute expression = 'tort_rain_min = 0.1'>0.1</execute>
 <execute expression = 'tort_rain_min = 0.2'>0.2</execute>
 <execute expression = 'tort_rain_min = 0.3'>0.3</execute>
 <execute expression = 'tort_rain_min = 0.4'>0.4</execute>
 <execute expression = 'tort_rain_min = 0.5'>0.5</execute>
 <execute expression = 'tort_rain_min = 0.6'>0.6</execute>
 <execute expression = 'tort_rain_min = 0.7'>0.7</execute>
 <execute expression = 'tort_rain_min = 0.8'>0.8</execute>
 <execute expression = 'tort_rain_min = 0.9'>0.9</execute>
 <execute expression = 'tort_rain_min = 1'>1.0</execute>
<br/>
Maximum:
 <execute expression = 'tort_rain_max = 0'>0.0</execute>
 <execute expression = 'tort_rain_max = 0.1'>0.1</execute>
 <execute expression = 'tort_rain_max = 0.2'>0.2</execute>
 <execute expression = 'tort_rain_max = 0.3'>0.3</execute>
 <execute expression = 'tort_rain_max = 0.4'>0.4</execute>
 <execute expression = 'tort_rain_max = 0.5'>0.5</execute>
 <execute expression = 'tort_rain_max = 0.6'>0.6</execute>
 <execute expression = 'tort_rain_max = 0.7'>0.7</execute>
 <execute expression = 'tort_rain_max = 0.8'>0.8</execute>
 <execute expression = 'tort_rain_max = 0.9'>0.9</execute>
 <execute expression = 'tort_rain_max = 1'>1.0</execute>
<br/>
Weighting:
 <execute expression = 'tort_rain_weighting = -1'>-1</execute>
 <execute expression = 'tort_rain_weighting = -0.75'>-0.75</execute>
 <execute expression = 'tort_rain_weighting = -0.5'>-0.5</execute>
 <execute expression = 'tort_rain_weighting = -0.25'>-0.25</execute>
 <execute expression = 'tort_rain_weighting = 0'>0</execute>
 <execute expression = 'tort_rain_weighting = 0.25'>0.25</execute>
 <execute expression = 'tort_rain_weighting = 0.5'>0.5</execute>
 <execute expression = 'tort_rain_weighting = 0.75'>0.75</execute>
 <execute expression = 'tort_rain_weighting = 1'>1</execute>
<br/>
Turbulence:
 <execute expression = 'tort_rain_turbulence = 0'>0</execute>
 <execute expression = 'tort_rain_turbulence = 0.1'>0.1</execute>
 <execute expression = 'tort_rain_turbulence = 0.2'>0.2</execute>
 <execute expression = 'tort_rain_turbulence = 0.3'>0.3</execute>
 <execute expression = 'tort_rain_turbulence = 0.4'>0.4</execute>
 <execute expression = 'tort_rain_turbulence = 0.5'>0.5</execute>
 <execute expression = 'tort_rain_turbulence = 0.6'>0.6</execute>
 <execute expression = 'tort_rain_turbulence = 0.7'>0.7</execute>
 <execute expression = 'tort_rain_turbulence = 0.8'>0.8</execute>
 <execute expression = 'tort_rain_turbulence = 0.9'>0.9</execute>
 <execute expression = 'tort_rain_turbulence = 1'>1</execute>
<br/>
Overcast threshold:
 <execute expression = 'tort_rain_threshold = 0.7'>0.7</execute>
 <execute expression = 'tort_rain_threshold = 0.75'>0.75</execute>
 <execute expression = 'tort_rain_threshold = 0.8'>0.8</execute>
 <execute expression = 'tort_rain_threshold = 0.85'>0.85</execute>
 <execute expression = 'tort_rain_threshold = 0.9'>0.9</execute>
 <execute expression = 'tort_rain_threshold = 0.95'>0.95</execute>
<br/>
<br/>
<execute expression = '[] call infoboard_on'>[Infoboard ON]</execute> - <execute expression = '[] call infoboard_off'>[Infoboard OFF]</execute>
"]];