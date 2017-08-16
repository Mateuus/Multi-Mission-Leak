class Life_Clothing {
	idd = 3100;
	name= "Life_Clothing";
	movingEnable = 1;
	enableSimulation = 1;

	class controlsBackground {
		class Life_RscTitleBackground:Life_RscText {
			colorBackground[] = {1,0.537,0,0.7};
			idc = -1;
			x = 0.0720312 * safezoneW + safezoneX;
			y = 0.137 * safezoneH + safezoneY;
			w = 0.201094 * safezoneW;
			h = 0.022 * safezoneH;
		};
		
		class MainBackground:Life_RscText {
			colorBackground[] = {0, 0, 0, 0.7};
			idc = -1;
			x = 0.0720315 * safezoneW + safezoneX;
			y = 0.159 * safezoneH + safezoneY;
			w = 0.201094 * safezoneW;
			h = 0.616 * safezoneH;
		};
	};

	class controls
	{
		class Title : Life_RscTitle 
		{
			colorBackground[] = {0, 0, 0, 0};
			idc = 3103;
			text = "";
			x = 0.0720312 * safezoneW + safezoneX;
			y = 0.137 * safezoneH + safezoneY;
			w = 0.201094 * safezoneW;
			h = 0.022 * safezoneH;
		};

		class ClothingList : Life_RscListBox
		{
			idc = 3101;
			text = "";
			sizeEx = 0.035;
			onLBSelChanged = "[_this] call life_fnc_changeClothes;";

			x = 0.0771873 * safezoneW + safezoneX;
			y = 0.17 * safezoneH + safezoneY;
			w = 0.190781 * safezoneW;
			h = 0.539 * safezoneH;
		};

		class PriceTag : Life_RscStructuredText
		{
			idc = 3102;
			text = "";
			sizeEx = 0.035;

			x = 0.0771875 * safezoneW + safezoneX;
			y = 0.709 * safezoneH + safezoneY;
			w = 0.0928125 * safezoneW;
			h = 0.033 * safezoneH;
		};

		class TotalPrice : Life_RscStructuredText
		{
			idc = 3106;
			text = "";
			sizeEx = 0.035;

			x = 0.170001 * safezoneW + safezoneX;
			y = 0.709 * safezoneH + safezoneY;
			w = 0.0979687 * safezoneW;
			h = 0.033 * safezoneH;
		};

		class FilterList : Life_RscCombo
		{
			idc = 3105;
			colorBackground[] = {0,0,0,0.7};
			onLBSelChanged  = "_this call life_fnc_clothingFilter";
			x = 0.0771875 * safezoneW + safezoneX;
			y = 0.742 * safezoneH + safezoneY;
			w = 0.190781 * safezoneW;
			h = 0.022 * safezoneH;
		};

		class CloseButtonKey : Life_RscButtonMenu
		{
			idc = -1;
			text = "$STR_Global_Close";
			onButtonClick = "closeDialog 0; [] call life_fnc_playerSkins;";
			x = 0.195781 * safezoneW + safezoneX;
			y = 0.775 * safezoneH + safezoneY;
			w = 0.0773437 * safezoneW;
			h = 0.022 * safezoneH;
			size = "0.022 * safeZoneH";
		};

		class BuyButtonKey : Life_RscButtonMenu
		{
			idc = -1;
			text = "$STR_Global_Buy";
			onButtonClick = "[] call life_fnc_buyClothes;";
			x = 0.0720312 * safezoneW + safezoneX;
			y = 0.775 * safezoneH + safezoneY;
			w = 0.0773437 * safezoneW;
			h = 0.022 * safezoneH;
			size = "0.022 * safeZoneH";
		};
		
		class viewAngle : life_RscXSliderH
		{
			color[] = {1, 1, 1, 0.45};
			colorActive[] = {1, 1, 1, 0.65};
			idc = 3107;
			text = "";
			onSliderPosChanged = "[4,_this select 1] call life_fnc_s_onSliderChange;";
			tooltip = "";
			x = 0.25 * safezoneW + safezoneX;
			y = 0.95 * safezoneH + safezoneY;
			w = 0.5 * safezoneW;
			h = 0.02 * safezoneH;
		};
	};
};
