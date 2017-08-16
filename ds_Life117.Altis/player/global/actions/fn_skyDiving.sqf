/*
	File: fn_skyDiving.sqf
*/
private ["_atAirField","_cost"];

_atAirField = false;
//if(player distance atm6 < 200)then{_atAirField = true};
_cost = 500;
if([getPos player,200,west] call DS_fnc_nearbyPlayers) exitWith {titleText["You can not do this while there is a police officer nearby","PLAIN"];};
//if((player_questLog select 0) > 27) then {_cost = 0};
if(DS_coin < _cost) exitWith {hint "You do not have $500 to skydive!";};
[_cost,false,false] call DS_fnc_handleMoney;
if(DS_doingStuff) exitWith {};
DS_skyDiving = true;
DS_doingStuff = true;
DS_skydive_backpack = backpack player;
DS_skydive_backpackItems = backpackItems player;
_pos = getPosATL player;
_pos set[2,6000];
cutText ["", "BLACK OUT", 5];
sleep 3;
player say3D "plane";
cutText ["You are now arriving at the drop zone. Please prepare to jump!", "BLACK FADED"];
0 cutFadeOut 999999; 
sleep 1;
player setVelocity [0,0,0];
player setPos (getMarkerPos "respawn_civilian"); //Send them to a island to play the audio to simulate the plane.
player addBackpack "B_Parachute";
sleep 5;
player setPosATL _pos;
_currentView = viewDistance;
setViewDistance 6000; 
cutText["","PLAIN"];  
waitUntil {isTouchingGround player};
hint "Ill take that backpack back, here is your old one!";
removeBackpack player;
player addBackpack DS_skydive_backpack;
clearBackpackCargo player;
{
	[_x,true,false] call DS_fnc_equipItem;
} foreach DS_skydive_backpackItems;

setViewDistance _currentView;
DS_doingStuff = false;
sleep 10;
DS_skyDiving = false;
if((DS_infoArray select 13) == 18)then
	{
	[0] call DS_fnc_questCompleted;
	};