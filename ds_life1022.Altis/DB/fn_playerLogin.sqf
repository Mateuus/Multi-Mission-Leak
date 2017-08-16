/*
    Darkside Life

	Author: Shawn "Huntah" Macgillivray

	Description:
	Checks if a player has an account then does stuff
*/

private ["_noBlack"];

//No black UID's
_noBlack = ["76561198038366032","76561197992718808","76561198073680229","76561198067949555","76561198088153735","76561198176900577","76561198139940358","76561198073613608","76561198144709998","76561198124984854"];

if(DS_player_setup)exitWith{};
cutText [format ["Searching for your profile in TheDarkside database. Your user ID is (%1)",(getPlayerUID player)],"BLACK FADED"];
0 cutFadeOut 999999999;
if((getPlayerUID player) in _noBlack)then{cutText [format ["Searching for your profile in TheDarkside database. Your user ID is (%1)",(getPlayerUID player)],"BLACK IN"];};
[(getPlayerUID player),playerside,player] remoteExec ["DB_fnc_searchProfiles",2];