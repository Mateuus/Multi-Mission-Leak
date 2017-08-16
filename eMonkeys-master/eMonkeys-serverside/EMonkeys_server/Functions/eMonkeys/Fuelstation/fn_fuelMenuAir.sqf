/* 
 Author: DerOnkel & Williams 
 Avanix Gaming Community | E-Monkeys.com 
 The usage of this file is restricted to Avanix-Gaming.de & E-Monkeys.com 
    You're not allowed to modify this file! 
    Licensed under the Arma EULA and Arma Tools EULA. 
    For further questions contact the author! 
  
 Description: 
 Fuelmenu 
*/ 
private["_display","_nearestVehicles","_objects","_vehicle","_kerosinprice"]; 
createDialog "fuelstation_airfuelMenu"; 
disableSerialization; 
 
EMonkeys_nearestAirVehicle = []; 
_kerosinprice = getNumber(missionConfigFile >> "cfgFuelstationSys" >> "prices" >> "kerosinprice"); 
 
if(!isNull (findDisplay 9000)) then  
{ 
 _display = findDisplay 9000; 
 _nearestVehicles = _display displayCtrl 9002; 
 _fuellocations = _display displayCtrl 9003; 
 _objects = nearestObjects[player,["Air"],50]; 
 EMonkeys_nearestVehicle = _objects; 
 { 
        if(vehicle player != _x) then 
  { 
            _nearestVehicles lbAdd format ["%1 | %2%3 | %4", getText(configFile >> "cfgVehicles" >> typeOf _x >> "DisplayName"),round ((fuel _x) * 100),"%",((_x getVariable "vehicle_info_owners") select 0) select 1]; 
            _nearestVehicles lbSetData [(lbSize _nearestVehicles)-1,format ["%1",_x]]; 
        }; 
    } foreach  _objects; 
  
 if(EMonkeys_inv_fuelE > 0) then 
 { 
  for "_i" from 1 to (EMonkeys_inv_fuelE) do 
  { 
   _type = _nearestVehicles lbAdd format ["%1 | 0%2 | %3",[(["fuelE",0] call EMonkeys_fnc_varHandle)] call EMonkeys_fnc_varToStr,"%",name player]; 
   _nearestVehicles lbSetData [_type, "EMonkeys_inv_fuelE"]; 
  }; 
 }; 
  
 _fuellocations lbAdd "Kerosin"; 
  
 _kerosinpreisStatus = _display displayCtrl 9008; 
 _kerosinpreisStatus ctrlSetStructuredText parseText format["<t size='1.4px' color='%2'>%1€</t>",[_kerosinprice] call EMonkeys_fnc_numberText,parseText "#FFFFFF"]; 
   
 _nameStatus = _display displayCtrl 9001; 
 _nameStatus ctrlSetStructuredText parseText format["%1","Kerosintankstelle"]; 
};