/*
	File: admin_searchBan.sqf
	Author: CooliMC "Marc"
	
	Description:
	Search for Name/PID/GUID
	YOU ARE NOT ALLOWED TO STEEL IT !!!!
*/
class life_admin_search
{
	idd = 35050;
	name= "life_admin_search";
	movingEnable = false;
	enableSimulation = true;
	
	class controlsBackground 
	{
		class Life_RscTitleBackground:Life_RscText 
		{
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", "(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
			idc = -1;
			x = 0.1;
			y = 0.2;
			w =	((0.58 + (6.25 / 40) + (1 / 250 / (safezoneW / safezoneH))) + 0.05625);
			//w = 0.8;
			h = (1 / 25);
		};
		
		class MainBackground:Life_RscText 
		{
			colorBackground[] = {0, 0, 0, 0.7};
			idc = -1;
			x = 0.1;
			y = 0.2 + (11 / 250);
			w =	((0.58 + (6.25 / 40) + (1 / 250 / (safezoneW / safezoneH))) + 0.05625);
			//w = 0.8;
			h = 0.6 - (2 / 250);
		};
	};
	
	class controls
	{
		class Title : Life_RscTitle 
		{
			colorBackground[] = {0, 0, 0, 0};
			idc = -1;
			text = "$STR_Search_PlayerID";
			x = 0.1;
			y = 0.2;
			w = 0.6;
			h = (1 / 25);
		};
		
		class PlayerList_Result : Life_RscListBox 
		{
			idc = 35051;
			text = "";
			sizeEx = 0.035;
			onLBSelChanged = "[3] call tanoarpg_fnc_adminSearch;";
			
			x = 0.12;
			y = 0.26;
			w = 0.30;
			h = 0.552;
		};
		
		class Text_PlayerPID : Life_RscText
		{
			idc = -1;
			sizeEx = 0.035;
			text = "PlayerID:";
			
			x = 0.424;
			y = 0.25;
			w = 0.46;
			h = 0.05;
		};
		
		class PlayerPID : Life_RscEdit
		{
			idc = 35052;
			sizeEx = 0.035;
			text = "";
			
			x = 0.424;
			y = 0.31;
			w = 0.46;
			h = 0.05;
		};
		
		class Text_GUID : Life_RscText
		{
			idc = -1;
			sizeEx = 0.035;
			text = "Player GUID:";
			
			x = 0.424;
			y = 0.38;
			w = 0.46;
			h = 0.05;
		};
		
		class GUID : Life_RscEdit
		{
			idc = 35053;
			sizeEx = 0.035;
			text = "";
			
			x = 0.424;
			y = 0.44;
			w = 0.46;
			h = 0.05;
		};
		
		class Text_PlayerName : Life_RscText
		{
			idc = -1;
			sizeEx = 0.035;
			text = "Player Name:";
			
			x = 0.424;
			y = 0.51;
			w = 0.46;
			h = 0.05;
		};
		
		class PlayerName : Life_RscEdit
		{
			idc = 35054;
			sizeEx = 0.035;
			text = "";
			
			x = 0.424;
			y = 0.57;
			w = 0.46;
			h = 0.05;
		};
		
		class Text_SearchName : Life_RscText
		{
			idc = -1;
			sizeEx = 0.035;
			text = "Suchen:";
			
			x = 0.424;
			y = 0.64;
			w = 0.46;
			h = 0.05;
		};
		
		class Search : Life_RscEdit
		{
			idc = 35055;
			sizeEx = 0.035;
			text = "";
			
			x = 0.424;
			y = 0.70;
			w = 0.46;
			h = 0.05;
		};

		class CloseButtonKey : Life_RscButtonMenu 
		{
			idc = -1;
			text = "$STR_Global_Close";
			onButtonClick = "closeDialog 0;";
			x = -0.06 + (6.25 / 40) + (1 / 250 / (safezoneW / safezoneH));
			y = 0.88 - (1 / 25);
			w = (6.25 / 40);
			h = (1 / 25);
		};
		
		class SearchPID : Life_RscButtonMenu 
		{
			idc = -1;
			text = "$STR_Search_PlayerID";
			onButtonClick = "[0] call tanoarpg_fnc_adminSearch;";
			x = 0.1 + (6.25 / 40) + (1 / 250 / (safezoneW / safezoneH));
			y = 0.88 - (1 / 25);
			w = (6.25 / 40);
			h = (1 / 25);
		};
		
		class SearchGUID : Life_RscButtonMenu 
		{
			idc = -1;
			text = "$STR_Search_GUID";
			onButtonClick = "[1] call tanoarpg_fnc_adminSearch;";
			x = 0.26 + (6.25 / 40) + (1 / 250 / (safezoneW / safezoneH));
			y = 0.88 - (1 / 25);
			w = (6.25 / 40);
			h = (1 / 25);
		};
		
		class SearchName : Life_RscButtonMenu 
		{
			idc = -1;
			text = "$STR_Search_Name";
			onButtonClick = "[2] call tanoarpg_fnc_adminSearch;";
			x = 0.42 + (6.25 / 40) + (1 / 250 / (safezoneW / safezoneH));
			y = 0.88 - (1 / 25);
			w = (6.25 / 40);
			h = (1 / 25);
		};
		
		class BanTarget : Life_RscButtonMenu
		{
			idc = -1;
			text = "$STR_Admin_Ban";
			onButtonClick = "[1] call tanoarpg_fnc_adminBan;";
			x = 0.58 + (6.25 / 40) + (1 / 250 / (safezoneW / safezoneH));
			y = 0.88 - (1 / 25);
			w = (6.25 / 40);
			h = (1 / 25);
		};
	};
};