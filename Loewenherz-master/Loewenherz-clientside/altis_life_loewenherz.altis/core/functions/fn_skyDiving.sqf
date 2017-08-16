/*
	File: fn_skyDiving.sqf
	Author: Ciaran Langton
	Desc: Makes the player skydive.
*/
if(lhm_atmcash < 500) exitWith {hint "Du hast keine 500$ für SkyDiving übrig!";};
lhm_atmcash = lhm_atmcash - 500;
playSound "chaching";
if(lhm_action_inUse) exitWith {};
lhm_action_inUse = true;
//Save these two vars.
lhm_skydive_backpack = backpack player;
lhm_skydive_backpackItems = backpackItems player;

_pos = getPosATL player;
_pos set[2,6000]; //Calculate the position to drop from.

cutText ["", "BLACK OUT", 5];
sleep 3;
playSound "bag";
cutText ["Du naeherst dich der Absprungzone - Mache dich bereit!", "BLACK FADED"];
0 cutFadeOut 999999; 
sleep 1;
//SETUP SIM OF PLANE
player setVelocity [0,0,0];
player setPos (getMarkerPos "respawn_civilian"); //Send them to a island to play the audio to simulate the plane.
player addBackpack "B_Parachute";
//Now play our audio
// for "_i" from 0 to 3 do
// {
	// playSound "airplane";
	// sleep 2.2;
// };
sleep 6;
player setPosATL _pos; //Set their position
_currentView = viewDistance;
setViewDistance 6000; //Up the view distance
cutText["","PLAIN"];  

waitUntil {isTouchingGround player};
hint "Hier hast du dein Zeug wieder...";
removeBackpack player;
player addBackpack lhm_skydive_backpack;
clearBackpackCargo player;
{
	[_x,true,true] call lhm_fnc_handleItem;
} foreach lhm_skydive_backpackItems;

setViewDistance _currentView;
lhm_action_inUse = false;