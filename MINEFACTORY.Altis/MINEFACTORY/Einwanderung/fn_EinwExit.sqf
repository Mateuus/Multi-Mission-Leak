/*
	File: fn_EXIT.sqf
	IF U WANT TO USE THE SCRIPT, ASK FOR PERMISSION! info@minefactory.eu
*/

if(playerSide in [west,independent]) then {
	
	0 cutText["","BLACK OUT"];
	sleep 1;
	player setPos (getMarkerPos "einwanderungCopExit");
	sleep 1;
	0 cutText ["","BLACK IN"];
	
	} else {
	systemChat "Du bist kein cop";
	};