#define DEBUG 
 
Private ["_player","_query","_result","_puid","_donlev","_uniformid","_headgearid","_backpackid","_vestid","_googlesid"]; 
//diag_log format["DONATOR: getDonatorLevel: _this = %1",_this]; 
_player = _this select 0; 
if ((count _this) > 1) then { 
 _puid = _this select 1; 
} else { 
 _puid = getPlayerUID _player; 
}; 
diag_log format["DONATOR: getDonatorLevel: _player: %2 _puid = %1",_puid,_player]; 
_query = format["SELECT donator_level,UniformID,HeadGearID,BackpackID,VestID,GogglesID FROM lhm_donators WHERE pid='%1'",_puid]; 
 
 
 
_result = [_query,2] call DB_fnc_asyncCall; 
waitUntil{!isNil"_result"}; 
 
if ((count _result) > 0) then { 
 _donlev = call compile (_result select 0); 
 if (_donlev > 0) then { 
  _uniformid = _result select 1; 
  _headgearid = _result select 2; 
  _backpackid = _result select 3; 
  _vestid = _result select 4; 
  _googlesid = _result select 5; 
  _player setVariable ["LHM_UniformID",(_uniformid),true]; 
  _player setVariable ["LHM_HeadGearID",(_headgearid),true]; 
  _player setVariable ["LHM_BackpackID",(_backpackid),true]; 
  _player setVariable ["LHM_VestID",(_vestid),true]; 
  _player setVariable ["LHM_GogglesID",(_googlesid),true]; 
 }; 
} else { 
 _donlev = 0; 
}; 
 
_player setVariable ["LHM_Donatorlevel",_donlev,true]; 
LHM_VAR_DonLvlReady = true; 
(owner _player) publicVariableClient "LHM_VAR_DonLvlReady";