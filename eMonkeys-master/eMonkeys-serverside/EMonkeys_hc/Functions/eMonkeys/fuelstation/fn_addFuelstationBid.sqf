/* 
 Author: DerOnkel & Williams 
 Avanix Gaming Community | E-Monkeys.com 
 The usage of this file is restricted to Avanix-Gaming.de & E-Monkeys.com 
    You're not allowed to modify this file! 
    Licensed under the Arma EULA and Arma Tools EULA. 
    For further questions contact the author! 
  
 Description: 
 Add Fuelstation to Database 
*/ 
private["_fuelstationID","_gebot","_playerID","_bieter","_firstBit"]; 
_fuelstationID = _this select 0; 
_gebot = _this select 1; 
_playerID = _this select 2; 
_firstBit = false; 
 
_bieter = ["SELECT bieter FROM fuelstation",2,true] call DB_fnc_asyncCall; 
 
{ 
 if(_playerID in _x) then  
 { 
  _firstBit = true; 
 }; 
} forEach _bieter; 
 
if(_firstBit) exitWith {}; 
 
_query = format["UPDATE fuelstation SET gebot='%1', bieter='%2' WHERE id='%3' AND gebot < '%1'",_gebot,_playerID,_fuelstationID]; 
[_query,1] call DB_fnc_asyncCall; 
 
_text = format ["*** Neues Gebot DB | SpielerID: %1 | Tankstellen ID: %2 | Gebot: %3 |",_playerID,_fuelstationID,_gebot]; 
[6,_text] call TON_fnc_log;