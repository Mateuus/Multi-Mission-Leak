/*
	File: fn_trapped.sqf
	Author: Wolfgang Bahmüller

	Description:
	speedtrap is a speedtrap and sometimes a speedtrap

    Das Script darf nicht verändert werden!
    Der Einsatz ist nur auf von mir genehmigten Servern/Clients erlaubt!
*/


private["_speedtraps","_trapped_infos","_trap_object","_trapped_speed","_trapped_drivername","_trap_object_position","_trapped_vehicle","_trapped_side","_trapped_uid","_photos","_speedlimit","_speed","_distance","_last_traptime","_blocktime_trap","_blocktime_detector","_search_range","_detector_search_range","_trap_distance","_has_radar_detector","_last_detector_time","_var_speedtrapdetector","_value_speedtrapdetector","_visible","_cashfc"];

_blocktime_trap = 10;
_blocktime_detector = 10;
_search_range = 200;
_detector_search_range = 100;
_trap_distance = 15;
_trap_speed_tolerance = 3;

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

    //diag_log format ["%1 ::King:: speedtrap _speed=%2 traps=%3", time, _speed, _speedtraps];

    //detector
    _has_radar_detector = 0;
    //_var_speedtrapdetector = ["speedtrapdetector",0] call lhm_fnc_varHandle;
    //_value_speedtrapdetector = missionNamespace getVariable _var_speedtrapdetector;
    //if(_value_speedtrapdetector > 0) then
    //{
    //    _has_radar_detector = 1
    //};

    if((count _speedtraps) > 0 && _has_radar_detector == 1 && _speed > 0) then
    {
        //at least one speedtrap in detectorrange so hint the driver
        _last_detector_time = player getVariable["speedtrap_last_detector_time", 0];
        if( (_last_detector_time == 0) || ((_last_detector_time + _blocktime_detector) < time) ) then
        {
            _trap_object = nearestObjects[player, ["Land_Runway_PAPI_4"], _detector_search_range];
            if((count _trap_object) > 0) then
            {
                titleText[format["Achtung da ist eine Radarfalle im Umkreis von %1m!", _detector_search_range],"PLAIN"];
                [["", _trap_object select 0, "Radarfalle", time],"lhm_fnc_addTrackingInfosToPlayers",player,false] call lhm_fnc_mp;
                player setVariable ["speedtrap_last_detector_time", time, false]; //only local to block the driver from detector warnings for some seconds
            };
        };
    };

    {
        _trap_object = _x;
        _speedlimit = _trap_object getVariable["speedtrap_speedlimit", 0];

        //diag_log format ["%1 ::King:: speedtrap _trap_object=%2 _speedlimit=%3", time, _trap_object, _speedlimit];

        if(_speedlimit > 0) then
        {
            //init of trap already done so calculate some stuff
            _distance = _trap_object distance (vehicle player);
            if(_distance < _trap_distance && _speed > (_speedlimit + _trap_speed_tolerance)) then
            {
                _visible = lineIntersects [position player, position _trap_object, player, _trap_object];
                if(!_visible) then
                {
                    //trapped!
                    _trapped_speed = _speed;
                    _trapped_drivername = name player;
                    _trap_object_position = position _trap_object;
                    _trapped_vehicle = vehicle player;
                    _trapped_uid     = getPlayerUID player;
                    _trapped_side    = side player;
                    //diag_log format ["%1 ::King:: speedtrap _distance=%2 _speed=%3", time, _distance, _speed];

                    _last_traptime = _trap_object getVariable["speedtrap_last_traptime", 0];
                    if( (_last_traptime == 0) || ((_last_traptime + _blocktime_trap) < time) ) then
                    {
                        _trap_object setVariable ["speedtrap_last_traptime", time, false]; //only local to block the driver at this trap for some seconds
                        //hint format["TRAPPED speed=%1 bei=%2",_speed,_speedlimit];

                        titleText[format["Sie wurden geblitzt! Geschwindigkeit %1km/h bei %2km/h", _trapped_speed, floor(_speedlimit)],"PLAIN"];

                        _cash = (_trapped_speed - floor(_speedlimit)) * 100;
                        if(_cash < 0) then {_cash = 0;};
                        if (playerside == civilian)then{
                            [[getPlayerUID player, name player, "500", _cash],"lhm_fnc_wantedAdd",false,false] call lhm_fnc_mp;
                        };
                        _trapped_infos = [];
						_trapped_infos pushBack _trapped_drivername;
						_trapped_infos pushBack time;
						_trapped_infos pushBack _trapped_speed;
						_trapped_infos pushBack _speedlimit;
						_trapped_infos pushBack _trap_object_position;
						_trapped_infos pushBack _trapped_vehicle;
						_trapped_infos pushBack _trapped_uid;
						_trapped_infos pushBack _trapped_side;
                        _photos = _trap_object getVariable["speedtrap_photos", []];
						_photos pushBack _trapped_infos;
                        _trap_object setVariable ["speedtrap_photos", _photos, true];
                        [_trapped_infos, _trap_object] spawn lhm_fnc_trapped;
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
        //sleep 0.5;
		sleep 1;
    };
};

