/* 
 Author: DerOnkel & Williams 
 Avanix Gaming Community | E-Monkeys.com 
 The usage of this file is restricted to Avanix-Gaming.de & E-Monkeys.com 
    You're not allowed to modify this file! 
    Licensed under the Arma EULA and Arma Tools EULA. 
    For further questions contact the author! 
  
 Description: 
 Script for Fuel the selected Vehicle 
*/ 
private ["_vehicle","_objects","_ui","_progress","_cP","_control","_owned","_vehOrItem"]; 
disableSerialization; 
 
if((lbCurSel 9002) == -1) exitWith {hint"Du hast kein Fahrzeug ausgewählt";}; 
if((lbCurSel 9003) == -1) exitWith {hint"Du hast keinen Treibstoff ausgewählt";}; 
 
_display = findDisplay 9000; 
_control = _display displayCtrl 9002; 
 
_vehOrItem = _control lbData (lbCurSel _control); 
 
_closeButton = _display displayCtrl 9009; 
_tankButton = _display displayCtrl 9007; 
_tankButton ctrlEnable false; 
 
_tank = 0; 
_vehicle = ""; 
 
if(_vehOrItem == "EMonkeys_inv_fuelE") then  
{ 
 _vehicle = objNull; 
 _tank = getNumber(missionConfigFile >> "cfgFuelstationSys" >> "fuelCanCapicity"); 
}  
 else  
{ 
 _vehicle = EMonkeys_nearestVehicle select (lbCurSel _control); 
 _tank = getNumber(missionConfigFile >> "CfgVehicles" >> (typeOf _vehicle) >> "fuelCapicity"); 
}; 
 
_sprit = "kerosin"; 
_sleep = 1; 
_betrag = ""; 
_liter = 0; 
_preis = getNumber(missionConfigFile >> "cfgFuelstationSys" >> "Prices" >> "kerosinprice"); 
_preisnew = 0; 
_endpreis = 0; 
_gesamtliter = 0; 
 
if(isNil{_sprit}) exitWith {hint "Du musst eine Treibstoffsorte auswählen!"}; 
 
_display = findDisplay 9000; 
_ui = uiNameSpace getVariable "EMonkeys_fuel_progress"; 
_progress = _ui displayCtrl 9006; 
_progress progressSetPosition 0.01; 
if(isNull _vehicle)then {_cP = 0} else {_cP = fuel _vehicle;}; 
_cPrate = 1 / _tank; 
 
_betrag = getNumber(missionConfigFile >> "cfgFuelstationSys" >> "prices" >> "kerosinprice"); 
 
if(isNil {_vehicle getVariable "vehicle_fueled"} && !(isNull _vehicle)) then {_vehicle setVariable ["vehicle_fueled",false,true];}; 
if(_vehicle getVariable "vehicle_fueled" && !(isNull _vehicle)) exitwith {hint "Das Fahrzeug wird schon betankt!"; closeDialog 0;}; 
if(_cP > 0.99) exitWith {hint"Dein Fahrzeug ist schon vollgetankt!"; closeDialog 0;}; 
 
if(!(isNull _vehicle)) then {_vehicle setVariable ["vehicle_fueled",true,true];}; 
 
if(!(isNull _vehicle)) then { 
 while {fuel (_vehicle) < 0.99} do  
 { 
  if(_cP >= 1) exitWith {}; 
  uisleep 0.5; 
  _cP = _cP + _cPrate; 
  _liter = _liter + ((_cPrate * _tank) / _sleep); 
  _preis = _betrag * _liter; 
  _progress progressSetPosition _cP; 
  
  if(damage _vehicle == 1) exitWith {hint "Das Fahrzeug wurde zerstört!";}; 
  if(!alive player) exitWith {}; 
  if(player != vehicle player) exitWith {}; 
  if(side player in [civilian,east] && EMonkeys_a164 < _preis) exitWith {}; 
  if(isNull findDisplay 9000) exitwith {}; 
  _endpreis = _preis; 
  _gesamtliter = _liter; 
  if(player distance _vehicle > 20) exitWith {hint "Du musst zum Tanken im Umkreis von 20 Metern bleiben."; closeDialog 0;}; 
  
  _betragStatus = _display displayCtrl 9004; 
  _betragStatus ctrlSetStructuredText parseText format["<t size='1.0px' color='%2'>%1,00€</t>",[_endpreis] call EMonkeys_fnc_numberText,parseText "#ffffff"]; 
   
  _literStatus = _display displayCtrl 9005; 
  _literStatus ctrlSetStructuredText parseText format["<t size='1.0px' color='%2'>%1,0 Liter</t>",[_gesamtliter] call EMonkeys_fnc_numberText,parseText "#ffffff"]; 
 }; 
} else { 
 _itemfuel = 0; 
 while {_itemfuel < 0.99} do  
 { 
  if(_cP >= 1) exitWith {}; 
  uisleep 0.5; 
  _cP = _cP + _cPrate; 
  _liter = _liter + ((_cPrate * _tank) / _sleep); 
  _preis = _betrag * _liter; 
  _progress progressSetPosition _cP; 
  
  if(!alive player) exitWith {}; 
  if(player != vehicle player) exitWith {}; 
  if(side player in [civilian,east] && EMonkeys_a164 < _preis) exitWith {}; 
  if(isNull findDisplay 9000) exitwith {}; 
  _endpreis = _preis; 
  _gesamtliter = _liter; 
  
  _betragStatus = _display displayCtrl 9004; 
  _betragStatus ctrlSetStructuredText parseText format["<t size='1.0px' color='%2'>%1,00€</t>",[_endpreis] call EMonkeys_fnc_numberText,parseText "#ffffff"]; 
   
  _literStatus = _display displayCtrl 9005; 
  _literStatus ctrlSetStructuredText parseText format["<t size='1.0px' color='%2'>%1,0 Liter</t>",[_gesamtliter] call EMonkeys_fnc_numberText,parseText "#ffffff"]; 
 }; 
}; 
if(side player in [civilian,east]) then 
{ 
 if(_endpreis == 0) exitWith 
 { 
  hint "Du hast nicht genug Bargeld dabei!"; 
  if(isNil "_item") then {_vehicle setVariable ["vehicle_fueled",false,true]}; 
 }; 
}; 
 
if(_cp > 1) then {_cp = 1;}; 
 
if(!(isNull _vehicle)) then 
{ 
 [[_vehicle,_cp],"EMonkeys_fnc_setFuel",true,false] call EMonkeys_fnc_MP; 
 _vehicle setVariable ["vehicle_fueled",false,true]; 
 _vehicle setVariable ["vehicle_fuellocation",_sprit,true]; 
} else { 
 [true,format["fuelcan_%1",_sprit],1] call EMonkeys_fnc_handleInv; 
 EMonkeys_inv_fuelE = EMonkeys_inv_fuelE - 1; 
}; 
 
if((playerside == civilian) OR (playerside == east)) then 
{ 
 EMonkeys_a164 = EMonkeys_a164 - _endpreis; 
}; 
 
 
if((playerside == civilian) OR (playerside == east)) then 
{ 
 hint format["Du hast 
%1 Liter Kerosin 
für %2€ getankt!",[_gesamtliter] call EMonkeys_fnc_numberText,[_endpreis] call EMonkeys_fnc_numberText]; 
} else { 
 hint format["Du hast 
%1 Liter Kerosin 
für %2€ getankt! Die Kosten wurden von der Staatskasse übernommen!",[_gesamtliter] call EMonkeys_fnc_numberText,[_endpreis] call EMonkeys_fnc_numberText]; 
}; 
   
_text = format ["*** Fahrzeug betankt | Spielername: %1 | Endpreis: %2 | Treibstoff: %4 Liter %3 |",name player,_endpreis,_sprit,_gesamtliter]; 
[[6,_text],"TON_fnc_log",false,false] call EMonkeys_fnc_mp; 
