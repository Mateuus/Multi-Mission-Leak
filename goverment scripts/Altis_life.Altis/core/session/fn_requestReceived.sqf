//in the switch statement for each side, include this:
life_voted = _this select x //Switch x to the correct number in the array, every server is different!!!


//Then include this check in case civilian only
life_governor = if(getPlayerUID player == (life_rules select 0)) then {true} else {false};
if(life_governor) then {
	player setVariable["governor",true,true];
	systemChat "You are the President of Altis!";
};

//NOTE
//Include The above IF statement in your onRespawn event handler to reset the player's variable when he respawns!