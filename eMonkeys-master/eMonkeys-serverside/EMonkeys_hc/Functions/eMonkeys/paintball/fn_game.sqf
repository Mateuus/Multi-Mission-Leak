pb_spielstatus=1; 
[["Paintballarena","Paintballarena eröffnet! Die Lobby schließt sich in 60 Sekunden! Melde dich an und sei dabei.. "],"EMonkeys_fnc_ryn_message",true,false] call EMonkeys_fnc_mp; 
uisleep 60; 
 
if (count pb_spieler>=2) then { 
 
    pb_spielstatus=2; 
    { 
        [[2],"EMonkeys_fnc_pb_response",_x,false] call EMonkeys_fnc_mp; 
    } forEach pb_spieler; 
    uisleep 60; 
    _msg = "Das Spiel läuft noch 4 Minuten"; 
    { 
        [[1,_msg],"EMonkeys_fnc_pb_response",_x,false] call EMonkeys_fnc_mp; 
    } forEach pb_spieler; 
    uisleep 60; 
    _msg = "Noch 3 Minuten"; 
    { 
        [[1,_msg],"EMonkeys_fnc_pb_response",_x,false] call EMonkeys_fnc_mp; 
    } forEach pb_spieler; 
    uisleep 60; 
    _msg = "Noch 2 Minuten"; 
    { 
        [[1,_msg],"EMonkeys_fnc_pb_response",_x,false] call EMonkeys_fnc_mp; 
    } forEach pb_spieler; 
    uisleep 60; 
    _msg = "Das Spiel läuft noch eine Minute! GO GO"; 
    { 
        [[1,_msg],"EMonkeys_fnc_pb_response",_x,false] call EMonkeys_fnc_mp; 
    } forEach pb_spieler; 
    uisleep 60; 
    { 
        [[3],"EMonkeys_fnc_pb_response",_x,false] call EMonkeys_fnc_mp; 
    } forEach pb_spieler; 
    pb_spieler = []; 
    pb_spielstatus=0; 
    eM_joinmode = 0; 
    publicVariable "eM_joinmode"; 
 
} else { 
 
    _msg = "Zuwenig Teilnehmer angemeldet. Spiel abgebrochen!"; 
    { 
        [[1,_msg],"EMonkeys_fnc_pb_response",_x,false] call EMonkeys_fnc_mp; 
    } forEach pb_spieler; 
    pb_spieler = []; 
    pb_spielstatus=0; 
    eM_joinmode = 0; 
    publicVariable "eM_joinmode"; 
 
};