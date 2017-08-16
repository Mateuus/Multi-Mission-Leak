/* 
 Author: DerOnkel & Williams 
 Avanix Gaming Community | E-Monkeys.com 
 The usage of this file is restricted to Avanix-Gaming.de & E-Monkeys.com 
    You're not allowed to modify this file! 
    Licensed under the Arma EULA and Arma Tools EULA. 
    For further questions contact the author! 
  
 Description: 
 Rob Fuelstations 
*/ 
private ["_fuelstation","_delay","_id","_owner","_fuelstationName","_kasse","_status","_loot","_endpreis","_marker","_ui","_progress","_pgText","_cP","_alarm","_distance","_success","_timer"]; 
_fuelstation = cursorTarget; 
_fuelstationData = _this select 0;  
_delay = getNumber(missionConfigFile >> "cfgFuelstationSys" >> "rob" >> "rob_localCooldown"); 
_minkasse = getNumber(missionConfigFile >> "cfgFuelstationSys" >> "rob" >> "rob_minkasse"); 
_minCops = getArray(missionConfigFile >> "cfgFuelstationSys" >> "rob" >> "rob_minCops"); 
_success = false; 
 
_id = _fuelstationData select 0; 
_fuelstationName = _fuelstationData select 1; 
_city = _fuelstationData select 2; 
_kasse = _fuelstationData select 3; 
_ownerID = _fuelstationData select 4; 
_owned = _fuelstationData select 5; 
_status = _fuelstation getVariable "fuelstation_status"; 
_inhaltkasse = 0; 
 
if(_kasse >= _minkasse) then {_inhaltkasse = (getArray(missionConfigFile >> "cfgFuelstationSys" >> "rob" >> "rob_kasse") select 0) + round(random (_kasse / (getArray(missionConfigFile >> "cfgFuelstationSys" >> "rob" >> "rob_kasse") select 1)))} else {_inhaltkasse = 0}; 
_loot = (getArray(missionConfigFile >> "cfgFuelstationSys" >> "rob" >> "rob_beute") select 0) + round(random (getArray(missionConfigFile >> "cfgFuelstationSys" >> "rob" >> "rob_beute") select 1)); 
_endpreis = _loot + _inhaltkasse; 
 
if(_ownerID == getPlayerUID player) exitWith {hint "Du kannst deinen eigene Tankstelle nicht ausrauben!"}; 
 
if(_owned == 0) then {_fuelstationName = _city} else {_fuelstationName = _fuelstationName}; 
 
if (vehicle player != player) exitWith {hint "Du musst aus dem Fahrzeug aussteigen!"}; 
if (currentWeapon player == "") exitWith {hint "Du brauchst ne Waffe!"}; 
if (!(_minCops call emonkeys_fnc_coplevelcall)) exitWith {hint "Es sind nicht genügend Polizisten online!"}; 
if (_status) exitWith {hint "Die Tankestelle wird bereits ausgeraubt!"}; 
if (side player in [west,independent]) exitWith {hint "Du bist im Dienst!"}; 
if (eM_robbed_station) exitWith {hint "Du hast erst vor kurzem die Tankstelle ausgeraubt!"}; 
if (robFuelstation) exitWith {hint "Momentan werden recht viele Tankstellen ausgeraubt. Versuch es später nochmal"}; 
if (currentWeapon player in ["","Binocular","Rangefinder"] ) exitWith { hint "Du machst mir keine Angst, raus hier du Lappen!!"}; 
 
_marker = format ["fuelstation_%1",_id]; 
_status = true; 
_fuelstation setVariable ["fuelstation_status",_status,true]; 
_marker setMarkerColor "ColorRed"; 
_marker setMarkerType "mil_warning"; 
_marker setMarkerText "!!!ACHTUNG RAUB!!!"; 
 
disableSerialization; 
5 cutRsc ["EMonkeys_progress","PLAIN"]; 
_ui = uiNameSpace getVariable "EMonkeys_progress"; 
_progress = _ui displayCtrl 38201; 
_pgText = _ui displayCtrl 38202; 
_pgText ctrlSetText format["%2...  (1%1)","%",("Raube Tankstelle aus...")]; 
_progress progressSetPosition 0.01; 
_cP = 0.01; 
 
if (_status) then  
{ 
 [[0],"TON_fnc_robFuelstationGlobalReset",false,false] call Emonkeys_fnc_MP; 
  
 if(_owned == 0) then  
 { 
  _nachricht = format ["Hilfe meine Tankstelle in %1 wird überfallen!",_city];  
  _absender = "Tankstellenwart"; 
  [[_nachricht,_absender,1],"clientMessage",true,false] call EMonkeys_fnc_mp; 
 } else { 
  _nachricht = format ["Hilfe meine Tankstelle in %1 wird überfallen!",_city];  
  _absender = format ["Angestellter von %1",_fuelstationName]; 
  [[_nachricht,_absender,1],"clientMessage",true,false] call EMonkeys_fnc_mp; 
 }; 
  
 while{true} do  
 { 
  if (_cP >= 1) exitWith {_success = true;}; 
  uisleep 2; 
  _cP = _cP + 0.01; 
  _progress progressSetPosition _cP; 
  _pgText ctrlSetText format["%3...  (%2%1)","%",round(_cP * 100),("Raube Tankstelle aus...")]; 
   
  _distance = player distance _fuelstation; 
   
  if ((_distance > 11) OR (vehicle player != player) OR (currentWeapon player == "") OR (player getVariable["onkill",FALSE]))exitWith  
  { 
   _status = false; 
   _success = false; 
   _fuelstation setVariable ["fuelstation_status",_status,true]; 
   eM_robbed_station = false; 
   [[_id,_delay,_fuelstationName,_fuelstation],"EMonkeys_fnc_robFuelstationReset",false,false] call Emonkeys_fnc_MP; 
   [[1,(getNumber(missionConfigFile >> "cfgFuelstationSys" >> "rob" >> "rob_globalCooldown"))],"TON_fnc_robFuelstationGlobalReset",false,false] call Emonkeys_fnc_MP; 
   _marker setMarkerColor "ColorGreen"; 
   _marker setMarkerType "loc_Fuelstation"; 
   _marker setMarkerText _fuelstationName; 
  };   
 }; 
  
 5 cutText ["","PLAIN"]; 
 if(!_success) exitWith {systemChat "Tankstellenraub abgebrochen!";}; 
  
 systemChat format ["Jemand hat gerade die Tankstelle in %1 ausgeraubt!",_city]; 
  
 EMonkeys_c164 = EMonkeys_c164 + _endpreis; 
 titleText[format["Du hast die Tankstelle ausgeraubt! Deine Beute: %1%2",[_endpreis] call EMonkeys_fnc_numberText,"€"],"PLAIN"]; 
 _status = false; 
 _fuelstation setVariable ["fuelstation_status",_status,true]; 
 [[_ownerID,_id,(_kasse - _inhaltkasse),7],"TON_fnc_updateFuelstation",false,false] call EMonkeys_fnc_MP; 
  
 [[_ownerID,_id],"EMonkeys_fnc_robFuelstationResetOwner",[east,civilian],false] call EMonkeys_fnc_MP; 
 [[1,(getNumber(missionConfigFile >> "cfgFuelstationSys" >> "rob" >> "rob_globalCooldown"))],"TON_fnc_robFuelstationGlobalReset",false,false] call Emonkeys_fnc_MP; 
  
 if ([west,getPos player,300] call EMonkeys_fnc_nearUnits) then { 
  [[getPlayerUID player,name player,"211"],"EMonkeys_fnc_wantedAdd",false,false] call EMonkeys_fnc_mp; 
 }; 
  
 _marker setMarkerColor "ColorGreen"; 
 _marker setMarkerType "loc_Fuelstation"; 
 _marker setMarkerText _fuelstationName; 
 
 //Client-side reset 
 uisleep _delay; 
 eM_robbed_station = false; 
}; 
 
_text = format ["*** Tankstellenraub | Spieler: %1 | Tankstellen ID: %2 | Beute: %3 |",name player,_id,_endpreis]; 
[[6,_text],"TON_fnc_log",false,false] call EMonkeys_fnc_mp;