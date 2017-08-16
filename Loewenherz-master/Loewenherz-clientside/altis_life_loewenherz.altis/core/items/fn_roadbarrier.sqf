Private["_roadbarrier","_position"];

if(!(playerSide in [west,independent])) exitWith {hint format["Du bist kein Cop oder medic %1",name player]};
if(vehicle player !=  player) exitWith{hint "Das geht nicht im Auto Opa!"};
_roadbarrier = "RoadBarrier_F" createvehicle [0,0,0];
_roadbarrier attachTo[player,[0,1.5,0.2]];
_roadbarrier setDir 0;
roadbarrier_placed = 0;

_deploy_roadbarrier = player addAction["<t color='#00FF00'>Roadbarrier aufstellen</t>",{player removeAction (_this select 2);roadbarrier_placed = 1;}];

waitUntil {roadbarrier_placed == 1};
player playMoveNow "AinvPknlMstpSnonWnonDnon_medic_1";
detach _roadbarrier;
_roadbarrier setpos [(getPos _roadbarrier select 0), (getPos _roadbarrier select 1)];
_roadbarrier allowDamage false;
roadbarrier_placed = 0;

hint format["Du hast eine Roadbarrier aufgestellt %1", name player];