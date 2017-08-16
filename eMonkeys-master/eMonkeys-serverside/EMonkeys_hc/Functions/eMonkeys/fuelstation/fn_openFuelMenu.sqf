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
 
_query = format ["SELECT name,city,super_price,superplus_price,diesel_price,biodiesel_price,repair_price,paint_price,money,benzinvorrat,dieselvorrat,owned FROM fuelstation WHERE id='%1'",_id]; 
_queryResult = [_query,2,true] call DB_fnc_asyncCall;  
 
if(_id in ["1","2","3","4","5","6","7","8","9","10","11","12","13","14","15","16","17","18","19","20","21","22","23"]) then 
{ 
 [_queryResult,"EMonkeys_fnc_fuelMenu",_player,false] call EMonkeys_fnc_mp; 
}  
 else  
{ 
 [_queryResult,"EMonkeys_fnc_fuelMenuAir",_player,false] call EMonkeys_fnc_mp; 
};