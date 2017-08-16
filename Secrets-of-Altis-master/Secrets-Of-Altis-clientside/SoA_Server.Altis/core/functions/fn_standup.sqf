
_chair = nearestobjects [player,["Land_Bench_F","Land_Bench_01_F","Land_Bench_02_F","Land_CampingChair_V1_F","Land_CampingChair_V2_F","Land_ChairPlastic_F","Land_ChairWood_F","Land_rattanChair_01_F"],2] select 0;

[player, ""] remoteExecCall ["switchmove",0];
detach player;
player setpos (player modeltoworld [0,1,0]);
life_action_sitzt = false;
_chair setvariable ["alreadySitting",false,true];