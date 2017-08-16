/*
	File: fn_tent.sqf
	Author: John "Paratus" VanderZwet
	
	Description:
	Plants a tent down near the player.
*/
private["_unit"];
_item = _this select 0;
_unit = cursorTarget;

_class = switch (_item) do
{
	case "tent1": { "Land_TentA_F" };
	case "tent2": { "Land_TentDome_F" };
};

if ((player distance (getMarkerPos "city")) < 200 || (player distance (getMarkerPos "civ_spawn_3")) < 200 || (player distance (getMarkerPos "civ_spawn_4")) < 200 || (player distance (getMarkerPos "civ_spawn_2")) < 200) exitWith {hint "You are too close to a populated city to place a tent."};
if(!([false,_item,1] call life_fnc_handleInv)) exitWith {};
closeDialog 0;

life_action_in_use = true;

player playMove "AinvPknlMstpSnonWnonDnon_medic_1";
sleep 1.5;
waitUntil {animationState player != "ainvpknlmstpsnonwnondnon_medic_1"};

life_action_in_use = false;

_tent = _class createVehicle (getPos player);
_tent setVariable ["Trunk", [[],0], true];
_tent setVariable ["owner", player, true];

titleText["You pitch a tent nearby.","PLAIN"];
life_experience = life_experience + 15;