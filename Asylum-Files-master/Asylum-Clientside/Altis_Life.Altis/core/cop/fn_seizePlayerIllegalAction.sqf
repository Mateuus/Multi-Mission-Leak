/*
	File: fn_seizePlayerIllegalAction.sqf
	Author: Skalicon

	Description:
	Removes the players weapons client side
*/
private ["_exempt"];
_exempt = ["Binocular", "ItemWatch", "ItemCompass", "ItemGPS", "ItemMap", "NVGoggles", "FirstAidKit", "ToolKit"];
{
	if(!(_x in _exempt)) then {
		player removeWeapon _x;
	};
} foreach weapons player;
{
	if(!(_x in _exempt)) then {
		player removeItemFromUniform _x;
	};
} foreach uniformItems player;
{
	if(!(_x in _exempt)) then {
		player removeItemFromVest _x;
	};
} foreach vestItems player;
{
	if(!(_x in _exempt)) then {
		player removeItemFromBackpack _x;
	};
} foreach backpackItems player;
{player removeMagazine _x} forEach magazines player;
if (uniform player in ["U_Competitor","U_Rangemaster","U_B_CombatUniform_mcam_worn"]) then {removeUniform player;};
if (vest player in ["V_HarnessOGL_brn","V_TacVest_blk_POLICE"]) then {removeVest player;};
if (headgear player in ["H_CrewHelmetHeli_B", "H_Cap_police"]) then {removeHeadgear player;};
if (goggles player in ["G_Aviator"]) then {removeGoggles player;};
// if player is wearing cop NVGs, remove them
if (hmd player == "NVGoggles_OPFOR") then {
	player unassignItem "NVGoggles_OPFOR";
    player removeItem "NVGoggles_OPFOR";
};

license_civ_gun = false;
if(life_inv_pcp > 0) then {[false,"pcp",life_inv_pcp] call life_fnc_handleInv;};
if(life_inv_heroinu > 0) then {[false,"heroinu",life_inv_heroinu] call life_fnc_handleInv;};
if(life_inv_heroinp > 0) then {[false,"heroinp",life_inv_heroinp] call life_fnc_handleInv;};
if(life_inv_coke > 0) then {[false,"cocaine",life_inv_coke] call life_fnc_handleInv;};
if(life_inv_cokep > 0) then {[false,"cocainep",life_inv_cokep] call life_fnc_handleInv;};
if(life_inv_cokepure > 0) then {[false,"cocainepure",life_inv_cokepure] call life_fnc_handleInv;};
if(life_inv_turtle > 0) then {[false,"turtle",life_inv_turtle] call life_fnc_handleInv;};
if (!(life_configuration select 2)) then
{
	if(life_inv_cannabis > 0) then {[false,"cannabis",life_inv_cannabis] call life_fnc_handleInv;};
	if(life_inv_marijuanam > 0) then {[false,"marijuanam",life_inv_marijuanam] call life_fnc_handleInv;};
};
if(life_inv_marijuana > 0) then {[false,"marijuana",life_inv_marijuana] call life_fnc_handleInv;};
if(life_inv_lockpick > 0) then {[false,"lockpick",life_inv_lockpick] call life_fnc_handleInv;};
if(life_inv_ephedra > 0) then {[false,"ephedra",life_inv_ephedra] call life_fnc_handleInv;};
if(life_inv_ephedrau > 0) then {[false,"ephedrau",life_inv_ephedrau] call life_fnc_handleInv;};
if(life_inv_meth > 0) then {[false,"meth",life_inv_meth] call life_fnc_handleInv;};
if(life_inv_lockpick > 0) then {[false,"lockpick",life_inv_lockpick] call life_fnc_handleInv;};
if(life_inv_ziptie > 0) then {[false,"ziptie",life_inv_ziptie] call life_fnc_handleInv;};
if(life_inv_speedbomb > 0) then {[false,"speedbomb",life_inv_speedbomb] call life_fnc_handleInv;};
if(life_inv_demoCharge > 0) then {[false,"demoCharge",life_inv_demoCharge] call life_fnc_handleInv;};
if(life_inv_goldbar > 0) then {[false,"goldbar",life_inv_goldbar] call life_fnc_handleInv;};
if(life_inv_dirty_money > 0) then {[false,"dirty_money",life_inv_dirty_money] call life_fnc_handleInv;};
if(life_inv_boltCutter > 0) then {[false,"boltCutter",life_inv_boltCutter] call life_fnc_handleInv;};
if(life_inv_drill > 0) then {[false,"drill",life_inv_drill] call life_fnc_handleInv;};
if(life_inv_blindfold > 0) then {[false,"blindfold",life_inv_blindfold] call life_fnc_handleInv;};
if(life_inv_moonshine > 0) then {[false,"moonshine",life_inv_moonshine] call life_fnc_handleInv;};
if(life_inv_whiskeyc_0 > 0) then {[false,"whiskeyc_0",life_inv_whiskeyc_0] call life_fnc_handleInv;};
if(life_inv_whiskeyc_1 > 0) then {[false,"whiskeyc_1",life_inv_whiskeyc_1] call life_fnc_handleInv;};
if(life_inv_whiskeyc_2 > 0) then {[false,"whiskeyc_2",life_inv_whiskeyc_2] call life_fnc_handleInv;};
if(life_inv_whiskeyc_3 > 0) then {[false,"whiskeyc_3",life_inv_whiskeyc_3] call life_fnc_handleInv;};
if(life_inv_whiskeyr_0 > 0) then {[false,"whiskeyr_0",life_inv_whiskeyr_0] call life_fnc_handleInv;};
if(life_inv_whiskeyr_1 > 0) then {[false,"whiskeyr_1",life_inv_whiskeyr_1] call life_fnc_handleInv;};
if(life_inv_whiskeyr_2 > 0) then {[false,"whiskeyr_2",life_inv_whiskeyr_2] call life_fnc_handleInv;};
if(life_inv_whiskeyr_3 > 0) then {[false,"whiskeyr_3",life_inv_whiskeyr_3] call life_fnc_handleInv;};
if(life_inv_scotch_0 > 0) then {[false,"scotch_0",life_inv_scotch_0] call life_fnc_handleInv;};
if(life_inv_scotch_1 > 0) then {[false,"scotch_1",life_inv_scotch_1] call life_fnc_handleInv;};
if(life_inv_scotch_2 > 0) then {[false,"scotch_2",life_inv_scotch_2] call life_fnc_handleInv;};
if(life_inv_scotch_3 > 0) then {[false,"scotch_3",life_inv_scotch_3] call life_fnc_handleInv;};
if(life_inv_gingerale_0 > 0) then {[false,"gingerale_0",life_inv_gingerale_0] call life_fnc_handleInv;};
if(life_inv_gingerale_1 > 0) then {[false,"gingerale_1",life_inv_gingerale_1] call life_fnc_handleInv;};
if(life_inv_gingerale_2 > 0) then {[false,"gingerale_2",life_inv_gingerale_2] call life_fnc_handleInv;};
if(life_inv_gingerale_3 > 0) then {[false,"gingerale_3",life_inv_gingerale_3] call life_fnc_handleInv;};
if(life_inv_rum_0 > 0) then {[false,"rum_0",life_inv_rum_0] call life_fnc_handleInv;};
if(life_inv_rum_1 > 0) then {[false,"rum_1",life_inv_rum_1] call life_fnc_handleInv;};
if(life_inv_rum_2 > 0) then {[false,"rum_2",life_inv_rum_2] call life_fnc_handleInv;};
if(life_inv_rum_3 > 0) then {[false,"rum_3",life_inv_rum_3] call life_fnc_handleInv;};
if(life_inv_cocaleaf > 0) then {[false,"cocaleaf",life_inv_cocaleaf] call life_fnc_handleInv;};
if(life_inv_cocapaste > 0) then {[false,"cocapaste",life_inv_cocapaste] call life_fnc_handleInv;};
//[] call life_fnc_civFetchGear;
[] call life_fnc_sessionUpdate; //Should make weapon remove persistent
//[] call life_fnc_civLoadGear;
if(param[0,true]) then {titleText["Your weapons and illegal items have been seized.","PLAIN"]};