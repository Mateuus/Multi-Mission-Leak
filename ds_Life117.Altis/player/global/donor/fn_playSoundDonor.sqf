/*
Darkside Life

Author: Shawn "Huntah" Macgillivray

Description:
	Do animation from the donor menu
*/

private ["_sound"];

_sound = lbData[1502,lbCurSel (1502)];

if(DS_donorUsed3)exitwith{hint "You have used this too recently, it can only be used once per 20 seconds"};
DS_donorUsed3 = true;

[[player,_sound],"DS_fnc_playSounds",true,false] spawn DS_fnc_MP;

sleep 20;
DS_donorUsed3 = false;