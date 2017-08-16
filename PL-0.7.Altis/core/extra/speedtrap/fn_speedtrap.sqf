/*
    File: fn_speedtrap.sqf
    Author: Skrow & Skyfezzer
    
    Description:
    speedtrap is a speedtrap ans sometimes a speedtrap
   
*/

private["_speedtraps","_trapped_infos","_trap_object","_trapped_speed","_trapped_drivername","_trap_object_position","_trapped_vehicle","_trapped_side","_trapped_uid","_photos","_speedlimit","_speed","_distance","_last_traptime","_blocktime_trap","_blocktime_detector","_search_range","_detector_search_range","_trap_distance","_has_radar_detector","_last_detector_time","_var_speedtrapdetector","_value_speedtrapdetector","_visible"];

_blocktime_trap = 10;
_blocktime_detector = 10;
_search_range = 200;
_detector_search_range = 100;
_trap_distance = 15;
_trap_speed_tolerance = 10;

while{true} do
{
    if((player == vehicle player) || (player != driver (vehicle player))) then
    {
        //not in a vehicle or not the driver
        //hint "wait for vehicle or be the driver...";
        waitUntil {sleep 1; player != vehicle player && player == driver (vehicle player)};
        //now he is in a car and he is the driver
    };
            
    //hint "start scanning";
    
    //scan for speedtraps in range
    _speedtraps = nearestObjects[player, ["Land_Runway_PAPI_4"], _search_range];

    _speed = floor(speed (vehicle player));
    if(_speed < 0) then
    {
        _speed = _speed * (-1);
    };
    

    {
        _trap_object = _x;
        _speedlimit = _trap_object getVariable["speedtrap_speedlimit", 0];

        
        if(_speedlimit > 0) then
        {
            //init of trap already done so calculate some stuff               
            _distance = _trap_object distance (vehicle player);
            if(_distance < _trap_distance && _speed > (_speedlimit + _trap_speed_tolerance)) then
            {
                _visible = lineIntersects [getPosWorld player, position _trap_object, player, _trap_object];
                if(!_visible) then
                {
                    //trapped!
                    _trapped_speed = _speed;
                    _trapped_drivername = name player;
                    _trap_object_position = position _trap_object;
                    _trapped_vehicle = vehicle player;
                    _trapped_uid     = getPlayerUID player;
                    _trapped_side    = side player;

					_trueorfalse = _trapped_vehicle getVariable["lights",FALSE];
					if(_trueorfalse && _trapped_side == west) exitwith {};
                    _last_traptime = _trap_object getVariable["speedtrap_last_traptime", 0];
                    if( (_last_traptime == 0) || ((_last_traptime + _blocktime_trap) < time) ) then
                    {
                        _trap_object setVariable ["speedtrap_last_traptime", time, false]; //only local to block the driver at this trap for some seconds

                        titleText[format["Ils ont étés flashés! Vitesse: %1km/h au lieu de %2km/h", _trapped_speed, floor(_speedlimit)],"PLAIN"];
                        _trapped_infos = [];
                        _trapped_infos set[count _trapped_infos, _trapped_drivername];
                        _trapped_infos set[count _trapped_infos, time];
                        _trapped_infos set[count _trapped_infos, _trapped_speed];
                        _trapped_infos set[count _trapped_infos, _speedlimit];
                        _trapped_infos set[count _trapped_infos, _trap_object_position];
                        _trapped_infos set[count _trapped_infos, _trapped_vehicle];
                        _trapped_infos set[count _trapped_infos, _trapped_uid];
                        _trapped_infos set[count _trapped_infos, _trapped_side];                                    
                        _photos = _trap_object getVariable["speedtrap_photos", []];
                        _photos set[count _photos, _trapped_infos];
                        _trap_object setVariable ["speedtrap_photos", _photos, true];
                        [_trapped_infos, _trap_object] spawn life_fnc_trapped;
                    };
                };
            };
        };
    } foreach _speedtraps;
    
    if((count _speedtraps) > 0) then
    {
        //trap in range so search faster
        sleep 0.05;
    }
    else
    {
        //nothing found so we save some cpu power... boring...
        sleep 0.5;
    };
};

    