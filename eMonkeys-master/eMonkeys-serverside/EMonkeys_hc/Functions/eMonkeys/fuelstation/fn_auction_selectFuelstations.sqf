/* 
 Author: DerOnkel & Williams 
 Avanix Gaming Community | E-Monkeys.com 
 The usage of this file is restricted to Avanix-Gaming.de & E-Monkeys.com 
    You're not allowed to modify this file! 
    Licensed under the Arma EULA and Arma Tools EULA. 
    For further questions contact the author! 
  
 Description: 
 Uses for the Fuelstations 
*/ 
private["_player","_array","_query","_queryResult"]; 
_player = _this select 0; 
_array = []; 
 
_query = ["SELECT id, city, bieter FROM fuelstation WHERE owned='1'",2,true] call DB_fnc_asyncCall;  
 
{  
 _count = _x select 0;  
 _array set[(parsenumber _count) ,_x];  
} forEach _query;  
 
[[_array],"EMonkeys_fnc_fuelstationAuctionMenu",_player,false] call EMonkeys_fnc_mp;