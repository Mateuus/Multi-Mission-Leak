 
 
 
 
 
 
 
private["_presence","_total","_animals","_pos"]; 
 
_animals = ["Cock_random_F","Goat_random_F","Goat_random_F","Goat_random_F","Hen_random_F","Sheep_random_F","Sheep_random_F","Alsatian_Random_F"];  
_pos = getMarkerPos "hunting"; 
 
 
_alive = 0; 
{ 
if (!isNull _x) then 
{ 
if (alive _x) then 
{ 
_alive = _alive + 1; 
}; 
}; 
} forEach life_animals_array; 
 
 
_presence = false;  
{ if (isPlayer _x && alive _x && _x distance _pos < 650) exitWith { _presence = true; }; } forEach allPlayers; 
 
_total = 20 - _alive;  
 
if(_presence) then 
{ 
if (time - life_animals_spawned_time > 300) then 
{ 
for "_i" from 1 to _total do 
{ 
_type = _animals call BIS_fnc_selectRandom; 
_animal = (createGroup civilian) createUnit [_type, _pos,[],500,"NONE"]; 
life_animals_array set[count life_animals_array,_animal]; 
}; 
life_animals_spawned_time = time; 
life_animals_spawned = true; 
}; 
} 
else 
{ 
{ 
if(!isNull _x) then 
{ 
deleteVehicle _x; 
}; 
} foreach life_animals_array; 
 
life_animals_array = []; 
life_animals_spawned = false; 
};