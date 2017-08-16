/* 
 Author: DerOnkel & Williams 
 Avanix Gaming Community | E-Monkeys.com 
 The usage of this file is restricted to Avanix-Gaming.de & E-Monkeys.com 
    You're not allowed to modify this file! 
    Licensed under the Arma EULA and Arma Tools EULA. 
    For further questions contact the author! 
  
 Description: 
 Starts automated mining of resource from the tempest device. 
*/ 
private["_vehicle","_fuelstation","_benzinvorrat","_dieselvorrat","_marketprice","_preisnew","_trunk","_item","_menge","_ui","_progress","_pgText","_cP","_endpreise","_price3","_price4","_price5","_price6","_price2","_price1","_index","_dieselliter1","_dieselliter2","_dieselliter3","_benzinliter1","_benzinliter2","_benzinmenge","_dieselmenge","_distance1","_success"]; 
_vehicle = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param; 
_fuelstation = nearestObject [player, "Land_CarService_F"]; 
_fuelstationID = _fuelstation getVariable "fuelstation_id"; 
_trunk = _vehicle getVariable "trunk" select 0; 
_trunk_size = _vehicle getVariable "trunk" select 1; 
_preisnew = 0; 
_success = false; 
 
if(isNull _vehicle) exitWith {}; 
if(_vehicle getVariable "vehicle_fueled") exitWith {hint "Du tankst gerade das Fahrzeug!";}; 
if(_vehicle getVariable "fueling") exitWith {hint "Du betankst schon eine Tankstelle!";}; 
if((["diesel",_trunk] call TON_fnc_index == -1) && (["super",_trunk] call TON_fnc_index == -1) && (["superplus",_trunk] call TON_fnc_index == -1) && (["diesel",_trunk] call TON_fnc_index == -1)&& (["biodiesel",_trunk] call TON_fnc_index == -1)&& (["diesel_gestreckt",_trunk] call TON_fnc_index == -1) && (["oilp",_trunk] call TON_fnc_index == -1)) exitWith {hint "Du hast keinen Treibstoff geladen!"}; 
 
closeDialog 0; 
eM_action_inUse = true; 
 
_vehicle setVariable ["fueling",true,true]; 
_distance = player distance getMarkerPos "fuel_processing"; 
_distance1 = player distance getMarkerPos "oil_processing"; 
_price1 = 0; 
_price2 = 0; 
_price3 = 0; 
_price4 = 0; 
_price5 = 0; 
_price6 = 0; 
_dieselliter1 = 0; 
_dieselliter2 = 0; 
_dieselliter3 = 0; 
_benzinliter1 = 0; 
_benzinliter2 = 0; 
_benzinmenge = 0; 
_dieselmenge = 0; 
 
disableSerialization; 
5 cutRsc ["EMonkeys_progress","PLAIN"]; 
_ui = uiNameSpace getVariable "EMonkeys_progress"; 
_progress = _ui displayCtrl 38201; 
_pgText = _ui displayCtrl 38202; 
_pgText ctrlSetText format["Tankstelle wird aufgefüllt... (1%1)...","%"]; 
_progress progressSetPosition 0.01; 
_cP = 0.01; 
  
while{true} do 
{ 
 sleep 0.27; 
 _cP = _cP + 0.01; 
 _progress progressSetPosition _cP; 
 _pgText ctrlSetText format["Tankstelle wird aufgefüllt... (%1%2)...",round(_cP * 100),"%"]; 
 if(_cP >= 1) exitWith {_success = true;}; 
 if (((player distance _fuelstation) > 50) OR (vehicle player != player) OR (player getVariable["onkill",FALSE]))exitWith  
 { 
  _success = false; 
 }; 
}; 
 
5 cutText ["","PLAIN"]; 
if(!_success) exitWith {systemChat "Tankstelle befüllen, abgebrochen!"; _vehicle setVariable["fueling",false,true];}; 
 
{ 
 _item = _x select 0; 
 _menge = _x select 1; 
 _index = [_item,(call sell_array)] call TON_fnc_index; 
 _item_gew = ([_item] call EMonkeys_fnc_itemWeight) * _menge; 
 if(_index != -1) then  
 { 
  _preisnew = ((call sell_array) select _index) select 1; 
  _marketprice = [_item] call EMonkeys_fnc_marketGetPrice; 
  
  if(_marketprice != -1) then 
  { 
   _preisnew = _marketprice; 
  }; 
 }; 
  
 switch (_item) do 
 { 
  case "super":  
  { 
   _trunk = _trunk - [_x]; 
   _trunk_size = _trunk_size - _item_gew; 
   _preisnew = _preisnew * _menge; 
   _benzinliter1 = _menge; 
   _price1 = round(_preisnew + ((_distance / 25) * _menge)); 
    
   if(_marketprice != -1) then 
   { 
    [[_item,_menge],"EMonkeys_fnc_updateEconomy",false,false] call EMonkeys_fnc_mp; 
   }; 
 
  }; 
  case "superplus":  
  { 
   _trunk = _trunk - [_x]; 
   _trunk_size = _trunk_size - _item_gew; 
   _preisnew = _preisnew * _menge; 
   _benzinliter2 = _menge; 
   _price2 = round(_preisnew + ((_distance / 25) * _menge)); 
    
   if(_marketprice != -1) then 
   { 
    [[_item,_menge],"EMonkeys_fnc_updateEconomy",false,false] call EMonkeys_fnc_mp; 
   }; 
  }; 
  case "diesel":  
  { 
   _trunk = _trunk - [_x]; 
   _trunk_size = _trunk_size - _item_gew; 
   _preisnew = _preisnew * _menge; 
   _dieselliter1 = _menge; 
   _price3 = round(_preisnew + ((_distance / 25) * _menge)); 
    
   if(_marketprice != -1) then 
   { 
    [[_item,_menge],"EMonkeys_fnc_updateEconomy",false,false] call EMonkeys_fnc_mp; 
   }; 
  }; 
  case "diesel_gestreckt":  
  { 
   _trunk = _trunk - [_x]; 
   _trunk_size = _trunk_size - _item_gew; 
   _preisnew = _preisnew * _menge; 
   _dieselliter2 = _menge; 
   _price4 = round(_preisnew + ((_distance / 25) * _menge)); 
    
   if(_marketprice != -1) then 
   { 
    [[_item,_menge],"EMonkeys_fnc_updateEconomy",false,false] call EMonkeys_fnc_mp; 
   }; 
  }; 
  case "biodiesel":  
  { 
   _trunk = _trunk - [_x]; 
   _trunk_size = _trunk_size - _item_gew; 
   _preisnew = _preisnew * _menge; 
   _dieselliter3 = _menge; 
   _price5 = round(_preisnew + ((_distance / 25) * _menge)); 
    
   if(_marketprice != -1) then 
   { 
    [[_item,_menge],"EMonkeys_fnc_updateEconomy",false,false] call EMonkeys_fnc_mp; 
   }; 
  }; 
  case "oilp":  
  { 
   _trunk = _trunk - [_x]; 
   _trunk_size = _trunk_size - _item_gew; 
   _preisnew = _preisnew * _menge; 
   _price6 = round(_preisnew + (_distance / 5)); 
    
   if(_marketprice != -1) then 
   { 
    [[_item,_menge],"EMonkeys_fnc_updateEconomy",false,false] call EMonkeys_fnc_mp; 
   }; 
  }; 
 }; 
  
 _benzinmenge = (_benzinliter1 + _benzinliter2) * 10; 
 _dieselmenge = (_dieselliter1 + _dieselliter2 + _dieselliter3) * 10; 
 [[_fuelstationID,_benzinmenge,0,5],"TON_fnc_updateFuelstation",false,false] call EMonkeys_fnc_MP; 
 [[_fuelstationID,_dieselmenge,0,6],"TON_fnc_updateFuelstation",false,false] call EMonkeys_fnc_MP; 
} foreach _trunk; 
 
_endpreise = _price1 + _price2 + _price3 + _price4 + _price5 + _price6; 
_vehicle setVariable ["Trunk", [_trunk, _trunk_size],true]; 
EMonkeys_c164 = EMonkeys_c164 + _endpreise; 
hint format ["Du hast für das befüllen der Tankstelle %1€ erhalten!",[_endpreise] call EMonkeys_fnc_numberText]; 
 
eM_action_inUse = false; 
_vehicle setVariable["fueling",false,true]; 
 
_text = format ["*** Tankstelle befuellt | Spielername: %1 | Endpreis: %2 | Liter Benzin: %3 | Liter Diesel: %4| Tankstellen ID: %5 |",name player,_endpreise,(_benzinmenge / 10),(_dieselmenge / 10),_fuelstationID]; 
[[6,_text],"TON_fnc_log",false,false] call EMonkeys_fnc_mp; 
