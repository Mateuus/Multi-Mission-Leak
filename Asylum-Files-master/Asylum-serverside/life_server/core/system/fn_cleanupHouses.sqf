 
 
 
 
 
 
 
 
_uid = [_this,0,"",[""]] call BIS_fnc_param; 
 
{ 
if (!isNil "_x") then 
{ 
if (_x select 1 == _uid) then 
{ 
if (typeName (_x select 2) == "ARRAY") then 
{ 
_house = (_x select 2) nearestObject "House_F"; 
if (!isNil "_x" && !isNull _house) then 
{ 
_numDoors = getNumber(configFile >> "CfgVehicles" >> (typeOf _house) >> "numberOfDoors"); 
_house setVariable["life_locked", nil, true]; 
_house setVariable["home_owner", nil, true]; 
for "_i" from 1 to _numDoors do 
{ 
_house setVariable[format["bis_disabled_Door_%1", _i], nil, true]; 
}; 
}; 
}; 
}; 
}; 
} forEach life_house_owners;