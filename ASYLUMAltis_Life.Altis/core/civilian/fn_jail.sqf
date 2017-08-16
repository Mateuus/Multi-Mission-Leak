/*
	File: fn_jail.sqf
	Author: Bryan "Tonic" Boardwine & John "Paratus" VanderZwet
	
	Description:
	Starts the initial process of jailing.
*/
private ["_jail","_jailSpawn","_jailRelease"];

if(life_is_arrested) exitWith {}; //Already arrested
player setVariable["restrained",nil,true];
player setVariable["Escorting",nil,true];
player setVariable["transporting",nil,true];
[[player,false],"life_fnc_setRestrained",false,false] spawn BIS_fnc_MP;
life_disable_actions = false;
titleText["You have been arrested, wait your time out. If you attempt to respawn or reconnect your time will increase!","PLAIN"];
hint "For being arrested you have lost the following licenses if you own them\n\nFirearms License";

_jailSpawn = "jail_marker2";
_jailRelease = "jail_release2";

_jailPos = (getMarkerPos _jailSpawn);
_jailPos set [2, 0.45];

player setPosATL _jailPos;

//Check to make sure they goto check
if(player distance _jailPos > 38) then
{
	player setPosATL _jailPos;
};

license_civ_gun = false;
license_civ_bounty = false;
if(life_inv_heroinu > 0) then {[false,"heroinu",life_inv_heroinu] call life_fnc_handleInv;};
if(life_inv_heroinp > 0) then {[false,"heroinp",life_inv_heroinp] call life_fnc_handleInv;};
if(life_inv_coke > 0) then {[false,"cocaine",life_inv_coke] call life_fnc_handleInv;};
if(life_inv_cokep > 0) then {[false,"cocainep",life_inv_cokep] call life_fnc_handleInv;};
if(life_inv_turtle > 0) then {[false,"turtle",life_inv_turtle] call life_fnc_handleInv;};
if(life_inv_cannabis > 0) then {[false,"cannabis",life_inv_cannabis] call life_fnc_handleInv;};
if(life_inv_marijuana > 0) then {[false,"marijuana",life_inv_marijuana] call life_fnc_handleInv;};
if(life_inv_lockpick > 0) then {[false,"lockpick",life_inv_lockpick] call life_fnc_handleInv;};
if(life_inv_ephedra > 0) then {[false,"ephedra",life_inv_ephedra] call life_fnc_handleInv;};
if(life_inv_meth > 0) then {[false,"meth",life_inv_meth] call life_fnc_handleInv;};
if(life_inv_ziptie > 0) then {[false,"ziptie",life_inv_ziptie] call life_fnc_handleInv;};
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
life_is_arrested = true;
player setVariable ["arrested", true, true];
removeAllWeapons player;
{player removeMagazine _x} foreach (magazines player);
if (uniform player in ["U_Rangemaster","U_B_CombatUniform_mcam_worn"]) then {removeUniform player;};
if (vest player in ["V_HarnessOGL_brn"]) then {removeVest player;};
player switchMove "AmovPercMstpSnonWnonDnon";
player playMoveNow "AmovPercMstpSnonWnonDnon";

[[player,_jailSpawn,_jailRelease],"life_fnc_jailSys",false,false] spawn BIS_fnc_MP;
[] call life_fnc_sessionUpdate;
[[getPlayerUID player],"life_fnc_removeBounty",true,false] spawn BIS_fnc_MP;