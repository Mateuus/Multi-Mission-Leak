/* 
 Author: DerOnkel & Williams 
 Avanix Gaming Community | E-Monkeys.com 
 The usage of this file is restricted to Avanix-Gaming.de & E-Monkeys.com 
    You're not allowed to modify this file! 
    Licensed under the Arma EULA and Arma Tools EULA. 
    For further questions contact the author! 
  
 Description: 
 Fuelmenu 
  
 0 - city 
 1 - name 
 2 - super_price 
 3 - superplus_price 
 4 - diesel_price 
 5 - biodiesel_price 
 6 - repair_price 
 7 - paint_price 
 8 - money 
 9 - benzinvorrat 
 10 - dieselvorrat 
 11 - tankvorgang 
 12 - owned 
*/ 
private["_display","_nearestVehicles","_objects","_vehicle","_fuelstation","_tankstellenname","_superpreis","_dieselpreis","_reperaturpreis","_lackierpreis","_fuellocation","_benzinvorrat","_tankvorgang","_dieselvorrat","_guthaben","_biodieselpreis","_superpluspreis","_stadtname","_owned"]; 
_fuelstation = nearestObject [player, "Land_CarService_F"]; 
_fuelstationData = _this select 0; 
createDialog "fuelstation_fuelMenu"; 
disableSerialization; 
 
(findDisplay 9000) displaySetEventHandler ["keyDown","_this call EMonkeys_fnc_displayHandler"]; 
 
_dialog = findDisplay 9000; 
_Btn1 = _dialog displayCtrl 9007; 
 
_id = _fuelstation getVariable "fuelstation_id"; 
_fuellocation = getArray(missionConfigFile >> "cfgFuelstationSys" >> "fuellocations"); 
_tankstellenname = ""; 
_superpreis = ""; 
_superpluspreis = ""; 
_dieselpreis = ""; 
_biodieselpreis = ""; 
_reperaturpreis = ""; 
_lackierpreis = ""; 
_benzinvorrat = ""; 
_dieselvorrat = ""; 
_guthaben = ""; 
_tankvorgang = ""; 
 
_owned = _fuelstationData select 11; 
 
if(_owned == 0) then  
{ 
 _tankstellenname = _fuelstationData select 1; 
 _superpreis = getNumber(missionConfigFile >> "cfgFuelstationSys" >> "prices"  >> "superprice"); 
 _superpluspreis = getNumber(missionConfigFile >> "cfgFuelstationSys" >> "prices"  >> "superplusprice"); 
 _dieselpreis = getNumber(missionConfigFile >> "cfgFuelstationSys" >> "prices"  >> "dieselprice"); 
 _biodieselpreis = getNumber(missionConfigFile >> "cfgFuelstationSys" >> "prices"  >> "biodieselprice"); 
 _reperaturpreis = getNumber(missionConfigFile >> "cfgFuelstationSys" >> "prices"  >> "repairprice"); 
 _lackierpreis = getNumber(missionConfigFile >> "cfgFuelstationSys" >> "prices"  >> "paintprice"); 
 _guthaben = 0; 
 _benzinvorrat = getNumber(missionConfigFile >> "cfgFuelstationSys" >> "benzinlager"); 
 _dieselvorrat = getNumber(missionConfigFile >> "cfgFuelstationSys" >> "diesellager"); 
 _tankvorgang = _fuelstationData select 10; 
} else { 
 if(_fuelstationData select 0 == "") then {_tankstellenname = _fuelstationData select 1;} else {_tankstellenname = _fuelstationData select 0;}; 
 _superpreis = _fuelstationData select 2; 
 _superpluspreis = _fuelstationData select 3; 
 _dieselpreis = _fuelstationData select 4; 
 _biodieselpreis = _fuelstationData select 5; 
 _reperaturpreis = _fuelstationData select 6; 
 _lackierpreis = _fuelstationData select 7; 
 _guthaben = _fuelstationData select 8; 
 _benzinvorrat = _fuelstationData select 9; 
 _dieselvorrat = _fuelstationData select 10; 
 _tankvorgang = _fuelstationData select 11; 
}; 
 
EMonkeys_nearestVehicle = []; 
 
if(!isNull (findDisplay 9000)) then  
{ 
 _display = findDisplay 9000; 
 _nearestVehicles = _display displayCtrl 9002; 
 _fuellocations = _display displayCtrl 9003; 
 _objects = nearestObjects[player,["Landvehicle"],5]; 
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
  
 { 
  _fuellocations lbAdd format ["%1",(_fuellocation select _forEachIndex) select 1]; 
 } forEach _fuellocation; 
  
 _superpreisStatus = _display displayCtrl 9009; 
 _superpreisStatus ctrlSetStructuredText parseText format["<t size='1.4px' color='%2'>%1€</t>",[_superpreis] call EMonkeys_fnc_numberText,parseText "#FFFFFF"]; 
  
 _superpluspreisStatus = _display displayCtrl 9010; 
 _superpluspreisStatus ctrlSetStructuredText parseText format["<t size='1.4px' color='%2'>%1€</t>",[_superpluspreis] call EMonkeys_fnc_numberText,parseText "#FFFFFF"]; 
  
 _dieselpreisStatus = _display displayCtrl 9011; 
 _dieselpreisStatus ctrlSetStructuredText parseText format["<t size='1.4px' color='%2'>%1€</t>",[_dieselpreis] call EMonkeys_fnc_numberText,parseText "#FFFFFF"]; 
  
 _biodieselpreisStatus = _display displayCtrl 9012; 
 _biodieselpreisStatus ctrlSetStructuredText parseText format["<t size='1.4px' color='%2'>%1€</t>",[_biodieselpreis] call EMonkeys_fnc_numberText,parseText "#FFFFFF"]; 
  
 /* 
 _reperaturpreisStatus = _display displayCtrl 9013; 
 _reperaturpreisStatus ctrlSetStructuredText parseText format["<t size='1.4px' color='%2'>%1€</t>",[_reperaturpreis] call EMonkeys_fnc_numberText,parseText "#FFFFFF"]; 
 
 _lackierpreisStatus = _display displayCtrl 9014; 
 _lackierpreisStatus ctrlSetStructuredText parseText format["<t size='1.4px' color='%2'>%1€</t>",[_lackierpreis] call EMonkeys_fnc_numberText,parseText "#FFFFFF"]; 
 */ 
  
 _nameStatus = _display displayCtrl 9001; 
 _nameStatus ctrlSetStructuredText parseText format["%1",_tankstellenname]; 
  
 fuelstationData = _fuelstationData; 
  
 _Btn1 buttonSetAction "[fuelstationData] spawn EMonkeys_fnc_startVehicleFueling;"; 
}; 
