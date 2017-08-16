/*
	File: admin_ban.sqf
	Author: CooliMC "Marc"
	
	Description:
	Ban Player/GUID
	YOU ARE NOT ALLOWED TO STEEL IT !!!!
*/
class life_admin_ban
{
	idd = 36050;
	name= "life_admin_ban";
	movingEnable = false;
	enableSimulation = true;
	
	class controlsBackground 
	{
		class Life_RscTitleBackground:Life_RscText 
		{
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", "(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
			idc = -1;
			x = 0.2;
			y = 0.2;
			w = 0.6;
			h = 0.04;
		};
		
		class MainBackground:Life_RscText 
		{
			colorBackground[] = {0, 0, 0, 0.7};
			idc = -1;
			x = 0.2;
			y = 0.244;
			w = 0.6;
			h = 0.592;
		};
	};
	
	class controls
	{
		class Title : Life_RscTitle 
		{
			colorBackground[] = {0, 0, 0, 0};
			idc = -1;
			text = "$STR_Admin_BanMenu";
			x = 0.205;
			y = 0.2;
			w = 0.6;
			h = (1 / 25);
		};
		
		class Text_GUID : Life_RscText
		{
			idc = -1;
			sizeEx = 0.035;
			text = "Player GUID:";
			
			x = 0.205;
			y = 0.25;
			w = 0.59;
			h = 0.05;
		};
		
		class GUID : Life_RscEdit
		{
			idc = 36051;
			sizeEx = 0.035;
			text = "";
			
			x = 0.205;
			y = 0.31;
			w = 0.59;
			h = 0.05;
		};
		
		class Text_TimeMin : Life_RscText
		{
			idc = -1;
			sizeEx = 0.035;
			text = "Zeit in Minuten (-1 = Permaban):";
			
			x = 0.205;
			y = 0.38;
			w = 0.59;
			h = 0.05;
		};
		
		class TimeMin : Life_RscEdit
		{
			idc = 35052;
			sizeEx = 0.035;
			text = "";
			
			x = 0.205;
			y = 0.44;
			w = 0.59;
			h = 0.05;
		};
		
		class Text_Reason : Life_RscText
		{
			idc = -1;
			sizeEx = 0.035;
			text = "Grund:";
			
			x = 0.205;
			y = 0.51;
			w = 0.59;
			h = 0.05;
		};
		
		class Reason : Life_RscEdit
		{
			idc = 35053;
			sizeEx = 0.035;
			text = "";
			
			x = 0.205;
			y = 0.57;
			w = 0.59;
			h = 0.05;
		};
		
		class Text_Rest : Life_RscText
		{
			idc = -1;
			sizeEx = 0.035;
			text = "Zusatzinformationen:";
			
			x = 0.205;
			y = 0.64;
			w = 0.59;
			h = 0.05;
		};
		
		class Rest : Life_RscText
		{
			idc = 35054;
			sizeEx = 0.035;
			text = "";
			
			x = 0.205;
			y = 0.70;
			w = 0.59;
			h = 0.13;
		};

		class CloseButtonKey : Life_RscButtonMenu 
		{
			idc = -1;
			text = "$STR_Global_Close";
			onButtonClick = "closeDialog 0;";
			x = 0.2;
			y = 0.84;
			w = 0.298;
			h = 0.04;
		};
		
		class Ban : Life_RscButtonMenu 
		{
			idc = -1;
			text = "$STR_Admin_Ban";
			onButtonClick = "[3] call tanoarpg_fnc_adminBan;";
			x = 0.5;
			y = 0.84;
			w = 0.298;
			h = 0.04;
		};
	};
};