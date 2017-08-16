/* 
 File: loadHouses 
*/ 
private["_queryResult","_query","_count","_pos","_house","_numOfDoors"]; 
_count = (["countHouse",2] call zero_fnc_asyncCall) select 0; 
 
for [{_x=0},{_x<=_count},{_x=_x+10}] do { 
 _query = format["selectHaus:%1",_x]; 
 _queryResult = [_query,2,true] call zero_fnc_asyncCall; 
 if(_queryResult isEqualTo []) exitWith {}; 
 if((_queryResult select 0) isEqualTo []) exitWith {}; //wegen Doppel [[]] 
 
 { 
  if(_x isEqualTo [] || typeName _x != "ARRAY") exitWith {diag_log format ["loadHouses _x: %1 is empty or no array", _x];}; 
  _pos = call compile format["%1",_x select 2]; 
  _house = nearestBuilding _pos; 
  _house setVariable["onUxX",[_x select 1,_x select 3],true]; 
  _house setVariable["SOyeKO",_x select 0,true]; 
  _house setVariable["locked",true,true]; //Lock up all the stuff. 
  _numOfDoors = getNumber(configFile >> "CfgVehicles" >> (typeOf _house) >> "numberOfDoors"); 
  for "_i" from 1 to _numOfDoors do { 
   _house setVariable[format["bis_disabled_Door_%1",_i],1,true]; 
  }; 
 } foreach _queryResult; 
}; 
