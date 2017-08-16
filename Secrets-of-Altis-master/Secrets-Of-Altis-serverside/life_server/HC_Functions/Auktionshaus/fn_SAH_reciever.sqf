_mode = [_this,0,-1] call BIS_FNC_PARAM; 
_info = [_this,1,-1] call BIS_FNC_PARAM; 
 
if (isNil "SAH_offers") then {SAH_offers=[];}; 
 
switch (_mode) do 
{ 
 
case 0: 
{ 
[2,SAH_offers] remoteExecCall ["life_fnc_CAH_reciever",_info]; 
}; 
 
 
case 1: 
{ 
{SAH_offers pushBack _x;} forEach _info; 
}; 
 
 
case 2:  
{ 
SAH_offers pushBack _info; 
}; 
 
 
case 3: 
{ 
{ 
if (_x isEqualTo _info) exitWith {SAH_offers deleteAt _forEachIndex;}; 
} forEach SAH_offers; 
}; 
};