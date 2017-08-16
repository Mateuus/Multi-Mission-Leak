 
 
 
 
 
 
 
 
private["_unit","_restrained","_uid","_index"]; 
 
_unit = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param; 
_restrained = [_this,1,false,[false]] call BIS_fnc_param; 
if(isNull _unit) exitWith {[]}; 
 
_index = -1; 
_uid = getPlayerUID _unit; 
{ 
if (_uid == _x) exitWith { _index = _forEachIndex }; 
} forEach life_restrained_players; 
 
if (_index < 0 && _restrained) then { life_restrained_players pushBack _uid }; 
if (_index > -1 && !_restrained) then { life_restrained_players set [_index, -1]; life_restrained_players = life_restrained_players - [-1]; };