pb_spielstatus=1;
[["Paintballarena","Ein Spieler hat soeben eine Lobby in der Paintballarena er�ffnet! Die Lobby schlie�t sich in 60 Sekunden!"],"ES_fnc_ryn_message",true,false] spawn ES_fnc_MP;
sleep 60;
if (count pb_spieler>=2) then {
    pb_spielstatus=2;
    {
        [[2],"ES_fnc_pb_response",_x,false] spawn ES_fnc_MP;
    } forEach pb_spieler;
    sleep 60;
    _msg = "Das Spiel l�uft noch 4 Minuten";
    {
        [[1,_msg],"ES_fnc_pb_response",_x,false] spawn ES_fnc_MP;
    } forEach pb_spieler;
    sleep 60;
    _msg = "Das Spiel l�uft noch 3 Minuten";
    {
        [[1,_msg],"ES_fnc_pb_response",_x,false] spawn ES_fnc_MP;
    } forEach pb_spieler;
    sleep 60;
    _msg = "Das Spiel l�uft noch 2 Minuten";
    {
        [[1,_msg],"ES_fnc_pb_response",_x,false] spawn ES_fnc_MP;
    } forEach pb_spieler;
    sleep 60;
    _msg = "Das Spiel l�uft noch eine Minute!";
    {
        [[1,_msg],"ES_fnc_pb_response",_x,false] spawn ES_fnc_MP;
        [[4],"ES_fnc_pb_response",_x,false] spawn ES_fnc_MP;
    } forEach pb_spieler;
    sleep 60;
    {
        [[3],"ES_fnc_pb_response",_x,false] spawn ES_fnc_MP;
    } forEach pb_spieler;
    pb_spieler = [];
    pb_spielstatus = 0;
    joinmode = 0;
    publicVariable "joinmode";
} else {
    _msg = "Da zu wenig Spieler sich in der Lobby befanden wurde das Spiel abgebrochen!";
    {
        [[1,_msg],"ES_fnc_pb_response",_x,false] spawn ES_fnc_MP;
    } forEach pb_spieler;
    pb_spieler = [];
    pb_spielstatus=0;
    joinmode = 0;
    publicVariable "joinmode";
};