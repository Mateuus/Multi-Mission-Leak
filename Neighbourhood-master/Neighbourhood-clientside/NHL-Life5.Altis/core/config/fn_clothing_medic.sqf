/*
	File: fn_clothing_reb.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Master configuration file for Reb shop.
*/

private["_filter"];
_filter = [_this,0,0,[0]] call BIS_fnc_param;

//Shop Title Name
ctrlSetText[3103,"Arzt Bekleidungsshop"];

_ret = [];
switch (_filter) do
{
	//Uniforms
	case 0:
	{
		
		[
			["U_Rangemaster","Artztuniform",500],
			["U_C_WorkerOveralls","ADAC Uniform",500]
		];
	};
	
	//Hats
	case 1:
	{
		
		[
			["H_Cap_blk",nil,50],
			["H_Cap_marshal",nil,50]
		];
	};
	
	//Glasses
	case 2:
	{
		
		[
			["G_Lowprofile",nil,50],
			["G_Tactical_Black",nil,50],
			["G_Tactical_Clear",nil,50],
			["G_Aviator",nil,50],
			["G_Spectacles",nil,50],
			["G_Spectacles_Tinted",nil,50],
			["G_Squares",nil,50],
			["G_Squares_Tinted",nil,50],
			["G_Shades_Black",nil,50],
			["G_Shades_Blue",nil,50],
			["G_Shades_Green",nil,50],
			["G_Shades_Red",nil,50],
			["G_Sport_Blackred",nil,50],
			["G_Sport_BlackWhite",nil,50],
			["G_Sport_Blackyellow",nil,50],
			["G_Sport_Checkered",nil,50],
			["G_Sport_Greenblack",nil,50],
			["G_Sport_Red",nil,50],
			["G_Lady_Blue",nil,50],
			["G_Lady_Dark",nil,50],
			["G_Lady_Mirror",nil,50],
			["G_Lady_Red",nil,50],
			["G_Goggles_VR",nil,50]
		];
	};
	
	//Vest
	case 3:
	{
		
		[	
			["V_TacVestIR_blk",nil,500]
		];
	};
	
	//Backpacks
	case 4:
	{
		
		[
			["B_Kitbag_sgg","MEDIC-Backpack",250],
			["B_Kitbag_cbr","ADAC-Backpack",250]
		];
	};
};

_ret;