pb_spielstatus=1;
[["Paintball Arena "," A player has just opened a lobby in the paintball arena! The lobby closes in 60 seconds!"],"life_fnc_ryn_message",true,false] spawn life_fnc_MP;
sleep 60;

if (count pb_spieler>=2) then {

	pb_spielstatus=2;
	{
		[[2],"life_fnc_pb_response",_x,false] spawn life_fnc_MP;
	} forEach pb_spieler;
	sleep 60;
    _msg = "4 minutes till the end of the game";
	{
		[[1,_msg],"life_fnc_pb_response",_x,false] spawn life_fnc_MP;
	} forEach pb_spieler;
	sleep 60;
    _msg = "3 minutes till the end of the game";
	{
		[[1,_msg],"life_fnc_pb_response",_x,false] spawn life_fnc_MP;
	} forEach pb_spieler;
	sleep 60;
    _msg = "2 minutes till the end of the game";
	{
		[[1,_msg],"life_fnc_pb_response",_x,false] spawn life_fnc_MP;
	} forEach pb_spieler;
	sleep 60;
    _msg = "1 minute till the end of the game";
	{
		[[1,_msg],"life_fnc_pb_response",_x,false] spawn life_fnc_MP;
		[[4],"life_fnc_pb_response",_x,false] spawn life_fnc_MP;
	} forEach pb_spieler;
	sleep 60;
	{
		[[3],"life_fnc_pb_response",_x,false] spawn life_fnc_MP;
	} forEach pb_spieler;
	pb_spieler = [];
	pb_spielstatus = 0;
	joinmode = 0;
	publicVariable "joinmode";

} else {

    _msg = "Because there were not enough players in the lobby, the game was cancelled!";
	{
		[[1,_msg],"life_fnc_pb_response",_x,false] spawn life_fnc_MP;
	} forEach pb_spieler;
	pb_spieler = [];
	pb_spielstatus=0;
	joinmode = 0;
	publicVariable "joinmode";

};