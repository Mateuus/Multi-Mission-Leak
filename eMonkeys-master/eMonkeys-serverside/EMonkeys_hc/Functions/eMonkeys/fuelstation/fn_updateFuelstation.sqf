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
private["_mode","_owner","_id","_fuelstationName","_query","_queryResult","_dieselpreis","_einkommen","_vorrat"]; 
_mode = [_this,3,-1,[0]] call BIS_fnc_param; 
 
switch (_mode) do  
{ 
 case 0: 
 { 
  //Tankstellenname ändern 
  _owner = [_this,0,"",[""]] call BIS_fnc_param; 
  _id = _this select 1; 
  _fuelstationName = [_this,2,"",[""]] call BIS_fnc_param; 
  _query = format["UPDATE fuelstation SET name='%3' WHERE id='%2' AND owner= '%1'",_owner,_id,_fuelstationName]; 
  _queryResult = [_query,2] call DB_fnc_asyncCall; 
  _text = format ["*** Namen geändert | SpielerID: %1 | Tankstellen ID: %2 | Name: %3 |",_owner,_id,_fuelstationName]; 
  [6,_text] call TON_fnc_log; 
 }; 
  
 case 1:  
 { 
  //Spritpreise ändern _owner,_id,_superpreis,1,_superpluspreis,_dieselpreis,_biodieselpreis,_reperaturpreis,_lackierpreis 
  _owner = [_this,0,"",[""]] call BIS_fnc_param; 
  _id = _this select 1; 
  _superpreis = _this select 2; 
  _superpluspreis = _this select 4; 
  _dieselpreis = _this select 5; 
  _biodieselpreis = _this select 6; 
  _reperaturpreis = _this select 7; 
  _lackierpreis = _this select 8; 
  _query = format["UPDATE fuelstation SET super_price='%3', superplus_price='%4', diesel_price='%5', biodiesel_price='%6', repair_price='%7', paint_price='%8' WHERE id='%2' AND owner= '%1'",_owner,_id,_superpreis,_superpluspreis,_dieselpreis,_biodieselpreis,_reperaturpreis,_lackierpreis]; 
  _queryResult = [_query,2] call DB_fnc_asyncCall; 
  _text = format ["*** Preise geändert | SpielerID: %1 | Tankstellen ID: %2 | Superpreis: %3 | Superpluspreis: %4 | Dieselpreis: %5 | Biodielsepreis: %6 | Reperaturpreis: %7 | Lackierpreis: %8 |",_owner,_id,_superpreis,_superpluspreis,_dieselpreis,_biodieselpreis,_reperaturpreis,_lackierpreis]; 
  [6,_text] call TON_fnc_log; 
 }; 
  
 case 2:  
 { 
  //Einkommen abholen 
  _owner = [_this,0,"",[""]] call BIS_fnc_param; 
  _id = _this select 1; 
  _einkommen = _this select 2; 
  _query = format["UPDATE fuelstation SET money = money - '%3' WHERE id = '%1' AND owner = '%2'",_id,_owner,_einkommen]; 
  _queryResult = [_query,2] call DB_fnc_asyncCall; 
  _text = format ["*** Einkommen abgeholt | SpielerID: %1 | Tankstellen ID: %2 | Einkommen: %3 |",_owner,_id,_einkommen]; 
  [6,_text] call TON_fnc_log; 
 }; 
  
 case 3:  
 { 
  //Benzin tanken 
  _einkommen = _this select 0; 
  _vorrat = _this select 1; 
  _id = _this select 2; 
  _query = format["UPDATE fuelstation SET money = '%1', benzinvorrat = '%2', tankvorgang = tankvorgang + '1' WHERE id='%3'",_einkommen,_vorrat,_id]; 
  _queryResult = [_query,2] call DB_fnc_asyncCall; 
 }; 
  
 case 4:  
 { 
  //Diesel tanken 
  _einkommen = _this select 0; 
  _vorrat = _this select 1; 
  _id = _this select 2; 
  _query = format["UPDATE fuelstation SET money = '%1', dieselvorrat = '%2', tankvorgang = tankvorgang + '1' WHERE id='%3'",_einkommen,_vorrat,_id]; 
  _queryResult = [_query,2] call DB_fnc_asyncCall; 
 }; 
  
 case 5:  
 { 
  //Benzin beliefern 
  _id = _this select 0; 
  _vorrat = _this select 1; 
  _query = format["UPDATE fuelstation SET benzinvorrat = benzinvorrat + '%1' WHERE id='%2'",_vorrat,_id]; 
  _queryResult = [_query,2] call DB_fnc_asyncCall; 
 }; 
  
 case 6:  
 { 
  //Diesel beliefern 
  _id = _this select 0; 
  _vorrat = _this select 1; 
  _query = format["UPDATE fuelstation SET dieselvorrat = dieselvorrat + '%1' WHERE id='%2'",_vorrat,_id]; 
  _queryResult = [_query,2] call DB_fnc_asyncCall; 
 }; 
  
 case 7:  
 { 
  //Ausrauben 
  _owner = [_this,0,"",[""]] call BIS_fnc_param; 
  _id = _this select 1; 
  _betrag = _this select 2; 
  _query = format["UPDATE fuelstation SET money = money - '%1' WHERE id='%2' AND owner='%3'",_betrag,_id,_owner]; 
  _queryResult = [_query,2] call DB_fnc_asyncCall; 
 }; 
};