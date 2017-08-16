/*
	COP UNIFORM SCRIPT
	Author: coldgas (http://altis.newhopeoutfit.de)
	Created for www.altisliferpg.com
*/

	#define __GETC__(var) (call var)
	// Special Uniforms cops can buy in shops. Add new 'if' for every classname you want the skin to be overwritten. (warning, does NOT work with every class!)
	
	if ((playerside == west)&&((uniform player) == "U_Rangemaster"))  then {
		[[player,0,"extras\textures\clothing\cop\HighwayCostume.paa"],"DS_fnc_globalTextureClothes",true,false] spawn DS_fnc_MP;
	};
		if ((uniform player) == "U_BG_Guerilla2_3")  then {
		[[player,0,"extras\textures\clothing\cop\hwaypatrol_U_BG_Guerilla2_2_by_MrKraken.jpg"],"DS_fnc_globalTextureClothes",true,false] spawn DS_fnc_MP;
	};
		if ((uniform player) == "U_Competitor")  then {
		[[player,0,"extras\textures\clothing\cop\PoliceOfficer.paa"],"DS_fnc_globalTextureClothes",true,false] spawn DS_fnc_MP;
	};
		if ((uniform player) == "U_B_CombatUniform_mcam")  then {
		[[player,0,"extras\textures\clothing\cop\Swat.paa"],"DS_fnc_globalTextureClothes",true,false] spawn DS_fnc_MP;
	};
		if ((uniform player) == "U_millerbody")  then {
		[[player,0,"extras\textures\clothing\cop\policeDylan.jpg"],"DS_fnc_globalTextureClothes",true,false] spawn DS_fnc_MP;
	};

if(player getVariable ["medic",false])then
	{
	//player setObjectTextureGlobal [0, "extras\textures\clothing\wlciv\medic_uniform.jpg"];
	[[player,0,"extras\textures\clothing\wlciv\medic_uniform.jpg"],"DS_fnc_globalTextureClothes",true,false] spawn DS_fnc_MP;
	};
	
if(player getVariable ["mechanic",false])then
	{
	//player setObjectTextureGlobal [0, "extras\textures\clothing\wlciv\mechanic_uniform.jpg"];
	[[player,0,"extras\textures\clothing\wlciv\mechanic_uniform.jpg"],"DS_fnc_globalTextureClothes",true,false] spawn DS_fnc_MP;
	};
	
if(player getVariable ["security",false])then
	{
	[[player,0,"extras\textures\clothing\wlciv\security_uniform.jpg"],"DS_fnc_globalTextureClothes",true,false] spawn DS_fnc_MP;
	//player setObjectTextureGlobal [0, "extras\textures\clothing\wlciv\security_uniform.jpg"];
	};
	
// call this script in as many files as possible, especially init_cop, init_civ and all files related to the cop-shop.