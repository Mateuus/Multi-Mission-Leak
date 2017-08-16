//FUNCTIONS
open_house_inventory = compile preprocessFile "core\eMonkeys\houseinventory\functions\open_house_inventory.sqf";
//Get Data
create_playergear_array = compile preprocessFile "core\eMonkeys\houseinventory\functions\create_playergear_array.sqf";

update_dbgear_array = compile preprocessFile "core\eMonkeys\houseinventory\functions\update_dbgear_array.sqf";
set_dbgear_array = compile preProcessFile "core\eMonkeys\houseinventory\functions\set_dbgear_array.sqf";
//Format
is_in_string = compile preprocessFile "core\eMonkeys\houseinventory\functions\is_in_string.sqf";
delete_from_1dim = compile preprocessFile "core\eMonkeys\houseinventory\functions\delete_from_1dim.sqf";
write_in_1dim = compile preprocessFile "core\eMonkeys\houseinventory\functions\write_in_1dim.sqf";
delete_from_2dim = compile preprocessFile "core\eMonkeys\houseinventory\functions\delete_from_2dim.sqf";
write_in_2dim = compile preprocessFile "core\eMonkeys\houseinventory\functions\write_in_2dim.sqf";

//VARS

house_inventar_restricted_items = ["srifle_GM6_F","launch_B_Titan_F","launch_B_Titan_short_F","srifle_DMR_02_sniper_F","srifle_DMR_03_tan_F","srifle_DMR_06_camo_F","arifle_MXM_F","LMG_Mk200_F","hgun_P07_snds_F","hgun_PDW2000_F","SMG_01_F","SMG_02_F","arifle_SDAR_F","arifle_Mk20_F","arifle_TRG20_F","arifle_TRG21_F","arifle_MXC_Black_F","arifle_MX_Black_F","arifle_MX_GL_Black_F","arifle_MX_SW_Black_F","arifle_MXM_Black_F","srifle_EBR_F","srifle_DMR_01_F","arifle_Katiba_C_F","arifle_Katiba_F","arifle_Katiba_GL_F","arifle_Mk20C_F","hgun_PDW2000_F","hgun_Rook40_F","hgun_Pistol_heavy_01_F","hgun_Pistol_heavy_02_F","hgun_ACPC2_F"];
