pb_spielstatus=1;
[["Paintball Arena","A player has just opened a lobby in the paintball arena! The lobby closes in 60 seconds!"],"life_fnc_ryn_message",true,false] spawn life_fnc_MP;
sleep 60;

if (count pb_spieler>=2) then {

    pb_spielstatus=2;
    {
        [[2],"life_fnc_pb_response",_x,false] spawn life_fnc_MP;
    } forEach pb_spieler;
    sleep 60;
    _msg = "The game ends 4 minutes!";
    {
        [[1,_msg],"life_fnc_pb_response",_x,false] spawn life_fnc_MP;
    } forEach pb_spieler;
    sleep 60;
    _msg = "The game ends in 3 minutes!";
    {
        [[1,_msg],"life_fnc_pb_response",_x,false] spawn life_fnc_MP;
    } forEach pb_spieler;
    sleep 60;
    _msg = "The game ends in 2 minutes!";
    {
        [[1,_msg],"life_fnc_pb_response",_x,false] spawn life_fnc_MP;
    } forEach pb_spieler;
    sleep 60;
    _msg = "The game ends in 1 minute!";
    {
        [[1,_msg],"life_fnc_pb_response",_x,false] spawn life_fnc_MP;
    } forEach pb_spieler;
    sleep 60;
    {
        [[3],"life_fnc_pb_response",_x,false] spawn life_fnc_MP;
    } forEach pb_spieler;
    pb_spieler = [];
    pb_spielstatus=0;
    joinmode = 0;
    publicVariable "joinmode";

} else {

    _msg = "Because too few players were in the lobby, the game was canceled!";
    {
        [[1,_msg],"life_fnc_pb_response",_x,false] spawn life_fnc_MP;
    } forEach pb_spieler;
    pb_spieler = [];
    pb_spielstatus=0;
    joinmode = 0;
    publicVariable "joinmode";

};