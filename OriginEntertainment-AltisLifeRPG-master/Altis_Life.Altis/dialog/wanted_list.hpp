class life_wanted_menu {
	idd = 2400;
	name= "life_wanted_menu";
	movingEnable = false;
	enableSimulation = true;
	//onLoad = "[] spawn life_fnc_wantedadd2;";
	
	class controlsBackground {
		class WantedBackground: Life_RscText
		{
			idc = -1;
			x = 0.283437 * safezoneW + safezoneX;
			y = 0.225 * safezoneH + safezoneY;
			w = 0.433125 * safezoneW;
			h = 0.55 * safezoneH;
			colorBackground[] = {0,0,0,0.7};
		};
		class TitleBackground: Life_RscText
		{
			idc = -1;
			x = 0.283437 * safezoneW + safezoneX;
			y = 0.19222 * safezoneH + safezoneY;
			w = 0.433125 * safezoneW;
			h = 0.033 * safezoneH;
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", "(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
		};
	};
	
	class controls {

		
		class Title : Life_RscTitle {
			colorBackground[] = {0, 0, 0, 0};
			idc = -1;
			text = "$STR_Wanted_Title";
			x = 0.283437 * safezoneW + safezoneX;
			y = 0.192 * safezoneH + safezoneY;
			w = 0.433125 * safezoneW;
			h = 0.033 * safezoneH;
		};
		
		class WantedConnection : Title {
			idc = 2404;
			style = 1;
			text = "";
		};
		
		class WantedList : Life_RscListBox 
		{
			idc = 2401;
			text = "";
			sizeEx = 0.035;
			onLBSelChanged = "[] spawn life_fnc_wantedGrab";
			
			x = 0.29375 * safezoneW + safezoneX;
			y = 0.269 * safezoneH + safezoneY;
			w = 0.113437 * safezoneW;
			h = 0.484 * safezoneH;
		};
		
		class PlayerList : Life_RscListBox 
		{
			idc = 2406;
			text = "";
			sizeEx = 0.035;
			//colorBackground[] = {0,0,0,0};
			onLBSelChanged = "";
			
			x = 0.54125 * safezoneW + safezoneX;
			y = 0.269 * safezoneH + safezoneY;
			w = 0.113437 * safezoneW;
			h = 0.484 * safezoneH;
		};
		
		class WantedDetails : Life_RscListBox
		{
			idc = 2402;
			text = "";
			sizeEx = 0.035;
			colorBackground[] = {0, 0, 0, 0};
			
			x = 0.417499 * safezoneW + safezoneX;
			y = 0.313 * safezoneH + safezoneY;
			w = 0.113437 * safezoneW;
			h = 0.44 * safezoneH;
		};
		
		class BountyPrice : Life_RscText
		{
			idc = 2403;
			text = "";
			x = 0.4175 * safezoneW + safezoneX;
			y = 0.269 * safezoneH + safezoneY;
			w = 0.113437 * safezoneW;
			h = 0.033 * safezoneH;
		};
		
		class WantedAddL : Life_RscCombo
		{
			idc = 2407;
			x = 0.665 * safezoneW + safezoneX;
			y = 0.423 * safezoneH + safezoneY;
			w = 0.0464063 * safezoneW;
			h = 0.022 * safezoneH;
		};
		
		class CloseButtonKey : Life_RscButtonMenu {
			idc = -1;
			text = "$STR_Global_Close";
			onButtonClick = "closeDialog 0;";
			x = 0.665 * safezoneW + safezoneX;
			y = 0.291 * safezoneH + safezoneY;
			w = 0.0464063 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", "(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
		};
		
		class PardonButtonKey : Life_RscButtonMenu {
			idc = 2405;
			text = "$STR_Wanted_Pardon";
			onButtonClick = "[] call life_fnc_pardon; closeDialog 0;";
			x = 0.665 * safezoneW + safezoneX;
			y = 0.335 * safezoneH + safezoneY;
			w = 0.0464063 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", "(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
		};
		
		class ButtonWantedAdd : life_RscButtonMenu {
			idc = 9800;
			//shortcuts[] = {0x00050000 + 2};
			text = "Add";
			onButtonClick = "[] call life_fnc_wantedAddP;";
			x = 0.665 * safezoneW + safezoneX;
			y = 0.379 * safezoneH + safezoneY;
			w = 0.0464063 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", "(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
		};
		
		class wantedText: Life_RscText
		{
			idc = 1000;
			text = "$STR_Wanted_People";
			x = 0.29375 * safezoneW + safezoneX;
			y = 0.236 * safezoneH + safezoneY;
			w = 0.113437 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class citizensText: Life_RscText
		{
			idc = 1001;
			text = "$STR_Wanted_Citizens";
			x = 0.54125 * safezoneW + safezoneX;
			y = 0.236 * safezoneH + safezoneY;
			w = 0.113437 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class crimesText: Life_RscText
		{
			idc = 1002;
			text = "$STR_Wanted_Crimes";
			x = 0.4175 * safezoneW + safezoneX;
			y = 0.236 * safezoneH + safezoneY;
			w = 0.113437 * safezoneW;
			h = 0.022 * safezoneH;
		};
	};
}; 