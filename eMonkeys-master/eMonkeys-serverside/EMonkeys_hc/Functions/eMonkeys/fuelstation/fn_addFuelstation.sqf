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
private["_playerID","_fuelstationID","_query"]; 
_playerID = _this select 0; 
_fuelstationID = _this select 1; 
 
_query = format["UPDATE fuelstation SET owner='%1', super_price='%2', superplus_price='%3', diesel_price='%4', biodiesel_price='%5', repair_price='%6', paint_price='%7', money='0', benzinvorrat='%8', dieselvorrat='%9', owned='1', bieter='0', gebot='0', leasedOn=NOW(), leasedTo=DATE_ADD(CURRENT_TIMESTAMP, INTERVAL %10 DAY) WHERE id='%11'", 
_playerID, 
getNumber(missionConfigFile >> "cfgFuelstationSys" >> "Prices" >> "superprice"), 
getNumber(missionConfigFile >> "cfgFuelstationSys" >> "Prices" >> "superplusprice"), 
getNumber(missionConfigFile >> "cfgFuelstationSys" >> "Prices" >> "dieselprice"), 
getNumber(missionConfigFile >> "cfgFuelstationSys" >> "Prices" >> "biodieselprice"), 
getNumber(missionConfigFile >> "cfgFuelstationSys" >> "Prices" >> "repairprice"), 
getNumber(missionConfigFile >> "cfgFuelstationSys" >> "Prices" >> "paintprice"), 
getNumber(missionConfigFile >> "cfgFuelstationSys" >> "benzinlager"), 
getNumber(missionConfigFile >> "cfgFuelstationSys" >> "diesellager"), 
getNumber(missionConfigFile >> "cfgFuelstationSys" >> "leaseddays"), 
_fuelstationID 
]; 
[_query,1] call DB_fnc_asyncCall; 
 
_text = format ["*** Neuer Owner | Spieler ID: %1 | Tankstellen ID: %2 |",_playerID,_fuelstationID]; 
[6,_text] call TON_fnc_log;