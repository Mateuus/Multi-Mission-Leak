/*
    Darkside Life

	Author: Shawn "Huntah" Macgillivray

	Description:
	Checks if a player has an account then does stuff
*/

cutText ["No profile found, creating your profile now...","BLACK FADED"];
0 cutFadeOut 9999999;
[getPlayerUID player,profileName,0,100000,500,player] remoteExec ["DB_fnc_insertPlayer",2];