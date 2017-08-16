#include "..\..\macros.hpp"
/*
	File: fn_equipTextures.sqf
	Author: Division Wolf e.V. - Sandmann
	
	Description:
	Initializes custom gear textures

*/
private["_path","_unit","_type","_groupID"];
_unit = param [0,ObjNull,[ObjNull]];
_type = param [1,"",[""]];

if((side player) == west) then
{
	switch(_type) do
	{
		case "U_BG_Guerilla2_1" :
		{
			_unit setObjectTextureGlobal [0,'textures\kleidung\cop\Oberkommissar.paa'];
		};

		case "U_B_CombatUniform_mcam" :
		{
			if((__GETC__(DWEV_coplevel) >= 3)) then
			{
				_unit setObjectTextureGlobal [0,'textures\kleidung\cop\sek.paa'];
			};
		};

		case "U_BG_Guerilla2_2" :
		{
			if((__GETC__(DWEV_coplevel) >= 6)) then
			{
			_unit setObjectTextureGlobal [0,'textures\kleidung\cop\uniform_schwarz.paa'];
			};
		};
		case "U_IG_Guerilla2_2" :
		{
			_unit setObjectTextureGlobal [0,'textures\kleidung\civ\combatlog.paa'];
		};
		
		case "B_Carryall_cbr" :
		{
			unitBackpack player setObjectTextureGlobal [0, ""];
		};
	};
};

if((side player) == civilian) then
{
	_groupID = grpPlayer getVariable["gang_id",-1];
	switch(_type) do
	{
		case "U_C_Scientist" :
		{	
			_unit setObjectTextureGlobal [0,'textures\kleidung\civ\schutzanzug.paa'];
		};
		
		case "U_IG_Guerilla2_1" :
		{
			_unit setObjectTextureGlobal [0,'textures\kleidung\civ\Jail.paa'];
		};
		
		case "U_C_Poloshirt_blue" :
		{
			if (lc_girl) then
			{
				_unit setObjectTextureGlobal [0,'textures\kleidung\civ\kitty.paa'];
			};
/*			
			if (_groupID == 846 && (__GETC__(DWEV_viplevel) >= 1)) then // Beispiel HPA
			{
			_unit setObjectTextureGlobal [0,'textures\vehicles\vip\camo_blau.paa'];
			};
			
			if((getPlayerUID player) in ["76561197999060849","76561198134887934"]) // einzel spieler eispiel Kai & Markus
			{
			_unit setObjectTextureGlobal [0,'textures\vehicles\vip\camo_blau.paa'];
			};
*/
		};
		
		case "B_Kitbag_cbr" :
		{
			if (lc_girl) then
			{
				(unitBackpack _unit) setObjectTextureGlobal [0,'textures\kleidung\civ\backpack.paa'];
			};
		};
		
		case "U_BG_Guerilla2_1" :
		{
			if (lc_girl) then
			{
				_unit setObjectTextureGlobal [0,'textures\kleidung\civ\camo.paa'];
			};
		};
		case "U_IG_Guerilla2_2" :
		{
			_unit setObjectTextureGlobal [0,'textures\kleidung\civ\combatlog.paa'];
		};
	};
};

if((side player) == independent) then
{
	switch(_type) do
	{
		case "U_IG_Guerilla2_1":
		{
			_unit setObjectTextureGlobal [0,'textures\kleidung\med\uniform.paa'];
		};
		
		case "U_I_Wetsuit":
		{
			_unit setObjectTextureGlobal [0,'textures\kleidung\med\taucher.paa'];
		};
		
		case "B_Kitbag_cbr":
		{
			(unitBackpack _unit) setObjectTextureGlobal [0,'textures\kleidung\med\backpack.paa'];
		};
		
		case "U_IG_Guerilla2_2" :
		{
			_unit setObjectTextureGlobal [0,'textures\kleidung\civ\combatlog.paa'];
		};
	};
};

if((side player) == east) then
{
	switch(_type) do
	{
		case "U_BG_Guerilla2_1" :
		{
			_unit setObjectTextureGlobal [0,'textures\kleidung\opfor\uniform.paa'];
		};
		
		case "U_IG_Guerilla2_2" :
		{
			_unit setObjectTextureGlobal [0,'textures\kleidung\civ\combatlog.paa'];
		};
		
		case "B_Kitbag_cbr" :
		{
			unitBackpack player setObjectTextureGlobal [0, ""];
		};
	};
};