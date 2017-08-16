/*
	File: fn_blindfolded.sqf
	Author: Shawn "Huntah" Macgillivray

	Description:
	Blindfolds a player until he is killed/unrestrained or un-blindfolded
*/

if(player getVariable ["blindfolded",false])exitwith {
	player setVariable ["blindfolded",false,true];
};

titleText ["You have been blindfolded by a police officer","BLACK OUT"];
player setVariable ["blindfolded",true,true];

while{true}do {
	if(!(player getVariable ["blindfolded",false]))exitwith{};
	if(!alive player)exitwith{};
	if(!(player getVariable ["restrained",false]))exitwith{};
	sleep 2.5;
};

titleText ["You have pulled your blindfold off","BLACK IN",4];
player setVariable ["blindfolded",false,true];

