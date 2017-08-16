if(argent_liquide < 200) exitWith {	hint "Vous devez avoir 200€ pour faire un saut en parachute.";};
argent_liquide = argent_liquide - 200;
if(life_action_inUse) exitWith {};
life_action_inUse = true;
life_skydive_backpack = backpack player;
life_skydive_backpackItems = backpackItems player;

_pos = getPosATL player;
_pos set[2,2000];

cutText ["","BLACK OUT",5];
uiSleep 3;
cutText ["Vous allez bientot arrivez dans la zone de largage. Préparez-vous à sauter!", "BLACK FADED"];
0 cutFadeOut 999999; 
uiSleep 1;

player setVelocity [0,0,0];
player setPos (getMarkerPos "respawn_civilian");
player addBackpack "B_Parachute";

for "_i" from 0 to 3 do
{
	playSound "airplane";
	uiSleep 2.2;
};
uiSleep 5;
player setPosATL _pos;
_currentView = viewDistance;
setViewDistance 6000;
if (cameraView == "EXTERNAL") then { player switchCamera "INTERNAL"; };
cutText ["", "BLACK IN", 0.75];

waitUntil {isTouchingGround player};
hint "Je recuperes le parachute, voici votre sac à dos !";
removeBackpack player;
player addBackpack life_skydive_backpack;
clearBackpackCargo player;
{
	[_x,true,true] call life_fnc_handleItem;
} foreach life_skydive_backpackItems;

setViewDistance _currentView;
life_action_inUse = false;