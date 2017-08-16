#include "..\..\script_macros.hpp"
/*File: sdive.sqf Author:[RPGforYOU] */

private ["_loadoutName","_action","_dive","_SpawnLocation","_TeleportLocationposition"];
if(playerSide in [west,independent]) exitWith {hint"You are not allowed to skydive, get to work!";};
if (vehicle player != player) exitWith { hint "Get out of your vehicle!" };
if(!alive player) exitWith {hint"You dead homie.. dafuq";};
if (player getVariable["restrained",false]) exitWith {hint"Can't skydive when in cuffs!";};
if(life_istazed) exitWith {hint"You are still shaking! You can't take skydive like this!";};
_TeleportLocationposition = [3549,13092,2500];

_dive = 30000;
if(BANK <_dive) exitWith {hint format[localize "STR_House_NotEnough"];};
BANK = BANK - _dive;

removeBackpack player;
			
titleText ["That'll be $30,000. Have fun and watch out for birds!","PLAIN"];
uiSleep 2;
player addBackPack "B_Parachute";
_SpawnLocation = [(_TeleportLocationposition select 0) + (random(300)), (_TeleportLocationposition select 1) + (random(300)), (_TeleportLocationposition select 2) + (random(1500))];
UiSleep 0.1;
player setPos [_SpawnLocation select 0,_SpawnLocation select 1,_SpawnLocation select 2]; 






