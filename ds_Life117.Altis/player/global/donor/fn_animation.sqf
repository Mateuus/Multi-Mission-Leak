/*
Darkside Life

Author: Shawn "Huntah" Macgillivray

Description:
	Do animation from the donor menu
*/

private ["_animation"];

_animation = lbData[1500,lbCurSel (1500)];

if(((vehicle player) != player)||(player getVariable ["cuffed",false])||(player getVariable ["ziptied",false])||(DS_jailed))exitwith{hint "Can't do this while in a vehicle, restrained or in jail"};
if(DS_donorUsed1)exitwith{hint "You have used this too recently, it can only be used once per 20 seconds"};
DS_donorUsed1 = true;
hint "Press F6 to stop this animation";
player switchmove _animation;
player playMove _animation;
//[[player,_animation],"DS_fnc_animSync",nil,false] spawn DS_fnc_MP;

sleep 20;

DS_donorUsed1 = false;