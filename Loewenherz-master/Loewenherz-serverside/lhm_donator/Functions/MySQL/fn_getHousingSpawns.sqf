#define DEBUG 
 
Private ["_player","_query","_puid","_housingspawns","_houses"]; 
//diag_log format["DONATOR: getHousingSpawns: _this = %1",_this]; 
_player = _this select 0; 
if ((count _this) > 1) then { 
 _puid = _this select 1; 
} else { 
 _puid = getPlayerUID _player; 
}; 
//diag_log format["DONATOR: getHousingSpawns: _player: %2 _puid = %1",_puid,_player]; 
 
_count = (["SELECT COUNT(*) FROM houses",2] call DB_fnc_asyncCall) select 0; 
waitUntil{!isNil"_count"}; 
 
if(_count == 0) exitWith {}; 
 
 
_query = format["SELECT pid, pos FROM houses WHERE pid='%1' AND owned='1'",_puid]; 
 
_houses = [_query,2,true] call DB_fnc_asyncCall; 
waitUntil{!isNil"_houses"}; 
 
#ifdef DEBUG 
//diag_log format["DONATOR: getHousingSpawns: Line: %2 _result = %1",_houses,__LINE__]; 
#endif 
 
_housingspawns = []; 
{ 
 _pos = call compile format["%1",_x select 1]; 
 //_house = nearestBuilding _pos; 
 _housingspawns pushBack _pos; 
} foreach _houses; 
 
_player setVariable ["LHM_HousingSpawns",_housingspawns,true];