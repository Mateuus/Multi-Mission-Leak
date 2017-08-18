#include "\@TORT_DYNAMICWEATHER2\script\config\templates.sqf"

ShuffleStatus = false;
ShuffleAddactionEnable = {if (!ShuffleStatus) then {ShuffleStatus = true; ShuffleAddactionID = player addAction ["Shuffle Weather", "[] call template_shuffle; tort_breakout_changenow = true", nil, 1.5, false, true]};};
ShuffleAddactionDisable = {ShuffleStatus = false; player removeAction ShuffleAddactionID};
start_watcher = {if !tort_dynamicweather2_watch then {tort_dynamicweather2_watch = true; tort_watcher = [] execVM "\@tort_DynamicWeather2\script\modules\watcher.sqf"};};

player createDiaryRecord ["tort_DiaryWeatherMenu", ["Main","<br/>
<execute expression = '[] call start_watcher;[] call infoboard_on;'>[Weather processing ON]</execute> -
 <execute expression = 'terminate tort_watcher; tort_dynamicweather2_watch = false;[] call infoboard_on'>[Weather processing OFF]</execute><br/>
<br/>
Templates:<br/>
<execute expression = '[] call template_shuffle'>[SHUFFLE]</execute> <font color='#33CC33'><execute expression = '[] call ShuffleAddactionEnable'>[To action menu]</execute></font color> <font color='#CC0000'><execute expression = '[] call ShuffleAddactionDisable'>[Remove]</execute></font color><br/>
<execute expression = '[] call template_clearcalm; tort_breakout_changenow = true'>[Clear]</execute> - Clouds are rare here.<br/>
<execute expression = '[] call template_decent; tort_breakout_changenow = true'>[Decent]</execute> - Always nice, clouds possible, no rain.<br/>
<execute expression = '[] call template_sunnycloudy; tort_breakout_changenow = true'>[Sunny to cloudy]</execute> - ...not much rain.<br/>
<execute expression = '[] call template_rathercloudy; tort_breakout_changenow = true'>[Cloudy]</execute> - ...not much rain.<br/>
<execute expression = '[] call template_variable; tort_breakout_changenow = true'>[Variable]</execute> - Whole spectrum weather, slow.<br/>
<execute expression = '[] call template_unstable; tort_breakout_changenow = true'>[Unstable]</execute> - Whole spectrum and unstable.<br/>
<execute expression = '[] call template_permaclouds; tort_breakout_changenow = true'>[Permaclouds]</execute> - Permanent cloud coverage, rare rain/wind.<br/>
<execute expression = '[] call template_permacloudsplus; tort_breakout_changenow = true'>[Permaclouds+]</execute> - Permanent cloud coverage+, rare wind, no rain.<br/>
<execute expression = '[] call template_ohmyfog; tort_breakout_changenow = true'>[Oh my fog!]</execute> - Permanent fog coverage.<br/>
<execute expression = '[] call template_england; tort_breakout_changenow = true'>[England]</execute> - England weather.<br/>
<execute expression = '[] call template_disgusting; tort_breakout_changenow = true'>[Disgusting]</execute> - Lots of rain and wind.<br/>
<execute expression = '[] call template_acauap; tort_breakout_changenow = true'>[ACAUAP]</execute> - As Chaotic And Unpredictable As Possible.<br/>
<br/>
Set overall Weather stability:<br/>
<execute expression = 'tort_overcast_turbulence = 0; tort_fog_turbulence = 0; tort_wind_turbulence = 0; tort_rain_turbulence = 0; tort_breakout_p1 = 0.01; tort_breakout_p2 = 0; tort_breakout_s1 = 600; tort_breakout_s2 = 1800; tort_breakout_changenow = true'>[Highest] </execute>
<execute expression = 'tort_overcast_turbulence = 0.25; tort_fog_turbulence = 0.25; tort_wind_turbulence = 0.25; tort_rain_turbulence = 0.25; tort_breakout_p1 = 0.1; tort_breakout_p2 = 0.1; tort_breakout_s1 = 600; tort_breakout_s2 = 1800; tort_breakout_changenow = true'>[High] </execute>
<execute expression = 'tort_overcast_turbulence = 0.5; tort_fog_turbulence = 0.5; tort_wind_turbulence = 0.5; tort_rain_turbulence = 0.5; tort_breakout_p1 = 0.15; tort_breakout_p2 = 0.15; tort_breakout_s1 = 500; tort_breakout_s2 = 1400; tort_breakout_changenow = true'>[Medium] </execute>
<execute expression = 'tort_overcast_turbulence = 0.75; tort_fog_turbulence = 0.75; tort_wind_turbulence = 0.75; tort_rain_turbulence = 0.75; tort_breakout_p1 = 0.3; tort_breakout_p2 = 0.25; tort_breakout_s1 = 400; tort_breakout_s2 = 1000; tort_breakout_changenow = true'>[Low] </execute>
<execute expression = 'tort_overcast_turbulence = 1; tort_fog_turbulence = 1; tort_wind_turbulence = 1; tort_rain_turbulence = 1; tort_breakout_p1 = 0.5; tort_breakout_p2 = 0.3; tort_breakout_s1 = 300; tort_breakout_s2 = 800; tort_breakout_changenow = true'>[Lowest]</execute><br/>
<br/>
<execute expression = '[] call infoboard_on'>[Infoboard ON] </execute><execute expression = '[] call infoboard_off'>[Infoboard OFF] </execute>
<execute expression = '[] call template_Reset; tort_breakout_changenow = true'>[RESET TO INIT WEATHER]</execute>
"]];