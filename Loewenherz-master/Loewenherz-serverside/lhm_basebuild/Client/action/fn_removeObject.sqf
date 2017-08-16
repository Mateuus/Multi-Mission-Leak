private ["_serviceItems", "_price", "_handle","_object","_objectid","_gangid","_gangBank","_displayName","_upp","_ui","_progress","_pgText","_cP","_txtTmp","_name","_objinUse"]; 
 
if (vehicle player != player) exitWith {Hint "Du kannst dies nicht im Fahrzeug tun!"}; 
 
_object = cursorTarget; 
if (isNull _object) exitWith {}; 
if (_object isKindOf "Flag_Quontrol_F") exitWith {}; 
 
if (!isNil"AttachedObj") exitWith { 
 ["Objekt zuerst plazieren!", -1, 1.2, 5, 0, 0, 11123] spawn BIS_fnc_dynamicText; 
}; 
 
_objectid = _object getVariable ["ObjectID",0]; 
_gangid = _object getVariable ["gangarea_id",-1]; 
_gangBank = group player getVariable "gang_bank"; 
_objinUse = _object getVariable "objUsed"; 
 
if (_objinUse) exitWith { 
 ["Objekt wird benutzt!", -1, 1.2, 5, 0, 0, 11123] spawn BIS_fnc_dynamicText; 
}; 
 
_object setVariable ["objUsed",true,true]; 
lhm_action_inUse = true; 
 
// Animation Fix Test 
if((weaponState player select 4) > 0) then { 
 player action ["SwitchWeapon", player, player, 100]; 
}; 
waitUntil{sleep 2.5;(weaponState player select 4) isEqualTo 0}; 
 
 
_displayName = getText(configFile >> "CfgVehicles" >> (typeOf _object) >> "displayName"); 
_upp = format["removing %1",_displayName]; 
//Setup our progress bar. 
disableSerialization; 
5 cutRsc ["lhm_progress","PLAIN"]; 
_ui = uiNameSpace getVariable "lhm_progress"; 
_progress = _ui displayCtrl 38201; 
_pgText = _ui displayCtrl 38202; 
_pgText ctrlSetText format["%2 (1%1)...","%",_upp]; 
_progress progressSetPosition 0.01; 
_cP = 0.01; 
 
For "_i" from 0 to 1 step 0 do 
{ 
 // Animation Fix Test 
 if(animationState player != "AinvPknlMstpsnonWnonDnon_medic_1" ) then { 
   player action ["SwitchWeapon", player, player, 100]; 
   player playMove "AinvPknlMstpsnonWnonDnon_medic_1"; 
   player playActionNow "stop"; 
   player playMove "AinvPknlMstpsnonWnonDnon_medic_1"; 
   player playActionNow "stop"; 
   player playMove "AinvPknlMstpsnonWnonDnon_medic_1"; 
  }; 
 sleep 0.27; 
 _cP = _cP + 0.01; 
 _progress progressSetPosition _cP; 
 _pgText ctrlSetText format["%3 (%1%2)...",round(_cP * 100),"%",_upp]; 
 if(_cP >= 1) exitWith {}; 
 if(!alive player) exitWith {_object setVariable ["objUsed",false,true];}; 
 if(player != vehicle player) exitWith {_object setVariable ["objUsed",false,true];}; 
 if(lhm_interrupted) exitWith {_object setVariable ["objUsed",false,true];}; 
}; 
 
lhm_action_inUse = false; 
5 cutText ["","PLAIN"]; 
player playActionNow "stop"; 
if(lhm_interrupted) exitWith {lhm_interrupted = false; titleText[localize "STR_NOTF_ActionCancel","PLAIN"]; lhm_action_inUse = false;}; 
if(player != vehicle player) exitWith {titleText[localize "STR_NOTF_RepairingInVehicle","PLAIN"];}; 
 
_serviceItems = [ 
 "RoadCone_F", 
 "RoadCone_L_F", 
 "RoadBarrier_F", 
 "RoadBarrier_small_F", 
 "Land_CncBarrier_F", 
 "Land_CncBarrier_stripes_F", 
 "TapeSign_F", 
 "Flag_Quontrol_F" 
]; 
if (!(typeOf _object in _serviceItems)) then { 
 [[_objectid,_gangid,_object],"build_fnc_deleteObject",false,false] call lhm_fnc_mp; 
 
 switch {typeOf _object} do { 
  case "Land_TentHangar_V1_F": { // Air Garage 
  _name = format ["ga_air_spawn_%1", (lhm_gangData select 0)]; 
  deleteMarker _name; 
  }; 
  case "Land_i_Garage_V1_F": { // Car Garage 
  _name = format ["ga_vehicle_spawn_%1", (lhm_gangData select 0)]; 
  deleteMarker _name; 
  }; 
 }; 
 
 _price = [typeOf _object] call build_fnc_getPrice; 
 _gangBank = _gangBank + round(_price * 0.75); 
 group player setVariable["gang_bank",_gangBank,true]; 
 [[1,group player],"TON_fnc_updateGang",false,false] call lhm_fnc_mp; 
 
 _txtTmp = format ["Du hast %1 fuer %2$ verkauft!",typeOf _object,round(_price * 0.75)]; 
 [_txtTmp, -1, 1.2, 5, 0, 0, 11123] spawn BIS_fnc_dynamicText; 
} else { 
 Hint "Du kannst das nicht entfernen!"; 
};