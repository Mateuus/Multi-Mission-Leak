/* 
 Author: DerOnkel & Williams 
 Avanix Gaming Community | E-Monkeys.com 
 The usage of this file is restricted to Avanix-Gaming.de & E-Monkeys.com 
    You're not allowed to modify this file! 
    Licensed under the Arma EULA and Arma Tools EULA. 
    For further questions contact the author! 
  
 Description: 
 Set Variables of all Fuelstations 
*/ 
private["_query","_queryResult","_position","_fuelstation","_fuelstationName"]; 
 
_queryResult = ["SELECT id, pos, name, city, owned FROM fuelstation",2,true] call DB_fnc_asyncCall; 
 
{ 
 _position = call compile format["%1",_x select 1]; 
 _fuelstation = (nearestObjects [_position, ["Land_CarService_F"], 50] select 0); 
 _fuelstation setVariable["fuelstation_id",_x select 0,true]; 
  
 _fuelstationName = ""; 
  
 if(_x select 4 == 0) then { 
  _fuelstationName = _x select 3; 
 } else { 
  _fuelstationName = _x select 2; 
 }; 
 
 _text = format ["*** Tankstelle geladen | Tankstellen ID: %1 | Tankstelle in: %2 |",_x select 0,_x select 3]; 
 [6,_text] call TON_fnc_log; 
  
 { 
  if(_fuelstationName != "") then { 
   format["fuelstation_%1",_x] setMarkerText format ["%1",_fuelstationName]; 
  }; 
 } forEach [_x select 0]; 
  
 _fuelstation setVariable ["fuelstation_status",false,true]; 
 _fuelstation setVariable["fuelstation_auction",[],true]; 
} foreach _queryResult;