/*
	File: fn_applyWeather.sqf
	Author: John "Paratus" VanderZwet
	
	Description:
	Receive set weather requests and... set weather.
*/

private["_overcast","_rain","_wind","_fog"];
_overcast = [_this,0,0,[0]] call BIS_fnc_param;
_rain = [_this,1,0,[0]] call BIS_fnc_param;
_wind = [_this,2,0,[0]] call BIS_fnc_param;
_fog = [_this,3,0,[0]] call BIS_fnc_param;

0 setOvercast _overcast;
0 setFog _fog;
0 setFog _fog;
0 setRain _rain;
setWind [_wind, _wind, true];

[] spawn {
	sleep 0.5;
	forceWeatherChange;
	//simulWeatherSync;
};
