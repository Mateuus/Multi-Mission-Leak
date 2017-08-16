life_badGearList = [ 
"SLAMDirectionalMine_Wire_Mag", 
"ATMine_Range_Mag", 
"APERSMine_Range_Mag", 
"APERSTripMine_Wire_Mag", 
"ClaymoreDirectionalMine_Remote_Mag", 
"SatchelCharge_Remote_Mag", 
"DemoCharge_Remote_Mag", 
"7Rnd_408_Mag", 
"5Rnd_127x108_Mag", 
"5Rnd_127x108_APDS_Mag", 
"100Rnd_65x39_caseless_mag", 
"200Rnd_65x39_cased_Box", 
"200Rnd_65x39_cased_Box_Tracer", 
"200Rnd_65x39_Belt_Tracer_Red", 
"200Rnd_65x39_Belt_Tracer_Green", 
"200Rnd_65x39_Belt_Tracer_Yellow", 
"RPG32_F", 
"RPG32_HE_F", 
"NLAW_F", 
"1Rnd_HE_Grenade_shell", 
"3Rnd_HE_Grenade_shell", 
"launch_NLAW_F", 
"launch_RPG32_F", 
"srifle_GM6_F", 
"srifle_GM6_SOS_F", 
"srifle_LRR_F", 
"srifle_LRR_SOS_F", 
"LMG_Mk200_F", 
"LMG_Mk200_MRCO_F", 
"LMG_Mk200_pointer_F", 
"launch_B_Titan_F", 
"launch_I_Titan_F", 
"launch_O_Titan_F", 
"launch_Titan_F", 
"launch_B_Titan_short_F", 
"launch_I_Titan_short_F", 
"launch_O_Titan_short_F", 
"launch_Titan_short_F", 
"LMG_Zafir_F", 
"LMG_Zafir_pointer_F", 
"srifle_GM6_LRPS_F", 
"srifle_LRR_LRPS_F", 
"arifle_MX_SW_F", 
"arifle_MXM_F", 
"arifle_MXC_F", 
"arifle_MX_F", 
"arifle_MX_SW_Black_F", 
"arifle_MX_GL_F", 
"arifle_MX_GL_Black_F", 
"arifle_Katiba_GL_F", 
"arifle_TRG21_GL_F", 
"arifle_Mk20_GL_F", 
"muzzle_snds_H", 
"muzzle_snds_M", 
"muzzle_snds_B", 
"muzzle_snds_H_MG", 
"muzzle_snds_acp", 
"optic_SOS", 
"optic_DMS", 
"optic_LRPS", 
"optic_NVS", 
"optic_Nightstalker", 
"optic_tws", 
"optic_tws_mg" 
]; 
 
{ 
scopeName "loop"; 
_player = _x; 
{ 
{ 
if (typeName _x == "ARRAY") then { 
_x = _x select 0; 
}; 
if (_x in life_badGearList) then { 
[[912, _player, format["Illegal equipment detected! %1",_x]],"ASY_fnc_logIt",false,false] spawn life_fnc_MP; 
breakOut "loop"; 
}; 
} forEach _x + (magazines _player); 
} forEach weaponsItems _player; 
} forEach allUnits;