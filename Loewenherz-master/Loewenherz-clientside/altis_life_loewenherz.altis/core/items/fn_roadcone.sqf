Private["_roadcone","_position"];

if(!(playerSide in [west,independent])) exitWith {hint format["Du bist kein Cop %1",name player]};
if(vehicle player !=  player) exitWith{hint "Das geht nicht im Auto Opa!"};
_roadcone = "Roadcone_L_F" createvehicle [0,0,0];
_roadcone attachTo[player,[0,1.5,0.2]];
_roadcone setDir 0;
roadcone_placed = 0;

_deploy_roadcone = player addAction["<t color='#00FF00'>Roadcone aufstellen</t>",{player removeAction (_this select 2);roadcone_placed = 1;}];

waitUntil {roadcone_placed == 1};
player playMoveNow "AinvPknlMstpSnonWnonDnon_medic_1";

detach _roadcone;
_roadcone setpos [(getPos _roadcone select 0), (getPos _roadcone select 1)];
_roadcone allowDamage false;
roadcone_placed = 0;

hint format["Du hast einen Roadcone aufgestellt %1", name player];