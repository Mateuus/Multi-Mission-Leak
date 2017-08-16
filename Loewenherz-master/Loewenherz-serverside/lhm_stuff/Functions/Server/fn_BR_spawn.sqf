/* 
 File: fn_BR_spawn.sqf 
 Author: Bloodwyn 
 
 Written for Loewenherz Altis RPG. Usage of this script is restricted to permitted servers e.g. Loewenherz 
 Ask us for permission to use this file www.lhzp.de 
 You're not allowed to modify this file! 
    Licensed under the Arma EULA and Arma Tools EULA. 
 
 Description: 
 Inits the Battle Royale. Should be moved on the server ;) 
*/ 
private ["_box"]; 
LHM_BR_boxestoclear=[]; 
LHM_BR_boxeswithloot=[]; 
LHM_BR_allObjs=[]; 
 
{ 
 _obj = createVehicle [(_x select 0), call compile (_x select 1), [], 0, "CAN_COLLIDE"]; if(_obj isKindOf "Box_NATO_Wps_F")then{LHM_BR_boxestoclear pushback _obj}; if(_obj isKindOf "Box_NATO_AmmoOrd_F")then{LHM_BR_boxestoclear pushback _obj; LHM_BR_boxeswithloot pushback _obj};if((_x select 4) == 1) then {_obj enableSimulation false; _obj allowdamage false;};_obj setdir (_x select 2);if((_x select 3) == -100) then {_obj setposATL (call compile (_x select 1))} else {_obj setposASL [((call compile (_x select 1)) select 0),((call compile (_x select 1)) select 1),(_x select 3)]};if((_x select 5) == 0) then {_obj setVectorUp [0,0,1]} else {_obj setVectorUp (surfacenormal (getPosATL _obj))}; LHM_BR_allObjs pushback _obj; 
}foreach 
[ 
["Land_Pier_F","[23524.666016,17827.794922,8.18505]",0,-100,1,0,[]], 
["Land_Pier_F","[23550.853516,17854.154297,8.18505]",270,-100,1,0,[]], 
["Land_Pier_F","[23482.984375,17827.798828,8.18505]",1.00179e-005,-100,1,0,[]], 
["Land_Pier_F","[23456.625,17853.986328,8.18505]",90,-100,1,0,[]], 
["Land_Pier_F","[23456.617188,17895.650391,8.18505]",90,-100,1,0,[]], 
["Land_Pier_F","[23482.804688,17922.00976563,8.18505]",180,-100,1,0,[]], 
["Land_Pier_F","[23524.498047,17922.0292969,8.18505]",180,-100,1,0,[]], 
["Land_Pier_F","[23550.857422,17895.841797,8.18505]",270,-100,1,0,[]], 
["Land_Shoot_House_Wall_Long_F","[23541.201172,17835.210938,0.117773]",360,-100,1,0,[]], 
["Land_Shoot_House_Wall_Long_F","[23543.119141,17837.146484,0.117773]",270,-100,1,0,[]], 
["Land_Shoot_House_Wall_Long_F","[23543.107422,17841.00195313,0.117773]",270,-100,1,0,[]], 
["Land_Shoot_House_Wall_Long_F","[23543.105469,17844.867188,0.117773]",270,-100,1,0,[]], 
["Land_Shoot_House_Wall_Long_F","[23537.322266,17846.757813,0.117773]",360,-100,1,0,[]], 
["Land_Shoot_House_Wall_Long_F","[23541.1875,17846.759766,0.117773]",360,-100,1,0,[]], 
["Land_Shoot_House_Wall_Long_F","[23533.464844,17846.767578,0.117773]",360,-100,1,0,[]], 
["Land_Shoot_House_Wall_Long_F","[23531.53125,17848.685547,0.117773]",450,-100,1,0,[]], 
["Land_Shoot_House_Wall_Long_F","[23527.757813,17852.941406,0.117773]",540,-100,1,0,[]], 
["Land_Shoot_House_Wall_Long_F","[23531.615234,17852.953125,0.117773]",540,-100,1,0,[]], 
["Land_Shoot_House_Wall_Long_F","[23533.548828,17851.0566406,0.117773]",630,-100,1,0,[]], 
["Land_Shoot_House_Wall_Long_F","[23540.976563,17839.0429688,0.117773]",270,-100,1,0,[]], 
["Land_Shoot_House_Wall_Long_F","[23539.0585938,17837.107422,0.117773]",360,-100,1,0,[]], 
["Land_Shoot_House_Wall_Long_F","[23540.964844,17842.898438,0.117773]",270,-100,1,0,[]], 
["Land_Shoot_House_Wall_Long_F","[23537.130859,17842.9375,0.117773]",90,-100,1,0,[]], 
["Land_Shoot_House_Wall_Long_F","[23539.0488281,17844.873047,0.117773]",180,-100,1,0,[]], 
["Land_Shoot_House_Wall_Long_F","[23537.386719,17849.367188,0.117773]",0,-100,1,0,[]], 
["Land_Shoot_House_Wall_Long_F","[23541.28125,17853.212891,0.117773]",180,-100,1,0,[]], 
["Land_Shoot_House_Wall_Long_F","[23537.425781,17853.201172,0.117773]",180,-100,1,0,[]], 
["Land_Shoot_House_Wall_Long_F","[23543.216797,17851.294922,0.117773]",270,-100,1,0,[]], 
["Land_Shoot_House_Wall_Long_F","[23535.451172,17851.285156,0.117773]",90,-100,1,0,[]], 
["Land_Shoot_House_Wall_Long_F","[23541.228516,17859.447266,0.117773]",180,-100,1,0,[]], 
["Land_Shoot_House_Wall_Long_F","[23537.333984,17855.601563,0.117773]",360,-100,1,0,[]], 
["Land_Shoot_House_Wall_Long_F","[23541.189453,17855.613281,0.117773]",360,-100,1,0,[]], 
["Land_Shoot_House_Wall_Long_F","[23535.398438,17857.519531,0.117773]",450,-100,1,0,[]], 
["Land_Shoot_House_Wall_Long_F","[23543.164063,17857.529297,0.117773]",270,-100,1,0,[]], 
["Land_Shoot_House_Wall_Long_Crouch_F","[23534.0859375,17854.476563,1.30353]",130,-100,1,0,[]], 
["Land_Shoot_House_Tunnel_Stand_F","[23533.914063,17860.410156,0]",90,-100,1,0,[]], 
["Land_Shoot_House_Tunnel_Stand_F","[23536.298828,17862.791016,0]",180,-100,1,0,[]], 
["CamoNet_OPFOR_big_Curator_F","[23502.404297,17876.0917969,2.38419e-007]",180,-100,1,0,[]], 
["Land_Chapel_V1_F","[23474.373047,17837.888672,0]",180,-100,1,0,[]], 
["Land_GH_Gazebo_F","[23502.517578,17889.1875,-0.287878]",180,-100,1,0,[]], 
["Land_FuelStation_Shed_F","[23503.382813,17864.150391,2.38419e-007]",180,-100,1,0,[]], 
["Land_Castle_01_wall_15_F","[23534.824219,17867.203125,-2.17092]",194.104,-100,1,0,[]], 
["Land_Canal_Wall_Stairs_F","[23463.539063,17847.273438,3.73059]",268.864,-100,1,0,[]], 
["Land_ConcretePipe_F","[23525.265625,17867.923828,0]",363.864,-100,1,0,[]], 
["Land_ConcretePipe_F","[23525.451172,17870.898438,0]",363.864,-100,1,0,[]], 
["Land_ConcretePipe_F","[23525.724609,17873.863281,0]",368.864,-100,1,0,[]], 
["Land_ConcretePipe_F","[23526.279297,17876.804688,0]",373.864,-100,1,0,[]], 
["Land_ConcretePipe_F","[23527.0722656,17879.685547,0]",378.864,-100,1,0,[]], 
["Land_ConcretePipe_F","[23528.128906,17882.449219,0]",383.864,-100,1,0,[]], 
["Land_ConcretePipe_F","[23529.410156,17885.130859,-2.38419e-007]",28.8637,-100,1,0,[]], 
["Land_BellTower_02_V2_F","[23468.1875,17908.615234,0]",358.864,-100,1,0,[]], 
["Land_MolonLabe_F","[23538.787109,17878.253906,-0.853535]",268.864,-100,1,0,[]], 
["Land_Kiosk_redburger_F","[23541.125,17888.417969,-2.38419e-007]",178.864,-100,1,0,[]], 
["Land_d_Windmill01_F","[23518.810547,17903.0898438,-2.38419e-007]",178.864,-100,1,0,[]], 
["Dirthump_1_F","[23495.0253906,17905.367188,0.258571]",178.864,-100,1,0,[]], 
["Zombie_PopUp_Moving_90deg_Acc1_NoPop_F","[23494.875,17905.679688,2.116]",358.864,-100,1,0,[]], 
["Land_Wreck_Plane_Transport_01_F","[23468.162109,17876.544922,-1.26336]",358.864,-100,1,0,[]], 
["Land_Grave_memorial_F","[23468.015625,17912.6875,0]",358.864,-100,1,0,[]], 
["Land_Factory_Tunnel_F","[23523.291016,17841.660156,-2.38419e-007]",180.077,-100,1,0,[]], 
["Land_Shoot_House_Wall_Long_F","[23533.259766,17839.00585938,0.117773]",450,-100,1,0,[]], 
["Land_Shoot_House_Wall_Long_F","[23535.193359,17837.0878906,0.117773]",360,-100,1,0,[]], 
["Land_Shoot_House_Wall_Long_F","[23535.277344,17841.376953,0.117773]",630,-100,1,0,[]], 
["Land_Shoot_House_Wall_Long_F","[23533.251953,17842.916016,0.117773]",270,-100,1,0,[]], 
["Land_Shoot_House_Wall_Long_F","[23531.318359,17844.833984,0.117773]",180,-100,1,0,[]], 
["Land_Shoot_House_Wall_Long_F","[23531.234375,17840.544922,0.117773]",450,-100,1,0,[]], 
["Land_i_House_Big_02_V1_F","[23489.142578,17840.412109,2.38419e-007]",180.077,-100,1,0,[]], 
["Land_i_House_Big_02_V3_F","[23489.119141,17854.607422,-0.108586]",180.077,-100,1,0,[]], 
["Land_i_House_Small_01_V1_F","[23476.951172,17850.550781,0]",180.077,-100,1,0,[]], 
["Land_LightHouse_F","[23514.53125,17874.109375,0.415825]",180.077,-100,1,0,[]], 
["Land_UWreck_MV22_F","[23535.425781,17907.513672,-0.034512]",35.077,-100,1,0,[]], 
["Land_Cargo_House_V1_F","[23512.535156,17839.369141,0]",180.077,-100,1,0,[]], 
["Land_cmp_Shed_dam_F","[23521.396484,17882.710938,0]",4.50878,-100,1,0,[]], 
["Land_Slum_House03_F","[23480.0644531,17894.628906,0]",359.509,-100,1,0,[]], 
["Land_Slum_House02_F","[23488.539063,17894.535156,0.0159932]",269.509,-100,1,0,[]], 
["Land_Slum_House01_F","[23488.0898438,17889.515625,0.0159932]",359.509,-100,1,0,[]], 
["Land_cargo_house_slum_F","[23482.455078,17890.623047,0.0159932]",359.509,-100,1,0,[]], 
["Land_cargo_addon01_V1_F","[23481.675781,17887.853516,0.0159931]",359.509,-100,1,0,[]], 
["Land_Slum_House03_F","[23485.257813,17884.753906,0]",154.509,-100,1,0,[]], 
["Land_d_Stone_HouseBig_V1_F","[23510.71875,17912.564453,2.38419e-007]",89.3951,-100,1,0,[]], 
["Land_i_Stone_HouseSmall_V3_F","[23500.466797,17846.00976563,-0.417211]",89.3951,-100,1,0,[]], 
["Land_i_Stone_HouseBig_V2_F","[23513.171875,17848.511719,2.38419e-007]",179.395,-100,1,0,[]], 
["Land_PartyTent_01_F","[23478.357422,17865.386719,-2.38419e-007]",224.395,-100,1,0,[]], 
["Land_cmp_Hopper_F","[23512.675781,17897.257813,0]",224.395,-100,1,0,[]], 
["Land_Shoot_House_Wall_Long_F","[23523.484375,17855.0527344,0.117773]",180,-100,1,0,[]], 
["Land_Shoot_House_Wall_Long_F","[23525.220703,17858.910156,0.117773]",270,-100,1,0,[]], 
["Land_Shoot_House_Wall_Long_F","[23522.621094,17862.832031,0.117773]",-90,-100,1,0,[]], 
["Land_Shoot_House_Wall_Long_F","[23524.759766,17864.628906,0.117773]",70,-100,1,0,[]], 
["Land_Shoot_House_Wall_Long_F","[23527.355469,17862.775391,0.117773]",180,-100,1,0,[]], 
["Land_Shoot_House_Wall_Long_F","[23527.394531,17855.0605469,0.117773]",360,-100,1,0,[]], 
["Land_Shoot_House_Wall_Long_F","[23529.292969,17860.859375,0.117773]",270,-100,1,0,[]], 
["Land_Shoot_House_Wall_Long_F","[23520.701172,17860.894531,0.117773]",0,-100,1,0,[]], 
["Land_Shoot_House_Wall_Long_F","[23523.300781,17856.976563,0.117773]",360,-100,1,0,[]], 
["Land_Shoot_House_Wall_Long_F","[23529.310547,17856.992188,0.117773]",270,-100,1,0,[]], 
["Land_Shoot_House_Wall_Long_F","[23520.929688,17858.994141,0.117773]",540,-100,1,0,[]], 
["Land_Shoot_House_Wall_Long_F","[23520.693359,17868.662109,0.117773]",180,-100,1,0,[]], 
["Land_Shoot_House_Wall_Long_F","[23518.785156,17862.871094,0.117773]",90,-100,1,0,[]], 
["Land_Shoot_House_Wall_Long_F","[23529.253906,17864.917969,0.117773]",180,-100,1,0,[]], 
["Land_Shoot_House_Wall_Long_F","[23518.914063,17866.714844,0.117773]",90,-100,1,0,[]], 
["Land_Cargo40_white_F","[23478.546875,17908.648438,0]",90,-100,1,0,[]], 
["Land_Cargo40_red_F","[23468.126953,17903.402344,0]",358.864,-100,1,0,[]], 
["Land_Cargo20_light_blue_F","[23474.257813,17909.714844,0]",88.8637,-100,1,0,[]], 
["Land_BagBunker_Large_F","[23529.212891,17891.923828,0]",198.864,-100,1,0,[]], 
["Land_Scrap_MRAP_01_F","[23529.886719,17870.693359,0]",278.611,-100,1,0,[]], 
["Land_Maroula_F","[23502.244141,17897.273438,0]",278.611,-100,1,0,[]], 
["Land_Castle_01_church_a_ruin_F","[23488.808594,17870.527344,0]",283.611,-100,1,0,[]], 
["Land_TouristShelter_01_F","[23496.455078,17914.380859,-2.38419e-007]",178.611,-100,1,0,[]], 
["Land_Kiosk_gyros_F","[23468.240234,17896.169922,-2.38419e-007]",88.6112,-100,1,0,[]], 
["Land_HBarrierBig_F","[23514.859375,17908.380859,0]",48.6112,-100,1,0,[]], 
["Land_BagBunker_Tower_F","[23484.171875,17911.662109,0]",180,-100,1,0,[]], 
["Land_New_WiredFence_10m_F","[23506.726563,17896.5625,0]",90,-100,1,0,[]], 
["Land_Slum_House03_F","[23493.123047,17897.306641,0]",90,-100,1,0,[]], 
["Land_cargo_addon02_V2_F","[23480.982422,17899.992188,0]",180,-100,1,0,[]], 
["Land_Tribune_F","[23483.494141,17874.335938,0]",195,-100,1,0,[]], 
["Land_AncientPillar_fallen_F","[23496.556641,17856.00390625,0]",0,-100,1,0,[]], 
["Land_Airport_center_F","[23490.816406,17825.298828,10.5976]",0,-100,1,0,[]], 
["Land_Airport_center_F","[23516.771484,17825.302734,10.5976]",0,-100,1,0,[]], 
["Land_Canal_Wall_10m_F","[23475.888672,17828.216797,15.4402]",90,-100,1,0,[]], 
["Land_Canal_Wall_10m_F","[23475.882813,17818.220703,15.4402]",90,-100,1,0,[]], 
["Land_Canal_Wall_10m_F","[23475.878906,17813.207031,15.4562]",90,-100,1,0,[]], 
["Land_Canal_Wall_10m_F","[23531.851563,17823.208984,15.4394]",-90,-100,1,0,[]], 
["Land_Canal_Wall_10m_F","[23531.855469,17828.222656,15.4553]",-90,-100,1,0,[]], 
["Land_Canal_Wall_10m_F","[23531.845703,17813.212891,15.4394]",270,-100,1,0,[]], 
["Box_NATO_AmmoOrd_F","[23462.435547,17916.103516,0]",50,-100,1,0,[]], 
["Box_NATO_AmmoOrd_F","[23536.990234,17876.582031,0]",50,-100,1,0,[]], 
["Box_NATO_AmmoOrd_F","[23537.619141,17844.232422,0]",70,-100,1,0,[]], 
["Box_NATO_AmmoOrd_F","[23540.417969,17844.3125,0]",125,-100,1,0,[]], 
["Box_NATO_AmmoOrd_F","[23514.576172,17835.705078,0.710846]",230,-100,1,0,[]], 
["Box_NATO_AmmoOrd_F","[23505.443359,17837.228516,0.789128]",230,-100,1,0,[]], 
["Box_NATO_AmmoOrd_F","[23486.972656,17841.486328,0.210845]",320,-100,1,0,[]], 
["Box_NATO_AmmoOrd_F","[23485.166016,17835.6875,3.59974]",320,-100,1,0,[]], 
["Box_NATO_AmmoOrd_F","[23463.876953,17837.787109,0.492882]",355,-100,1,0,[]], 
["Box_NATO_AmmoOrd_F","[23465.109375,17846.884766,4.14601]",355,-100,1,0,[]], 
["Box_NATO_AmmoOrd_F","[23481.892578,17874.357422,-0.0197448]",465,-100,1,0,[]], 
["Box_NATO_AmmoOrd_F","[23484.914063,17881.376953,-0.0348963]",600,-100,1,0,[]], 
["Box_NATO_AmmoOrd_F","[23480.763672,17895.369141,-0.0348963]",570,-100,1,0,[]], 
["Box_NATO_AmmoOrd_F","[23469.898438,17897.8125,-0.0348963]",570,-100,1,0,[]], 
["Box_NATO_AmmoOrd_F","[23508.115234,17915.287109,3.03207]",570,-100,1,0,[]], 
["Box_NATO_AmmoOrd_F","[23521.402344,17902.623047,3.35172]",570,-100,1,0,[]], 
["Box_NATO_AmmoOrd_F","[23513.328125,17848.472656,3.03185]",210,-100,1,0,[]], 
["Box_NATO_AmmoOrd_F","[23505.802734,17876.458984,0]",0,-100,1,0,[]], 
["Box_NATO_AmmoOrd_F","[23505.0800781,17878.269531,0]",-45,-100,1,0,[]], 
["Box_NATO_AmmoOrd_F","[23503.726563,17879.177734,0]",-70,-100,1,0,[]], 
["Box_NATO_AmmoOrd_F","[23502.242188,17878.986328,0]",-125,-100,1,0,[]], 
["Box_NATO_AmmoOrd_F","[23501.585938,17877.511719,0]",-165,-100,1,0,[]], 
["Box_NATO_AmmoOrd_F","[23501.863281,17875.773438,0]",-215,-100,1,0,[]], 
["Box_NATO_AmmoOrd_F","[23503.558594,17874.791016,0]",-265,-100,1,0,[]], 
["Box_NATO_AmmoOrd_F","[23505.0742188,17875.201172,0]",45,-100,1,0,[]], 
["Box_NATO_AmmoOrd_F","[23483.916016,17909.310547,2.77919]",-315,-100,1,0,[]], 
["Box_NATO_AmmoOrd_F","[23496.121094,17913.603516,-0.0227278]",-315,-100,1,0,[]], 
["Box_NATO_AmmoOrd_F","[23537.220703,17910.330078,0]",-315,-100,1,0,[]], 
["Box_NATO_AmmoOrd_F","[23542.873047,17907.0332031,0]",-315,-100,1,0,[]], 
["Box_NATO_AmmoOrd_F","[23541.730469,17889.078125,0]",45,-100,1,0,[]], 
["Box_NATO_AmmoOrd_F","[23513.4,17834.4,0]",45,-100,1,0,[]], 
["Box_NATO_AmmoOrd_F","[23520.1,17862.8,0]",45,-100,1,0,[]], 
["Box_NATO_AmmoOrd_F","[23480.5,17899.4,0]",45,-100,1,0,[]], 
["Box_NATO_AmmoOrd_F","[23469.4,17893.2,0.0750017]",45,-100,1,0,[]], 
["Box_NATO_AmmoOrd_F","[23483.5,17852.1,0]",45,-100,1,0,[]], 
["Box_NATO_AmmoOrd_F","[23467,17851.6,0]",45,-100,1,0,[]], 
["Box_NATO_AmmoOrd_F","[23480.5,17853.3,0.273491]",45,-100,1,0,[]], 
["Sign_Arrow_F","[23490.7,17820.5,10.609]",0,-100,1,0,[]], 
["Sign_Arrow_Blue_F","[23522.6,17820.3,10.609]",0,-100,1,0,[]] 
]; 
 
Event_BR_info setPosATL [23510.7,17824.5,9.68]; 
Event_BR_info setDir 0; 
Event_BR_info setVectorUp [0,0,1]; 
 
_startTrigger = createTrigger ["EmptyDetector", [23490.7,17820.5,10.609]]; 
_startTrigger setTriggerArea [1, 1, 0, false]; 
_startTrigger setTriggerActivation ["ANY", "PRESENT", true]; 
_startTrigger setTriggerStatements ["this"," 
if((count thisList > 0) && !(isnull(thisList select 0)))then{ 
 if((Gericht_1 getVariable ['LHM_BR_eventstarted',true]) || (count(Gericht_1 getVariable ['LHM_BR_members',[]]))>29 || (count(Gericht_1 getVariable ['LHM_BR_availablespawns',[]]) == 0))then{ 
  [[[],{ titleText ['Das Event hat bereits angefangen, oder es sind alle Plaetze belegt!','PLAIN']}],'BIS_FNC_SPAWN',(thisList select 0),false] call lhm_fnc_mp; 
 }else{ 
  [[],'LHM_fnc_brstartspawn',(thisList select 0),false] call LHM_fnc_mp; 
 }; 
}; 
",""]; 
LHM_BR_allObjs pushback _startTrigger; 
 
_respawnTrigger = createTrigger ["EmptyDetector", [23522.6,17820.3,10.609]]; 
_respawnTrigger setTriggerArea [1, 1, 0, false]; 
_respawnTrigger setTriggerActivation ["ANY", "PRESENT", true]; 
_respawnTrigger setTriggerStatements ["this", "if((count thisList > 0) && !(isnull(thisList select 0)))then{[[],'LHM_fnc_brendspawn',thisList,false]call LHM_fnc_mp};",""]; 
 
LHM_BR_allObjs pushback _respawnTrigger; 
 
 
0 spawn LHM_fnc_BR_reset;