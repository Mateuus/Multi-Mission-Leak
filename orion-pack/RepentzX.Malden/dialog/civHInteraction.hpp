class life_civHInteraction {
	idd = 519519;
	name= "life_civHInteraction";
	movingEnable = false;
	enableSimulation = true;

	class controlsBackground {
		class Background: Life_RscPicture
		{
			idc = -1;
			text = "images\textures\HUD\civHInteraction.paa";
			x = 0.324687 * safezoneW + safezoneX;
			y = 0.192 * safezoneH + safezoneY;
			w = 0.350625 * safezoneW;
			h = 0.616 * safezoneH;
		};
	};

	class controls {
		class Sell: Life_RscButtonMenu
		{
			idc = 5195191;
			x = 0.528802 * safezoneW + safezoneX;
			y = 0.288222 * safezoneH + safezoneY;
			w = 0.0515625 * safezoneW;
			h = 0.088 * safezoneH;
			colorBackground[] = {-1,-1,-1,-1};
			colorBackgroundFocused[] = {-1,-1,-1,-1};
			colorBackground2[] = {-1,-1,-1,-1};
			color[] = {-1,-1,-1,-1};
			colorFocused[] = {-1,-1,-1,-1};
			color2[] = {-1,-1,-1,-1};
			colorText[] = {-1,-1,-1,-1};
			colorDisabled[] = {-1,-1,-1,-1};
		};
		class Buy: Life_RscButtonMenu
		{
			idc = 5195192;
			x = 0.568541 * safezoneW + safezoneX;
			y = 0.357 * safezoneH + safezoneY;
			w = 0.0515625 * safezoneW;
			h = 0.088 * safezoneH;
			colorBackground[] = {-1,-1,-1,-1};
			colorBackgroundFocused[] = {-1,-1,-1,-1};
			colorBackground2[] = {-1,-1,-1,-1};
			color[] = {-1,-1,-1,-1};
			colorFocused[] = {-1,-1,-1,-1};
			color2[] = {-1,-1,-1,-1};
			colorText[] = {-1,-1,-1,-1};
			colorDisabled[] = {-1,-1,-1,-1};
		};
		class UnlockStorage: Life_RscButtonMenu
		{
			idc = 5195193;
			x = 0.582812 * safezoneW + safezoneX;
			y = 0.456481 * safezoneH + safezoneY;
			w = 0.0515625 * safezoneW;
			h = 0.088 * safezoneH;
			colorBackground[] = {-1,-1,-1,-1};
			colorBackgroundFocused[] = {-1,-1,-1,-1};
			colorBackground2[] = {-1,-1,-1,-1};
			color[] = {-1,-1,-1,-1};
			colorFocused[] = {-1,-1,-1,-1};
			color2[] = {-1,-1,-1,-1};
			colorText[] = {-1,-1,-1,-1};
			colorDisabled[] = {-1,-1,-1,-1};
		};
		class LockStorage: Life_RscButtonMenu
		{
			idc = 5195194;
			x = 0.571353 * safezoneW + safezoneX;
			y = 0.55926 * safezoneH + safezoneY;
			w = 0.0515625 * safezoneW;
			h = 0.088 * safezoneH;
			colorBackground[] = {-1,-1,-1,-1};
			colorBackgroundFocused[] = {-1,-1,-1,-1};
			colorBackground2[] = {-1,-1,-1,-1};
			color[] = {-1,-1,-1,-1};
			colorFocused[] = {-1,-1,-1,-1};
			color2[] = {-1,-1,-1,-1};
			colorText[] = {-1,-1,-1,-1};
			colorDisabled[] = {-1,-1,-1,-1};
		};
		class Lights: Life_RscButtonMenu
		{
			idc = 5195195;
			x = 0.527083 * safezoneW + safezoneX;
			y = 0.625 * safezoneH + safezoneY;
			w = 0.0515625 * safezoneW;
			h = 0.088 * safezoneH;
			colorBackground[] = {-1,-1,-1,-1};
			colorBackgroundFocused[] = {-1,-1,-1,-1};
			colorBackground2[] = {-1,-1,-1,-1};
			color[] = {-1,-1,-1,-1};
			colorFocused[] = {-1,-1,-1,-1};
			color2[] = {-1,-1,-1,-1};
			colorText[] = {-1,-1,-1,-1};
			colorDisabled[] = {-1,-1,-1,-1};
		};
	};
};

