if(cash_in_hand < 50) exitWith {hint "You do not have enough cash to join the game, you need $50!.";};

if (joinmode isEqualTo 0) then {
	_PUID = getPlayerUID player;
	hint "A request has been sent to the server, please wait a moment.";
	[_PUID] remoteExec ["TON_fnc_paintball",2];
	joinmode = 1;
} else {
	hint "You are already in the lobby..!";
};