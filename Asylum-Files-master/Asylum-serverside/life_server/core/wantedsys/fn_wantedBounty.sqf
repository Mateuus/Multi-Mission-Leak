 
 
 
 
 
 
 
private["_civ","_cop","_id","_half","_share","_friends","_amount"]; 
_civ = [_this,0,Objnull,[Objnull]] call BIS_fnc_param; 
_cop = [_this,1,Objnull,[Objnull]] call BIS_fnc_param; 
_half = [_this,2,false,[false]] call BIS_fnc_param; 
_share = [_this,3,false,[false]] call BIS_fnc_param; 
if(isNull _civ OR isNull _cop) exitWith {}; 
 
_id = [(getPlayerUID _civ),life_wanted_list] call life_fnc_index; 
 
if(_id != -1) then 
{ 
if(_half) then 
{ 
[[((life_wanted_list select _id) select 3) / 2,((life_wanted_list select _id) select 3)],"life_fnc_bountyReceive",_cop,false] spawn life_fnc_MP; 
} 
else 
{ 
_friends = [units group _cop, {_cop distance _x < 100 && _x != _cop}] call BIS_fnc_conditionalSelect; 
_amount = (life_wanted_list select _id) select 3; 
if (count life_allpoints > 0) then 
{ 
if (life_allpoints select 1 == getPlayerUID _civ) then 
{ 
_amount = _amount * 1.5; 
life_allpoints = []; 
publicVariable "life_allpoints"; 
}; 
}; 
_original = _amount; 
if (_share && count _friends > 0) then 
{ 
_amount = round (_amount / ((count _friends) + 1)); 
{ 
[[_amount,_amount,_cop,_original],"life_fnc_bountyReceive",_x,false] spawn life_fnc_MP; 
} forEach _friends; 
}; 
[[_amount,_amount,_cop,_original],"life_fnc_bountyReceive",_cop,false] spawn life_fnc_MP; 
}; 
};