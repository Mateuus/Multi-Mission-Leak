class Life_Confirm_Menu {
	idd = 4700;
	name= "life_confirm_menu";
	movingEnable = false;
	enableSimulation = true;
	onLoad = "life_confirm_response = false;";
	
	class controlsBackground {
		class MainBackground:Life_RscText
		{
			colorBackground[] = {0, 0, 0, 0.7};
			idc = -1;
			x = 0.40309 * safezoneW + safezoneX;
			y = 0.377781 * safezoneH + safezoneY;
			w = 0.193819 * safezoneW;
			h = 0.0940147 * safezoneH;
		};
	};
	
	class controls {

		class TextConfirmMenu: Life_RscStructuredText
		{
			idc = 4710;
			text = "<t align='center'>Are you sure?</t>";
			x = 0.407495 * safezoneW + safezoneX;
			y = 0.387182 * safezoneH + safezoneY;
			w = 0.185009 * safezoneW;
			h = 0.0752118 * safezoneH;
		};
		class OKConfirmMenu : Life_RscButtonMenu
		{
			idc = 4720;
			text = "OKAY";
			onButtonClick = "life_confirm_response = true; closeDialog 0;";
			colorBackground[] = {0.5, 0, 0, 0.5};
			x = 0.539645 * safezoneW + safezoneX;
			y = 0.481197 * safezoneH + safezoneY;
			w = 0.0572648 * safezoneW;
			h = 0.0188029 * safezoneH;
		};
		class CloseConfirmMenu : Life_RscButtonMenu
		{
			idc = 4730;
			text = "CANCEL";
			onButtonClick = "life_confirm_response = false; closeDialog 0;";
			colorBackground[] = {0.5, 0, 0, 0.5};
			x = 0.40309 * safezoneW + safezoneX;
			y = 0.481197 * safezoneH + safezoneY;
			w = 0.0572648 * safezoneW;
			h = 0.0188029 * safezoneH;
		};
		
	};
};