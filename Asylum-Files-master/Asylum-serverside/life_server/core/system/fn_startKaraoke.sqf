 
 
 
 
 
 
 
 
_unit = [_this,0,objNull,[objNull]] call BIS_fnc_param; 
_song = [_this,1,"",[""]] call BIS_fnc_param; 
 
if (_song == "") exitWith {}; 
 
[[_song],"life_fnc_playKaraoke",true,false] spawn life_fnc_MP; 
playSound3D [MISSION_ROOT + format["sounds\%1.ogg", life_karaoke], kar_monitor, false, getPos kar_monitor, 5, 1, 100];  
 
_delay = switch (_song) do 
{ 
case "lav": { 185 }; 
case "dsb": { 250 }; 
case "iab": { 200 }; 
case "ymca": { 205 }; 
default { 200 }; 
}; 
 
sleep _delay; 
 
life_karaoke = ""; 
publicVariable "life_karaoke";