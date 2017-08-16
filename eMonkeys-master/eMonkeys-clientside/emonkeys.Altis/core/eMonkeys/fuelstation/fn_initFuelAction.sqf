/*
	Author: DerOnkel & Williams
	Avanix Gaming Community | E-Monkeys.com
	The usage of this file is restricted to Avanix-Gaming.de & E-Monkeys.com
    You're not allowed to modify this file!
    Licensed under the Arma EULA and Arma Tools EULA.
    For further questions contact the author!
	
	Description:
	Set Fuelstation Init
*/
uisleep 2;
fuel_station = [];

fuel_station1 = nearestObjects[getMarkerPos "fuelstation_1", ["Land_fs_feed_F"], 20];
{
    fuel_station = fuel_station + [_x]; 
	_x setFuelCargo 0;
	_x addaction ["Fahrzeug betanken",{[[player,"1"],"TON_fnc_openFuelMenu",false,false] call Emonkeys_fnc_MP;}];

} foreach fuel_station1;

fuel_station2 = nearestObjects[getMarkerPos "fuelstation_2", ["Land_fs_feed_F"], 20];
{
    fuel_station = fuel_station + [_x]; 
	_x setFuelCargo 0;
	_x addaction ["Fahrzeug betanken",{[[player,"2"],"TON_fnc_openFuelMenu",false,false] call Emonkeys_fnc_MP;}];

} foreach fuel_station2;

fuel_station3 = nearestObjects[getMarkerPos "fuelstation_3", ["Land_fs_feed_F"], 20];
{
    fuel_station = fuel_station + [_x]; 
	_x setFuelCargo 0;
	_x addaction ["Fahrzeug betanken",{[[player,"3"],"TON_fnc_openFuelMenu",false,false] call Emonkeys_fnc_MP;}];

} foreach fuel_station3;

fuel_station4 = nearestObjects[getMarkerPos "fuelstation_4", ["Land_fs_feed_F"], 20];
{
    fuel_station = fuel_station + [_x]; 
	_x setFuelCargo 0;
	_x addaction ["Fahrzeug betanken",{[[player,"4"],"TON_fnc_openFuelMenu",false,false] call Emonkeys_fnc_MP;}];

} foreach fuel_station4;

fuel_station5 = nearestObjects[getMarkerPos "fuelstation_5", ["Land_fs_feed_F"], 20];
{
    fuel_station = fuel_station + [_x]; 
	_x setFuelCargo 0;
	_x addaction ["Fahrzeug betanken",{[[player,"5"],"TON_fnc_openFuelMenu",false,false] call Emonkeys_fnc_MP;}];

} foreach fuel_station5;

fuel_station6 = nearestObjects[getMarkerPos "fuelstation_6", ["Land_fs_feed_F"], 20];
{
    fuel_station = fuel_station + [_x]; 
	_x setFuelCargo 0;
	_x addaction ["Fahrzeug betanken",{[[player,"6"],"TON_fnc_openFuelMenu",false,false] call Emonkeys_fnc_MP;}];

} foreach fuel_station6;

fuel_station7 = nearestObjects[getMarkerPos "fuelstation_7", ["Land_fs_feed_F"], 20];
{
    fuel_station = fuel_station + [_x]; 
	_x setFuelCargo 0;
	_x addaction ["Fahrzeug betanken",{[[player,"7"],"TON_fnc_openFuelMenu",false,false] call Emonkeys_fnc_MP;}];

} foreach fuel_station7;

fuel_station8 = nearestObjects[getMarkerPos "fuelstation_8", ["Land_fs_feed_F"], 20];
{
    fuel_station = fuel_station + [_x]; 
	_x setFuelCargo 0;
	_x addaction ["Fahrzeug betanken",{[[player,"8"],"TON_fnc_openFuelMenu",false,false] call Emonkeys_fnc_MP;}];

} foreach fuel_station8;

fuel_station9 = nearestObjects[getMarkerPos "fuelstation_9", ["Land_fs_feed_F"], 20];
{
    fuel_station = fuel_station + [_x]; 
	_x setFuelCargo 0;
	_x addaction ["Fahrzeug betanken",{[[player,"9"],"TON_fnc_openFuelMenu",false,false] call Emonkeys_fnc_MP;}];

} foreach fuel_station9;

fuel_station10 = nearestObjects[getMarkerPos "fuelstation_10", ["Land_fs_feed_F"], 20];
{
    fuel_station = fuel_station + [_x]; 
	_x setFuelCargo 0;
	_x addaction ["Fahrzeug betanken",{[[player,"10"],"TON_fnc_openFuelMenu",false,false] call Emonkeys_fnc_MP;}];

} foreach fuel_station10;

fuel_station11 = nearestObjects[getMarkerPos "fuelstation_11", ["Land_fs_feed_F"], 20];
{
    fuel_station = fuel_station + [_x]; 
	_x setFuelCargo 0;
	_x addaction ["Fahrzeug betanken",{[[player,"11"],"TON_fnc_openFuelMenu",false,false] call Emonkeys_fnc_MP;}];

} foreach fuel_station11;

fuel_station12 = nearestObjects[getMarkerPos "fuelstation_12", ["Land_fs_feed_F"], 20];
{
    fuel_station = fuel_station + [_x]; 
	_x setFuelCargo 0;
   _x addaction ["Fahrzeug betanken",{[[player,"12"],"TON_fnc_openFuelMenu",false,false] call Emonkeys_fnc_MP;}];

} foreach fuel_station12;

fuel_station13 = nearestObjects[getMarkerPos "fuelstation_13", ["Land_fs_feed_F"], 20];
{
    fuel_station = fuel_station + [_x]; 
	_x setFuelCargo 0;
	_x addaction ["Fahrzeug betanken",{[[player,"13"],"TON_fnc_openFuelMenu",false,false] call Emonkeys_fnc_MP;}];

} foreach fuel_station13;

fuel_station14 = nearestObjects[getMarkerPos "fuelstation_14", ["Land_fs_feed_F"], 20];
{
    fuel_station = fuel_station + [_x]; 
	_x setFuelCargo 0;
	_x addaction ["Fahrzeug betanken",{[[player,"14"],"TON_fnc_openFuelMenu",false,false] call Emonkeys_fnc_MP;}];

} foreach fuel_station14;

fuel_station15 = nearestObjects[getMarkerPos "fuelstation_15", ["Land_fs_feed_F"], 20];
{
    fuel_station = fuel_station + [_x]; 
	_x setFuelCargo 0;
	_x addaction ["Fahrzeug betanken",{[[player,"15"],"TON_fnc_openFuelMenu",false,false] call Emonkeys_fnc_MP;}];

} foreach fuel_station15;

fuel_station16 = nearestObjects[getMarkerPos "fuelstation_16", ["Land_fs_feed_F"], 20];
{
    fuel_station = fuel_station + [_x]; 
	_x setFuelCargo 0;
	_x addaction ["Fahrzeug betanken",{[[player,"16"],"TON_fnc_openFuelMenu",false,false] call Emonkeys_fnc_MP;}];

} foreach fuel_station16;

fuel_station17 = nearestObjects[getMarkerPos "fuelstation_17", ["Land_fs_feed_F"], 20];
{
    fuel_station = fuel_station + [_x]; 
	_x setFuelCargo 0;
	_x addaction ["Fahrzeug betanken",{[[player,"17"],"TON_fnc_openFuelMenu",false,false] call Emonkeys_fnc_MP;}];

} foreach fuel_station17;

fuel_station18 = nearestObjects[getMarkerPos "fuelstation_18", ["Land_fs_feed_F"], 20];
{
    fuel_station = fuel_station + [_x]; 
	_x setFuelCargo 0;
	_x addaction ["Fahrzeug betanken",{[[player,"18"],"TON_fnc_openFuelMenu",false,false] call Emonkeys_fnc_MP;}];

} foreach fuel_station18;

fuel_station19 = nearestObjects[getMarkerPos "fuelstation_19", ["Land_fs_feed_F"], 20];
{
    fuel_station = fuel_station + [_x]; 
	_x setFuelCargo 0;
	_x addaction ["Fahrzeug betanken",{[[player,"19"],"TON_fnc_openFuelMenu",false,false] call Emonkeys_fnc_MP;}];

} foreach fuel_station19;

fuel_station20 = nearestObjects[getMarkerPos "fuelstation_20", ["Land_fs_feed_F"], 20];
{
    fuel_station = fuel_station + [_x]; 
	_x setFuelCargo 0;
	_x addaction ["Fahrzeug betanken",{[[player,"20"],"TON_fnc_openFuelMenu",false,false] call Emonkeys_fnc_MP;}];

} foreach fuel_station20;

fuel_station21 = nearestObjects[getMarkerPos "fuelstation_21", ["Land_fs_feed_F"], 20];
{
    fuel_station = fuel_station + [_x]; 
	_x setFuelCargo 0;
	_x addaction ["Fahrzeug betanken",{[[player,"21"],"TON_fnc_openFuelMenu",false,false] call Emonkeys_fnc_MP;}];

} foreach fuel_station21;

fuel_station22 = nearestObjects[getMarkerPos "fuelstation_22", ["Land_fs_feed_F"], 20];
{
    fuel_station = fuel_station + [_x]; 
	_x setFuelCargo 0;
	_x addaction ["Fahrzeug betanken",{[[player,"22"],"TON_fnc_openFuelMenu",false,false] call Emonkeys_fnc_MP;}];

} foreach fuel_station22;

fuel_station23 = nearestObjects[getMarkerPos "fuelstation_23", ["Land_fs_feed_F"], 20];
{
    fuel_station = fuel_station + [_x]; 
	_x setFuelCargo 0;
	_x addaction ["Fahrzeug betanken",{[[player,"23"],"TON_fnc_openFuelMenu",false,false] call Emonkeys_fnc_MP;}];

} foreach fuel_station23;

/*
fuel_station24 = nearestObjects[getMarkerPos "fuelstation_24", ["Land_fs_feed_F"], 20];
{
    fuel_station = fuel_station + [_x]; 
	_x setFuelCargo 0;
	_x addaction ["Fahrzeug betanken",{[] spawn EMonkeys_fnc_fuelMenu;}];

} foreach fuel_station24;


//Kerosintankstellen
fuel_stationAir1 = nearestObjects[getMarkerPos "plane_fuel_1", ["Land_fs_feed_F"], 20];
{
    fuel_station = fuel_station + [_x]; 
	_x setFuelCargo 0;
	_x addaction ["Flugzeug/Helikopter betanken",{[] spawn EMonkeys_fnc_fuelMenuAir;}];

} foreach fuel_stationAir1;

fuel_stationAir2 = nearestObjects[getMarkerPos "plane_fuel_2", ["Land_fs_feed_F"], 20];
{
    fuel_station = fuel_station + [_x]; 
	_x setFuelCargo 0;
	_x addaction ["Flugzeug/Helikopter betanken",{[] spawn EMonkeys_fnc_fuelMenuAir;}];

} foreach fuel_stationAir2;

fuel_stationAir3 = nearestObjects[getMarkerPos "plane_fuel_3", ["Land_fs_feed_F"], 20];
{
    fuel_station = fuel_station + [_x]; 
	_x setFuelCargo 0;
	_x addaction ["Flugzeug/Helikopter betanken",{[] spawn EMonkeys_fnc_fuelMenuAir;}];

} foreach fuel_stationAir3;

fuel_stationAir4 = nearestObjects[getMarkerPos "plane_fuel_4", ["Land_fs_feed_F"], 20];
{
    fuel_station = fuel_station + [_x]; 
	_x setFuelCargo 0;
	_x addaction ["Flugzeug/Helikopter betanken",{[] spawn EMonkeys_fnc_fuelMenuAir;}];

} foreach fuel_stationAir4;

fuel_stationAir5 = nearestObjects[getMarkerPos "plane_fuel_5", ["Land_fs_feed_F"], 20];
{
    fuel_station = fuel_station + [_x]; 
	_x setFuelCargo 0;
	_x addaction ["Flugzeug/Helikopter betanken",{[] spawn EMonkeys_fnc_fuelMenuAir;}];

} foreach fuel_stationAir5;
*/