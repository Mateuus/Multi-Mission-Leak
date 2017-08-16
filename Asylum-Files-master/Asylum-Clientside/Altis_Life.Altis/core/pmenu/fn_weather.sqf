/*
	File: fn_weather.sqf
	Author: John "Paratus" VanderZwet
	
	Description:
	Populate weather app for smartphone
*/
private["_display","_icon","_weather"];

disableSerialization;
waitUntil {!isNull findDisplay 2001};

[] call life_fnc_p_updateMenu;

_display = findDisplay 2001;
_weather = _display displayCtrl 2015;

_month = switch (date select 1) do
{
	case 1: {"January"};
	case 2: {"February"};
	case 3: {"March"};
	case 4: {"April"};
	case 5: {"May"};
	case 6: {"June"};
	case 7: {"July"};
	case 8: {"August"};
	case 9: {"September"};
	case 10: {"October"};
	case 11: {"November"};
	case 12: {"December"};
};

_date = format["%1 %2, %3", _month, date select 2, date select 0];

_desc = "";
switch (true) do
{
	case (rain > 0.7): {_icon = "icons\weather_storm.paa"; _desc = "Thunderstorm";};
	case (rain > 0): {_icon = "icons\weather_rain.paa"; _desc = "Rain";};
	case (overcast > 0.7): {_icon = "icons\weather_overcast.paa"; _desc = "Overcast";};
	case (overcast > 0.25): {_icon = "icons\weather_cloudy.paa"; _desc = "Cloudy";};
	default {_icon = "icons\weather_sunny.paa"; _desc = "Sunny";};
};

_comp = ["north", "north east", "east", "south east", "south", "south west", "west", "north west", "north"];
_wind = wind;
_windSpeed = sqrt ( (_wind select 0)^2 + (_wind select 1)^2 + (_wind select 2)^2 );
_windSpeed = (_windSpeed * 60 * 60) / 1000;
_windSpeed = round (_windSpeed * (10 ^ 2)) / (10 ^ 2);
_windDir = _comp select (round (windDir / 45));

_weather ctrlSetStructuredText parseText format["<t align='center'><t size='0.8'>%3</t><br/><br/><img size='4' image='%1'/><br/><t size='2'>%2</t><br/><br/><t size='1'>Wind:</t><br/><t size='0.9'>%4 km/h to the %5</t><br/><t size='1'>Fog: %6%8</t><br/><t size='1'>Overcast: %6%8</t><br/><br/><a underline='true' size='0.8' color='#3333FF' href='http://www.gaming-asylum.com/weather/'>Forecast</a></t>", _icon, _desc, _date, _windSpeed, _windDir, round (fog * 100), round (overcast * 100), "%"];