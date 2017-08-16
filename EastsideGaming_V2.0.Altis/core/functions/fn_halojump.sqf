#include "..\..\script_macros.hpp"
/*
	Author: Andie Macht
*/
if (playerSide != civilian)exitWith{hint "Du bist im Dienst"};
if (CASH <= 250)exitWith{hint "Du hast nicht genügend Geld dabei"};
if !(alive player)exitWith{}; //Why Arma why?!?!
if (life_action_inUse)exitWith{};

life_action_inUse = true;
_bag = backpack player;
_bagi = backpackitems player;
_head = headgear player;
_oldPos = getPos player;
removeBackpack player;
removeHeadgear player;
_newBag = player addBackpack "B_parachute";
_newHead = player addHeadgear "H_PilotHelmetFighter_B";
titleText ["","BLACK OUT",1];
_rdm = round random(3);
if(_rdm isEqualTo 0)then {
	para_chem = "Chemlight_green" createVehicle (position player);
	para_chem attachTo [player,[0,0,0]];
	para_smoke = "SmokeShellGreen" createVehicle (position player);
	para_smoke attachTo [player,[0,0,0]];
};
if(_rdm isEqualTo 1)then {
	para_chem = "Chemlight_yellow" createVehicle (position player);
	para_chem attachTo [player,[0,0,0]];
	para_smoke = "SmokeShellYellow" createVehicle (position player);
	para_smoke attachTo [player,[0,0,0]];
};
if(_rdm isEqualTo 2)then {
	para_chem = "Chemlight_red" createVehicle (position player);
	para_chem attachTo [player,[0,0,0]];
	para_smoke = "SmokeShellRed" createVehicle (position player);
	para_smoke attachTo [player,[0,0,0]];
};
if(_rdm isEqualTo 3)then {
	para_chem = "Chemlight_blue" createVehicle (position player);
	para_chem attachTo [player,[0,0,0]];
	para_smoke = "SmokeShellBlue" createVehicle (position player);
	para_smoke attachTo [player,[0,0,0]];
};
sleep 3;
titleText ["","BLACK IN",3];
player setPos [((getPos player select 0)+(round random(10))),((getPos player select 1)+(round random(10))),((getPos player select 2)+9000)];
waituntil {isTouchingGround player};
removeBackpack player;
removeHeadgear player;
player addBackpack _bag;
player addHeadgear _head;
deleteVehicle para_chem;
deleteVehicle para_smoke;
{
	player addItemToBackpack _x;
}forEach _bagi;
titleText ["","BLACK OUT",1];
sleep 2;
player setPos _oldPos;
sleep 2;
titleText ["","BLACK IN",3];
life_action_inUse = false;