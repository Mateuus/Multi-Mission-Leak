/*
	COP UNIFORM SCRIPT
	Author: coldgas (http://altis.newhopeoutfit.de)
	Created for www.altisliferpg.com
*/

private ["_uniform"];

_uniform = (uniform player);

if((_uniform isEqualTo "U_Rangemaster")&&(playerSide isEqualTo west))exitWith {
	[player,0,"extras\textures\clothing\cop\HighwayCostume.paa"] remoteExec ["DS_fnc_globalTextureClothes",0];
	//player setObjectTextureGlobal [0,"extras\textures\clothing\cop\HighwayCostume.paa"];
};

if(_uniform isEqualTo "U_BG_Guerilla2_3")exitWith {
	[player,0,"extras\textures\clothing\cop\hwaypatrol_U_BG_Guerilla2_2_by_MrKraken.jpg"] remoteExec ["DS_fnc_globalTextureClothes",0];
	//player setObjectTextureGlobal [0,"extras\textures\clothing\cop\hwaypatrol_U_BG_Guerilla2_2_by_MrKraken.jpg"];
};

if(_uniform isEqualTo "U_B_CombatUniform_mcam")exitWith {
	[player,0,"extras\textures\clothing\cop\Swat.paa"] remoteExec ["DS_fnc_globalTextureClothes",0];
	//player setObjectTextureGlobal [0,"extras\textures\clothing\cop\Swat.paa"];
};

if(player getVariable ["medic",false])exitWith {
	[player,0,"extras\textures\clothing\wlciv\medic_uniform.jpg"] remoteExec ["DS_fnc_globalTextureClothes",0];
	//player setObjectTextureGlobal [0,"extras\textures\clothing\wlciv\medic_uniform.jpg"];
};

if(player getVariable ["mechanic",false])exitWith {
	[player,0,"extras\textures\clothing\wlciv\mechanic_uniform.jpg"] remoteExec ["DS_fnc_globalTextureClothes",0];
	//player setObjectTextureGlobal [0,"extras\textures\clothing\wlciv\mechanic_uniform.jpg"];
};

if(player getVariable ["security",false])exitWith {
	[player,0,"extras\textures\clothing\wlciv\security_uniform.jpg"] remoteExec ["DS_fnc_globalTextureClothes",0];
	//player setObjectTextureGlobal [0,"extras\textures\clothing\wlciv\security_uniform.jpg"];
};