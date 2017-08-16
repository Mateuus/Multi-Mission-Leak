/* 
 Author: DerOnkel 
 Avanix Gaming Community | E-Monkeys.com 
 The usage of this file is restricted to Avanix-Gaming.de & E-Monkeys.com 
    You're not allowed to modify this file! 
    Licensed under the Arma EULA and Arma Tools EULA. 
    For further questions contact the author! 
  
 Description: 
 Select Fueldates for Fuelmenu 
*/ 
private ["_player","_id","_query","_queryResult"]; 
_player = _this select 0; 
_id = _this select 1; 
 
_query = format ["SELECT id, name, city, money, owner, owned FROM fuelstation WHERE id='%1'",_id]; 
_queryResult = [_query,2,true] call DB_fnc_asyncCall;  
 
[_queryResult,"EMonkeys_fnc_robFuelstation",_player,false] call EMonkeys_fnc_mp;