/* 
 Filename: fn_radio.sqf 
 
 Author: Blackd0g 
 
 Description: Handles radio sounds for vehicles 
*/ 
private ["_sound","_song","_delay"]; 
if(radiospam) exitWith {}; 
 
antispam = true; 
playsound "switch"; 
 
_sound = floor ( random (count music)); 
 
while {true} do 
{ 
 _song = (music select _sound) select 0; 
 _delay = (music select _sound) select 1; 
 //Hint format ["Music %1 
 Song: %2 
 Delay: %3",_sound,_song,_delay]; 
 if(!alive vehicle player || !antispam || isNull vehicle player || vehicle player == player) exitWith {antispam = false; radiospam = false; playsound "switch"; titletext ["Radio ausgeschaltet","PLAIN"]; }; 
  
 [[vehicle player,_song],"lhm_fnc_say3d",nil,false] call lhm_fnc_mp; 
  
 radiospam = true; 
 uisleep _delay; 
  
 if(!alive vehicle player || !antispam || isNull vehicle player || vehicle player == player) exitWith {antispam = false; radiospam = false; playsound "switch"; titletext ["Radio ausgeschaltet","PLAIN"]; }; 
  
 radiospam = false; 
 
 _sound = _sound + 1; 
 if (_sound > ((count music) - 1)) then { 
  _sound = 0; 
 }; 
};