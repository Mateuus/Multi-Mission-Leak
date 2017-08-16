 
 
 
 
 
 
 
 
private["_unit","_jailId","_start","_soundOn","_dispatch"]; 
 
_unit = [_this,0,objNull,[objNull]] call BIS_fnc_param; 
_attend = [_this,1,true,[true]] call BIS_fnc_param; 
 
if (isNull _unit || !life_trial_inprogress) exitWith {}; 
 
if (_attend && ([_unit,life_trial_jury] call life_fnc_index) < 0) then { life_trial_jury pushBack _unit; }; 
if (!_attend) then { life_trial_jury = life_trial_jury - [_unit]; };