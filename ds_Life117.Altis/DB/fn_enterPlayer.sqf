/*
	Author: Shawn "Huntah" Macgillivray
	
	Description:
	Checks if a player has an account then does stuff
*/
if(life_session_completed) exitWith {}; //Why did this get executed when the client already initialized? Fucking arma...
cutText["No profile found, creating your profile now....","BLACK FADED"];
0 cutFadeOut 9999999;
[[getPlayerUID player,profileName,0,100000,500,player],"DB_fnc_insertPlayer",false,false] spawn BIS_fnc_MP;