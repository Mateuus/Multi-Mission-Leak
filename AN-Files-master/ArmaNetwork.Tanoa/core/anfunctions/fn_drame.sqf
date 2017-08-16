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
  ["_player",objNull,[objNull]],
  ["_message",[],[[]]],
  ["_side",sideUnknown,[sideUnknown]]
];
if(isNull _player OR isNil "_player") exitWith {};
if(!alive _player) exitWith {};
if(_message isEqualTo []) exitWith {};
if(_side isEqualTo sideUnknown) exitWith {};
if(life_silentMode) exitWith {hintSilent "Someone tried to show his ID but was unable to due to Silent Mode being turned on.";};
if(isNil "ShownID") then {ShownID = false;};
if(ShownID) exitWith {};
ShownID = true;
_background = format["\sndimg\sahrani\icons\idcard_%1.paa",_side];
("ANIDisplay" call BIS_fnc_rscLayer) cutRsc ["ANIDLayer","PLAIN",1,false];
disableSerialization;
_display = uiNamespace getVariable "ANIDLayer";
(_display displayCtrl 2401) ctrlShow false;
(_display displayCtrl 2404) ctrlShow false;
(_display displayCtrl 2403) ctrlShow false;
(_display displayCtrl 2408) ctrlShow false;
(_display displayCtrl 2411) ctrlShow false;
(_display displayCtrl 2412) ctrlShow false;
(_display displayCtrl 2413) ctrlShow false;
(_display displayCtrl 2416) ctrlShow false;
(_display displayCtrl 2417) ctrlShow false;
switch(_side)do {
  case civilian: {
    (_display displayCtrl 1200) ctrlSetText _background;
    (_display displayCtrl 2403) ctrlShow true;
    (_display displayCtrl 2408) ctrlShow true;
    (_display displayCtrl 2411) ctrlShow true;
    (_display displayCtrl 2412) ctrlShow true;
    (_display displayCtrl 2413) ctrlShow true;
    (_display displayCtrl 2416) ctrlShow true;
    (_display displayCtrl 2417) ctrlShow true;
    (_display displayCtrl 2405) ctrlSetStructuredText parseText format["%1",(_message select 0)];
    (_display displayCtrl 2403) ctrlSetStructuredText parseText format["%1-%2-%3",(_message select 1),(_message select 2),(_message select 3)];
    (_display displayCtrl 2408) ctrlSetStructuredText parseText format["%1",(_message select 4)];
    (_display displayCtrl 2411) ctrlSetStructuredText parseText format["%1",(_message select 7)];
    (_display displayCtrl 2412) ctrlSetStructuredText parseText format["%1",(_message select 8)];
    (_display displayCtrl 2413) ctrlSetStructuredText parseText format["%1",(_message select 5)];
    (_display displayCtrl 2416) ctrlSetStructuredText parseText format["%1",(_message select 9)];
    (_display displayCtrl 2417) ctrlSetStructuredText parseText format["%1",(_message select 6)];
  };
  case independent: {
    (_display displayCtrl 1200) ctrlSetText _background;
    (_display displayCtrl 2401) ctrlShow true;
    (_display displayCtrl 2404) ctrlShow true;

    (_display displayCtrl 2402) ctrlShow false;
    (_display displayCtrl 2406) ctrlShow false;
    (_display displayCtrl 2407) ctrlShow false;
    (_display displayCtrl 2409) ctrlShow false;
    (_display displayCtrl 2410) ctrlShow false;
    (_display displayCtrl 2414) ctrlShow false;
    (_display displayCtrl 2415) ctrlShow false;

    (_display displayCtrl 2405) ctrlSetStructuredText parseText format["%1",(_message select 0)];
    (_display displayCtrl 2404) ctrlSetStructuredText parseText format["%1",(_message select 1)];
  };
  case west: {
    (_display displayCtrl 1200) ctrlSetText _background;
    (_display displayCtrl 2401) ctrlShow true;
    (_display displayCtrl 2404) ctrlShow true;
    
    (_display displayCtrl 2402) ctrlShow false;
    (_display displayCtrl 2406) ctrlShow false;
    (_display displayCtrl 2407) ctrlShow false;
    (_display displayCtrl 2409) ctrlShow false;
    (_display displayCtrl 2410) ctrlShow false;
    (_display displayCtrl 2414) ctrlShow false;
    (_display displayCtrl 2415) ctrlShow false;

    (_display displayCtrl 2405) ctrlSetStructuredText parseText format["%1",(_message select 0)];
    (_display displayCtrl 2404) ctrlSetStructuredText parseText format["%1",(_message select 1)];
  };
};

[] spawn {sleep 6;("ANIDisplay" call BIS_fnc_rscLayer) cutText ["","PLAIN"];ShownID = nil;};
