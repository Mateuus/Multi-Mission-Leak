private["_corpse","_handle","_nearestClinic"];
closeDialog 0;
0 cutText ["Du erinnerst dich an nichts mehr... (Bitte beachte die New-Life Regel)","BLACK FADED",30];
life_respawned = true;
_corpse = life_corpse;
_handle = [] spawn life_fnc_respawned;
waitUntil{scriptDone _handle};

_nearestClinic = ([["newlife_spawn_1","newlife_spawn_2","newlife_spawn_3","newlife_spawn_4"], _corpse] call BIS_fnc_nearestPosition);
WaitUntil{preloadCamera (getMarkerPos _nearestClinic)};
0 cutFadeout 0.1;
player setpos getMarkerpos _nearestClinic;