/*
    Darkside Life

    Author: Shawn "Huntah" Macgillivray

    Description:
	Called when a player respawns
*/

params ["_player","_corpse"];

DS_deadBody = _corpse;
player allowDamage false;

if(playerSide isEqualTo west)then {
	if((str(player) in ["cop_4","cop_1","cop_3","cop_5","cop_6","cop_7"]))then {
		DS_pubCop = true;
		player setVariable ["pubCop",true,true];
	} else {
		player setVariable ["cop",true,true];
	};

	[] call DS_cop_updateCopRank;
};