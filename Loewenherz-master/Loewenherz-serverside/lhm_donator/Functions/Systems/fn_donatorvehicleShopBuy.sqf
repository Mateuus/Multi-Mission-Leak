/* 
 File: fn_vehicleShopBuy.sqf 
 Author: Bryan "Tonic" Boardwine 
  
 Description: 
 Does something with vehicle purchasing. 
*/ 
private["_mode","_spawnPoints","_className","_basePrice","_colorIndex","_spawnPoint","_vehicle"]; 
_mode = _this select 0; 
if((lbCurSel 2302) == -1) exitWith {hint localize "STR_Shop_Veh_DidntPick"}; 
_className = lbData[2302,(lbCurSel 2302)]; 
_vIndex = lbValue[2302,(lbCurSel 2302)]; 
_vehicleList = [lhm_veh_shop select 0] call lhm_fnc_donatorvehicleListCfg; _basePrice = (_vehicleList select _vIndex) select 1; 
 if(_mode) then {_basePrice = round(_basePrice * 1.5)}; 
_colorIndex = lbValue[2304,(lbCurSel 2304)]; 
 
//Series of checks (YAY!) 
if(_basePrice < 0) exitWith {}; //Bad price entry 
if(lhm_cash < _basePrice) exitWith {hint format[localize "STR_Shop_Veh_NotEnough",[_basePrice - lhm_cash] call lhm_fnc_numberText];}; 
if(!([_className] call lhm_fnc_donatorvehShopLicenses)) exitWith {hint localize "STR_Shop_Veh_NoLicense"}; 
 
_spawnPoints = lhm_veh_shop select 1; 
_spawnPoint = ""; 
 
if((lhm_veh_shop select 0) == "med_air_hs") then { 
 if(count(nearestObjects[(getMarkerPos _spawnPoints),["Air"],35]) == 0) exitWith {_spawnPoint = _spawnPoints}; 
} else { 
 //Check if there is multiple spawn points and find a suitable spawnpoint. 
 if(typeName _spawnPoints == typeName []) then { 
  //Find an available spawn point. 
  {if(count(nearestObjects[(getMarkerPos _x),["Car","Ship","Air"],5]) == 0) exitWith {_spawnPoint = _x};} foreach _spawnPoints; 
 } else { 
  if(count(nearestObjects[(getMarkerPos _spawnPoints),["Car","Ship","Air"],5]) == 0) exitWith {_spawnPoint = _spawnPoints}; 
 }; 
}; 
 
 
if(_spawnPoint == "") exitWith {hint localize "STR_Shop_Veh_Block";}; 
lhm_cash = lhm_cash - _basePrice; 
hint format[localize "STR_Shop_Veh_Bought",getText(configFile >> "CfgVehicles" >> _className >> "displayName"),[_basePrice] call lhm_fnc_numberText]; 
 
//Spawn the vehicle and prep it. 
if((lhm_veh_shop select 0) == "med_air_hs") then { 
 _vehicle = createVehicle [_className,[0,0,999],[], 0, "NONE"]; 
 waitUntil {!isNil "_vehicle"}; //Wait? 
 _vehicle allowDamage false; 
 _hs = nearestObjects[getMarkerPos _spawnPoint,["Land_Hospital_side2_F"],50] select 0; 
 _vehicle setPosATL (_hs modelToWorld [-0.4,-4,14]); 
 _vehicle lock 2; 
 [[_vehicle,_colorIndex],"lhm_fnc_colorVehicle",true,false] call lhm_fnc_mp; 
 [_vehicle] call lhm_fnc_clearVehicleAmmo; 
 _vehicle setVariable["trunk_in_use",false,true]; 
 _vehicle setVariable["vehicle_info_owners",[[getPlayerUID player,profileName]],true]; 
 _vehicle disableTIEquipment true; //No Thermals.. They're cheap but addictive. 
} else { 
 _vehicle = createVehicle [_className, (getMarkerPos _spawnPoint), [], 0, "NONE"]; 
 waitUntil {!isNil "_vehicle"}; //Wait? 
 _vehicle allowDamage false; //Temp disable damage handling.. 
 _vehicle lock 2; 
 _vehicle setVectorUp (surfaceNormal (getMarkerPos _spawnPoint)); 
 _vehicle setDir (markerDir _spawnPoint); 
 _vehicle setPos (getMarkerPos _spawnPoint); 
 [[_vehicle,_colorIndex],"lhm_fnc_colorVehicle",true,false] call lhm_fnc_mp; 
 [_vehicle] call lhm_fnc_clearVehicleAmmo; 
 _vehicle setVariable["trunk_in_use",false,true]; 
 _vehicle setVariable["vehicle_info_owners",[[getPlayerUID player,profileName]],true]; 
 _vehicle disableTIEquipment true; //No Thermals.. They're cheap but addictive. 
}; 
 
//Side Specific actions. 
switch(playerSide) do { 
 case west: { 
  [_vehicle,"cop_offroad",true] spawn lhm_fnc_vehicleAnimate; 
 }; 
  
 case civilian: { 
  if((lhm_veh_shop select 2) == "civ" && {_className == "B_Heli_Light_01_F"}) then { 
   [_vehicle,"civ_littlebird",true] spawn lhm_fnc_vehicleAnimate; 
  }; 
 }; 
  
 case independent: { 
  [_vehicle,"med_offroad",true] spawn lhm_fnc_vehicleAnimate; 
 }; 
}; 
 
_vehicle allowDamage true; 
 
lhm_vehicles pushBack _vehicle; //Add err to the chain. 
if(_mode) then { 
  [[(getPlayerUID player),playerSide,_vehicle,_colorIndex],"TON_fnc_vehicleCreate",false,false] call lhm_fnc_mp; 
}; 
[player,_vehicle] call lhm_fnc_setObjDir;  
[0] call SOCK_fnc_updatePartial; 
closeDialog 0; //Exit the menu. 
true;