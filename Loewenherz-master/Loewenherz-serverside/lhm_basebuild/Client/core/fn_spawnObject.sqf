/* 
 File: fn_spawnObject.sqf 
 Author: Blackd0g 
  
 Description: 
 spawn a new object from shop 
*/ 
private ["_dialog", "_lb", "_index", "_classname", "_price", "_gangBank", "_gangId", "_text", "_txtTmp", "_distance", "_i", "_object","_spawnPos","_gangisCreating"]; 
disableSerialization; 
_dialog = findDisplay 8800; 
_lb = _dialog displayCtrl 8802; 
_index = lbCurSel _lb; 
if (_index == -1) exitWith {hint "Objekt auswaehlen!"}; 
_classname = (call compile (_lb lbData _index)) select 0; 
_price = [_classname] call build_fnc_getPrice; 
_gangBank = group player getVariable "gang_bank"; 
_gangId = group player getVariable "gang_id"; 
_text = getText (configFile >> "CfgVehicles" >> _classname >> "displayName"); 
_spawnPos = getMarkerPos format ["ga_building_spawn_%1", (lhm_gangData select 0)]; 
closeDialog 0; 
 
if (BUILD_isCreating) exitWith {Hint "Du baust schon etwas..."}; 
_result = nearestObjects[_spawnPos,["All"],6.1];  
if (count _result > 1) exitWith {Hint "Es steht bereits etwas auf dem Spawnpunkt.
Bau abgebrochen!"}; 
if (_gangBank < _price) exitWith {["Deine Gang hat nicht genug Geld", -1, 1.2, 5, 0, 0, 11123] spawn BIS_fnc_dynamicText}; 
 
BUILD_isCreating = true; 
 
// remove cash from player 
_gangBank = _gangBank - _price; 
group player setVariable["gang_bank",_gangBank,true]; 
[[1,group player],"TON_fnc_updateGang",false,false] call lhm_fnc_mp; 
 
playSound "chaching"; 
 
player playMoveNow "AinvPknlMstpSnonWnonDnon_medic_1"; 
 
waitUntil {sleep 1;animationState player != "AinvPknlMstpSnonWnonDnon_medic_1"}; 
 
playsound "repair"; 
 
for "_i" from 0 to 5 do { 
 _distance = round (player distance _spawnPos); 
 _txtTmp = format ["Gebaeude spawnt in %1s - Entfernung: %2m", (5 - _i),_distance]; 
 [_txtTmp, -1, 1.2, 5, 0, 0, 11123] spawn BIS_fnc_dynamicText; 
  
uiSleep 1; 
}; 
 
_object = _classname createVehicle _spawnPos; 
waitUntil {!isNil "_object" && {!isNull _object}}; 
 
// insert object 
[[_gangId,(typeOf _object),[round (direction _object),getPosATL _object],_object],"build_fnc_insertObject",false,false] call lhm_fnc_mp; 
[_object] call build_fnc_prepareObject;  
 
//player setDir ([player,_object] call BIS_fnc_dirTo); 
 
_txtTmp = format ["'%1' wurde gebaut",_text]; 
[_txtTmp, -1, 1.2, 5, 0, 0, 11123] spawn BIS_fnc_dynamicText; 
 
BUILD_isCreating = false;