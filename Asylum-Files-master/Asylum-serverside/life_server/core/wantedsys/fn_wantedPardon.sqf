 
 
 
 
 
 
 
private["_uid","_owner","_unit"]; 
_uid = [_this,0,"",[""]] call BIS_fnc_param; 
if(_uid == "") exitWith {}; 
 
_index = [_uid,life_wanted_list] call life_fnc_index; 
_owner = 0; 
_unit = objNull; 
 
if(_index != -1) then 
{ 
life_wanted_list set[_index,-1]; 
life_wanted_list = life_wanted_list - [-1]; 
 
{ if (getPlayerUID _x == _uid) then { _owner = (_x getVariable ["ownerID", -1]); _unit = _x; }; } foreach allPlayers; 
life_wanted = 0; 
_owner publicVariableClient "life_wanted"; 
[[_uid], "life_fnc_removeBounty",true,false] call life_fnc_MP; 
[_uid] spawn DB_fnc_deleteWanted; 
if (!isNull _unit && (_unit getVariable ["paroleViolated", false])) then 
{ 
_unit setVariable ["parole", nil, true]; 
_unit setVariable ["paroleViolated", nil, true]; 
}; 
};