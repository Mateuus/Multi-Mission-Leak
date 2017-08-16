/* 
 Author: DerOnkel & Williams 
 Avanix Gaming Community | E-Monkeys.com 
 The usage of this file is restricted to Avanix-Gaming.de & E-Monkeys.com 
    You're not allowed to modify this file! 
    Licensed under the Arma EULA and Arma Tools EULA. 
    For further questions contact the author! 
  
 Description: 
 Fetches all the players fuelstation and sets them up. 
*/ 
private["_query","_queryResult","_return","_id","_position","_fuelstation"]; 
if(_this == "") exitWith {}; 
 
_query = format["SELECT id, pos FROM fuelstation WHERE owner='%1' AND owned='1'",_this]; 
_queryResult = [_query,2,true] call DB_fnc_asyncCall; 
 
_return = []; 
 
{ 
 _id = _x select 0; 
 _position = call compile format["%1",_x select 1]; 
 _fuelstation = (nearestObjects [_position, ["Land_CarService_F"], 50] select 0); 
 _fuelstation allowDamage false;  
  
 _return pushback [_id,_position]; 
} foreach _queryResult; 
 
missionNamespace setVariable[format["fuelstation_%1",_this],_return];