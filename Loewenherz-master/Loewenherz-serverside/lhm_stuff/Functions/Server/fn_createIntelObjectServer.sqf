/* 
 Filename: fn_createIntelObjectServer.sqf 
 Author: Killzonekid, Blackd0g 
  
 Description: create a intel object with interaction from the server 
  
 Parameters: 
 [ 
  -1, // type: 0 - file1, 1 - file2, 2 - photo, -1 - random  
  random 360, // direction: 0-360 of Intel object 
  getPosASL playerServer, // position ASL of Intel object 
  "Secret Intel", // title of Intel 
  "GO FUCK YOURSELF!", // description of Intel 
  "\a3\data_f\Flags\flag_armex_co.paa", // optional large image 
  [west], // recipient sides 
  true // sync found Intel for JIP players 
 ] 
*/ 
if (!isServer) exitWith {}; 
params [ 
 ["_intelType", 0, [0]], 
 ["_direction", 0, [0]],  
 ["_positionASL", [0,0,0], [[]], [3]],  
 ["_title", "Title", [""]], 
 ["_description", "Description", [""]], 
 ["_texture", "", [""]], 
 ["_recipients", [west, east, resistance, civilian], [[]]], 
 ["_syncJIP", false, [false]], 
 "_intelTypes", 
 "_intel" 
]; 
_intelTypes = [ 
 "Intel_File1_F",  
 "Intel_File2_F",  
 "Intel_Photos_F" 
]; 
if (_intelType < 0 || _intelType >= count _intelTypes) then { 
 _intelType = floor random count _intelTypes; 
}; 
_intel = _intelTypes select _intelType createVehicle [0,0,0]; 
_intel setDir _direction; 
_intel setPosASL _positionASL; 
_intel setVariable ["RscAttributeOwners", _recipients, true]; 
if (_syncJIP) then { 
 _intel setVariable ["recipients", _recipients, true]; 
}; 
if (_texture != "") then { 
 _intel setVariable ["RscAttributeDiaryRecord_texture", _texture, true]; 
}; 
[ 
 _intel,  
 "RscAttributeDiaryRecord",  
 [_title, _description, _texture] 
] call BIS_fnc_setServerVariable; 
_intel