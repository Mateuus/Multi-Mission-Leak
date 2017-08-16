private["_uid"]; 
_uid = [_this,0,"",[""]] call BIS_fnc_param; 
 
if (count pb_spieler==0&&pb_spielstatus==0) then { 
    [[],"TON_fnc_game",false,false] call EMonkeys_fnc_mp; 
    pb_spielstatus = 1; 
}; 
 
if (pb_spielstatus==1) then { 
    _uidarr = [_uid]; 
    pb_spieler = pb_spieler + _uidarr; 
    [[1,"Du wurdest erfolgreich für das kommende Spiel angemeldet!"],"EMonkeys_fnc_pb_response",_uid,false] call EMonkeys_fnc_mp; 
}; 
 
if ((pb_spielstatus==2&&count pb_spieler>=2)||(count pb_spieler==pb_maxspieler)) then { 
    [[1,"Leider hat das Spiel bereits begonnen oder die Lobby ist bereits voll, versuche es später noch einmal!"],"EMonkeys_fnc_pb_response",_uid,false] call EMonkeys_fnc_mp; 
};