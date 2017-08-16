/*
	File: fn_clothing_bandit.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Master configuration file for outfits for Bandits.
*/
private["_filter","_ret"];
_filter = [_this,0,0,[0]] call BIS_fnc_param;

ctrlSetText[3103,"Banditentextilausstatter"];
if(life_level < 4) then {["Info: ","Weitere Kleidung schaltest du mit einem höheren Level frei!","#ff1000","#ffffff",7] call life_fnc_texttiles;};

_ret = [];
switch (_filter) do
{
	//Uniforms
	case 0:
	{
		if(life_level >= 3) then {
			_ret = [
				["U_I_C_Soldier_Bandit_1_F",nil,3500],
				["U_I_C_Soldier_Bandit_2_F",nil,3700],
				["U_I_C_Soldier_Bandit_3_F",nil,3900],
				["U_I_C_Soldier_Bandit_4_F",nil,4000],
				["U_I_C_Soldier_Bandit_5_F",nil,4200]				
			];
		};
		
		if(life_level >= 4) then {		
		_ret pushback ["U_I_C_Soldier_Para_1_F",nil,4300];
		_ret pushback ["U_I_C_Soldier_Para_2_F",nil,4350];
		_ret pushback ["U_I_C_Soldier_Para_3_F",nil,4400];
		_ret pushback ["U_I_C_Soldier_Para_4_F",nil,4400];
		_ret pushback ["U_I_C_Soldier_Para_5_F",nil,4444];
		};
	};
	
	//Hats
	case 1:
	{
		if (life_level >= 3) then {
			_ret =	[
				["H_HelmetB_TI_tna_F",nil,2000],
				["H_Booniehat_tna_F",nil,1500],
				["H_ShemagOpen_khk",nil,200],
				["H_Cap_blk_CMMG",nil,450],
				["H_Cap_blk_ION",nil,470],
				["H_HelmetSpecO_blk",nil,3500]
			];
		};
	};
	
	//Glasses
	case 2:
	{
		if(life_level >= 3) then {
			_ret =	[
				["G_Shades_Black",nil,110],
				["G_Shades_Blue",nil,120],
				["G_Shades_Green",nil,130],
				["G_Shades_Red",nil,140],
				["G_Spectacles",nil,150],
				["G_Spectacles_Tinted",nil,160],
				["G_Sport_Blackred",nil,170],
				["G_Sport_Checkered",nil,180],
				["G_Sport_Blackyellow",nil,190],
				["G_Sport_BlackWhite",nil,200],
				["G_Sport_Greenblack",nil,210],
				["G_Sport_Red",nil,220],
				["G_Squares",nil,230]
			];
		};

		if(life_level >= 3) then {
			_ret pushback ["G_Aviator",nil,240];
			_ret pushback ["G_Lady_Blue",nil,250];
			_ret pushback ["G_Tactical_Black",nil,500];
			_ret pushback ["G_Tactical_Clear",nil,700];
			_ret pushback ["G_Lowprofile",nil,1000];
		};
	};
	
	//Vest
	case 3:
	{
		if(life_level >= 3) then {
			_ret pushback ["V_Rangemaster_belt",nil,4900];
		};
	};
	
	//Backpacks
	case 4:
	{
		if(life_level >= 3) then {
			_ret =	[
				["B_FieldPack_oucamo",nil,4000],
				["B_Kitbag_sgg",nil,4000]
			];
		};
	};
};

_ret;