 
 
 
 
 
 
 
 
private["_html","_array"]; 
 
_url = switch (worldName) do 
{ 
case "Australia": { "http://172.16.0.1/data/weather.php?location=Sydney,Australia"; 
case "Tanoa": { "http://172.16.0.1/data/weather.php?location=Suva,Fiji"; 
default { "http://172.16.0.1/data/weather.php" }; 
}; 
 
while {true} do 
{ 
_html = "Arma2Net.Unmanaged" callExtension format["GetHttpUrl %1", _url]; 
if (_html == "ERROR") exitWith {};  
_array = [_html] call DB_fnc_mresToArray; 
if(typeName _array == "STRING") then {_array = call compile format["%1", _array];};  
 
if ((life_lastWeather select 0) != (_array select 0) || (life_lastWeather select 1) != (_array select 1) || (life_lastWeather select 2) != (_array select 2) || (life_lastWeather select 3) != (_array select 3)) then 
{ 
_array call life_fnc_applyWeather; 
}; 
 
if ((life_lastWeather select 2) != (_array select 2)) then { setWind [_array select 2, _array select 2, false]; 0 setGusts 0; sleep 1; setWind [_array select 2, _array select 2, false]; 0 setGusts 0; }; 
 
life_lastWeather = _array; 
 
sleep 900; 
};