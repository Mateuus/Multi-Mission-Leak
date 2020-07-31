#include <macro.h>
/*
	File: fn_copSearch.sqf
	
	
	Description:
	Returns information on the search.
*/

life_action_inUse = false;
if(side player == civilian || side player == east) then {
private["_civ","_invs","_license","_robber","_guns","_gun","_cop"];
_civ = param [0,Objnull,[Objnull]];
_invs = param [1,[],[[]]];
_cop = param [2,false,[false]];
drug_fuck = 1;
turtle_fuck = 1;
uiSleep 1;



totaldrugs = life_inv_methu + life_inv_methp + life_inv_cokeu + life_inv_cokep + life_inv_heroinu + life_inv_heroinp + life_inv_cannabis + life_inv_marijuana;

if(life_inv_methu > 0) then {[false,"methu",life_inv_methu] call life_fnc_handleInv; drug_fuck = 2;};
if(life_inv_methp > 0) then {[false,"methp",life_inv_methp] call life_fnc_handleInv; drug_fuck = 2;};
if(life_inv_cokeu > 0) then {[false,"cokeu",life_inv_cokeu] call life_fnc_handleInv; drug_fuck = 2;};
if(life_inv_cokep > 0) then {[false,"cokep",life_inv_cokep] call life_fnc_handleInv; drug_fuck = 2;};
if(life_inv_heroinu > 0) then {[false,"heroinu",life_inv_heroinu] call life_fnc_handleInv; drug_fuck = 2;};
if(life_inv_heroinp > 0) then {[false,"heroinp",life_inv_heroinp] call life_fnc_handleInv; drug_fuck = 2;};
if(life_inv_cannabis > 0) then {[false,"cannabis",life_inv_cannabis] call life_fnc_handleInv; drug_fuck = 2;};
if(life_inv_marijuana > 0) then {[false,"marijuana",life_inv_marijuana] call life_fnc_handleInv; drug_fuck = 2;};

totalturtles = life_inv_turtle;

if(life_inv_turtle > 0) then {[false,"turtle",life_inv_turtle] call life_fnc_handleInv; turtle_fuck = 2;};



[0,format["%1 zostal przeszukany.",name player, _cop]] remoteExecCall ["life_fnc_broadcast", -2]; 

if(turtle_fuck == 2) then {
	[0,format["%1 was found with %2 turtles in their possession.",name player, totalturtles]] remoteExecCall ["life_fnc_broadcast", -2]; 
};
if(drug_fuck == 2) then {
	[0,format["%1 was found with %2 drugs in their possession.",name player, totaldrugs]] remoteExecCall ["life_fnc_broadcast", -2]; 
} else {
	[0,format["%1 was found with no illegal drugs.",name player]] remoteExecCall ["life_fnc_broadcast", -2]; 
};


[false,"blastingcharge",life_inv_marijuana] call life_fnc_handleInv;
[false,"boltcutter",life_inv_marijuana] call life_fnc_handleInv;
[false,"spikeStrip",life_inv_marijuana] call life_fnc_handleInv;
[false,"roadcone",life_inv_marijuana] call life_fnc_handleInv;
[false,"mRoadConeStripB",life_inv_marijuana] call life_fnc_handleInv;
[false,"RoadConeB",life_inv_marijuana] call life_fnc_handleInv;
[false,"RoadConeStrip",life_inv_marijuana] call life_fnc_handleInv;
[false,"RoadCone",life_inv_marijuana] call life_fnc_handleInv;
[false,"RoadBlockWood",life_inv_marijuana] call life_fnc_handleInv;
[false,"RoadBlockConc",life_inv_marijuana] call life_fnc_handleInv;
[false,"RoadBlockRebel",life_inv_marijuana] call life_fnc_handleInv;



[localize "Przeszukiwanie zakonczone... wszystkie nielegalne przedimoty odebrane.", false] spawn domsg;
[5] call SOCK_fnc_updatePartial;

};



