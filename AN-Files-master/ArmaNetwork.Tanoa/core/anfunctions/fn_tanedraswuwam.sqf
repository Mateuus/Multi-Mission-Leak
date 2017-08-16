/*
  ArmA.Network
  Rathbone
  (c) ArmA.Network 2016

  The usage of this file is restricted to ArmA.Network
  You're not allowed to modify this file!
  Licensed under the Arma EULA and Arma Tools EULA.
  For further questions contact the author!
*/
params [
  ["_object",objNull,[objNull]]
];
if(isNull _object) exitWith {};
if!(playerSide isEqualTo civilian) exitWith {};
_time = 0;
_type = "";
_type = switch(typeOf _object) do {
  case "Land_GatedoorA": {"prison"};
  case "Land_CargoBox_V1_F": {"bank"};
  default {""};
};
if(_type isEqualTo "") exitWith {hintSilent "You can't use the Blasting Charge on that Object!";};
switch(_type)do {
  case "prison": {
    if!((typeOf _object) isEqualTo "Land_GatedoorA") exitWith {};
    if(player distance (_object) > 10) exitWith {};
    if(player distance (getMarkerPos "PrisonBreakMarker") > 100) exitWith {};
    if(!(getNumber(missionConfigFile >> "DebugMode") isEqualTo 1) && ({side _x isEqualTo west} count playableUnits < 10)) exitWith {["NotEnoughCops"] call life_fnc_notificationHandler;};
    if(!(count (attachedObjects cursorObject) isEqualTo 0)) exitWith {hintSilent "Someone's already placed explosives on this gate!";};
    if(!(["blastingcharge",1] call life_fnc_virtualItemRemove)) exitWith {["ItemsFail"] call life_fnc_notificationHandler;};
    _time = if("demoOne" in AN_Skills) then {15} else {45};
    ["PrisonMainGateBreakInProgress"] remoteExecCall ["life_fnc_drath",west];
    [_object,player,_time] remoteExecCall ["life_fnc_handlePrisonServer",2];
    [5,"<t color='#FFFF00'><t size='1.5'>ALL UNITS - PRISON BREAK IN PROGRESS</t></t>"] remoteExecCall ["life_fnc_brusathusek",west];
  };
  case "bank": {
    if!((typeOf _object) isEqualTo "Land_CargoBox_V1_F") exitWith {};
    if(!(getNumber(missionConfigFile >> "DebugMode") isEqualTo 1) && ({side _x isEqualTo west} count playableUnits < 10)) exitWith {["NotEnoughCops"] call life_fnc_notificationHandler;};
    if(!(count (attachedObjects cursorObject) isEqualTo 0)) exitWith {hintSilent "Someone's already placed explosives on this gate!";};
    if(player distance fed_bank > 10) exitWith {hintSilent "You're too far from the vault to even start the heist!";};
    if(fed_bank getVariable["safe_open",false]) exitWith {hintSilent "Safe is already Open!";};
    if(!(["blastingcharge",1] call life_fnc_virtualItemRemove)) exitWith {["ItemsFail"] call life_fnc_notificationHandler;};
    _time = if("demoOne" in AN_SKills) then {3} else {4};
    ["BankTimerStarted"] remoteExecCall ["life_fnc_drath",west];
    [_object,player,_time] remoteExecCall ["life_fnc_handleBankServer",2];
    [5,"<t color='#FF0000'><t size='1.5'>ALL UNITS - THE BANK IS BEING ROBBED</t></t>"] remoteExecCall ["life_fnc_brusathusek",west];
  };
};
