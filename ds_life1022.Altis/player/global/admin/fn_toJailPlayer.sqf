/*
    Darkside Life

	Author: Shawn "Huntah" Macgillivray

	Description:
	Sends target to jail (by admins)
*/

player allowDamage false;
if(!isNull objectParent player)then {moveOut player;};
sleep 1;
[player,"30","Glitching",true] spawn DS_fnc_jail;
cutText ["","BLACK IN"];
(vehicle player) switchCamera "EXTERNAL";