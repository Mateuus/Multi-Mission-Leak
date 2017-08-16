/* 
 File: fn_initHC.sqf 
 Author: CooliMC 
  
 Description: 
 Server checks for the headless client and initializes? 
*/ 
private ["_HCID","_UID","_NAME"]; 
_HCID = [_this,0,0,[0]] call BIS_fnc_param; 
_UID = [_this,1,1,[1]] call BIS_fnc_param; 
_NAME = [_this,2,"",[""]] call BIS_fnc_param; 
 
switch (_HCID) do 
{ 
 case 0: 
 { 
  life_hc_inUse = ObjNull; 
  if(_NAME == "") then {_NAME = "DISCONECTED HC"}; 
  if(_UID == 1) then {_UID = -1}; 
  [[_UID, _NAME], [-1, "SERVER"], 4, "[HC]", "Error Headless Client hat sich in die Lobby begeben/ausgeloggt", "[HC ERROR]"] spawn TEX_fnc_logIt; 
 }; 
 
 case 1: 
 { 
  life_hc_inUse = hc_1; 
  [[(getPlayerUID hc_1), (name hc_1)], [-1, "SERVER"], 4, "[HC]", "Headless Client 1 verbunden und ausgewählt"] spawn TEX_fnc_logIt; 
 }; 
 
 case 2: 
 { 
  life_hc_inUse = hc_2; 
  [[(getPlayerUID hc_2), (name hc_2)], [-1, "SERVER"], 4, "[HC]", "Headless Client 2 verbunden und ausgewählt"] spawn TEX_fnc_logIt; 
 }; 
  
 default 
 { 
  life_hc_inUse = ObjNull; 
  if(_NAME == "") then {_NAME = "DISCONECTED HC"}; 
  if(_UID == 1) then {_UID = -1}; 
  [[_UID, _NAME], [-1, "SERVER"], 4, "[HC]", "Error in Headless Client Init", "[HC ERROR]"] spawn TEX_fnc_logIt; 
 }; 
};