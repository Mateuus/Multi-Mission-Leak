/* 
    Author: Niklas "Rappelkiste" Quenter 
 File: fn_impoundItem.sqf 
     
    Description: Impound Item in Vehicle Inventory 
*/ 
private["_display","_selection","_anzahl","_vehicle","_inventory","_vehicle_gew","_item_gew","_illegal","_value","_illegalItems"]; 
disableSerialization; 
 
_illegalItems = getArray(missionConfigFile >> "Cfgmaster" >> "illigalItems"); 
 
//Dialog config 
_display = findDisplay 38300; 
_selection = lbData [3303,(lbCurSel 3303)]; 
_anzahl = ctrlText (_display displayCtrl 3307); 
if(!([_anzahl] call fnc_isnumber)) exitWith {hint "Du kannst nur Zahlen verwenden"}; 
_anzahl = parseNumber(_anzahl); 
 
//Variabel config 
_vehicle = cursortarget; 
_inventory = _vehicle getVariable "Trunk" select 0; 
_vehicle_gew = _vehicle getVariable "Trunk" select 1; 
_item_gew = ([_selection] call EMonkeys_fnc_itemWeight) * _anzahl; 
_illegal = false; 
_value = 0; 
 
//Abfrage Illegal? 
{ 
 if(_selection in _x) then { 
  _illegal = true; 
 }; 
}forEach _illegalItems; 
if(!_illegal) exitWith{hint "Das ist kein Illegaler Gegenstand!"}; 
 
//Dialog Progress 
disableSerialization; 
5 cutRsc ["EMonkeys_progress","PLAIN"]; 
_ui = uiNameSpace getVariable "EMonkeys_progress"; 
_progress = _ui displayCtrl 38201; 
_pgText = _ui displayCtrl 38202; 
_var = [_selection,0] call EMonkeys_fnc_varHandle; 
_name = [_var] call EMonkeys_fnc_varToStr; 
_text = format["Beschlagnahme %1",_name]; 
_cP = 0.01; 
_dead = false; 
 
closeDialog 0; 
player playMove "AinvPknlMstpSnonWnonDr_medicUp1"; 
while {true} do 
{ 
 uisleep 0.2; 
 _cP = _cP + 0.02; 
 _progress progressSetPosition _cP; 
 _pgText ctrlSetText format["%3 (%2%1)...","%",(_cP * 100),_text]; 
 if(_cP >= 1) exitWith {}; 
 if((!alive player) || (player getVariable["onkill",FALSE])) exitWith {_dead = true;}; 
}; 
5 cutText ["","PLAIN"]; 
if(_dead) exitWith {}; 
 
//Gegenstand beschlagnahmen 
{ 
 if(_selection in _x) then { 
  _old_num  = _x select 1; 
  if(_anzahl < 1)exitWith {Hint "Du kannst nicht Null Gegenstände beschlagnahmen."}; 
  if(_anzahl > _old_num)exitWith {Hint "Es ist nicht so viel im Fahrzeug!"}; 
  if(_anzahl == _old_num) then { 
   _gew_final = _vehicle_gew - _item_gew; 
   _old_item = [_x]; 
   _delete = _inventory - _old_item; 
   _vehicle setVariable ["Trunk", [_delete, _gew_final],true]; 
    
   //Preis 
   _vIndex = [_selection,(call sell_array)] call TON_fnc_index; 
   if(_vIndex != -1) then 
   { 
    _value = _value + (_anzahl * (((call sell_array) select _vIndex) select 1)); 
   }; 
    
   //Fahrzueg Gewicht 
   _DefaultMass = eM_trunk_vehicle getVariable "default_mass"; 
   _totalWeight = [eM_trunk_vehicle] call EMonkeys_fnc_vehicleWeight; 
   _vehicle setMass (((((_totalWeight select 1)/(_totalWeight select 0))*0.5)*_DefaultMass)-_DefaultMass); 
    
   hint format["Du hast %1x %2 beschlagnahmt im Wert von %3€",_anzahl,_selection,_value]; 
  } else { 
   _old_item = [_x]; 
   _new_num = _old_num - _anzahl; 
   _gew_final = _vehicle_gew - _item_gew; 
   //Entfernen 
   _delete_final = _inventory - _old_item; 
   _vehicle setVariable ["Trunk", [_delete_final, _gew_final],true];   
   //Hinzufügen 
   _delete_final pushBack [_selection,_new_num]; 
   _vehicle setVariable ["Trunk", [_delete_final, _gew_final],true]; 
    
   //Preis 
   _vIndex = [_selection,(call sell_array)] call TON_fnc_index; 
   if(_vIndex != -1) then 
   { 
    _value = _value + (_anzahl * (((call sell_array) select _vIndex) select 1)); 
   }; 
    
   //Fahrzueg Gewicht 
   _DefaultMass = eM_trunk_vehicle getVariable "default_mass"; 
   _totalWeight = [eM_trunk_vehicle] call EMonkeys_fnc_vehicleWeight; 
   _vehicle setMass (((((_totalWeight select 1)/(_totalWeight select 0))*0.5)*_DefaultMass)-_DefaultMass); 
    
   hint format["Du hast %1x %2 beschlagnahmt im Wert von %3€",_anzahl,_selection,_value]; 
  };   
 }; 
}foreach _inventory; 
 
if(_value > 0) then 
{ 
 [[0,format["Ein Fahrzeug wurde durchsucht. Es wurden illegale Güter im Wert von %1€ konfisziert.",[_value] call EMonkeys_fnc_numberText]],"EMonkeys_fnc_broadcast",true,false] call EMonkeys_fnc_mp; 
  
 [format ["%1",_value],"EMonkeys_fnc_copcash",west,false] call EMonkeys_fnc_mp; 
};