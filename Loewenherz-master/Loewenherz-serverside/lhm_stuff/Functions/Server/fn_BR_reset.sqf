/* 
 File: fn_BR_reset.sqf 
 Author: Bloodwyn 
 
 Written for Loewenherz Altis RPG. Usage of this script is restricted to permitted servers e.g. Loewenherz 
 Ask us for permission to use this file www.lhzp.de 
 You're not allowed to modify this file! 
    Licensed under the Arma EULA and Arma Tools EULA. 
 
 Description: 
 Resets the Battle Royale. 
*/ 
 
_spawnsconfig=[ 
[23528.3,17862.4,0.00143886], 
[23530.9,17849.3,0.00143886], 
[23541.8,17837,0.00143886], 
[23544.7,17841.8,0.00143886], 
[23526.4,17863.1,0.00143886], 
[23529.4,17890.9,0.00143886], 
[23490.5,17893.2,0.00143886], 
[23468.6,17899,0.00143862], 
[23467.5,17911.3,0.00182509], 
[23483.9,17909.3,0.00143886], 
[23495.2,17895.6,0.00143886], 
[23513.8,17915.7,0.00143886], 
[23509.9,17847,0.00143409], 
[23492.2,17833.8,0.00143886], 
[23480.4,17841.3,0.00143862], 
[23466,17843.5,0.00143886], 
[23473.7,17846.5,0.00143814], 
[23518.2,17902,0.00170231], 
[23519.6,17883,0.00143886], 
[23490.7,17857,0.152108], 
[23520.8,17861.8,0.00143886], 
[23514.3,17876.3,0.00143433], 
[23513.2,17876.7,0.00143814], 
[23484.8,17884.6,0.00143886], 
[23527.9,17890.7,0.00143886], 
[23504.1,17854.8,0.00145674], 
[23485.1,17850.6,0.00143886], 
[23464.2,17878.9,0.00143886], 
[23529.2,17868,0.00143886], 
[23511,17836.9,0.00143886] 
]; 
 
_lootconfig=[ 
["srifle_GM6_F","5Rnd_127x108_Mag","5Rnd_127x108_Mag"], 
["hgun_ACPC2_F","9Rnd_45ACP_Mag","9Rnd_45ACP_Mag","9Rnd_45ACP_Mag","FirstAidKit"], 
["hgun_ACPC2_F","9Rnd_45ACP_Mag","9Rnd_45ACP_Mag","9Rnd_45ACP_Mag"], 
["arifle_Katiba_C_F","30Rnd_65x39_caseless_green","30Rnd_65x39_caseless_green"], 
["arifle_Katiba_C_F","30Rnd_65x39_caseless_green","30Rnd_65x39_caseless_green","30Rnd_65x39_caseless_green"], 
["arifle_Katiba_C_F","30Rnd_65x39_caseless_green","V_TacVest_khk"], 
["30Rnd_65x39_caseless_green","30Rnd_65x39_caseless_green","30Rnd_65x39_caseless_green","30Rnd_65x39_caseless_green"], 
["arifle_Katiba_C_F","30Rnd_65x39_caseless_green","30Rnd_65x39_caseless_green","30Rnd_65x39_caseless_green","30Rnd_65x39_caseless_green"], 
["arifle_MX_F","30Rnd_65x39_caseless_mag_Tracer","U_I_Wetsuit"], 
["arifle_MX_F","30Rnd_65x39_caseless_mag_Tracer","30Rnd_65x39_caseless_mag_Tracer","30Rnd_65x39_caseless_mag_Tracer"], 
["SMG_01_F","30Rnd_45ACP_Mag_SMG_01_tracer_green","30Rnd_45ACP_Mag_SMG_01_tracer_green"], 
["arifle_TRG21_F","30Rnd_556x45_Stanag"], 
["hgun_Pistol_heavy_02_Yorris_F","6Rnd_45ACP_Cylinder","6Rnd_45ACP_Cylinder"], 
["hgun_Pistol_heavy_01_MRD_F","11Rnd_45ACP_Mag","U_IG_Guerilla2_2"], 
["srifle_DMR_06_camo_F","20Rnd_762x51_Mag"], 
["srifle_DMR_06_camo_F","20Rnd_762x51_Mag","20Rnd_762x51_Mag"], 
["srifle_DMR_06_camo_F","20Rnd_762x51_Mag","20Rnd_762x51_Mag","20Rnd_762x51_Mag","20Rnd_762x51_Mag"], 
["9Rnd_45ACP_Mag","9Rnd_45ACP_Mag","30Rnd_45ACP_Mag_SMG_01_tracer_green","U_NikosAgedBody"], 
["U_C_Driver_2","V_TacVest_khk","30Rnd_65x39_caseless_green"], 
["H_HelmetIA_camo","U_IG_Guerilla2_2","V_TacVest_khk"], 
["U_I_Wetsuit","U_B_CombatUniform_mcam_vest"], 
["30Rnd_556x45_Stanag_Tracer_Yellow","30Rnd_556x45_Stanag_Tracer_Yellow"], 
["optic_MRCO","30Rnd_65x39_caseless_green","5Rnd_127x108_Mag"], 
["optic_Holosight","FirstAidKit","30Rnd_556x45_Stanag_Tracer_Yellow"], 
["optic_Arco","FirstAidKit","FirstAidKit","5Rnd_127x108_Mag"], 
["FirstAidKit","FirstAidKit","30Rnd_65x39_caseless_green","U_IG_Guerilla2_2"] 
]; 
 
 
{ 
clearWeaponCargoGlobal _x; 
clearMagazineCargoGlobal _x; 
clearItemCargoGlobal _x; 
clearBackpackCargoGlobal _x; 
_x enableSimulation true; 
}foreach LHM_BR_boxestoclear; 
 
{ 
 _box=LHM_BR_boxeswithloot select _forEachIndex; 
 {_box addItemCargoGlobal [_x, 1];}foreach (selectRandom _lootconfig); 
}foreach LHM_BR_boxeswithloot; 
 
 
Gericht_1 setVariable ["LHM_BR_availablespawns",_spawnsconfig,true]; 
Gericht_1 setVariable ["LHM_BR_eventstarted",false,true]; 
Gericht_1 setVariable ["LHM_BR_members",[],true]; 
 
 
 
//hui, it starts. 
 
waituntil {(Gericht_1 getVariable ['LHM_BR_eventstarted',true])}; 
 while{(count(Gericht_1 getVariable ["LHM_BR_members",[]]))>1}do{ 
  { 
   if(!alive _x || isnil "_x" || (_x distance [23510.6,17820.5,10.6])>1000)then{ 
 
    Gericht_1 setVariable ["LHM_BR_members",(Gericht_1 getVariable ["LHM_BR_members",[]])-[_x],true]; 
    if(!isnil "_x" && !(isnull _x) && (_x in allplayers) && typeName _x == "OBJECT") then{ 
     [[],"lhm_fnc_brdied",_x,false] call lhm_fnc_mp; 
    }; 
   }; 
  }foreach (Gericht_1 getVariable ["LHM_BR_members",[]]); 
  sleep 0.5; 
 }; 
 
_winner=(Gericht_1 getVariable ["LHM_BR_members",[]]) select 0; 
 
if((!(isnull _winner) || !(isNil "_winner")) && (count (Gericht_1 getVariable ["LHM_BR_members",[]]) == 1))then{ 
 _winner setPosATL [23510.6,17820.5,10.6]; 
 [[[name _winner],{ titleText [format["%1 gewinnt das BattleRoyale!",_this select 0],"PLAIN"]}],"BIS_FNC_SPAWN",true,false] call lhm_fnc_mp; 
 [[],"lhm_fnc_brdied",_winner,false] call lhm_fnc_mp; 
}else{ 
 {_x setPosATL [23510.6,17820.5,10.6];}foreach(Gericht_1 getVariable ["LHM_BR_members",[]]); 
 [[{ titleText ["BattleRoyal hat wohl niemand gewonnen?","PLAIN"]}],"BIS_FNC_SPAWN",true,false] call lhm_fnc_mp; 
}; 
 
0 spawn LHM_fnc_BR_reset;