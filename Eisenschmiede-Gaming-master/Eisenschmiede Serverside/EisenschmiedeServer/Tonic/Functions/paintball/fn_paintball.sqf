private["_uid"];
_uid = [_this,0,"",[""]] call BIS_fnc_param;
if (count pb_spieler==0&&pb_spielstatus==0) then {
    [[],"ES_fnc_game",false,false] spawn ES_fnc_MP;
    pb_spielstatus = 1;
};
if (pb_spielstatus==1) then {
    _uidarr = [_uid];
    _geld = [_this,1,0,[0]] call BIS_fnc_param;
    if (_geld>=5000) then {
        pb_spieler = pb_spieler + _uidarr;
        [[5,"Du wurdest erfolgreich f�r das kommende Spiel angemeldet!"],"ES_fnc_pb_response",_uid,false] spawn ES_fnc_MP;
    } else {
        [[1,"Du hast keine 5000 Dollar bei dir!"],"ES_fnc_pb_response",_uid,false] spawn ES_fnc_MP;
    };
};
if ((pb_spielstatus==2&&count pb_spieler>=2)||(count pb_spieler==pb_maxspieler)) then {
    [[1,"Leider hat das Spiel bereits begonnen oder die Lobby ist bereits voll, versuche es sp�ter noch einmal!"],"ES_fnc_pb_response",_uid,false] spawn ES_fnc_MP;
};