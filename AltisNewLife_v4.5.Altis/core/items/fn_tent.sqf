private["_unit"];
_item = _this select 0;
_unit = cursorTarget;
_class = switch (_item) do
{
	case "tente1": { "Land_TentA_F" };
	case "tente2": { "Land_TentDome_F" };
};
if ((player distance (getMarkerPos "city")) < 200 || (player distance (getMarkerPos "civ_spawn_1")) < 200 || (player distance (getMarkerPos "civ_spawn_3")) < 200 || (player distance (getMarkerPos "civ_spawn_5")) < 200 || (player distance (getMarkerPos "civ_spawn_6")) < 200) exitWith {hint "Vous etes trop pres d'une ville."};
if(!([false,_item,1] call life_fnc_handleInv)) exitWith {};
closeDialog 0;
life_action_inUse = true;
player playMove "AinvPknlMstpSnonWnonDnon_medic_1";
uiSleep 1.5;
waitUntil {animationState player != "ainvpknlmstpsnonwnondnon_medic_1"};
life_action_inUse = false;
_tent = _class createVehicle (getPos player);
_tent setVariable ["Trunk", [[],0], true];
_tent setVariable ["owner", player, true];
[[_tent],"life_fnc_simDisable",false,false] spawn BIS_fnc_MP;
titleText["Vous avez installé votre tente a coté.","PLAIN"];