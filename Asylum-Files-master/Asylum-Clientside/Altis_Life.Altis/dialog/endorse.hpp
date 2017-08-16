class life_endorse_menu {
	idd = 6700;
	name= "life_endorse_menu";
	movingEnable = false;
	enableSimulation = true;
	onLoad = "[] spawn life_fnc_showEndorse;";
	
	class controlsBackground {
		class Life_RscTitleBackground:Life_RscText {
			colorBackground[] = {0.4, 0.05, 0.05, 0.7};
			idc = -1;
			x = 0.402031 * safezoneW + safezoneX;
			y = 0.357 * safezoneH + safezoneY;
			w = 0.201094 * safezoneW;
			h = 0.022 * safezoneH;
		};
		
		class MainBackground:Life_RscText {
			colorBackground[] = {0, 0, 0, 0.7};
			idc = -1;
			x = 0.402031 * safezoneW + safezoneX;
			y = 0.379 * safezoneH + safezoneY;
			w = 0.201094 * safezoneW;
			h = 0.198 * safezoneH;
		};
	};
	
	class controls {
		
		class moneyEdit : Life_RscEdit
		{
			idc = 6702;
			text = "1";
			x = 0.422656 * safezoneW + safezoneX;
			y = 0.533 * safezoneH + safezoneY;
			w = 0.159844 * safezoneW;
			h = 0.022 * safezoneH;
		};
		
		class MarketButton : life_RscButtonMenu 
		{
			idc = -1;
			colorBackground[] = {0.5, 0, 0, 0.5};
			onButtonClick = "[] call life_fnc_endorse;";
			text = "Let's do it!"; //--- ToDo: Localize;
			x = 0.536094 * safezoneW + safezoneX;
			y = 0.588 * safezoneH + safezoneY;
			w = 0.0670312 * safezoneW;
			h = 0.022 * safezoneH;
		};
		
		class CloseButton : Life_RscButtonMenu {
			idc = -1;
			text = "Cancel"; //--- ToDo: Localize;
			onButtonClick = "closeDialog 0";
			x = 0.463906 * safezoneW + safezoneX;
			y = 0.588 * safezoneH + safezoneY;
			w = 0.0670312 * safezoneW;
			h = 0.022 * safezoneH;
		};
		
		class RscStructuredText_1100: Life_RscStructuredText
		{
			idc = -1;
			text = "Sign over your soul to convert your prestige to hard cash, for a price."; //--- ToDo: Localize;
			x = 0.407187 * safezoneW + safezoneX;
			y = 0.39 * safezoneH + safezoneY;
			w = 0.190781 * safezoneW;
			h = 0.055 * safezoneH;
		};
		class RscStructuredText_1101: Life_RscStructuredText
		{
			idc = 6703;
			text = "The network's cut: 25%"; //--- ToDo: Localize;
			x = 0.407187 * safezoneW + safezoneX;
			y = 0.445 * safezoneH + safezoneY;
			w = 0.190781 * safezoneW;
			h = 0.022 * safezoneH;
		};
		
		class RscStructuredText_1102: Life_RscStructuredText
		{
			idc = 6704;
			text = "Your current prestige: %1"; //--- ToDo: Localize;
			x = 0.407187 * safezoneW + safezoneX;
			y = 0.467 * safezoneH + safezoneY;
			w = 0.190781 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class RscText_1001: Life_RscText
		{
			idc = -1;
			text = "Amount Endorsed:"; //--- ToDo: Localize;
			x = 0.4175 * safezoneW + safezoneX;
			y = 0.511 * safezoneH + safezoneY;
			w = 0.103125 * safezoneW;
			h = 0.022 * safezoneH;
		};
		
		class Title : Life_RscTitle {
			colorBackground[] = {0, 0, 0, 0};
			idc = -1;
			text = "Network Endorsement";
			x = 0.402031 * safezoneW + safezoneX;
			y = 0.357 * safezoneH + safezoneY;
			w = 0.201094 * safezoneW;
			h = 0.022 * safezoneH;
		};
	};
};