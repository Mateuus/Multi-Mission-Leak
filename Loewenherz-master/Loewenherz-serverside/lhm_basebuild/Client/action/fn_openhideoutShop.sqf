/* 
 File: fn_openhideOutShop.sqf 
 Author: Blackd0g 
  
 Description: 
 opens the Shop Dialog 
*/ 
private ["_object","_objectinUse"]; 
_object = cursorTarget; 
 
if (isNil "_object") exitWith {}; 
if (!alive player) exitWith {}; 
if (count lhm_gangData < 1) exitWith {}; 
 
_objectinUse = _object getVariable "objUsed"; 
 
If (_objectinUse) exitWith { 
 ["Shop wird benutzt!", -1, 1.2, 5, 0, 0, 11123] spawn BIS_fnc_dynamicText; 
}; 
 
_object setVariable ["objUsed",true,true]; 
sleep 0.1; 
createDialog "lhm_object_builder_dialog"; 
["Bitte Kategorie und Objekt zum bauen waehlen", -1, 1.2, 5, 1, 0, 11123] spawn BIS_fnc_dynamicText; 
 
// wait till dialog is closed and set objUsed to false 
waitUntil{sleep 0.1; isNull (findDisplay 8800) && !BUILD_isCreating}; 
 
_object setVariable ["objUsed",false,true];