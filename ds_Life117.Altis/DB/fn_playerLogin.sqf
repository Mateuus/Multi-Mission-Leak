/*
	Author: Shawn "Huntah" Macgillivray
	
	Description:
	Checks if a player has an account then does stuff
*/
if(DS_player_setup)exitWith{};
cutText[format["Searching for your profile in TheDarkside database. Your user ID is (%1)",(getPlayerUID player)],"BLACK FADED"];
0 cutFadeOut 999999999;
[[(getPlayerUID player),playerside,player],"DB_fnc_searchProfiles",false,false] call DS_fnc_MP;