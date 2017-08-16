/*
    Darkside Life

    Author: Shawn "Huntah" Macgillivray

    Description:
	Do animation from the donor menu
*/

private ["_animation"];

if((lbCurSel 1500) isEqualTo -1)exitWith{hint "You have not selected an animation to perform"};

_animation = lbData [1500,lbCurSel 1500];
if((!isNull objectParent player)||(player getVariable ["restrained",false])||(DS_jailed))exitwith{hint "You can't do this while in a vehicle, restrained or in jail"};
if(DS_donorUsed1)exitWith{hint "You have used this too recently. It can only be used once every 20 seconds"};
if(DS_doingAnimation)exitWith{hint "You are already performing an animation"};

DS_donorUsed1 = true;
hint "Press F6 to stop this animation";
player switchMove _animation;
player playMove _animation;

DS_doingAnimation = true;
[] spawn {
    _animState = animationState player;
    waitUntil {animationState player != _animState};
    uisleep 0.2;
    DS_doingAnimation = false;
};

sleep 20;
DS_donorUsed1 = false;